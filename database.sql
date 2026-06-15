-- MySQL dump 10.13  Distrib 9.6.0, for macos26.4 (arm64)
--
-- Host: localhost    Database: tekoraai_chatbot
-- ------------------------------------------------------
-- Server version	9.6.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '12169090-6897-11f1-869b-be36d5882b3f:1-76';

--
-- Table structure for table `certificate_requests`
--

DROP TABLE IF EXISTS `certificate_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intern_name` varchar(100) NOT NULL,
  `intern_email` varchar(100) NOT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `requested_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate_requests`
--

LOCK TABLES `certificate_requests` WRITE;
/*!40000 ALTER TABLE `certificate_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificate_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extension_requests`
--

DROP TABLE IF EXISTS `extension_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `extension_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intern_name` varchar(100) NOT NULL,
  `intern_email` varchar(100) NOT NULL,
  `extension_duration` varchar(100) NOT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `requested_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extension_requests`
--

LOCK TABLES `extension_requests` WRITE;
/*!40000 ALTER TABLE `extension_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `extension_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq`
--

DROP TABLE IF EXISTS `faq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq` (
  `id` int NOT NULL AUTO_INCREMENT,
  `topic` varchar(100) NOT NULL,
  `question` varchar(500) NOT NULL,
  `answer` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq`
--

LOCK TABLES `faq` WRITE;
/*!40000 ALTER TABLE `faq` DISABLE KEYS */;
INSERT INTO `faq` VALUES (1,'Internship Information','What is the TekoraAI internship?','The TekoraAI internship is a hands-on program where you work on real projects in AI, development, or business analysis. You get a dedicated mentor, weekly training sessions, and an official completion certificate. It runs in batches and is open to students and fresh graduates. Visit tekoraai.com or email customersupport@tekoraai.com','2026-06-15 09:53:24'),(2,'Internship Information','Tell me about the internship program','TekoraAI offers a structured internship program with real industry projects, dedicated mentors, weekly training, and an official certificate on completion. Open to students and fresh graduates. Visit tekoraai.com to know more or call +91 9449730488','2026-06-15 09:53:24'),(3,'Application Process','How do I apply for the internship?','To apply for the TekoraAI internship visit tekoraai.com and fill out the application form with your resume and details. Once submitted wait for a confirmation email and complete the onboarding process. For help email customersupport@tekoraai.com or call +91 9449730488','2026-06-15 09:53:24'),(4,'Application Process','What is the application process?','Step 1 visit tekoraai.com. Step 2 fill out the application form. Step 3 submit your resume and details. Step 4 wait for confirmation email. Step 5 complete onboarding. For help email customersupport@tekoraai.com or call +91 9449730488','2026-06-15 09:53:24'),(5,'Eligibility','Who can apply for the internship?','The TekoraAI internship is open to students in 2nd year or above and fresh graduates within 1 year of graduation. You need basic domain knowledge, good communication skills, and passion for learning and technology. Apply at tekoraai.com','2026-06-15 09:53:24'),(6,'Eligibility','What are the eligibility criteria?','Eligibility requires being a student in 2nd year or above or a fresh graduate within 1 year. You need basic knowledge of your domain and good communication skills. Email customersupport@tekoraai.com or call +91 9449730488 for queries','2026-06-15 09:53:24'),(7,'Internship Duration','How long is the internship?','The TekoraAI internship runs for 1 to 3 months depending on your role and project. The exact duration is clearly mentioned in your offer letter. Extensions are available based on performance. Email customersupport@tekoraai.com for details','2026-06-15 09:53:24'),(8,'Internship Duration','What is the duration of the internship?','The internship duration is 1 to 3 months based on your role. Your exact start and end date will be confirmed in your offer letter and onboarding email. For queries email customersupport@tekoraai.com or call +91 9449730488','2026-06-15 09:53:24'),(9,'Stipend Information','Will I get a stipend?','Yes the TekoraAI internship includes a stipend. The amount depends on your role and is clearly mentioned in your offer letter. Stipends are paid monthly at the end of each month. For exact details email customersupport@tekoraai.com or call +91 9449730488','2026-06-15 09:53:24'),(10,'Stipend Information','How much is the stipend?','The stipend amount depends on your role and domain and is mentioned in your offer letter. It is paid monthly at the end of each month. For exact stipend details email customersupport@tekoraai.com or call +91 9449730488','2026-06-15 09:53:24'),(11,'Work Mode','Is the internship remote or in office?','The TekoraAI internship is currently fully remote so you can work from home. You need a laptop and stable internet connection. Team meetings are online via Google Meet. For queries email customersupport@tekoraai.com','2026-06-15 09:53:24'),(12,'Work Mode','Can I work from home?','Yes the internship is fully remote. You can work from home with flexible hours. You need a laptop and stable internet. Online team meetings are scheduled in advance via Google Meet. Email customersupport@tekoraai.com for details','2026-06-15 09:53:24'),(13,'Certificate Information','Will I get a certificate?','Yes you will receive an official TekoraAI internship completion certificate after finishing the program. It is issued digitally within 7 days of completion and includes your name, role, duration, and is signed by TekoraAI management. Email customersupport@tekoraai.com for certificate queries','2026-06-15 09:53:24'),(14,'Certificate Information','When is the certificate issued?','The certificate is issued digitally within 7 days of internship completion. It includes your full name, role, duration, and is signed by TekoraAI management. You can add it to LinkedIn and your resume. Email customersupport@tekoraai.com','2026-06-15 09:53:24'),(15,'Project Details','What projects will I work on?','At TekoraAI you will work on real industry projects in AI, development, business analysis, or marketing. Your project is assigned by your mentor in Week 1 with weekly progress reviews. Email customersupport@tekoraai.com for project queries','2026-06-15 09:53:24'),(16,'Project Details','What kind of work will I do?','You will work on real hands-on projects based on your domain. This could be AI, software development, business analysis, marketing, or design. Your mentor assigns the project in Week 1. Email customersupport@tekoraai.com','2026-06-15 09:53:24'),(17,'Training Information','What training is provided?','TekoraAI provides Week 1 orientation and onboarding, domain specific training materials, hands-on project guidance, and weekly mentor check-ins. All training is conducted online. Email customersupport@tekoraai.com or call +91 9449730488','2026-06-15 09:53:24'),(18,'Training Information','Is there any onboarding training?','Yes TekoraAI has full training support including Week 1 orientation, domain specific sessions, project training, and weekly check-ins with your mentor. Calendar invites are sent on Day 1. Email customersupport@tekoraai.com','2026-06-15 09:53:24'),(19,'Mentor Information','Who is my mentor?','Every intern at TekoraAI gets a dedicated mentor who guides your project, conducts weekly check-ins, reviews your work, helps with blockers, and writes your LinkedIn recommendation after completion. You meet your mentor in Week 1. Email customersupport@tekoraai.com','2026-06-15 09:53:24'),(20,'Mentor Information','Will I have a mentor?','Yes every intern gets a dedicated personal mentor. Your mentor will guide you through your project, do weekly check-ins, give feedback, help with blockers, and write your LinkedIn recommendation. Email customersupport@tekoraai.com','2026-06-15 09:53:24'),(21,'Contact Support','How do I contact TekoraAI?','Email: customersupport@tekoraai.com | Phone: +91 9449730488 or +91 9611968209 | Website: tekoraai.com | Office: TekoraAI 8th Floor Obeya North Star MSR North Tower Manyata Tech Park Nagavara Bengaluru 560045. We respond within 24 hours','2026-06-15 09:53:24'),(22,'Contact Support','What is the TekoraAI contact number?','You can call us at +91 9449730488 or +91 9611968209. You can also email customersupport@tekoraai.com or visit tekoraai.com. Our office is at TekoraAI 8th Floor Obeya North Star MSR North Tower Manyata Tech Park Nagavara Bengaluru 560045','2026-06-15 09:53:24'),(23,'Performance & Evaluation','How will I be evaluated?','You are evaluated on project quality, punctuality, attendance, communication, teamwork, learning mindset, and final presentation. You receive a performance review at mid-internship and at completion. Email customersupport@tekoraai.com','2026-06-15 09:53:24'),(24,'Performance & Evaluation','What are the performance criteria?','Performance criteria include project quality, punctuality and attendance, communication and teamwork, learning and growth mindset, and final project presentation. Reviews happen at mid-internship and end. Email customersupport@tekoraai.com','2026-06-15 09:53:24'),(25,'Tools & Software Access','What tools will I use?','At TekoraAI you will use Google Workspace for emails and meetings, Jira for project tracking, Slack for communication, GitHub for code, and domain specific tools. All access details sent in onboarding email on Day 1. Email customersupport@tekoraai.com','2026-06-15 09:53:24'),(26,'Tools & Software Access','Which software do I need?','You will need access to Google Workspace, Jira, Slack, GitHub, and domain specific tools based on your project. All login details are sent in your onboarding email on Day 1. Email customersupport@tekoraai.com or call +91 9449730488','2026-06-15 09:53:24'),(27,'Leave & Attendance Policy','What is the leave policy?','You get 2 casual leaves per month. Apply by emailing customersupport@tekoraai.com and informing your mentor at least 1 day in advance. Emergency leaves are case by case. More than 3 unplanned absences may affect your certificate eligibility','2026-06-15 09:53:24'),(28,'Leave & Attendance Policy','How many leaves do I get?','You get 2 casual leaves per month. To apply email customersupport@tekoraai.com and inform your mentor 1 day in advance. Emergency leaves are considered case by case. More than 3 unplanned absences may affect certificate eligibility','2026-06-15 09:53:24'),(29,'Offer Letter & Documents','When will I get my offer letter?','Your offer letter is sent to your registered email within 2 to 3 days of selection. For onboarding you need government ID, college ID or marksheet, passport photo, and signed offer letter. Send documents to customersupport@tekoraai.com','2026-06-15 09:53:24'),(30,'Offer Letter & Documents','What documents do I need to submit?','You need to submit government ID proof, college ID or marksheet, passport size photo, and signed copy of offer letter. Send all documents to customersupport@tekoraai.com or call +91 9449730488 for help','2026-06-15 09:53:24'),(31,'Internship Extension','Can I extend my internship?','Yes extension is possible based on performance rating, project requirements, and mentor availability. Email your mentor and copy customersupport@tekoraai.com at least 2 weeks before your end date. Call +91 9449730488 or +91 9611968209','2026-06-15 09:53:24'),(32,'Internship Extension','How do I apply for extension?','To apply for extension email your mentor and copy customersupport@tekoraai.com at least 2 weeks before your end date. Include your reason for extension. Call +91 9449730488 for urgent requests','2026-06-15 09:53:24'),(33,'Referral & Recommendations','Can I get a recommendation letter?','Yes after successful completion TekoraAI offers LinkedIn recommendation, formal letter of recommendation, and job reference. Email your mentor 1 week before your last day. Contact customersupport@tekoraai.com or call +91 9449730488','2026-06-15 09:53:24'),(34,'Referral & Recommendations','Will I get a LinkedIn recommendation?','Yes your mentor will write a LinkedIn recommendation after successful completion based on your performance. Request it by emailing your mentor 1 week before your last day. Contact customersupport@tekoraai.com for queries','2026-06-15 09:53:24'),(35,'Internship Completion','What happens at the end of internship?','At completion you submit final project report, give presentation to mentor, complete exit feedback form, and return company access. Certificate issued within 7 days. Email customersupport@tekoraai.com or call +91 9449730488','2026-06-15 09:53:24'),(36,'Internship Completion','What is the exit process?','Exit process includes submitting final project report, giving presentation to mentor, completing feedback form, and returning company credentials. Certificate issued within 7 days of completion. Email customersupport@tekoraai.com','2026-06-15 09:53:24'),(37,'FAQ / General Queries','What can you help me with?','I can help with internship info, applications, eligibility, stipend, work mode, certificates, projects, training, mentors, leave policy, tools, offer letters, extensions, recommendations, and much more. Email customersupport@tekoraai.com or call +91 9449730488','2026-06-15 09:53:24'),(38,'FAQ / General Queries','I need help','I am TekoraAI Intern Assistant and I am here to help! Ask me anything about your internship. For direct support email customersupport@tekoraai.com or call +91 9449730488 or +91 9611968209. Visit tekoraai.com for more information','2026-06-15 09:53:24');
/*!40000 ALTER TABLE `faq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedback`
--

DROP TABLE IF EXISTS `feedback`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feedback` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intern_name` varchar(100) NOT NULL,
  `rating` int NOT NULL,
  `comments` text,
  `submitted_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedback`
--

LOCK TABLES `feedback` WRITE;
/*!40000 ALTER TABLE `feedback` DISABLE KEYS */;
/*!40000 ALTER TABLE `feedback` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intern_registration`
--

DROP TABLE IF EXISTS `intern_registration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intern_registration` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intern_name` varchar(100) NOT NULL,
  `intern_email` varchar(100) NOT NULL,
  `education_level` varchar(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `registered_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intern_registration`
--

LOCK TABLES `intern_registration` WRITE;
/*!40000 ALTER TABLE `intern_registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `intern_registration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leave_applications`
--

DROP TABLE IF EXISTS `leave_applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leave_applications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intern_name` varchar(100) NOT NULL,
  `leave_date` date NOT NULL,
  `leave_reason` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `applied_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leave_applications`
--

LOCK TABLES `leave_applications` WRITE;
/*!40000 ALTER TABLE `leave_applications` DISABLE KEYS */;
INSERT INTO `leave_applications` VALUES (1,'Nikhil','2026-06-16','Sick Leave','Pending','2026-06-15 12:22:03');
/*!40000 ALTER TABLE `leave_applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offer_letter_requests`
--

DROP TABLE IF EXISTS `offer_letter_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offer_letter_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intern_name` varchar(100) NOT NULL,
  `intern_email` varchar(100) NOT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `requested_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offer_letter_requests`
--

LOCK TABLES `offer_letter_requests` WRITE;
/*!40000 ALTER TABLE `offer_letter_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `offer_letter_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_reviews`
--

DROP TABLE IF EXISTS `performance_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intern_name` varchar(100) NOT NULL,
  `evaluation_period` varchar(100) NOT NULL,
  `project_quality` int DEFAULT '0',
  `attendance` int DEFAULT '0',
  `communication` int DEFAULT '0',
  `overall_rating` int DEFAULT '0',
  `reviewed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_reviews`
--

LOCK TABLES `performance_reviews` WRITE;
/*!40000 ALTER TABLE `performance_reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `performance_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recommendation_requests`
--

DROP TABLE IF EXISTS `recommendation_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recommendation_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intern_name` varchar(100) NOT NULL,
  `intern_email` varchar(100) NOT NULL,
  `recommendation_type` varchar(100) NOT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `requested_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recommendation_requests`
--

LOCK TABLES `recommendation_requests` WRITE;
/*!40000 ALTER TABLE `recommendation_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `recommendation_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tool_access_requests`
--

DROP TABLE IF EXISTS `tool_access_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool_access_requests` (
  `id` int NOT NULL AUTO_INCREMENT,
  `intern_name` varchar(100) NOT NULL,
  `intern_email` varchar(100) NOT NULL,
  `tool_name` varchar(100) NOT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `requested_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tool_access_requests`
--

LOCK TABLES `tool_access_requests` WRITE;
/*!40000 ALTER TABLE `tool_access_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `tool_access_requests` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-06-15 22:37:14
