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
INSERT INTO `book_categories` VALUES (1,'Фантастика','1'),(2,'Научная фантастика','1'),(3,'фентези','1'),(4,'ужасы','0'),(5,'мистика','1'),(6,'Детектив','3'),(8,'delete','2'),(9,'new11','0'),(10,'sada1','0'),(11,'sada','33');
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
  PRIMARY KEY (`id`,`category`),
  KEY `fk_books_1_idx` (`category`),
  CONSTRAINT `fk_books_1` FOREIGN KEY (`category`) REFERENCES `book_categories` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=155 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (2,' 1491745437','те','тест','\r\n\r\n',1,1,'vxcv','2017-04-09 21:00:38','tickets.pdf','12.png',NULL),(4,' 1491745437','5444','5444','3335\r\n\r\n\r\n\r\n\r\n\r\n',1,1,NULL,'2017-04-12 23:31:52','1491773761tickets.pdf','1492029112million.jpg',NULL),(153,' 1492029294','вв','вв','\r\n            вв',0,1,NULL,'2017-04-12 23:37:32','1492029452Bulgakov.fb2','149202945212.png',1),(154,' 1492029294','вв','вв','\r\n            вв',0,1,NULL,'2017-04-12 23:44:35','1492029875Bulgakov.fb2','149202987512.png',1);
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
INSERT INTO `books_categories` VALUES (2,2);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin','admin@your-site.com','admin','2d71419bc256e02fb1f9462b0fd75669',1),(10,'user','s@mail.ru','user','78f39176b1bbfc6c6fb9ee5e6fd64aa5',1);
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

-- Dump completed on 2017-04-12 23:52:06
