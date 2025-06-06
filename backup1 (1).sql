-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: skincare
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `factors`
--

DROP TABLE IF EXISTS `factors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factors` (
  `user_id` int NOT NULL,
  `session_id` int NOT NULL,
  `concerns` text,
  `age_group` varchar(20) DEFAULT NULL,
  `skin_color` varchar(100) DEFAULT NULL,
  `acne` tinyint(1) DEFAULT NULL,
  `skin_type` varchar(50) DEFAULT NULL,
  `skin_type_score` int DEFAULT NULL,
  `sensitivity` tinyint(1) DEFAULT NULL,
  `sensitivity_score` int DEFAULT NULL,
  PRIMARY KEY (`user_id`,`session_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `factors_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `factors_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `questionnaire_sessions` (`session_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factors`
--

LOCK TABLES `factors` WRITE;
/*!40000 ALTER TABLE `factors` DISABLE KEYS */;
INSERT INTO `factors` VALUES (2,5,NULL,'18ΓÇô25','Fair',0,'Dry',4,1,5),(2,6,NULL,'Under 18','Fair',0,'Dry',9,0,2),(2,7,NULL,'18ΓÇô25','Medium / Olive',0,'Dry',6,1,5),(2,8,NULL,'18ΓÇô25','Brown',0,'Dry',5,0,4),(2,9,NULL,'18ΓÇô25','Medium / Olive',0,'Oily',3,1,7),(2,11,NULL,'18ΓÇô25','Very Fair (burns easily)',0,'Oily',8,1,9),(2,12,NULL,'26ΓÇô35','Very Fair (burns easily)',0,'Oily',8,1,9),(2,13,NULL,'18ΓÇô25','Very Fair (burns easily)',0,'Oily',8,1,9),(2,14,NULL,'26ΓÇô35','Dark Brown / Black',0,'Balanced',4,0,3),(2,16,NULL,'26ΓÇô35','Fair',0,'Dry',4,0,4),(2,17,NULL,'18ΓÇô25','Very Fair (burns easily)',0,'Balanced',5,0,2),(2,20,NULL,'26ΓÇô35','Very Fair (burns easily)',0,'Dry',7,1,7),(6,15,NULL,'26ΓÇô35','Dark Brown / Black',0,'Combination',8,0,0),(7,18,NULL,'18ΓÇô25','Medium / Olive',0,'Dry',6,1,6),(9,19,NULL,'18ΓÇô25','Medium / Olive',0,'Dry',7,0,4);
/*!40000 ALTER TABLE `factors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `options`
--

DROP TABLE IF EXISTS `options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `options` (
  `option_id` int NOT NULL AUTO_INCREMENT,
  `question_id` int DEFAULT NULL,
  `option_text` text,
  PRIMARY KEY (`option_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `options_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `options`
--

LOCK TABLES `options` WRITE;
/*!40000 ALTER TABLE `options` DISABLE KEYS */;
INSERT INTO `options` VALUES (1,1,'Acne or frequent breakouts'),(2,1,'Blackheads or clogged pores'),(3,1,'Excessive oil/shininess'),(4,1,'Dryness or flakiness'),(5,1,'Redness or irritation'),(6,1,'Sensitivity to skincare products'),(7,1,'Uneven skin tone or dark spots'),(8,1,'Fine lines or wrinkles'),(9,1,'Dull-looking skin'),(10,1,'Rough or bumpy texture'),(11,1,'Other'),(12,2,'Under 18'),(13,2,'18ΓÇô25'),(14,2,'26ΓÇô35'),(15,2,'36ΓÇô45'),(16,2,'46+'),(17,3,'Very Fair (burns easily)'),(18,3,'Fair'),(19,3,'Medium / Olive'),(20,3,'Brown'),(21,3,'Dark Brown / Black'),(22,4,'Yes, often'),(23,4,'Sometimes'),(24,4,'Rarely'),(25,4,'Never'),(26,5,'Very oily and shiny'),(27,5,'Tight and rough'),(28,5,'Comfortable and soft'),(29,5,'Oily on T-zone, dry on cheeks'),(30,6,'Large and visible everywhere'),(31,6,'Small and tight'),(32,6,'Barely visible'),(33,6,'Large on T-zone, small on cheeks'),(34,7,'Very often'),(35,7,'Sometimes'),(36,7,'Rarely'),(37,7,'Never'),(38,8,'Gets very greasy'),(39,8,'Feels the same, normal'),(40,8,'Feels dry or irritated'),(41,8,'Gets oily only on forehead/nose'),(42,9,'Almost always'),(43,9,'Sometimes'),(44,9,'Rarely'),(45,9,'Never'),(46,10,'Yes, frequently'),(47,10,'Occasionally'),(48,10,'Very rarely'),(49,10,'Never'),(50,11,'Easily irritated (redness, itchiness)'),(51,11,'Mildly affected'),(52,11,'Hardly any effect'),(53,11,'No noticeable effect');
/*!40000 ALTER TABLE `options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prod_id` int NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(255) NOT NULL,
  `prod_comp` varchar(100) DEFAULT NULL,
  `prod_price` decimal(10,2) NOT NULL,
  `prod_category` varchar(100) NOT NULL,
  `prod_concerns` text,
  `prod_sensitivity_score` float DEFAULT '0',
  `prod_skin_type_score` json DEFAULT NULL,
  `prod_age_group_score` json DEFAULT NULL,
  `prod_rating` float DEFAULT '0',
  `description` text,
  `link` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`prod_id`),
  CONSTRAINT `product_chk_1` CHECK ((`prod_rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Vitamin C Serum with Niacinamide & Alpha Arbutin','Accufix Cosmetics',3195.00,'Serum','Hyperpigmentation, Melasma, Uneven skin tone',0.9,'{\"dry\": 0.9, \"oily\": 0.8, \"combination\": 0.9}','{\"18-25\": 0.8, \"26-35\": 0.9}',4.95,'Brightening serum with 10% SAP Vitamin C, 4% Niacinamide, 2% Alpha Arbutin, Bearberry & Mulberry Extracts. Avoid during pregnancy.','https://accufixcosmetics.com/collections/face-serums/products/vitamin-c-serum-niacinamide-alpha-arbutin'),(2,'Salicylic Acid Serum','Accufix Cosmetics',1895.00,'Serum','Acne, Blackheads, Oily skin',0.7,'{\"dry\": 0.5, \"oily\": 0.9, \"combination\": 0.8}','{\"18-25\": 0.9, \"26-35\": 0.8}',4.59,'Exfoliating serum with 1.5% Salicylic Acid and Glycolic Acid for acne-prone and textured skin.','https://accufixcosmetics.com/collections/face-serums/products/salicylic-acid-serum'),(3,'Vitamin C Serum','Accufix Cosmetics',1895.00,'Serum','Dullness, Uneven skin tone, Hyperpigmentation',0.9,'{\"dry\": 0.9, \"oily\": 0.8, \"combination\": 0.9}','{\"18-25\": 0.8, \"26-35\": 0.8}',4.57,'Contains 10% Sodium Ascorbyl Phosphate and Hylaraunic acid. Fragrance-free, suitable for sensitive skin.','https://accufixcosmetics.com/collections/face-serums/products/vitamin-c-serum'),(4,'Azelaic Acid Serum','Accufix Cosmetics',3195.00,'Serum','Redness, Blemishes, Texture irregularities',0.95,'{\"dry\": 0.9, \"oily\": 0.9, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.8}',4.8,'10% Azelaic Acid serum targeting redness and post-acne marks. Suitable for all skin types.','https://accufixcosmetics.com/collections/face-serums/products/azelaic-acid-serum'),(5,'Niacinamide Serum','Accufix Cosmetics',1895.00,'Serum','Oiliness, Large pores, Uneven skin tone',0.9,'{\"dry\": 0.8, \"oily\": 0.9, \"combination\": 0.8}','{\"18-25\": 0.8, \"26-35\": 0.8}',4.86,'10% Niacinamide and Zinc PCA to reduce sebum and tighten pores. Water-based, fragrance-free.','https://accufixcosmetics.com/collections/face-serums/products/niacinamide-serum'),(6,'Retinol Serum','Accufix Cosmetics',2195.00,'Serum','Fine lines, Acne, Uneven texture',0.6,'{\"dry\": 0.6, \"oily\": 0.8, \"combination\": 0.7}','{\"26-35\": 0.9, \"36-50\": 0.8}',4.5,'Encapsulated 0.3% Retinol serum to reduce signs of aging and acne. Not recommended during pregnancy.','https://accufixcosmetics.com/collections/face-serums/products/retinol-serum'),(7,'Salicylic Acid Cleanser','Accufix Cosmetics',1495.00,'Cleanser','Acne, Blackheads, Oily skin',0.8,'{\"dry\": 0.6, \"oily\": 0.9, \"combination\": 0.8}','{\"18-25\": 0.9, \"26-35\": 0.8}',4.74,'Bestselling cleanser formulated with salicylic and glycolic acids to control acne, unclog pores, and improve skin texture without irritation.','https://accufixcosmetics.com/collections/glycolic-acid/products/salicylic-acid-cleanser'),(8,'Glycolic Acid Toner','Accufix Cosmetics',2295.00,'Toner','Dullness, Uneven texture, Hyperpigmentation',0.85,'{\"dry\": 0.9, \"oily\": 0.8, \"combination\": 0.9}','{\"18-25\": 0.8, \"26-35\": 0.9}',5,'Gel-based toner with glycolic and lactic acids, enriched with oat extract and panthenol, gently exfoliates and hydrates for smoother, brighter skin.','https://accufixcosmetics.com/collections/glycolic-acid/products/glycolic-acid-toner'),(9,'Daily Moisturizer','Hudson Skincare',1260.00,'Moisturizer','Dryness, Dehydration, Barrier repair',0.93125,'{\"dry\": 0.95, \"oily\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4.725,'Lightweight moisturizer with ceramides and hyaluronic acid for daily hydration and barrier support. Suitable for sensitive and all skin types.','https://hudson-skincare.com/collections/face/products/daily-moisturizer'),(10,'Salicylic Acid Cleanser','Hudson Skincare',1500.00,'Cleanser','Acne, Oil control, Clogged pores',0.7,'{\"dry\": 0.6, \"oily\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.8}',5,'Gentle cleanser with 2% salicylic acid to unclog pores, reduce breakouts, and balance oil. Ideal for acne-prone and oily skin.','https://hudson-skincare.com/collections/face/products/salicylic-acid-cleanser'),(11,'Discoloration Defense Serum','Hudson Skincare',2850.00,'Serum','Dark spots, Hyperpigmentation, Uneven tone',0.8,'{\"dry\": 0.9, \"oily\": 0.9, \"combination\": 0.9}','{\"18-25\": 0.8, \"26-35\": 0.9}',3,'Clinically proven blend of tranexamic acid, niacinamide, and kojic acid to reduce dark spots and discoloration. Fragrance-free.','https://hudson-skincare.com/collections/face/products/discoloration-defense-serum'),(12,'C15 Antioxidant Serum','Hudson Skincare',3500.00,'Serum','Dullness, Environmental damage, Aging',0.85,'{\"dry\": 0.9, \"oily\": 0.85, \"combination\": 0.9}','{\"26-35\": 0.9, \"36-50\": 0.9}',1,'High-potency Vitamin C serum (15%) to brighten skin, neutralize free radicals, and promote collagen. Non-irritating formula.','https://hudson-skincare.com/collections/face/products/c15-antioxidant-serum'),(13,'Blemish + Age Defense Serum','Hudson Skincare',2550.00,'Serum','Acne, Enlarged pores, Aging',0.75,'{\"dry\": 0.6, \"oily\": 0.9, \"combination\": 0.85}','{\"26-35\": 0.9, \"36-50\": 0.85}',1,'Targeted treatment combining salicylic and glycolic acid to treat adult acne and reduce fine lines. Oil-free.','https://hudson-skincare.com/collections/face/products/blemish-age-defense-serum'),(14,'Daily Sunscreen Gel','Hudson Skincare',4400.00,'Sunscreen','UV protection, Photoaging',0.95,'{\"dry\": 0.9, \"oily\": 0.9, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4,'Broad spectrum SPF 50+ sunscreen with antioxidant protection in a lightweight gel. Non-comedogenic and sensitive-skin friendly.','https://hudson-skincare.com/collections/face/products/daily-sunscreen-gel'),(15,'Daily Sunscreen Gel','Hudson Skincare',4400.00,'Sunscreen','UV protection, Photoaging',0.95,'{\"dry\": 0.9, \"oily\": 0.9, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4,'Broad spectrum SPF 50+ sunscreen with antioxidant protection in a lightweight gel. Non-comedogenic and sensitive-skin friendly.','https://hudson-skincare.com/collections/face/products/daily-sunscreen-gel'),(16,'Moisture Balancing Cleanser','Hudson Skincare',1450.00,'Cleanser','Dryness, Redness, Skin balance',0.95,'{\"dry\": 0.95, \"oily\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.9}',1,'Gentle cleanser with ceramides and glycerin to maintain skin moisture without stripping. Ideal for daily use.','https://hudson-skincare.com/collections/face/products/moisture-balancing-cleanser'),(17,'Silymarin C15 Serum','Hudson Skincare',2900.00,'Serum','Oiliness, Free radicals, Dull skin',0.8,'{\"oily\": 0.9, \"combination\": 0.85}','{\"26-35\": 0.9, \"36-50\": 0.85}',1,'Oil-control antioxidant serum with 15% Vitamin C and Silymarin for oily and blemish-prone skin. Non-comedogenic.','https://hudson-skincare.com/collections/face/products/silymarin-c15-serum'),(18,'Hyaluronic B5 Serum','Hudson Skincare',2600.00,'Serum','Dehydration, Dryness, Skin plumping',0.98,'{\"dry\": 1.0, \"oily\": 0.75, \"combination\": 0.75}','{\"18-25\": 0.95, \"26-35\": 0.95, \"36-50\": 0.9}',1,'Intensely hydrating serum with hyaluronic acid and vitamin B5 to restore moisture and plump the skin. Excellent for all skin types.','https://hudson-skincare.com/collections/face/products/hyaluronic-b5-serum'),(19,'3-in-1 Bright Sunscreen SPF 40','Join Her Beauty',2995.00,'Sunscreen','Sun protection, Dullness, Uneven tone',0.9,'{\"dry\": 0.9, \"oily\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',1,'Lightweight SPF 40 mineral sunscreen with niacinamide and vitamin C for brightening, oil control, and hydration. Suitable for all skin types.','https://joinherbeauty.com/products/3-in-1-bright-sunscreen-spf-40'),(20,'Soy Smoothie Moisturizer','Join Her Beauty',2800.00,'Moisturizer','Dryness, Uneven texture, Redness',0.95,'{\"dry\": 0.95, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.85, \"26-35\": 0.9, \"36-50\": 0.85}',4.5,'Creamy moisturizer powered by fermented soy, niacinamide, and probiotics to soothe, smooth, and strengthen the skin barrier. Fragrance-free.','https://joinherbeauty.com/products/soy-smoothie'),(21,'Balance Bestie Cleanser','Join Her Beauty',1900.00,'Cleanser','Oiliness, Acne, Redness, Uneven texture',0.95,'{\"dry\": 0.7, \"oily\": 0.95, \"normal\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.9}',4,'A pH-balanced gel cleanser with 1% Zinc PCA, 0.5% Allantoin, and prebiotics. Designed to reduce oil, unclog pores, and calm skin without disrupting the skin barrier. Ideal for oily, acne-prone, and sensitive skin.','https://joinherbeauty.com/products/balance-bestie'),(22,'Goodnight Glow ΓÇô PowerBlend Exfoliating Tonic','Join Her Beauty',2800.00,'Toner','Dullness, Uneven texture, Pores, Acne, Fine lines',0.85,'{\"dry\": 0.75, \"oily\": 0.9, \"normal\": 0.8, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4.8,'A nighttime exfoliating tonic with 6% Glycolic Acid, 1% Niacinamide, Salicylic Acid, and Hyaluronic Acid. Designed to deeply cleanse, unclog pores, correct discoloration, and refine skin texture for a radiant glow.','https://joinherbeauty.com/products/goodnight-glow'),(23,'Bright B.A.E ΓÇô Daily Wakeup Radiance Tonic','Join Her Beauty',2800.00,'Toner','Dullness, Uneven tone, Enlarged pores, Dehydration',0.9,'{\"dry\": 0.9, \"oily\": 0.8, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4,'A daily radiance tonic featuring 3% Niacinamide, 2% Alpha Arbutin, Vitamin C, Hyaluronic Acid, and Chamomile. Helps reduce dullness, even out skin tone, and minimize pores for a glowing complexion.','https://joinherbeauty.com/products/bright-b-a-e'),(24,'Superkind Lift & Renew Serum','Join Her Beauty',3000.00,'Serum','Fine lines, Wrinkles, Acne scars, Uneven tone',0.9,'{\"dry\": 0.85, \"oily\": 0.9, \"normal\": 0.9, \"combination\": 0.9}','{\"26-35\": 0.95, \"36-50\": 0.9}',1,'A gentle yet effective serum featuring 1% Encapsulated MultiSal Retinol, Bakuchiol, and Squalane. Designed to reduce wrinkles, even skin tone, and diminish acne scarring without irritation.','https://joinherbeauty.com/products/superkind-lift-and-renew-serum-2'),(25,'Superkind Brighten & Correct Serum','Join Her Beauty',2850.00,'Serum','Hyperpigmentation, Dark spots, Dullness, Uneven tone',0.875,'{\"dry\": 0.9, \"oily\": 0.9, \"normal\": 0.9, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.95}',4.5,'An ultra-lightweight serum with 4% Niacinamide and a 1% blend of Tyrostat & Belides. Targets stubborn hyperpigmentation and discoloration, revealing a clearer and brighter complexion.','https://joinherbeauty.com/products/superkind-brighten-correct-serum'),(26,'Superkind Glow & Radiate Serum','Join Her Beauty',2850.00,'Serum','Dullness, Uneven tone, Fine lines',0.95,'{\"dry\": 0.9, \"oily\": 0.9, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.9}',4.5,'A potent yet gentle serum with 10% Vitamin C and Sunflower Seed Oil. Enhances skin radiance, smooths texture, and provides antioxidant protection.','https://joinherbeauty.com/products/superkind-glow-radiate-serum'),(27,'Superkind Pillowy & Plumpy Serum','Join Her Beauty',2950.00,'Serum','Dryness, Dehydration, Fine lines, Redness',0.95,'{\"dry\": 0.95, \"oily\": 0.75, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.95, \"36-50\": 0.9}',4.5,'A hydration powerhouse featuring 5% 5D Hyaluronic Acid, 1% Niacinamide, firming Peptides, and Aloe Vera. Delivers intense moisture, plumps skin, and soothes redness.','https://joinherbeauty.com/products/superkind-pillowy-plumpy-serum'),(28,'Skin Drink ΓÇô Hydrating Rose Essence','Join Her Beauty',3500.00,'Moisturizer','Dehydration, Dryness, Dullness, Redness',0.95,'{\"dry\": 0.95, \"oily\": 0.8, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.95, \"36-50\": 0.9}',4.5,'A 2-in-1 toner and moisturizer enriched with 5D Hyaluronic Acid, Niacinamide, Squalene, and Rosa Damascena Flower Water. This hydrating milk traps moisture to keep skin plump and radiant throughout the day.','https://joinherbeauty.com/products/skin-drink'),(29,'Dermive Hydrating Serum','Jenpharm',1698.00,'Serum','Dehydration, Dryness, Sensitivity',0.95,'{\"dry\": 0.95, \"oily\": 0.8, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.95, \"36-50\": 0.9}',4.8,'A lightweight hydrating serum enriched with Hyaluronic Acid and Aloe Vera, designed to replenish moisture and soothe sensitive skin.','https://jenpharm.com/collections/skin-care/products/dermive-hydrating-serum?variant=49474185396522'),(30,'Epceama Anti-Aging Serum','Jenpharm',1798.00,'Serum','Fine lines, Wrinkles, Uneven tone',0.9,'{\"dry\": 0.9, \"oily\": 0.8, \"normal\": 0.9, \"combination\": 0.85}','{\"50+\": 0.9, \"26-35\": 0.9, \"36-50\": 0.95}',4.8,'An anti-aging serum featuring 5% Laminaria Japonica Extract, 2% Gamma-Aminobutyric Acid, and 0.5% Sodium Ascorbyl Phosphate to reduce wrinkles and improve skin firmness.','https://jenpharm.com/collections/skin-care/products/epceama-anti-aging-serum?variant=46770695242026'),(31,'Cerulic Glow Boosting Serum','Jenpharm',1798.00,'Serum','Dullness, Uneven tone, Fine lines',0.9,'{\"dry\": 0.9, \"oily\": 0.8, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4.8,'A glow-boosting serum formulated with Ferulic Acid and Sodium Ascorbyl Phosphate to enhance radiance and reduce signs of aging.','https://jenpharm.com/collections/skin-care/products/cerulic-glow-boosting-serum?variant=46770682298666'),(32,'Maxdif Brightening Serum','Jenpharm',1598.00,'Serum','Hyperpigmentation, Dullness, Uneven tone',0.9,'{\"dry\": 0.9, \"oily\": 0.8, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.95, \"36-50\": 0.9}',4.8,'A brightening serum containing Alpha-Arbutin, Glutathione, and Sodium Ascorbyl Phosphate to reduce pigmentation and enhance skin clarity.','https://jenpharm.com/collections/skin-care/products/maxdif-brightening-serum'),(33,'Niaronic Serum','Jenpharm',1598.00,'Serum','Redness, Sensitivity, Uneven tone',0.95,'{\"dry\": 0.9, \"oily\": 0.85, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.95, \"36-50\": 0.9}',4.8,'A soothing serum enriched with Centella Asiatica, Green Tea Extract, and Galactoarabinan to calm sensitive skin and improve tone.','https://jenpharm.com/collections/skin-care/products/niaronic-serum?variant=46771019284778'),(34,'Mandelac Serum','Jenpharm',1798.00,'Serum','Acne, Uneven texture, Hyperpigmentation',0.8,'{\"dry\": 0.8, \"oily\": 0.95, \"normal\": 0.8, \"combination\": 0.8}','{\"18-25\": 0.95, \"26-35\": 0.9, \"36-50\": 0.85}',4.8,'An exfoliating serum with Mandelic Acid and Allantoin, designed to gently remove dead skin cells and improve skin texture.','https://jenpharm.com/collections/skin-care/products/mandelac-serum?variant=46770764775722'),(35,'Dermive Sensitive Moisturizer','Jenpharm',998.00,'Moisturizer','Skin sensitivity, Redness, Itchy skin, Damaged skin barrier',0.875,'{\"dry\": 0.9, \"oily\": 0.85, \"normal\": 0.9, \"combination\": 0.9}','{\"50+\": 0.9, \"0-17\": 0.9, \"18-25\": 0.95, \"26-35\": 0.95, \"36-50\": 0.9}',4.4,'A fragrance-free moisturizer enriched with Oat Kernel oil, Ceramide III, and Centella Asiatica Extract, designed to soothe inflamed skin, relieve itching, and repair the skin barrier. Suitable for all skin types, including sensitive skin and babies.','https://jenpharm.com/collections/skin-care/products/dermive-sensitive-moisturizer?variant=46770726043946'),(36,'Spectra Block Max 100','Jenpharm',998.00,'Sunscreen','Sun protection, Premature aging',0.85,'{\"dry\": 0.9, \"oily\": 0.9, \"normal\": 0.9, \"combination\": 0.9}','{\"50+\": 0.9, \"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.9}',4.4,'A broad-spectrum sunscreen with SPF 100, formulated with Titanium Dioxide, Zinc Oxide, and Avobenzone. Provides high sun protection without white residue, suitable for all skin types.','https://jenpharm.com/collections/skin-care/products/spectra-block-max-100?variant=46770598117674'),(37,'Spectra Block SPF60','Jenpharm',998.00,'Sunscreen','Sun protection, Premature aging',0.95,'{\"dry\": 0.95, \"oily\": 0.85, \"normal\": 0.95, \"combination\": 0.85}','{\"50+\": 0.9, \"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.9}',3.975,'A broad-spectrum sunscreen with SPF 60, enriched with Microfine Zinc Oxide, Titanium Dioxide, Aloe Vera, and Vitamin E. Offers sun protection with a shine-free finish, ideal for normal to dry skin types.','https://jenpharm.com/collections/skin-care/products/sunblock-spectra-block?variant=46770636751146'),(38,'Dermive Oily Moisturizer','Jenpharm',998.00,'Moisturizer',' Dehydration',0.45,'{\"dry\": 0.95, \"oily\": 0.8, \"normal\": 0.85, \"combination\": 0.95}','{\"18-25\": 0.95, \"26-35\": 0.9, \"36-50\": 0.85}',2.9,'A lightweight moisturizer formulated with Hyaluronic Acid, Ceramides, and Glycerin to hydrate oily and acne-prone skin without clogging pores. Contains Microfine Titanium Dioxide and Octinoxate for added sun protection.','https://jenpharm.com/collections/skin-care/products/dermive-oily-moisturizer?variant=46770883592490'),(39,'Dermive Oil-Free Moisturizer','Jenpharm',998.00,'Moisturizer','Oily skin, Dehydration',0.975,'{\"dry\": 0.8, \"oily\": 0.95, \"normal\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.9, \"36-50\": 0.85}',4.9,'A non-comedogenic, lightweight moisturizer infused with Ceramides, Hyaluronic Acid, and Glycerin to hydrate and soothe oily and acne-prone skin. Free from fragrances and essential oils.','https://jenpharm.com/collections/skin-care/products/dermive-oil-free?variant=46770752946474'),(40,'Spectra Matt SC SPF 40','Jenpharm',1998.00,'Sunscreen','Oily skin, Acne-prone skin, Sun protection',0.4875,'{\"dry\": 0.8, \"oily\": 0.95, \"normal\": 0.8, \"combination\": 0.8}','{\"18-25\": 0.95, \"26-35\": 0.9, \"36-50\": 0.85}',2.95,'An acne-friendly, broad-spectrum sunscreen with SPF 40, formulated with Tinosorb S, Uvinul A+, and Ethylhexyl Methoxycinnamate to provide effective sun protection without a white cast. Ideal for oily and sensitive skin types.','https://jenpharm.com/collections/skin-care/products/spectra-matt?variant=46770610995498'),(41,'The Ordinary \"Buffet\" Multi-Peptide Serum','The Ordinary',4995.00,'Serum','Fine lines, Wrinkles, Loss of firmness',0.95625,'{\"dry\": 0.9, \"oily\": 0.85, \"normal\": 0.9, \"combination\": 0.85}','{\"50+\": 0.95, \"26-35\": 0.9, \"36-50\": 0.95}',4,'A multi-technology peptide serum that targets multiple signs of aging, including fine lines and wrinkles, to promote a smoother, more youthful appearance.','https://ordinarypakistan.pk/product/buffet-multi-peptide-serum/'),(42,'The Ordinary Alpha Arbutin 2% + HA','The Ordinary',5995.00,'Serum','Hyperpigmentation, Dark spots, Uneven skin tone',0.9,'{\"dry\": 0.9, \"oily\": 0.85, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.95, \"36-50\": 0.9}',5,'A concentrated serum with purified alpha arbutin and hyaluronic acid to reduce the look of dark spots and uneven skin tone.','https://ordinarypakistan.pk/product/alpha-arbutin-2-ha/'),(43,'The Ordinary Argireline Solution 10%','The Ordinary',2795.00,'Serum','Fine lines, Expression lines, Forehead lines',0.9,'{\"dry\": 0.95, \"oily\": 0.8, \"normal\": 0.95, \"combination\": 0.8}','{\"50+\": 0.95, \"26-35\": 0.9, \"36-50\": 0.95}',5,'A lightweight serum that targets the appearance of dynamic facial lines, especially around the eyes and forehead.','https://ordinarypakistan.pk/product/argireline-solution/'),(44,'The Ordinary Ascorbic Acid 8% + Alpha Arbutin 2%','The Ordinary',6450.00,'Serum','Dullness, Uneven tone, Dark spots',0.9,'{\"dry\": 0.9, \"oily\": 0.85, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4.8,'A brightening serum combining pure vitamin C and alpha arbutin to target signs of aging and uneven skin tone.','https://ordinarypakistan.pk/product/ascorbic-acid-alpha-arbutin/'),(45,'The Ordinary Ascorbyl Glucoside Solution 12%','The Ordinary',4400.00,'Serum','Dullness, Uneven tone, Signs of aging',0.93125,'{\"dry\": 0.95, \"oily\": 0.9, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.95, \"36-50\": 0.9}',4.73625,'A brightening serum with a stable vitamin C derivative that visibly targets uneven skin tone and signs of aging.','https://ordinarypakistan.pk/product/ascorbyl-glucoside-solution/'),(46,'The Ordinary Caffeine Solution 5% + EGCG','The Ordinary',3995.00,'Serum','Dark circles, Puffiness, Eye bags',0.95,'{\"dry\": 0.95, \"oily\": 0.9, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.95, \"36-50\": 0.9}',5,'A lightweight serum with caffeine and EGCG to reduce the appearance of eye contour pigmentation and puffiness.','https://ordinarypakistan.pk/product/caffeine-5-egcg/'),(47,'The Ordinary Caffeine Solution 5% + EGCG','The Ordinary',5995.00,'Serum','Dark circles, Puffiness, Eye bags',0.95,'{\"dry\": 0.95, \"oily\": 0.9, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.95, \"36-50\": 0.9}',4.67,'A lightweight serum with caffeine and EGCG to reduce the appearance of eye contour pigmentation and puffiness.','https://ordinarypakistan.pk/product/caffeine-5-egcg/'),(48,'The Ordinary Granactive Retinoid 2% Emulsion','The Ordinary',5995.00,'Serum','Fine lines, Wrinkles, Uneven texture',0.85,'{\"dry\": 0.9, \"oily\": 0.8, \"normal\": 0.9, \"combination\": 0.85}','{\"50+\": 0.95, \"26-35\": 0.9, \"36-50\": 0.95}',4.67,'A creamy serum with advanced retinoid active technologies to reduce signs of aging and improve skin texture.','https://ordinarypakistan.pk/product/granactive-retinoid-emulsion/'),(49,'The Ordinary Hyaluronic Acid 2% + B5','The Ordinary',4990.00,'Serum','Dryness, Dehydration, Fine lines',0.95,'{\"dry\": 0.95, \"oily\": 0.9, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.95, \"36-50\": 0.9}',4.78,'A hydrating serum with hyaluronic acid and vitamin B5 to enhance moisture retention and improve skin smoothness.','https://ordinarypakistan.pk/product/hyaluronic-acid-b5/'),(50,'Marine Hyaluronics','The Ordinary',4495.00,'Serum','Dehydration, Dryness',0.95,'{\"dry\": 0.95, \"oily\": 0.85, \"normal\": 0.9, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.95, \"36-50\": 0.9}',4.75,'A lightweight, water-based serum that offers deep hydration using marine-derived ingredients, suitable for all skin types.','https://ordinarypakistan.pk/product/marine-hyaluronics/'),(51,'Matrixyl 10% + HA','The Ordinary',5695.00,'Serum','Fine lines, Wrinkles, Loss of firmness',0.9,'{\"dry\": 0.95, \"oily\": 0.85, \"normal\": 0.95, \"combination\": 0.9}','{\"50+\": 0.95, \"26-35\": 0.9, \"36-50\": 0.95}',5,'A high-strength peptide formulation that targets visible signs of aging and supports skin elasticity.','https://ordinarypakistan.pk/product/matrixyl-ha/'),(52,'Matrixyl 10% + HA','The Ordinary',4995.00,'Serum','Fine lines, Wrinkles, Loss of firmness',0.9,'{\"dry\": 0.95, \"oily\": 0.85, \"normal\": 0.95, \"combination\": 0.9}','{\"50+\": 0.95, \"26-35\": 0.9, \"36-50\": 0.95}',5,'A high-strength peptide formulation that targets visible signs of aging and supports skin elasticity.','https://ordinarypakistan.pk/product/matrixyl-ha/'),(53,'Multi-Peptide + HA Serum','The Ordinary',4995.00,'Serum','Fine lines, Wrinkles, Loss of firmness',0.9,'{\"dry\": 0.95, \"oily\": 0.85, \"normal\": 0.95, \"combination\": 0.9}','{\"50+\": 0.95, \"26-35\": 0.9, \"36-50\": 0.95}',5,'A comprehensive peptide serum that targets multiple signs of aging and improves skin texture and elasticity.','https://ordinarypakistan.pk/product/multi-peptideha-serum/'),(54,'Niacinamide 10% + Zinc 1%','The Ordinary',4495.00,'Serum','Blemishes, Congestion, dryness',0.9,'{\"dry\": 0.85, \"oily\": 0.9, \"normal\": 0.9, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.9, \"36-50\": 0.85}',4.92,'A high-strength vitamin and mineral formula that visibly regulates sebum and minimizes pores.','https://ordinarypakistan.pk/product/niacinamide-and-zinc/'),(55,'Resveratrol 3% + Ferulic Acid 3%','The Ordinary',4990.00,'Serum','Oxidative stress, Signs of aging',0.9,'{\"dry\": 0.9, \"oily\": 0.85, \"normal\": 0.9, \"combination\": 0.85}','{\"50+\": 0.95, \"26-35\": 0.9, \"36-50\": 0.95}',5,'A high-potency antioxidant serum that protects against environmental stressors and supports skin health.','https://ordinarypakistan.pk/product/the-ordinary-resveratrol-3-ferulic-acid-3/'),(56,'Retinol 0.2% in Squalane','The Ordinary',5195.00,'Serum','Fine lines, Uneven texture, Signs of aging',0.85,'{\"dry\": 0.9, \"oily\": 0.8, \"normal\": 0.9, \"combination\": 0.85}','{\"50+\": 0.95, \"26-35\": 0.9, \"36-50\": 0.95}',4.88,'A gentle retinol serum in a squalane base that targets signs of aging and improves skin texture.','https://ordinarypakistan.pk/product/retinol-in-squalane-2/'),(57,'Retinol 0.5% in Squalane','The Ordinary',5495.00,'Serum','Fine lines, Uneven texture, Signs of aging',0.8,'{\"dry\": 0.85, \"oily\": 0.75, \"normal\": 0.85, \"combination\": 0.8}','{\"50+\": 0.95, \"26-35\": 0.9, \"36-50\": 0.95}',4.83,'A moderate-strength retinol serum in a squalane base that targets signs of aging and improves skin texture.','https://ordinarypakistan.pk/product/retinol-in-squalane-4/'),(58,'Retinol 1% in Squalane','The Ordinary',4995.00,'Serum','Fine lines, Uneven texture, Signs of aging',0.75,'{\"dry\": 0.8, \"oily\": 0.7, \"normal\": 0.8, \"combination\": 0.75}','{\"50+\": 0.95, \"26-35\": 0.9, \"36-50\": 0.95}',4.9,'A high-strength retinol serum in a squalane base that targets signs of aging and improves skin texture.','https://ordinarypakistan.pk/product/retinol-in-squalane/'),(59,'Soothing & Barrier Support Serum','The Ordinary',4895.00,'Serum','Redness, Irritation, Barrier support',0.475,'{\"dry\": 0.95, \"oily\": 0.9, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.95, \"36-50\": 0.9}',3,'A serum designed to soothe discomfort and reduce signs of irritation-induced redness while strengthening the skin barrier.','https://ordinarypakistan.pk/product/soothing-barrier-support-serum/'),(60,'Mineral SPF 30 Sunscreen','The Ordinary',4995.00,'Sunscreen','UV protection, Sensitivity, Redness, Environmental stress',0.9275,'{\"dry\": 0.9, \"oily\": 0.85, \"normal\": 0.95, \"combination\": 0.9}','{\"50+\": 0.9, \"18-25\": 0.95, \"26-35\": 0.95, \"36-50\": 0.9}',4.725,'A broad-spectrum mineral sunscreen with SPF 30 that offers daily protection from UV rays and oxidative stress, formulated with antioxidants and non-comedogenic hydrators.','https://ordinarypakistan.pk/product/mineral-spf-30/'),(61,'AHA 30% + BHA 2% Peeling Solution','The Ordinary',4495.00,'Serum','Acne, Texture irregularities, Dullness, Congested pores',0.6,'{\"dry\": 0.65, \"oily\": 0.85, \"normal\": 0.75, \"combination\": 0.8}','{\"18-25\": 0.85, \"26-35\": 0.8}',4.87,'An intensive exfoliating serum with 30% AHAs and 2% BHAs that helps resurface skin, reduce blemishes, and improve clarity. Use only once or twice a week and avoid on sensitive skin.','https://ordinarypakistan.pk/product/the-ordinary-aha-30-bha-2-peeling-solution/'),(62,'Lactic Acid 10% + HA','The Ordinary',5400.00,'Serum','Uneven skin tone, Texture, Dullness',0.75,'{\"dry\": 0.9, \"oily\": 0.7, \"normal\": 0.85, \"combination\": 0.75}','{\"18-25\": 0.85, \"26-35\": 0.85}',4.8,'A gentle exfoliating serum with 10% lactic acid and hyaluronic acid to improve skin texture, tone, and hydration with minimal irritation.','https://ordinarypakistan.pk/product/lactic-acid-ha/'),(63,'Lactic Acid 5% + HA','The Ordinary',4995.00,'Serum','Texture irregularities, Dullness, Uneven tone',0.8,'{\"dry\": 0.95, \"oily\": 0.75, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4.67,'A mild exfoliating serum with 5% lactic acid and hyaluronic acid for smoother and brighter skin with reduced risk of irritation. Suitable for sensitive beginners.','https://ordinarypakistan.pk/product/lactic-acid-ha-2/'),(64,'Mandelic Acid 10% + HA','The Ordinary',4995.00,'Serum','Dullness, Uneven tone, Textural irregularities',0.88,'{\"dry\": 0.9, \"normal\": 0.9, \"sensitive\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4.75,'A gentle alpha hydroxy acid exfoliant derived from bitter almonds, ideal for sensitive skin. Helps with dullness, rough texture, and uneven skin tone.','https://ordinarypakistan.pk/product/mandelic-acid-10ha/'),(65,'Salicylic Acid 2% Solution','The Ordinary',4995.00,'Serum','Acne, Congestion, Blackheads, Oily skin',0.7,'{\"dry\": 0.6, \"oily\": 0.95, \"normal\": 0.8, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.85}',4.9,'A powerful BHA serum formulated with 2% salicylic acid to deeply exfoliate inside pores, reducing acne, blackheads, and congestion.','https://ordinarypakistan.pk/product/salicylic-acid-solution/'),(66,'Neutrogena Hydro Boost Water Gel (50ml)','Neutrogena',4799.00,'Moisturizer','Dehydration, Dullness, Dryness',0.9,'{\"dry\": 0.8, \"oily\": 0.85, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.9, \"36-50\": 0.85}',4.73,'A lightweight, gel-based moisturizer infused with hyaluronic acid to provide intense hydration and a refreshing feel. Suitable for all skin types.','https://cozmetica.pk/products/neutrogena-hydro-boost-water-gel-50ml'),(67,'Neutrogena spot controlling Moisturiser Cream','Neutrogena',1700.00,'Moisturizer','Acne, Oil control, Blemishes',0.8,'{\"dry\": 0.7, \"oily\": 0.95, \"normal\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.85}',4.63,'An oil-free moisturizer designed to hydrate the skin while helping to clear and prevent breakouts. Suitable for acne-prone and oily skin types.','https://cozmetica.pk/products/neutrogena-visible-clear-proof-moisturiser-cream'),(68,'L\'Oreal Paris White Perfect Night Cream (50ml)','L\'Oreal Paris',3699.00,'Moisturizer','Dark spots, Dullness, Uneven skin tone',0.85,'{\"dry\": 0.8, \"oily\": 0.75, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.85, \"26-35\": 0.9, \"36-50\": 0.85}',4.9,'An overnight cream enriched with melanin-blocking ingredients to reduce dark spots and brighten skin tone. Ideal for those seeking radiance and even complexion.','https://cozmetica.pk/products/loreal-paris-white-perfect-night-cream-50ml'),(69,'CeraVe Daily Moisturizing Lotion (87ml)','CeraVe',4710.00,'Moisturizer','Dryness, Dehydration, Barrier repair',0.95625,'{\"dry\": 0.95, \"oily\": 0.8, \"normal\": 0.9, \"combination\": 0.85}','{\"50+\": 0.85, \"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4,'A lightweight, non-comedogenic moisturizer with ceramides and hyaluronic acid that hydrates and restores the skinΓÇÖs natural barrier. Suitable for normal to dry skin.','https://cozmetica.pk/products/cerave-daily-moisturizing-lotion-87ml?variant=44344832786593'),(70,'CeraVe Renewing SA Cleanser (237ml)','CeraVe',9990.00,'Cleanser','Acne, Rough texture, Clogged pores',0.825,'{\"dry\": 0.75, \"oily\": 0.95, \"normal\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4.5,'A gentle exfoliating cleanser with salicylic acid, ceramides, and niacinamide that helps smooth rough skin and clear pores without disrupting the skin barrier.','https://cozmetica.pk/products/cerave-renewing-sa-cleanser-237ml'),(71,'Neutrogena Hydro Boost Cleanser Water Gel','Neutrogena',3250.00,'Cleanser','Dehydration, Dullness, Dryness',0.95,'{\"dry\": 0.8, \"oily\": 0.85, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.9, \"36-50\": 0.85}',4.965,'A lightweight, gel-based cleanser infused with hyaluronic acid to provide intense hydration and a refreshing feel. Suitable for all skin types.','https://cozmetica.pk/products/neutrogena-hydro-boost-cleanser-water-gel'),(72,'Garnier Micellar Vitamin C Cleansing Water (400ml)','Garnier',1549.00,'Cleanser','Dullness, Uneven skin tone, Makeup removal',0.475,'{\"dry\": 0.9, \"oily\": 0.85, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.9, \"36-50\": 0.85}',2.875,'A micellar water infused with Vitamin C that effectively removes makeup and impurities while brightening the skin. Suitable for all skin types.','https://cozmetica.pk/products/copy-of-garnier-micellar-vitamin-c-cleansing-water-400ml-free-cotton-pads-pouch?variant=44347063369889'),(73,'CeraVe Foaming Facial Cleanser (87ml)','CeraVe',6000.00,'Cleanser','Oiliness, Acne, Clogged pores',0.9,'{\"dry\": 0.7, \"oily\": 0.95, \"normal\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.9, \"36-50\": 0.85}',4.67,'A foaming cleanser with ceramides and niacinamide that effectively removes excess oil and impurities without disrupting the skin barrier. Ideal for normal to oily skin.','https://cozmetica.pk/products/copy-of-cerave-renewing-sa-cleanser-237ml'),(74,'CeraVe Hydrating Facial Cleanser (87ml)','CeraVe',4270.00,'Cleanser','Dryness, Dehydration, Sensitive skin',0.93125,'{\"dry\": 0.95, \"oily\": 0.8, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4.75,'A non-foaming, gentle cleanser with ceramides and hyaluronic acid that hydrates and restores the skinΓÇÖs natural barrier. Ideal for normal to dry skin.','https://cozmetica.pk/products/creave-hydrating-facial-cleanser-normal-to-dry-87ml?variant=44344837275809'),(75,'CeraVe Hydrating Cream-to-Foam Cleanser (87ml)','CeraVe',4270.00,'Cleanser','Dryness, Dehydration, Makeup removal',0.9,'{\"dry\": 0.9, \"oily\": 0.85, \"normal\": 0.95, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4,'A gentle cleanser that transforms from cream to foam, effectively removing dirt and makeup while hydrating the skin. Suitable for normal to dry skin.','https://cozmetica.pk/products/cerave-hydrating-cream-to-foam-cleanser-87ml?variant=44344832721057'),(76,'CeraVe SA Smoothing Cleanser (236ml)','CeraVe',8390.00,'Cleanser','Rough texture, Bumpy skin, Keratosis pilaris',0.85,'{\"dry\": 0.75, \"oily\": 0.95, \"normal\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4,'An exfoliating cleanser with salicylic acid and ceramides that smooths rough and bumpy skin without disrupting the skin barrier.','https://cozmetica.pk/products/cerave-sa-smoothing-cleanser-236ml?variant=44649082159265'),(77,'CeraVe Foaming Facial Cleanser (237ml)','CeraVe',9500.00,'Cleanser','Oiliness, Acne, Clogged pores',0.9,'{\"dry\": 0.7, \"oily\": 0.95, \"normal\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.9, \"36-50\": 0.85}',4.5,'A foaming cleanser with ceramides and niacinamide that effectively removes excess oil and impurities without disrupting the skin barrier. Ideal for normal to oily skin.','https://cozmetica.pk/products/cerave-foaming-facial-cleanser-237ml?variant=44344832491681'),(78,'CeraVe Hydrating Cream-to-Foam Cleanser (237ml)','CeraVe',9500.00,'Cleanser','Dryness, Dehydration, Makeup removal',0.95,'{\"dry\": 0.95, \"oily\": 0.8, \"normal\": 0.9, \"combination\": 0.85}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4,'A gentle cleanser that transforms from cream to foam, effectively removing dirt and makeup while hydrating the skin. Suitable for normal to dry skin.','https://cozmetica.pk/products/cerave-hydrating-cream-to-foam-cleanser-237ml?variant=44344834621601'),(79,'CeraVe Acne Control Cleanser (237ml)','CeraVe',9500.00,'Cleanser','Acne, Oiliness, Clogged pores',0.85,'{\"dry\": 0.75, \"oily\": 0.95, \"normal\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.9, \"26-35\": 0.9, \"36-50\": 0.85}',4,'A cleanser formulated with salicylic acid and ceramides to treat acne and prevent new breakouts while maintaining the skinΓÇÖs natural barrier.','https://cozmetica.pk/products/cerave-acne-control-cleanser-237ml?variant=44344831967393'),(80,'CeraVe Acne Foaming Cream Cleanser 4% BPO (150ml)','CeraVe',3699.00,'Cleanser','Acne, Inflammation, Clogged pores',0.8,'{\"dry\": 0.7, \"oily\": 0.95, \"normal\": 0.85, \"combination\": 0.9}','{\"18-25\": 0.95, \"26-35\": 0.9, \"36-50\": 0.85}',4,'A foaming cream cleanser with 4% benzoyl peroxide to treat and prevent acne while maintaining the skinΓÇÖs natural barrier with ceramides and niacinamide.','https://cozmetica.pk/products/cerave-acne-foaming-cream-cleanser-150ml?variant=44344836489377'),(81,'L\'Or├⌐al Paris Revitalift Milky Cleansing Foam Gel (100ml)','L\'Or├⌐al Paris',1589.00,'Cleanser','Aging signs, Dullness, Dryness',0.95,'{\"dry\": 0.9, \"oily\": 0.8, \"normal\": 0.95, \"combination\": 0.85}','{\"50+\": 0.85, \"26-35\": 0.9, \"36-50\": 0.9}',4,'A milky foam cleanser enriched with anti-aging ingredients to gently cleanse the skin while reducing signs of aging and improving skin texture.','https://cozmetica.pk/products/loreal-paris-revitalift-milky-cleansing-foam-gel-100ml');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_responses`
--

DROP TABLE IF EXISTS `questionnaire_responses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_responses` (
  `session_id` int NOT NULL,
  `question_id` int NOT NULL,
  `response` text NOT NULL,
  PRIMARY KEY (`session_id`,`question_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `questionnaire_responses_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `questionnaire_sessions` (`session_id`) ON DELETE CASCADE,
  CONSTRAINT `questionnaire_responses_ibfk_2` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_responses`
--

LOCK TABLES `questionnaire_responses` WRITE;
/*!40000 ALTER TABLE `questionnaire_responses` DISABLE KEYS */;
INSERT INTO `questionnaire_responses` VALUES (4,2,'26ΓÇô35'),(4,3,'Fair'),(4,4,'Sometimes'),(4,5,'Tight and rough'),(4,6,'Small and tight'),(4,7,'Sometimes'),(4,8,'Feels the same, normal'),(4,9,'Sometimes'),(4,10,'Occasionally'),(4,11,'Mildly affected'),(5,2,'18ΓÇô25'),(5,3,'Fair'),(5,4,'Sometimes'),(5,5,'Very oily and shiny'),(5,6,'Small and tight'),(5,7,'Very often'),(5,8,'Feels the same, normal'),(5,9,'Rarely'),(5,10,'Occasionally'),(5,11,'Mildly affected'),(6,2,'Under 18'),(6,3,'Fair'),(6,4,'Sometimes'),(6,5,'Tight and rough'),(6,6,'Small and tight'),(6,7,'Sometimes'),(6,8,'Feels dry or irritated'),(6,9,'Rarely'),(6,10,'Never'),(6,11,'Hardly any effect'),(7,2,'18ΓÇô25'),(7,3,'Medium / Olive'),(7,4,'Sometimes'),(7,5,'Tight and rough'),(7,6,'Small and tight'),(7,7,'Sometimes'),(7,8,'Feels the same, normal'),(7,9,'Rarely'),(7,10,'Occasionally'),(7,11,'Mildly affected'),(8,2,'18ΓÇô25'),(8,3,'Brown'),(8,4,'Sometimes'),(8,5,'Tight and rough'),(8,6,'Small and tight'),(8,7,'Rarely'),(8,8,'Feels the same, normal'),(8,9,'Rarely'),(8,10,'Very rarely'),(8,11,'Mildly affected'),(9,2,'18ΓÇô25'),(9,3,'Medium / Olive'),(9,4,'Sometimes'),(9,5,'Very oily and shiny'),(9,6,'Small and tight'),(9,7,'Sometimes'),(9,8,'Feels the same, normal'),(9,9,'Almost always'),(9,10,'Occasionally'),(9,11,'Mildly affected'),(10,2,'26ΓÇô35'),(10,3,'Very Fair (burns easily)'),(10,4,'Yes, often'),(10,5,'Very oily and shiny'),(10,6,'Large and visible everywhere'),(10,7,'Very often'),(10,8,'Gets very greasy'),(10,9,'Almost always'),(10,10,'Yes, frequently'),(10,11,'Easily irritated (redness, itchiness)'),(11,2,'18ΓÇô25'),(11,3,'Very Fair (burns easily)'),(11,4,'Yes, often'),(11,5,'Very oily and shiny'),(11,6,'Large and visible everywhere'),(11,7,'Very often'),(11,8,'Gets very greasy'),(11,9,'Almost always'),(11,10,'Yes, frequently'),(11,11,'Easily irritated (redness, itchiness)'),(12,2,'26ΓÇô35'),(12,3,'Very Fair (burns easily)'),(12,4,'Yes, often'),(12,5,'Very oily and shiny'),(12,6,'Large and visible everywhere'),(12,7,'Very often'),(12,8,'Gets very greasy'),(12,9,'Almost always'),(12,10,'Yes, frequently'),(12,11,'Easily irritated (redness, itchiness)'),(13,2,'18ΓÇô25'),(13,3,'Very Fair (burns easily)'),(13,4,'Yes, often'),(13,5,'Very oily and shiny'),(13,6,'Large and visible everywhere'),(13,7,'Very often'),(13,8,'Gets very greasy'),(13,9,'Almost always'),(13,10,'Yes, frequently'),(13,11,'Easily irritated (redness, itchiness)'),(14,2,'26ΓÇô35'),(14,3,'Dark Brown / Black'),(14,4,'Sometimes'),(14,5,'Oily on T-zone, dry on cheeks'),(14,6,'Barely visible'),(14,7,'Rarely'),(14,9,'Rarely'),(14,10,'Never'),(14,11,'Mildly affected'),(15,2,'26ΓÇô35'),(15,3,'Dark Brown / Black'),(15,4,'Never'),(15,5,'Oily on T-zone, dry on cheeks'),(15,6,'Large on T-zone, small on cheeks'),(15,7,'Never'),(15,8,'Gets oily only on forehead/nose'),(15,9,'Never'),(15,10,'Never'),(15,11,'No noticeable effect'),(16,2,'26ΓÇô35'),(16,3,'Fair'),(16,4,'Sometimes'),(16,5,'Very oily and shiny'),(16,6,'Small and tight'),(16,7,'Very often'),(16,8,'Feels the same, normal'),(16,9,'Sometimes'),(16,10,'Never'),(16,11,'Mildly affected'),(17,2,'18ΓÇô25'),(17,3,'Very Fair (burns easily)'),(17,4,'Rarely'),(17,5,'Comfortable and soft'),(17,6,'Barely visible'),(17,7,'Sometimes'),(17,8,'Gets oily only on forehead/nose'),(17,9,'Never'),(17,10,'Never'),(17,11,'Mildly affected'),(18,2,'18ΓÇô25'),(18,3,'Medium / Olive'),(18,4,'Sometimes'),(18,5,'Comfortable and soft'),(18,6,'Small and tight'),(18,7,'Sometimes'),(18,8,'Feels dry or irritated'),(18,9,'Sometimes'),(18,10,'Occasionally'),(18,11,'Mildly affected'),(19,2,'18ΓÇô25'),(19,3,'Medium / Olive'),(19,4,'Sometimes'),(19,5,'Tight and rough'),(19,6,'Small and tight'),(19,7,'Very often'),(19,8,'Gets very greasy'),(19,9,'Never'),(19,10,'Very rarely'),(19,11,'Easily irritated (redness, itchiness)'),(20,2,'26ΓÇô35'),(20,3,'Very Fair (burns easily)'),(20,4,'Sometimes'),(20,5,'Tight and rough'),(20,6,'Small and tight'),(20,7,'Very often'),(20,8,'Gets very greasy'),(20,9,'Almost always'),(20,10,'Occasionally'),(20,11,'Mildly affected');
/*!40000 ALTER TABLE `questionnaire_responses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_sessions`
--

DROP TABLE IF EXISTS `questionnaire_sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `submitted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `questionnaire_sessions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_sessions`
--

LOCK TABLES `questionnaire_sessions` WRITE;
/*!40000 ALTER TABLE `questionnaire_sessions` DISABLE KEYS */;
INSERT INTO `questionnaire_sessions` VALUES (1,2,'2025-05-22 01:55:14'),(2,2,'2025-05-22 02:01:21'),(3,2,'2025-05-22 02:08:43'),(4,2,'2025-05-22 02:12:39'),(5,2,'2025-05-22 03:01:13'),(6,2,'2025-05-22 13:34:06'),(7,2,'2025-05-22 13:38:10'),(8,2,'2025-05-22 13:39:26'),(9,2,'2025-05-22 13:41:41'),(10,2,'2025-05-22 14:01:05'),(11,2,'2025-05-22 14:03:06'),(12,2,'2025-05-22 14:05:49'),(13,2,'2025-05-22 14:08:33'),(14,2,'2025-05-25 09:31:35'),(15,6,'2025-05-25 10:11:01'),(16,2,'2025-05-25 13:22:30'),(17,2,'2025-05-26 05:50:05'),(18,7,'2025-05-27 03:53:12'),(19,9,'2025-05-27 07:14:59'),(20,2,'2025-05-27 09:36:40');
/*!40000 ALTER TABLE `questionnaire_sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `question_id` int NOT NULL AUTO_INCREMENT,
  `section` varchar(50) DEFAULT NULL,
  `question_text` text,
  `is_multi_select` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'General Concerns','Which of the following concerns do you experience?',1),(2,'Section 1','What is your age group?',0),(3,'Section 1','What is your natural skin color (Fitzpatrick scale)?',0),(4,'Section 1','Do you currently experience acne or frequent breakouts?',0),(5,'Section 2','How does your skin feel 3ΓÇô4 hours after washing without applying anything?',0),(6,'Section 2','How visible are your pores (especially around the nose and cheeks)?',0),(7,'Section 2','How often does your skin get flaky or feel rough without moisturizer?',0),(8,'Section 2','How does your skin react to humid (hot and sticky) weather?',0),(9,'Section 3','How often does your skin sting, burn, or turn red after using new skincare products?',0),(10,'Section 3','Do you have visible redness, rashes, or bumps even when not using new products?',0),(11,'Section 3','How would you describe your skinΓÇÖs reaction to environmental factors (like wind, sun, pollution)?',0);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routine`
--

DROP TABLE IF EXISTS `routine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routine` (
  `session_id` int NOT NULL,
  `cleanser_id` int DEFAULT NULL,
  `serum_id` int DEFAULT NULL,
  `moisturizer_id` int DEFAULT NULL,
  `sunscreen_id` int DEFAULT NULL,
  `recommended_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`),
  KEY `cleanser_id` (`cleanser_id`),
  KEY `serum_id` (`serum_id`),
  KEY `moisturizer_id` (`moisturizer_id`),
  KEY `sunscreen_id` (`sunscreen_id`),
  CONSTRAINT `routine_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `questionnaire_sessions` (`session_id`) ON DELETE CASCADE,
  CONSTRAINT `routine_ibfk_2` FOREIGN KEY (`cleanser_id`) REFERENCES `product` (`prod_id`) ON DELETE SET NULL,
  CONSTRAINT `routine_ibfk_3` FOREIGN KEY (`serum_id`) REFERENCES `product` (`prod_id`) ON DELETE SET NULL,
  CONSTRAINT `routine_ibfk_4` FOREIGN KEY (`moisturizer_id`) REFERENCES `product` (`prod_id`) ON DELETE SET NULL,
  CONSTRAINT `routine_ibfk_5` FOREIGN KEY (`sunscreen_id`) REFERENCES `product` (`prod_id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routine`
--

LOCK TABLES `routine` WRITE;
/*!40000 ALTER TABLE `routine` DISABLE KEYS */;
INSERT INTO `routine` VALUES (9,74,25,69,40,'2025-05-22 08:41:42'),(13,81,46,69,60,'2025-05-22 09:08:34'),(14,74,59,69,36,'2025-05-25 04:31:36'),(15,70,25,35,36,'2025-05-25 05:11:01'),(16,71,41,39,40,'2025-05-25 08:22:31'),(17,81,41,69,37,'2025-05-26 00:50:06'),(18,74,45,9,60,'2025-05-26 22:53:13'),(19,72,59,38,40,'2025-05-27 02:14:59'),(20,71,46,39,14,'2025-05-27 04:36:40');
/*!40000 ALTER TABLE `routine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routine_feedback`
--

DROP TABLE IF EXISTS `routine_feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routine_feedback` (
  `feedback_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `session_id` int NOT NULL,
  `rating` int NOT NULL,
  `effectiveness_score` float DEFAULT NULL,
  `satisfaction_score` float DEFAULT NULL,
  `feedback_text` text,
  `feedback_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`feedback_id`),
  KEY `user_id` (`user_id`),
  KEY `session_id` (`session_id`),
  CONSTRAINT `routine_feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `routine_feedback_ibfk_2` FOREIGN KEY (`session_id`) REFERENCES `questionnaire_sessions` (`session_id`) ON DELETE CASCADE,
  CONSTRAINT `routine_feedback_chk_1` CHECK ((`rating` between 1 and 5)),
  CONSTRAINT `routine_feedback_chk_2` CHECK ((`effectiveness_score` between 0 and 1)),
  CONSTRAINT `routine_feedback_chk_3` CHECK ((`satisfaction_score` between 0 and 1))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routine_feedback`
--

LOCK TABLES `routine_feedback` WRITE;
/*!40000 ALTER TABLE `routine_feedback` DISABLE KEYS */;
INSERT INTO `routine_feedback` VALUES (1,6,15,4,0.8,0.8,'i have been using these products for more than an year now and it has been very much great for me','2025-05-25 05:49:27'),(2,2,16,5,1,1,'cvdwrtbrt','2025-05-25 08:23:05'),(3,2,17,5,0.9,0.9,'jv;oqerhvo;bo;rvo3rofoh43olfo34\'fjlo4jfonofnlo4','2025-05-26 00:52:37'),(4,2,17,1,0.9,0.8,'dqorehfi2bvbi4rbf','2025-05-26 19:58:56'),(5,2,17,5,1,1,'XaxASC','2025-05-26 20:13:01'),(6,7,18,5,0.9,0.8,'some of the things worked well like the sunscreen and moisturizer','2025-05-26 22:54:31'),(7,7,18,4,1,1,'dcsgr','2025-05-26 22:59:29'),(8,7,18,5,0.9,0.8,'dfvafvabregarga','2025-05-26 23:44:49'),(9,9,19,1,0,0,'no','2025-05-27 02:15:55');
/*!40000 ALTER TABLE `routine_feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'mohid','mohidammar550@gmail.com','OOOHOOO'),(3,'wasay','wasay980@gmail.com','gingle berry'),(4,'ali romeo','alivirk1015@gmail.com','alishoaib'),(5,'mohid','hello98@gmail.com','geooo'),(6,'jamil','jamil112@gmail.com','jamil'),(7,'django','django1@gmail.com','django'),(8,'mohid','nabihaasf321@gmail.com','m]cjb fc'),(9,'nabiha','asifnabiha321@gmai.com','nabiha.12');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-29 21:50:46
