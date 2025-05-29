from flask import Flask, render_template, request, redirect, url_for, flash, session
from flask_sqlalchemy import SQLAlchemy
from functools import wraps
from urllib.parse import urlparse, urljoin
import re
from collections import defaultdict
from datetime import datetime
import random

import random

def get_random_top_product(score_list):
    # Sort by score descending
    sorted_list = sorted(score_list, key=lambda x: x[1], reverse=True)
    top_3 = sorted_list[:3]
    return random.choice(top_3)[0] if top_3 else None

def is_safe_url(target):
    ref_url = urlparse(request.host_url)
    test_url = urlparse(urljoin(request.host_url, target))
    return test_url.scheme in ('http', 'https') and ref_url.netloc == test_url.netloc

def login_required(f):
    @wraps(f)
    def decorated_function(*args, **kwargs):
        if "user_id" not in session:
            flash("Please log in to continue.", "warning")
            return redirect(url_for("login",next=request.path))
        return f(*args, **kwargs)
    return decorated_function

app = Flask(__name__)
app.secret_key = "supersecret"
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:sarawarraich@localhost/skincare'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

class Routine(db.Model):
    session_id = db.Column(db.Integer, db.ForeignKey('Questionnaire_Sessions.session_id'), primary_key=True)
    cleanser_id = db.Column(db.Integer, db.ForeignKey('Product.prod_id'), nullable=True)
    serum_id = db.Column(db.Integer, db.ForeignKey('Product.prod_id'), nullable=True)
    moisturizer_id = db.Column(db.Integer, db.ForeignKey('Product.prod_id'), nullable=True)
    sunscreen_id = db.Column(db.Integer, db.ForeignKey('Product.prod_id'), nullable=True)
    recommended_at = db.Column(db.DateTime, default=datetime.utcnow)


class Factors(db.Model):
    __tablename__ = 'Factors'
    __table_args__ = {'schema': 'skincare'}  # Optional, only if you're using a schema

    user_id = db.Column(db.Integer, db.ForeignKey('Users.user_id', ondelete="CASCADE"), primary_key=True)
    session_id = db.Column(db.Integer, db.ForeignKey('Questionnaire_Sessions.session_id', ondelete="CASCADE"), primary_key=True)

    concerns = db.Column(db.Text)
    age_group = db.Column(db.String(20))
    skin_color = db.Column(db.String(20))

    acne = db.Column(db.Boolean)

    skin_type = db.Column(db.String(50))
    skin_type_score = db.Column(db.Integer)

    sensitivity = db.Column(db.Boolean)
    sensitivity_score = db.Column(db.Integer)

    # Optional relationships for easy access to user/session (if models exist)
    user = db.relationship("User", backref="factors")
    session = db.relationship("QuestionnaireSession", backref="factors")

class Question(db.Model):
    __tablename__ = 'Questions'
    question_id = db.Column(db.Integer, primary_key=True)
    section = db.Column(db.String(50))
    question_text = db.Column(db.Text)
    is_multi_select = db.Column(db.Boolean)

    options = db.relationship("Option", backref="question")

class Option(db.Model):
    __tablename__ = 'Options'
    option_id = db.Column(db.Integer, primary_key=True)
    question_id = db.Column(db.Integer, db.ForeignKey('Questions.question_id'))
    option_text = db.Column(db.Text)

class User(db.Model):
    __tablename__ = 'Users'
    user_id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(50))
    email = db.Column(db.String(100), unique=True)
    password = db.Column(db.String(255))
class Product(db.Model):
    __tablename__ = 'Product'

    prod_id = db.Column(db.Integer, primary_key=True)
    prod_name = db.Column(db.String(255), nullable=False)
    prod_comp = db.Column(db.String(100))
    prod_price = db.Column(db.Numeric(10, 2), nullable=False)
    prod_category = db.Column(db.String(100), nullable=False)
    prod_concerns = db.Column(db.Text)
    prod_sensitivity_score = db.Column(db.Float, default=0.0)
    prod_skin_type_score = db.Column(db.JSON)
    prod_age_group_score = db.Column(db.JSON)
    prod_rating = db.Column(db.Float, default=0.0)
    description = db.Column(db.Text)

