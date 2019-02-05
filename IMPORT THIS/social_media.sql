CREATE DATABASE  IF NOT EXISTS `social_media` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `social_media`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: social_media
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `post_body` text,
  `posted_by` varchar(60) DEFAULT NULL,
  `posted_to` varchar(60) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `removed` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,2,'english english hmm?','marko_jordanov','sara_zmejkovska','2019-02-05 17:57:27','no'),(2,2,'hahahah','sara_zmejkovska','sara_zmejkovska','2019-02-05 17:58:03','no');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_requests`
--

DROP TABLE IF EXISTS `friend_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_to` varchar(60) DEFAULT NULL,
  `user_from` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_requests`
--

LOCK TABLES `friend_requests` WRITE;
/*!40000 ALTER TABLE `friend_requests` DISABLE KEYS */;
/*!40000 ALTER TABLE `friend_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `likes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(60) DEFAULT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (1,'marko_jordanov',2),(2,'stefan_veljkovic',3),(3,'sara_zmejkovska',4);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_to` varchar(60) DEFAULT NULL,
  `user_from` varchar(60) DEFAULT NULL,
  `body` text,
  `date` datetime DEFAULT NULL,
  `opened` varchar(3) DEFAULT NULL,
  `viewed` varchar(3) DEFAULT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,'stefan_veljkovic','marko_jordanov','Raboti li?','2019-02-05 18:08:47','yes','no','no'),(2,'marko_jordanov','stefan_veljkovic','Sekako deka raboti!!','2019-02-05 18:09:07','yes','no','no');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `body` text,
  `added_by` varchar(60) DEFAULT NULL,
  `user_to` varchar(60) DEFAULT NULL,
  `date_added` datetime DEFAULT NULL,
  `user_closed` varchar(3) DEFAULT NULL,
  `deleted` varchar(3) DEFAULT NULL,
  `likes` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'Zdravo na site! ','marko_jordanov','none','2019-02-05 17:54:30','no','no',0),(2,'Sara in da houseeeeeee!!','sara_zmejkovska','none','2019-02-05 17:56:25','no','no',1),(3,'Bilder, a?','marko_jordanov','stefan_veljkovic','2019-02-05 18:00:25','no','no',1),(4,'Sakas da izlezeme?','igor_miloshevski','sara_zmejkovska','2019-02-05 18:03:03','no','no',1),(5,'Zzzz','maria_zdravkovska','none','2019-02-05 18:05:59','no','no',0),(6,'Bench-av 150kila!','stefan_veljkovic','none','2019-02-05 18:07:18','no','no',0);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) DEFAULT NULL,
  `num_posts` int(11) DEFAULT '0',
  `num_likes` int(11) DEFAULT '0',
  `user_closed` varchar(3) DEFAULT NULL,
  `friend_array` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Marko','Jordanov','marko_jordanov','marko@gmail.com','62c8ad0a15d9d1ca38d5dee762a16e01','2019-02-05','assets/images/profile_pics/marko_jordanovf2951c02459a40bc352eac2e8e1422aen.jpeg',2,1,'no',',sara_zmejkovska,stefan_veljkovic,maria_zdravkovska,'),(2,'Sara','Zmejkovska','sara_zmejkovska','sara@gmail.com','62c8ad0a15d9d1ca38d5dee762a16e01','2019-02-05','assets/images/profile_pics/sara_zmejkovska5d05e523667b9410a69531f8cb66370cn.jpeg',1,1,'no',',marko_jordanov,igor_miloshevski,'),(3,'Stefan','Veljkovic','stefan_veljkovic','stefan@gmail.com','62c8ad0a15d9d1ca38d5dee762a16e01','2019-02-05','assets/images/profile_pics/stefan_veljkovic2820bae39fd82c540d7bf61a171f5f9dn.jpeg',1,0,'no',',marko_jordanov,'),(4,'Igor','Miloshevski','igor_miloshevski','igor@gmail.com','62c8ad0a15d9d1ca38d5dee762a16e01','2019-02-05','assets/images/profile_pics/igor_miloshevski4fb5fbf4e088f4157a97410a4a91b01dn.jpeg',1,1,'no',',sara_zmejkovska,'),(5,'Maria','Zdravkovska','maria_zdravkovska','maria@gmail.com','62c8ad0a15d9d1ca38d5dee762a16e01','2019-02-05','assets/images/profile_pics/maria_zdravkovska44f1aced27e89a11ecea3dc090270d2cn.jpeg',1,0,'no',',marko_jordanov,');
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

-- Dump completed on 2019-02-05 18:29:54
