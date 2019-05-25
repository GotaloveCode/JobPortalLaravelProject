# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.5.5-10.3.12-MariaDB)
# Database: jobportal
# Generation Time: 2019-05-25 16:00:01 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table activities
# ------------------------------------------------------------

DROP TABLE IF EXISTS `activities`;

CREATE TABLE `activities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `college` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `degree` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `field` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `grade` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `interest` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Bangladesh',
  `about_me` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;

INSERT INTO `activities` (`id`, `user_id`, `location`, `college`, `degree`, `field`, `grade`, `language`, `interest`, `country`, `about_me`, `gender`, `created_at`, `updated_at`)
VALUES
	(5,9,'Kakamega','Masinde Muliro','Bachelor','Mathematics','Second Upper','Luhya,English,Kiswahili','Farming,Rugby,Politics','Kenya','I own a small green house and do some farming in my free time',NULL,'2017-05-30 14:46:18','2017-05-30 14:46:55'),
	(6,10,'Sydney','Caltech University','Master\'s','Computer Science','Pass','English,Bangla','Cricket, football','Uganda','I am a political activist',NULL,'2017-05-31 01:08:21','2017-05-31 04:04:18'),
	(7,11,'Paris','L\'e Cole University','SSC/HSC','Pharmacy','Second Lower','English,French','Deep sea diving','Australia',NULL,'male','2017-05-31 11:18:18','2017-06-05 14:05:32'),
	(10,17,'London','England','Bachelor','Sociology','1st Class',NULL,NULL,'Britain',NULL,NULL,'2017-09-16 10:09:31','2017-09-16 10:09:34'),
	(13,21,'Arizona','Arizona State University','Bachelor','Computer Science and Engineering.','A+','English,Turkish','Cricket, football','USA','Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit','male','2017-09-16 11:57:36','2017-09-19 16:47:32'),
	(14,23,'Tokyo','Tokyo Tech','Bachelor','Mechatronics','A','Japanese, English','Skiing, Fishing, Sky surfing','Japan','Am hardworking','male','2017-09-16 13:23:45','2019-05-25 14:36:13'),
	(15,24,'Kericho','Pwani University','Bachelor','Commerce','Pass','English, Swahili','Tennis, Travelling, ','Kenya',NULL,NULL,'2017-09-18 02:47:21','2017-09-18 02:47:24'),
	(16,25,'New Delhi','New Delhi Tech','Bachelor','AI','1st Class','Punjabi, English','Cricket, Travelling','India',NULL,NULL,'2017-09-18 02:47:51','2017-09-18 02:47:54'),
	(17,27,'Dar es Salaam','UDSM','Bachelor','IT','1st Class','Kiswahili, Kihaaya, English','Sports, hiking, Swimming, Sleeping','Tanzania',NULL,NULL,'2019-05-25 12:37:56','2019-05-25 12:39:01');

/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table answers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `answers`;

CREATE TABLE `answers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `question_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `value` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `answers_question_id_foreign` (`question_id`),
  KEY `answers_user_id_foreign` (`user_id`),
  CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `answers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;

INSERT INTO `answers` (`id`, `question_id`, `user_id`, `value`, `created_at`, `updated_at`)
VALUES
	(1,1,23,0,'2019-05-25 11:05:43','2019-05-25 11:05:43'),
	(2,2,23,1,'2019-05-25 11:05:43','2019-05-25 11:05:43'),
	(3,3,23,0,'2019-05-25 11:05:43','2019-05-25 11:05:43'),
	(4,1,27,0,'2019-05-25 12:55:07','2019-05-25 12:55:07'),
	(5,2,27,1,'2019-05-25 12:55:07','2019-05-25 12:55:07'),
	(6,3,27,0,'2019-05-25 12:55:07','2019-05-25 12:55:07'),
	(7,9,23,0,'2019-05-25 14:54:13','2019-05-25 14:54:13'),
	(8,10,23,1,'2019-05-25 14:54:13','2019-05-25 14:54:13'),
	(9,9,23,0,'2019-05-25 14:55:11','2019-05-25 14:55:11'),
	(10,10,23,1,'2019-05-25 14:55:11','2019-05-25 14:55:11');

/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table attachments
# ------------------------------------------------------------

DROP TABLE IF EXISTS `attachments`;