class QuestionnaireSession(db.Model):
    __tablename__ = 'Questionnaire_Sessions'
    session_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey('Users.user_id', ondelete="CASCADE"), nullable=False)
    submitted_at = db.Column(db.DateTime, server_default=db.func.current_timestamp())

    responses = db.relationship("QuestionnaireResponse", backref="session", cascade="all, delete-orphan")

class QuestionnaireResponse(db.Model):
    __tablename__ = 'Questionnaire_Responses'
    session_id = db.Column(db.Integer, db.ForeignKey('Questionnaire_Sessions.session_id', ondelete="CASCADE"), primary_key=True)
    question_id = db.Column(db.Integer, db.ForeignKey('Questions.question_id', ondelete="CASCADE"), primary_key=True)
    response = db.Column(db.Text, nullable=False)

class RoutineFeedback(db.Model):
    __tablename__ = 'Routine_Feedback'

    feedback_id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    user_id = db.Column(db.Integer, db.ForeignKey('Users.user_id', ondelete='CASCADE'), nullable=False)
    session_id = db.Column(db.Integer, db.ForeignKey('Questionnaire_Sessions.session_id', ondelete='CASCADE'), nullable=False)
    rating = db.Column(db.Integer, nullable=False)
    effectiveness_score = db.Column(db.Float)
    satisfaction_score = db.Column(db.Float)
    feedback_text = db.Column(db.Text)
    feedback_date = db.Column(db.DateTime, default=datetime.utcnow)


@app.route("/")
def index():
    return render_template("index.html")

@app.route("/routine")
@login_required
def routine():
    user_id = session.get('user_id')
    if not user_id:
        return redirect(url_for('login'))  # or wherever your login route is


    # Get the latest session for the user
    latest_session = (
        QuestionnaireSession.query
        .filter_by(user_id=user_id)
        .order_by(QuestionnaireSession.session_id.desc())
        .first()
    )

    if not latest_session:
        return render_template("routine.html", routine=None, message="No session found.")

    # Get the routine for that session
    user_routine = Routine.query.filter_by(session_id=latest_session.session_id).first()

    if not user_routine:
        return render_template("routine.html", routine=None, message="No routine found.")

    # Gather product info for each routine item
    routine_data = {}
    product_ids = {
        "cleanser": user_routine.cleanser_id,
        "serum": user_routine.serum_id,
        "moisturizer": user_routine.moisturizer_id,
        "sunscreen": user_routine.sunscreen_id
    }

    for step, prod_id in product_ids.items():
        if prod_id:
            product = Product.query.get(prod_id)
            if product:
                routine_data[step] = product

    return render_template("routine.html", routine=routine_data)

@app.route("/signup", methods=["GET", "POST"])
def signup():
    if request.method == "POST":
        username = request.form["username"]
        email = request.form["email"]
        password = request.form["password"]

        existing_user = User.query.filter_by(email=email).first()
        if existing_user:
            flash("Email already registered!", "warning")
            return redirect(url_for("signup"))

        new_user = User(username=username, email=email, password=password)
        db.session.add(new_user)
        db.session.commit()
        flash("Account created successfully!", "success")
        return redirect(url_for("login"))

    return render_template("signup.html")


