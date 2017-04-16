-- MySQL dump 10.13  Distrib 5.6.31, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: mvc
-- ------------------------------------------------------
-- Server version	5.6.31-0ubuntu0.15.10.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `book_categories`
--

DROP TABLE IF EXISTS `book_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `book_categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `weight` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_categories`
--

LOCK TABLES `book_categories` WRITE;
/*!40000 ALTER TABLE `book_categories` DISABLE KEYS */;
INSERT INTO `book_categories` VALUES (1,'Фантастика','1'),(2,'Научная фантастика','1'),(3,'фентези','1'),(4,'ужасы','1'),(5,'мистика','1'),(6,'Детектив','3'),(8,'delete','2');
/*!40000 ALTER TABLE `book_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `alias` varchar(100) DEFAULT NULL,
  `title` varchar(200) DEFAULT NULL,
  `author` varchar(300) DEFAULT NULL,
  `description` text,
  `is_published` tinyint(1) unsigned DEFAULT '0',
  `category` int(11) NOT NULL,
  `aditional_category` varchar(300) DEFAULT NULL,
  `add_date` varchar(100) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `picture_path` varchar(150) DEFAULT NULL,
  `is_deleted` int(11) DEFAULT NULL,
  `download` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`category`),
  KEY `fk_books_1_idx` (`category`),
  CONSTRAINT `fk_books_1` FOREIGN KEY (`category`) REFERENCES `book_categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (153,' 1492029294','вв','вв','\r\n            вв',1,1,NULL,'2017-04-12 23:37:32','1492029452Bulgakov.fb2','149202945212.png',1,8),(155,' 1492029294','вв','вв','Очередная книга ужасов великого и неповторимого Стивена Кингаddddddddddddd dddddddddddddddddddddddddddd d \r\ndddddddddddddddd\r\n dddddddddddddddddddddddddddddddd ddddddddddd dddddd\r\ndddddddd\r\ndddddddd\r\ndd\r\nd\r\nd\r\ndd\r\ndddddddddddddddd\r\nddddddd\r\n',1,1,NULL,'2017-04-15 21:08:31','1492029452Bulgakov.fb2','149202945212.png',0,10),(156,' 1492029294','вв','вв','\r\n            вв',1,1,NULL,'2017-04-12 23:37:32','1492029452Bulgakov.fb2','149202945212.png',0,1),(158,' 1492273492','test','test','test\r\n\r\n',1,1,NULL,'2017-04-15 19:26:41','1492273511test1.txt','149227351112.png',1,1),(159,' 1492278477','das','asd','dasd\r\nasdasd\r\nasdasdas\r\ndasdas\r\ndasdas\r\ndasdas\r\ngfdgdfgdf\r\ng\r\n.\r\ndgdfsgsd\r\ngdsfgdsf\r\ngsdf\r\ngsdfgsd\r\nfgsdfgsdfg\r\n        \r\n',1,1,NULL,'2017-04-15 20:54:03','1492278496ht','149227849612.png',0,1),(160,' 1492290557','das','das','ads\r\n',1,1,NULL,'2017-04-16 00:09:43','1492290567test1.txt','149229056712.png',0,3),(161,' 1492362566','test','test','dasdas\r\n',1,4,NULL,'2017-04-16 20:09:59','1492362583poems','149236258312.png',0,6),(162,' 1492373429','new','new','312312\r\n',1,1,NULL,'2017-04-16 23:11:11','1492373459ht','149237345912.png',0,1),(163,' 1492373510','new2','new2','new2\r\n',1,1,NULL,'2017-04-16 23:12:30','1492373532test1.txt','149237353212.png',0,14);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_categories`
--