CREATE TABLE `attachments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `document` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;

INSERT INTO `attachments` (`id`, `user_id`, `name`, `document`, `created_at`, `updated_at`)
VALUES
	(8,21,'sdfsdf','16142874_678655619005841_8320871813056749506_n.jpg','2017-09-16 11:58:46','2017-09-16 11:58:46'),
	(9,21,'Lorem ipsum dolor sit','add.JPG','2017-09-19 16:50:27','2017-09-19 16:50:27'),
	(10,21,'ffff','Be my reporter in bangladesh  - Copy.docx','2017-09-20 14:23:21','2017-09-20 14:23:21');

/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table companies
# ------------------------------------------------------------

DROP TABLE IF EXISTS `companies`;

CREATE TABLE `companies` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `industry` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `website` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `about` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;

INSERT INTO `companies` (`id`, `user_id`, `name`, `country`, `city`, `industry`, `website`, `about`, `image`, `created_at`, `updated_at`)
VALUES
	(1,13,'First Gallary','Australia','Khulna','IT/Software','www.google.com','yyyyyyyyyyyyyyyy yyyyyy uuuuuuuuuu','4.jpg','2017-07-16 15:44:35','2017-07-20 16:02:01'),
	(2,16,'Hello BD','Bangladesh','Dhaka','IT/Software','sdfsdf','sdfsf','asp.PNG','2017-09-15 18:04:11','2017-09-15 18:05:31'),
	(3,18,'Oasis IT','Bangladesh','Dhaka','IT/Software','www.oasis.com','This is a company','dg2.png','2017-09-16 10:18:02','2017-09-18 02:35:52'),
	(4,22,'Job board','Bangladesh','Dhaka','Bank',NULL,NULL,NULL,'2017-09-16 12:35:55','2017-09-16 12:35:55'),
	(5,26,'Tile And Carpet','Bangladesh','Khulna','IT/Software','www.test.com','Iko fresh','TopMfg.png','2019-05-24 12:21:44','2019-05-24 12:21:57');

/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table job_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `job_user`;

CREATE TABLE `job_user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `points` int(11) NOT NULL DEFAULT 0,
  `total` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `J_u_id` (`job_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `job_user` WRITE;
/*!40000 ALTER TABLE `job_user` DISABLE KEYS */;

INSERT INTO `job_user` (`id`, `job_id`, `user_id`, `points`, `total`, `created_at`, `updated_at`)
VALUES
	(8,8,14,0,0,'2017-07-18 15:38:35','2017-07-18 15:38:35'),
	(13,7,12,0,0,'2017-07-21 13:11:09','2017-07-21 13:11:09'),
	(14,8,12,0,0,'2017-07-21 13:11:16','2017-07-21 13:11:16'),
	(15,8,12,0,0,'2017-09-15 19:26:25','2017-09-15 19:26:25'),
	(16,9,21,0,0,'2017-09-16 13:05:11','2017-09-16 13:05:11'),
	(17,9,23,0,0,'2017-09-16 13:24:27','2017-09-16 13:24:27'),
	(18,13,21,0,0,'2017-09-19 16:45:36','2017-09-19 16:45:36'),
	(19,9,21,0,0,'2017-09-21 02:11:52','2017-09-21 02:11:52'),
	(26,17,23,0,0,'2019-05-25 11:39:09',NULL),
	(27,17,27,2,4,'2019-05-25 12:55:07',NULL),
	(28,13,23,1,3,'2019-05-25 14:54:13',NULL);

/*!40000 ALTER TABLE `job_user` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table jobs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `jobs`;

CREATE TABLE `jobs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requirement` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `industry` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deadline` date NOT NULL,
  `career_level` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `degree` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `experience` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `skill` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posted` tinyint(4) NOT NULL DEFAULT 0,
  `drafted` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;

INSERT INTO `jobs` (`id`, `user_id`, `title`, `description`, `requirement`, `industry`, `salary`, `city`, `country`, `deadline`, `career_level`, `degree`, `experience`, `language`, `skill`, `posted`, `drafted`, `created_at`, `updated_at`)
VALUES
	(10,18,'Bank Teller','Looking for an experienced bank teller. Must be a team player.','Experience in the banking industry','Bank','Negotiable','Kisumu','Nairobi','2019-07-25','Begineer','Bachelor','0 - 2 years','English,Swahili','Problem Solving',1,0,'2017-09-18 02:42:37','2017-09-18 02:42:37'),
	(11,18,'Software Developer','Looking for an intermediate web developer with minimum 2 years experience','Skills in HTML,CSS and JS.Understanding of OOP concepts','IT/Software','Negotiable','Nyeri','Kenya','2019-09-18','Intermediate','Bachelor','2 - 5 years','English,Swahili','HTML,CSS, JS',1,0,'2017-09-18 02:43:04','2017-09-18 02:43:04'),
	(12,18,'Photographer','Take good shorts of our models for our fashion magazine','Experience with Photoshop and Video editing','Design/Creative','Negotiable','Kisumu','Kenya','2019-07-18','Begineer','Diploma','0 - 2 years','English','photography,video editing',1,0,'2017-09-18 02:43:32','2017-09-18 02:43:32'),
	(13,18,'Web Developer/Software Engineer','Looking for someone to revamp our website and intranets','Web development experience with CMS like wordpress and drupal','IT/Software','25001 - 50000','Kakamega','Kenya','2019-07-18','Experienced','Bachelor','2 - 5 years','English','Wordpress PHP, Html, CSS, javascript',1,0,'2017-09-19 16:44:47','2017-09-19 16:45:12'),
	(14,18,'Mobile App developer','Must be able to build mobile apps for android and IOS','Android,IOS development skills','IT/Software','25001 - 50000','Kakamega','Kenya','2019-07-18','Intermediate','Master\'s','5 - 10 years','English','c++, java, PHP, Html, CSS, javascript, jquery, Laravel, Asp.net mvc',1,0,'2017-09-21 02:18:38','2017-09-21 02:18:38'),
	(15,18,'Accountant','A good accountant to manage our books','CPA K or CCSA','Accounting/Finance','Negotiable','Kigali','Rwanda','2019-07-18','Begineer','Bachelor','0 - 2 years','English','accounting, management',1,0,'2017-09-21 02:19:51','2017-09-21 02:19:51'),
	(16,18,'CEO','looking for a great visionary to make sure our company flourishes','Experience running a business that has been published on the NSE','Multinational','50001 - 75000','Mombasa','Kenya','2019-07-18','Experienced','Master\'s','5 - 10 years','English','Enterprenuership, Management',1,0,'2017-09-21 02:20:56','2017-09-21 02:20:56'),
	(17,26,'Software Dev','Must be able to build mobile apps for android and IOS','Android,IOS development skills','IT/Software','Negotiable','Nairobi','Kenya','2019-05-25','Begineer','Bachelor','0 - 2 years','English','IT',1,0,'2019-05-24 12:23:11','2019-05-24 20:26:22'),
	(18,26,'Greenhouse Manager','Horticulture farming experience','Experience with greenhouses.\nExperience in floriculture.','Agricultural','Negotiable','Nairobi','Kenya','2019-05-24','Begineer','Bachelor','0 - 2 years','Swahili, Sheng','Farming',1,0,'2019-05-24 19:48:34','2019-05-24 20:26:58');

/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table links
# ------------------------------------------------------------

DROP TABLE IF EXISTS `links`;

CREATE TABLE `links` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;

INSERT INTO `links` (`id`, `user_id`, `name`, `url`, `created_at`, `updated_at`)
VALUES
	(3,21,'Tutorials point','www.tutorialspoint.com','2017-09-19 16:50:53','2017-09-19 16:50:53');

/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(10,'2014_10_12_000000_create_users_table',1),
	(11,'2014_10_12_100000_create_password_resets_table',1),
	(12,'2017_05_29_084647_create_activities_table',1),
	(13,'2017_05_29_085529_create_works_table',1),
	(14,'2017_05_29_090300_create_skills_table',1),
	(15,'2017_05_29_090522_create_links_table',1),
	(16,'2017_05_29_090658_create_attachments_table',1),
	(17,'2017_05_29_090842_create_companies_table',1),
	(18,'2017_05_29_092418_create_jobs_table',1),
	(19,'2017_07_18_165823_create_job_user_table',2),
	(20,'2019_05_24_162311_create_questions_table',3),
	(21,'2019_05_24_163901_create_answers_table',3),
	(24,'2019_05_25_121938_addPivotFieldToTableJobUsers',4);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table questions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `questions`;

CREATE TABLE `questions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `job_id` int(10) unsigned NOT NULL,
  `quest` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` tinyint(1) NOT NULL DEFAULT 0,
  `points` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `questions_job_id_foreign` (`job_id`),
  CONSTRAINT `questions_job_id_foreign` FOREIGN KEY (`job_id`) REFERENCES `jobs` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;

INSERT INTO `questions` (`id`, `job_id`, `quest`, `answer`, `points`, `created_at`, `updated_at`)
VALUES
	(1,17,'Are you over 18?',1,1,'2019-05-24 18:58:58','2019-05-24 18:58:58'),
	(2,17,'Do you have a driving license?',1,2,'2019-05-24 18:58:58','2019-05-24 18:58:58'),
	(3,17,'Are you willing to relocate?',1,1,'2019-05-24 18:58:58','2019-05-24 18:58:58'),
	(4,11,'Do you have a degree?',1,2,'2019-05-24 19:09:37','2019-05-24 19:09:37'),
	(5,11,'Is your degree in marketing or acounting?',1,2,'2019-05-24 19:09:37','2019-05-24 19:09:37'),
	(6,18,'Any experience in horticultural farming?',1,2,'2019-05-24 19:49:18','2019-05-24 19:49:18'),
	(7,18,'Ever worked in a green house?',1,5,'2019-05-24 19:49:18','2019-05-24 19:49:18'),
	(8,18,'Do you have any formal education in the agricultural sector?',1,3,'2019-05-24 19:49:18','2019-05-24 19:49:18'),
	(9,13,'Are you over 18?',1,2,'2019-05-24 19:49:18',NULL),
	(10,13,'Are you willing to relocate?',1,1,'2019-05-24 19:49:18',NULL),
	(11,14,'Do you have any computer skills?',1,2,'2019-05-24 19:49:18',NULL),
	(12,13,'Are you willing to relocate?',0,1,'2019-05-24 19:49:18',NULL),
	(13,16,'Are you willing to relocate?',0,1,'2019-05-24 19:49:18',NULL),
	(14,14,'Do you have any mobile apps on the Playstore or Apple Store?',1,4,'2019-05-24 19:49:18',NULL),
	(15,10,'Are you willing to relocate?',0,1,'2019-05-24 19:49:18',NULL),
	(16,15,'Are you willing to relocate?',0,1,'2019-05-24 19:49:18',NULL),
	(17,12,'Are you willing to relocate?',0,1,'2019-05-24 19:49:18',NULL),
	(18,15,'Do you have any certifications?',0,2,'2019-05-24 19:49:18',NULL),
	(19,15,'Do you have any certifications?',0,1,'2019-05-24 19:49:18',NULL),
	(20,10,'Do you have any certifications?',0,2,'2019-05-24 19:49:18',NULL);

/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table skills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skills`;

CREATE TABLE `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `level` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `experience` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;

INSERT INTO `skills` (`id`, `user_id`, `name`, `level`, `experience`, `created_at`, `updated_at`)
VALUES
	(1,11,'Record Keeping','Experienced','6 - 10 years','2017-05-31 15:59:04','2017-05-31 15:59:04'),
	(2,11,'Project Management','Begineer','3 - 5 years','2017-05-31 16:00:15','2017-05-31 16:00:15'),
	(15,19,'Technical Sales','Begineer','0 - 2 years','2017-09-16 10:28:46','2017-09-16 10:28:46'),
	(18,23,'Sales and Marketing','Begineer','0 - 2 years','2017-09-16 13:24:10','2017-09-16 13:24:10'),
	(19,21,'PHP','Experienced','3 - 5 years','2017-09-19 16:49:44','2017-09-19 16:49:44'),
	(20,21,'Laravel','Experienced','3 - 5 years','2017-09-19 16:49:52','2017-09-19 16:49:52'),
	(21,21,'CSS','Experienced','3 - 5 years','2017-09-19 16:49:59','2017-09-19 16:49:59'),
	(22,27,'Accounting','Intermediate','3 - 5 years','2019-05-25 12:40:58','2019-05-25 12:40:58');

/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `seeker` tinyint(4) NOT NULL DEFAULT 0,
  `employer` tinyint(4) NOT NULL DEFAULT 0,
  `admin` tinyint(4) NOT NULL DEFAULT 0,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `image`, `seeker`, `employer`, `admin`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(18,'Jeny Waigwa','struff@gmail.com','$2y$10$qaWP/a6vPeWebZ0dNajuxuXf3MT3SMaCCOT9cc9Fo6k92qMel.GSO','07239802237',NULL,0,1,0,'AlrY6lSwzMiaUtrJTMGnOtJyZESnW2cLhA8KkaYqpqj0ky8JSi1r8Lxm5gOZ','2017-09-16 10:17:57','2019-05-24 20:23:16'),
	(21,'Joe Towet','towet@gmail.com','$2y$10$9A67dEbRGC1GjmV.nfe0VOF3m4XYyAK.WA.gV/m2d3ndKe5eMYifu','0714601116','asp.PNG',1,0,0,'pXjysemDrz0LkLQxS9MiXkkvbBYOKTpZt631ASYWRiF5nt6s8iFMSs8oZm9j','2017-09-16 11:57:31','2019-05-24 20:23:16'),
	(22,'Admin','admin@gmail.com','$2y$10$N4RqeHUs.ST4leJ9k4b9zONXsOphm55tOszyGyvaqnwL6M4sXfDnG','0712920100',NULL,0,0,1,'VFz7QzM4e8el4CW2QpUFbNJBfyrWITrvpeir9pFl30b9KONmmXDIZru9oTOM','2017-09-16 12:35:42','2019-05-24 20:25:36'),
	(23,'Seeker','seeker@gmail.com','$2y$10$9A67dEbRGC1GjmV.nfe0VOF3m4XYyAK.WA.gV/m2d3ndKe5eMYifu','0712920101','23.png',1,0,0,'rFsjCHBZ59Owv8uoYXXaLfMv2oH1AqtbKG67bHQg52bwbC73bJCh3gKy6AB8','2017-09-16 13:23:32','2019-05-25 14:50:39'),
	(24,'Major Lazer','lazer@gmail.com','$2y$10$9A67dEbRGC1GjmV.nfe0VOF3m4XYyAK.WA.gV/m2d3ndKe5eMYifu','0712925400',NULL,1,0,0,'oCSedoLT8YmD5gWktR4rS8kOSIMwD1jTx2zgH3jEEm8AuFlIk1iLtkkr9A2U','2017-09-18 02:47:16','2019-05-24 20:23:16'),
	(25,'Kirk Savoir','kirk@gmail.com','$2y$10$9A67dEbRGC1GjmV.nfe0VOF3m4XYyAK.WA.gV/m2d3ndKe5eMYifu','0712925403',NULL,1,0,0,'GpIRAezdiIahnwZySi9vjRJ9SvIpRN7PSBgWk8eyxzmGQII1XSWiiIo2DByQ','2017-09-18 02:47:44','2019-05-24 20:23:16'),
	(26,'Martin Kagume','martiniriga@gmail.com','$2y$10$PKyZOYnMRXunW09Ta4ErwORg.jqLBZOL4sTbyypdkTO.bg4KeBIIa','0712999400',NULL,0,1,0,'uN7XmNcRu8TgyVh497tCKkS9UaPNSdA8BZ1c1OW04OWeJlPOo2zfo2vbYp01','2019-05-24 12:21:07','2019-05-24 20:25:16'),
	(27,'Kanini Kadzo','kakzo@gmail.com','$2y$10$AWTpfgLMhnvX5EidziF30ueksPJwbZzLlnHTcwnzZManl/amGT85e','0712925499',NULL,1,0,0,'tko5EfjjcFBaO1DHQEOmz1tIwWaK8zHWFqhZvgQS74Glzr7kyME4vD6bSzr6','2019-05-25 12:37:43','2019-05-25 12:37:43');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table works
# ------------------------------------------------------------

DROP TABLE IF EXISTS `works`;

CREATE TABLE `works` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `no_experience` tinyint(4) NOT NULL DEFAULT 0,
  `job_title` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `industry` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_role` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `activity` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from` date DEFAULT NULL,
  `to` date DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `works` WRITE;
/*!40000 ALTER TABLE `works` DISABLE KEYS */;

INSERT INTO `works` (`id`, `user_id`, `no_experience`, `job_title`, `company_name`, `country`, `industry`, `job_role`, `activity`, `from`, `to`, `created_at`, `updated_at`)
VALUES
	(19,11,0,'Bank Teller','K & J Associates','USA','Marketing','Manager','Posting cheques',NULL,NULL,'2017-05-31 15:11:30','2017-05-31 15:11:30'),
	(20,11,0,'IT intern','Medtech Supplies','Rwanda','IT/Software','Manager','Keep track of internet usage ',NULL,NULL,'2017-05-31 16:01:39','2017-05-31 16:01:39'),
	(27,19,0,'Chief Accountant','Biz Audits','Ethiopia','Accounting','Accountant','Manage and file taxes and ensure company books are in order',NULL,NULL,'2017-09-16 10:28:41','2017-09-16 10:28:41'),
	(30,23,0,'Auditor','Zetech Media','Sudan','Accounting','Accountant','Manage and file taxes and ensure company books are in order',NULL,NULL,'2017-09-16 13:24:07','2017-09-16 13:24:07'),
	(31,21,0,'Web Developer','Oasis IT','Kenya','IT/Software','Manager','Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit',NULL,NULL,'2017-09-19 16:49:14','2017-09-19 16:49:14'),
	(32,21,0,'Project Manager','Oasis IT','Kenya','IT/Software','Manager','Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit Lorem ipsum dolor sit',NULL,NULL,'2017-09-19 16:49:32','2017-09-19 16:49:32'),
	(33,27,0,'Senior Engineer','Chef Kay','Tanzania','Accounting','Accountant','Book Keeping, Invoicing and General Accounts',NULL,NULL,'2019-05-25 12:40:34','2019-05-25 12:40:34');

/*!40000 ALTER TABLE `works` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
