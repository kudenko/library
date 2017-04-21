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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_categories`
--

LOCK TABLES `book_categories` WRITE;
/*!40000 ALTER TABLE `book_categories` DISABLE KEYS */;
INSERT INTO `book_categories` VALUES (1,'Фантастика','4'),(2,'Научная фантастика','1'),(3,'фентези','1'),(4,'ужасы','1'),(5,'мистика','1'),(6,'Детектив','3'),(12,'Для удаления','0');
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
  KEY `fk_books_1_idx` (`category`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (159,'1492278477','Последний дозор','Кинг','Завершающая книга про детектива Стивена Ходжеса.\r\n',1,1,NULL,'2017-04-21 23:57:05','1492808225king_Last_watch','1492807877кинг.jpg',0,8),(160,' 1492290557','Ночной Экспресс','Агата Кристи','Очередной детектив\r\n\r\n\r\n',1,1,NULL,'2017-04-21 23:57:22','1492808242agata_kristi_no4noy_express','1492807975экспресс.jpg',0,3),(161,' 1492362566','Звездный десант','Хайнлайн','Боевик про тараканов, но больших\r\n',1,1,NULL,'2017-04-21 23:57:42','1492808262Haynlayn_zvesdnyy_desant','1492808041desant.jpg',0,7),(162,' 1492373429','Как стать миллионером','Скрудж','Подробное описание того, как стать миллионером\r\n\r\n\r\n',1,1,NULL,'2017-04-21 23:59:15','1492808355kak_stat_millionerom','1492808119million.jpg',0,1),(163,' 1492373510','Властелин колец','Толкиен','Классика Фентези. Читайте только у нас!!',1,3,NULL,'2017-04-22 00:00:52','1492808452Tolkien_lord_of_the_rings','1492808452lord.jpg',0,22),(164,'dsad','Зов Ктулху','Говард Филлипс Лавкрафт','Литературное произведение, уже ставшее классикой в жанре ужаса.\r\n\r\n\r\n\r\n\r\n\r\n',1,4,NULL,'2017-04-22 00:03:23','1492808603Lavcraft_zov_ktulhu','1492808603ктулху.jpg',0,1),(165,'adm','adm','adm','adm\r\n',1,1,NULL,'2017-04-21 20:15:55','1492458812tickets.pdf','149245881212.png',1,0),(169,'dasdas','Мастер и Маргарита','Булгаков','Книга лучше фильма',1,1,NULL,'2017-04-22 00:30:41','1492810221Bulgakov_ru_master_i_margarita.fb2','1492809398мастер.jpg',0,0),(185,' 1492805885','asdasd','dasda','asdasd\r\n\r\n\r\n',0,1,NULL,'2017-04-22 00:38:15','1492805901test1.txt','149280590112.png',1,0),(186,' 1492810295','d','d','\r\n            d',0,1,NULL,'2017-04-22 00:31:50','1492810310Bulgakov_ru_master_i_margarita.fb2','1492810310ктулху.jpg',0,0);
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
  KEY `fk_comments_1_idx` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (5,153,'admin','testdasd','17-04-16 06:04:40'),(6,153,'admin','Привет, тестовый комментарий\r\nКак дела?','17-04-16 06:04:48'),(7,155,'admin','тест','17-04-16 06:04:41'),(8,155,'admin','в','17-04-16 06:04:53'),(9,155,'admin','dd','17-04-16 06:04:12'),(10,155,'admin','dd','17-04-16 18:04:44'),(11,155,'admin','test','17-04-16 19:04:34'),(12,155,'admin','test\r\n','17-04-16 19:04:47'),(13,156,'admin','dd','17-04-16 19:04:17'),(14,156,'admin','авто\r\n','17-04-16 19:04:20'),(21,153,'admin','test1','17-04-16 19:04:16'),(22,153,'admin','test2','17-04-16 19:04:24'),(23,153,'admin','test3','17-04-16 19:04:30'),(27,153,'','еуые 4','17-04-16 20:04:55'),(29,153,'','куку','17-04-16 20:04:16'),(30,153,'','кцукцук','17-04-16 20:04:21'),(37,161,'admin','dasd','17-04-16 20:10:11'),(38,153,'admin','dd','17-04-16 20:43:21'),(39,161,'admin','das','17-04-16 23:41:13'),(40,163,'user','dasd','17-04-16 23:49:54'),(41,163,'user2','dadas','17-04-16 23:54:39'),(42,163,'admin','sds','17-04-21 12:17:54'),(44,159,'admin','тест','17-04-21 23:27:17'),(45,163,'','тест2','17-04-21 23:27:55');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `like_id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) DEFAULT NULL,
  `is_like` int(11) DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `user_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`like_id`),
  KEY `fk_likes_1_idx` (`book_id`),
  KEY `index3` (`user_id`),
  KEY `fk_likes_3_idx` (`user_name`),
  CONSTRAINT `fk_likes_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_likes_3` FOREIGN KEY (`user_name`) REFERENCES `users` (`login`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (4,155,1,NULL,'admin33'),(5,163,1,NULL,'admin'),(41,155,1,NULL,'admin'),(42,155,1,NULL,'admin'),(43,155,1,NULL,'admin'),(44,155,1,NULL,'admin'),(45,155,1,NULL,'admin'),(46,153,1,NULL,'admin'),(47,153,1,NULL,'user'),(48,155,1,NULL,'user'),(49,165,1,NULL,'user'),(50,164,1,NULL,'admin'),(51,163,1,NULL,'user'),(52,162,1,NULL,'user'),(53,160,1,NULL,'user'),(54,161,1,NULL,'user'),(55,165,1,NULL,'admin'),(56,159,1,NULL,'admin');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(45) NOT NULL DEFAULT 'admin',
  `password` char(32) NOT NULL,
  `is_active` tinyint(1) unsigned DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index2` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'admin','admin@your-site.com','admin','2d71419bc256e02fb1f9462b0fd75669',1),(10,'user','s@mail.ru','user','78f39176b1bbfc6c6fb9ee5e6fd64aa5',1),(11,'user2','ky_se_se@mail.ru','user','9e39bf21bd096b4736abd80527f8cbb7',1),(12,'admin33','test@m.ru','admin','9e39bf21bd096b4736abd80527f8cbb7',1),(13,'user3','123@m.ru','user','9e39bf21bd096b4736abd80527f8cbb7',1);
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

-- Dump completed on 2017-04-22  0:39:49