DROP TABLE IF EXISTS `books_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books_categories` (
  `book_id` int(11) NOT NULL,
  `books_categories` int(11) NOT NULL,
  KEY `fk_books_categories_1_idx` (`book_id`),
  KEY `fk_books_categories_2_idx` (`books_categories`),
  CONSTRAINT `fk_books_categories_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_books_categories_2` FOREIGN KEY (`books_categories`) REFERENCES `categories` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_categories`
--

LOCK TABLES `books_categories` WRITE;
/*!40000 ALTER TABLE `books_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `books_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'fantasy',NULL),(2,'fantastic',NULL);
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `user_name` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `comment_add_day` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `fk_comments_1_idx` (`book_id`),
  CONSTRAINT `fk_comments_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (4,153,'admin','testdasd','17-04-16 06:04:40'),(5,153,'admin','testdasd','17-04-16 06:04:40'),(6,153,'admin','Привет, тестовый комментарий\r\nКак дела?','17-04-16 06:04:48'),(7,155,'admin','тест','17-04-16 06:04:41'),(8,155,'admin','в','17-04-16 06:04:53'),(9,155,'admin','dd','17-04-16 06:04:12'),(10,155,'admin','dd','17-04-16 18:04:44'),(11,155,'admin','test','17-04-16 19:04:34'),(12,155,'admin','test\r\n','17-04-16 19:04:47'),(13,156,'admin','dd','17-04-16 19:04:17'),(14,156,'admin','авто\r\n','17-04-16 19:04:20'),(21,153,'admin','test1','17-04-16 19:04:16'),(22,153,'admin','test2','17-04-16 19:04:24'),(23,153,'admin','test3','17-04-16 19:04:30'),(27,153,'','еуые 4','17-04-16 20:04:55'),(28,153,'','кук','17-04-16 20:04:13'),(29,153,'','куку','17-04-16 20:04:16'),(30,153,'','кцукцук','17-04-16 20:04:21'),(31,153,'','чясчя','17-04-16 20:04:55'),(37,161,'admin','dasd','17-04-16 20:10:11'),(38,153,'admin','dd','17-04-16 20:43:21'),(39,161,'admin','das','17-04-16 23:41:13'),(40,163,'user','dasd','17-04-16 23:49:54'),(41,163,'user2','dadas','17-04-16 23:54:39');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `messages` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'Test','asd','ÐŸÑ€Ð¸Ð²ÐµÑ‚'),(2,'d','d','d'),(3,'d','d','авто'),(4,'d','d','d'),(5,'test','test','test'),(6,'dasd','adsd','dasd'),(7,'','','dasd'),(8,'','','Ð°Ð²Ð¸'),(9,'','',''),(10,'','','Ð°'),(11,'','',''),(12,'','',''),(13,'','',''),(14,'','',''),(15,'','',''),(16,'','',''),(17,'','',''),(18,'','',''),(19,'','',''),(20,'Gre','',''),(21,'Grey','g','g'),(22,'ÐÐ²Ñ‚Ð¾','ÐÐ²Ñ‚Ð¾','ÐÐ²Ñ‚Ð¾'),(23,'nama','emaa','текст'),(24,'nama','emaa','текст5'),(25,'dasd','sad','ÐÐ²Ñ‚Ð¾'),(26,'das','das','авто'),(27,'авто1','авто2','тест3'),(28,'rqw','rqw','rqw'),(29,'ihgrkhehr','kjrk','irjwekrh');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pages` (
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `alias` varchar(100) NOT NULL,
  `title` varchar(100) NOT NULL,
  `content` text,
  `is_published` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'1test','1Test page 11','This is content',1),(2,'test2','Test page2','Another test content2',1),(53,'1','3','4',0),(54,'test5','12345','fsdfsdfsdf',1),(55,'213111','123111','123111\r\n        \r\n        \r\n        ',1),(56,'123','123','\r\n        123',1);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'admin',
  `password` char(32) NOT NULL,
  `is_active` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin','admin@your-site.com','admin','2d71419bc256e02fb1f9462b0fd75669',1),(10,'user','s@mail.ru','user','78f39176b1bbfc6c6fb9ee5e6fd64aa5',1),(11,'user2','ky_se_se@mail.ru','user','9e39bf21bd096b4736abd80527f8cbb7',1);
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

-- Dump completed on 2017-04-17  0:00:10