@app.route("/questionnaire", methods=["GET", "POST"])
@login_required
def questionnaire():
    if request.method == "POST":
        user_id = session["user_id"]

        # Step 1: Create a new QuestionnaireSession
        new_session = QuestionnaireSession(user_id=user_id)
        db.session.add(new_session)
        db.session.commit()

        session_id = new_session.session_id
        questions = Question.query.all()

        # Store answers for scoring later
        answers = {}

        for question in questions:
            key = f"q{question.question_id}"
            values = request.form.getlist(key)
            if not values:
                continue  # skip unanswered

            answers[question.question_id] = values  # store for later scoring

            for v in values:
                response = QuestionnaireResponse(
                    session_id=session_id,
                    question_id=question.question_id,
                    response=v
                )
                db.session.add(response)

        db.session.commit()

        # Step 2: Extract basic factors
        age_group = answers.get(2, [None])[0]
        skin_color = answers.get(3, [None])[0]
        acne = answers.get(4, [None])[0] == "Yes"  # assuming 'Yes' means True

        # Step 3: Skin Type Scoring (Q5–Q8)
        skin_scores = defaultdict(int)

        skin_map = {
            5: {  # Q5
                "Very oily and shiny": ("Oily", 3),
                "Tight and rough": ("Dry", 3),
                "Comfortable and soft": ("Balanced", 3),
                "Oily on T-zone, dry on cheeks": ("Combination", 3)
            },
            6: {  # Q6
                "Large and visible everywhere": ("Oily", 2),
                "Small and tight": ("Dry", 2),
                "Barely visible": ("Balanced", 2),
                "Large on T-zone, small on cheeks": ("Combination", 2)
            },
            7: {  # Q7
                "Very often": ("Dry", 2),
                "Sometimes": ("Dry", 1),
                "Rarely": ("Balanced", 2),
                "Never": ("Oily", 1)
            },
            8: {  # Q8
                "Gets very greasy": ("Oily", 3),
                "Feels the same, normal": ("Balanced", 3),
                "Feels dry or irritated": ("Dry", 3),
                "Gets oily only on forehead/nose": ("Combination", 3)
            }
        }

        for q_id, options in skin_map.items():
            response = answers.get(q_id, [None])[0]
            if response in options:
                skin_type, points = options[response]
                skin_scores[skin_type] += points

        # Step 4: Sensitivity Scoring (Q9–Q11)
        sensitivity_score = 0
        sensitivity_map = {
            9: {
                "Almost always": 3,
                "Sometimes": 2,
                "Rarely": 1,
                "Never": 0
            },
            10: {
                "Yes, frequently": 3,
                "Occasionally": 2,
                "Very rarely": 1,
                "Never": 0
            },
            11: {
                "Easily irritated (redness, itchiness)": 3,
                "Mildly affected": 2,
                "Hardly any effect": 1,
                "No noticeable effect": 0
            }
        }

        for q_id, score_map in sensitivity_map.items():
            response = answers.get(q_id, [None])[0]
            if response in score_map:
                sensitivity_score += score_map[response]

        sensitivity = sensitivity_score >= 5

        # Step 5: Determine dominant skin type and its score
        if skin_scores:
            skin_type = max(skin_scores, key=skin_scores.get)
            skin_type_score = skin_scores[skin_type]
        else:
            skin_type = None
            skin_type_score = 0

        # Step 6: Insert into Factors table
        factors = Factors(
            user_id=user_id,
            session_id=session_id,
            concerns=None,  # you can extract this too if mapped
            age_group=age_group,
            skin_color=skin_color,
            acne=acne,
            skin_type=skin_type,
            skin_type_score=skin_type_score,
            sensitivity=sensitivity,
            sensitivity_score=sensitivity_score
        )
        db.session.add(factors)
        db.session.commit()

        products = Product.query.all()
        top_products = {"cleanser": [], "serum": [], "moisturizer": [], "sunscreen": []}  # now list of tuples (prod_id, score)

# Define scoring weights
        weight_skin = 0.3
        weight_age = 0.2
        weight_sensitivity = 0.3 if sensitivity else 0.1
        weight_rating = 0.2 if sensitivity else 0.4

        for product in products:
            cat = product.prod_category.lower()
            if cat not in top_products:
                continue  # skip unrelated categories

            try:
                skin_score = product.prod_skin_type_score.get(skin_type, 0)
                age_score = product.prod_age_group_score.get(age_group, 0)
            except Exception:
                skin_score = 0
                age_score = 0

            sensitivity_score_norm = product.prod_sensitivity_score or 0
            rating_score_norm = (product.prod_rating or 0) / 5.0

            final_score = (
        weight_skin * skin_score +
        weight_age * age_score +
        weight_sensitivity * sensitivity_score_norm +
        weight_rating * rating_score_norm
    )

    # Insert product with score into the list for that category
            top_products[cat].append((product.prod_id, final_score))

