# Skincare Recommendation System

This is a Flask-based web application that provides personalized skincare routines by analyzing individual user profiles through a structured questionnaire. The system incorporates a feedback mechanism and uses a MySQL database for data persistence.

---

## Table of Contents

- [Overview](#overview)
- [Key Features](#key-features)
- [System Architecture](#system-architecture)
- [Workflow](#workflow)
- [Database Design](#database-design)
- [Sample SQL Operations](#sample-sql-operations)
- [How to Run the Project](#how-to-run-the-project)
- [Project Structure](#project-structure)
- [Contributors](#contributors)

---

## Overview

The Skincare Recommendation System is designed to suggest customized skincare routines based on user responses to a detailed skin assessment. Each recommendation includes a four-step routine consisting of a cleanser, serum, moisturizer, and sunscreen. Additionally, users can provide feedback on the recommended products, allowing the system to improve over time.

---

## Key Features

### Personalized Routine Generator

- Users fill out a questionnaire detailing their skin type, sensitivity, and concerns.
- The system processes responses and generates a tailored 4-step skincare routine:
  - Cleanser
  - Serum
  - Moisturizer
  - Sunscreen

### Feedback Mechanism

- Users can rate and review their personalized routine.
- Feedback is tied to specific routine sessions for data analysis and improvement.

### Admin and Vendor Management

- **Admin Responsibilities:**
  - Manage the questionnaire and available product database
  - Monitor system analytics

- **Vendor Contributions:**
  - Provide product data such as ingredients, sensitivity scores, and skin compatibility metrics

---

## System Architecture

This project follows a three-tier architecture:

1. **Presentation Tier:** HTML and CSS (Frontend)
2. **Application Tier:** Flask and Python (Backend)
3. **Data Tier:** MySQL Database

---

## Workflow

### Routine Generation Process

1. **User Registration and Login**
2. **Questionnaire Submission**
   - Data stored in `Questionnaire_Sessions`, `Responses`, and `Factors` tables
3. **Routine Generation**
   - Based on stored factors, a product combination is selected
4. **Routine Display**
   - Retrieved from `Routine` and `Product` tables
5. **Feedback Collection**
   - Stored in the `Feedback` table and linked to sessions

---

## Database Design

- The schema is fully normalized to the Third Normal Form (3NF).
- Major relationships include:

| Relationship Name             | Type | Parent → Child                         | Notes         |
|------------------------------|------|----------------------------------------|---------------|
| User_Completes_Session       | 1:M  | Users → Questionnaire_Sessions         | Non-unique    |
| Session_Contains_Responses   | 1:M  | Questionnaire_Sessions → Responses     | Non-unique    |
| Question_Has_Responses       | 1:M  | Questions → Responses                  | Non-unique    |
| Question_Has_Options         | 1:M  | Questions → Options                    | Non-unique    |
| Session_Has_Factors          | 1:1  | Questionnaire_Sessions → Factors       | Unique (PK)   |
| Session_Generates_Routine    | 1:1  | Questionnaire_Sessions → Routine       | Unique (PK)   |
| Product_Included_In_Routine  | 1:M  | Product → Routine                      | Non-unique    |
| Session_Receives_Feedback    | 1:M  | Questionnaire_Sessions → Feedback      | Non-unique    |
| User_Provides_Feedback       | 1:M  | Users → Routine_Feedback               | Non-unique    |

---

## Sample SQL Operations

```sql
-- User login
SELECT * FROM User WHERE email = 'user@example.com' LIMIT 1;

-- Insert new questionnaire session
INSERT INTO QuestionnaireSession (user_id) VALUES (...);

-- Save user responses
INSERT INTO QuestionnaireResponse (session_id, question_id, response) VALUES (...);

-- Generate skincare routine
INSERT INTO Routine (session_id, cleanser_id, serum_id, moisturizer_id, sunscreen_id) VALUES (...);