# Now pick random from top 3 per category
        selected_products = {}

        for cat, prod_list in top_products.items():
    # Sort descending by score
            top_3 = sorted(prod_list, key=lambda x: x[1], reverse=True)[:3]
            if top_3:
                selected_products[cat] = random.choice(top_3)[0]  # pick prod_id randomly
            else:
                selected_products[cat] = None


        # Step 8: Insert the routine into Routine table
        new_routine = Routine(
            session_id=session_id,
            cleanser_id=get_random_top_product(top_products["cleanser"]),
            serum_id=get_random_top_product(top_products["serum"]),
            moisturizer_id=get_random_top_product(top_products["moisturizer"]),
            sunscreen_id=get_random_top_product(top_products["sunscreen"])
        )
        db.session.add(new_routine)
        db.session.commit()


        flash("Questionnaire submitted successfully!", "success")
        return redirect(url_for("routine"))

    # GET request – display form
    questions = Question.query.all()
    return render_template("questionnaire.html", questions=questions)


@app.route("/products")
def view_products():
    products = Product.query.all()
    return render_template("products.html", products=products)

@app.route("/submission")
def submission():
    return render_template("submission.html")

@app.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        email = request.form["email"]
        password = request.form["password"]
        next_page = request.form.get("next")

        user = User.query.filter_by(email=email).first()

        if user and user.password == password:
            session["user_id"] = user.user_id
            session["username"] = user.username
            flash("Login successful!", "success")

            # If next_page exists and is safe, redirect there
            if next_page and is_safe_url(next_page):
                return redirect(next_page)
            # Otherwise redirect to home page (replace 'index' with your homepage route name)
            return redirect(url_for("index"))
        else:
            flash("Invalid email or password", "error")
            return redirect(url_for("login"))

    next_param = request.args.get("next")
    return render_template("login.html", next=next_param)



@app.route('/feedback', methods=['GET', 'POST'])
@login_required
def feedback():
    user_id = session.get('user_id')
    user_session = QuestionnaireSession.query.filter_by(user_id=user_id).order_by(QuestionnaireSession.session_id.desc()).first()

    if not user_session:
        flash("No session found to give feedback.")
        return redirect(url_for('routine'))

    session_id = user_session.session_id

    if request.method == 'POST':
        rating = int(request.form.get('rating'))
        effectiveness = float(request.form.get('effectiveness_score'))
        satisfaction = float(request.form.get('satisfaction_score'))
        feedback_text = request.form.get('feedback_text')

        # Insert feedback
        new_feedback = RoutineFeedback(
            user_id=user_id,
            session_id=session_id,
            rating=rating,
            effectiveness_score=effectiveness,
            satisfaction_score=satisfaction,
            feedback_text=feedback_text
        )
        db.session.add(new_feedback)

        # Get product IDs from routine
        routine = Routine.query.filter_by(session_id=session_id).first()
        product_ids = [
            routine.cleanser_id,
            routine.serum_id,
            routine.moisturizer_id,
            routine.sunscreen_id
        ]
        product_ids = [pid for pid in product_ids if pid]

        # Update product scores and ratings
        for prod_id in product_ids:
            product = Product.query.get(prod_id)
            if product:
                # Update rating with simple weighted average
                product.prod_rating = (product.prod_rating + rating) / 2

                # Update scores (just example logic - adjust based on actual logic)
                if product.prod_sensitivity_score is not None:
                    product.prod_sensitivity_score = (product.prod_sensitivity_score + effectiveness) / 2
                if product.prod_skin_type_score is not None and isinstance(product.prod_skin_type_score, dict):
                    for k in product.prod_skin_type_score:
                        product.prod_skin_type_score[k] = (product.prod_skin_type_score[k] + satisfaction) / 2

        db.session.commit()
        flash("Feedback submitted successfully!")
        return redirect(url_for('index'))

    return render_template("feedback.html")

if __name__ == "__main__":
    app.run(debug=True)
