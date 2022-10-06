-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: imbd
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `AGE` int DEFAULT NULL,
  `EXPERIENCE` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'LEO',47,15),(2,'KAMALHAASAN',70,45),(3,'MOHANLAL',65,30),(4,'KATEWINSLET',47,15),(5,'VJSETHUPATHY',40,10);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `details`
--

DROP TABLE IF EXISTS `details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `details` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ARTIST` int DEFAULT NULL,
  `MOVIE` int DEFAULT NULL,
  `ROLE` int DEFAULT NULL,
  `SKILL` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ARTIST` (`ARTIST`),
  KEY `MOVIE` (`MOVIE`),
  KEY `ROLE` (`ROLE`),
  KEY `SKILL` (`SKILL`),
  CONSTRAINT `details_ibfk_1` FOREIGN KEY (`ARTIST`) REFERENCES `artist` (`ID`),
  CONSTRAINT `details_ibfk_2` FOREIGN KEY (`MOVIE`) REFERENCES `movie` (`ID`),
  CONSTRAINT `details_ibfk_3` FOREIGN KEY (`ROLE`) REFERENCES `roles` (`ID`),
  CONSTRAINT `details_ibfk_4` FOREIGN KEY (`SKILL`) REFERENCES `skills` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `details`
--

LOCK TABLES `details` WRITE;
/*!40000 ALTER TABLE `details` DISABLE KEYS */;
INSERT INTO `details` VALUES (1,1,2,1,1),(2,2,1,1,1),(3,2,1,1,2),(4,3,3,1,1),(5,4,2,3,1),(6,5,1,2,1);
/*!40000 ALTER TABLE `details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genre` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `GENRE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'ACTION'),(2,'LOVE'),(3,'THRILLER'),(4,'COMEDY');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `ID` int DEFAULT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  `SIZE` varchar(255) DEFAULT NULL,
  `MOVIEID` int DEFAULT NULL,
  KEY `MOVIEID` (`MOVIEID`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`MOVIEID`) REFERENCES `movie` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,'VIDEO','50MB',1),(2,'IMAGE','5MB',2);
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MOVIENAME` varchar(255) DEFAULT NULL,
  `DIRECTOR` varchar(255) DEFAULT NULL,
  `LANG` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie`
--

LOCK TABLES `movie` WRITE;
/*!40000 ALTER TABLE `movie` DISABLE KEYS */;
INSERT INTO `movie` VALUES (1,'VIKRAM','LOKESH','TAMIL'),(2,'TITANIC','J CAMERON','ENGLISH'),(3,'DHRISHIYAM','JEETHU JOSEPH','MALAYALAM');
/*!40000 ALTER TABLE `movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genre`
--

DROP TABLE IF EXISTS `movie_genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_genre` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `MOVIE_ID` int DEFAULT NULL,
  `GENRE_ID` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MOVIE_ID` (`MOVIE_ID`),
  KEY `GENRE_ID` (`GENRE_ID`),
  CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movie` (`ID`),
  CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`MOVIE_ID`) REFERENCES `movie` (`ID`),
  CONSTRAINT `movie_genre_ibfk_3` FOREIGN KEY (`GENRE_ID`) REFERENCES `genre` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genre`
--

LOCK TABLES `movie_genre` WRITE;
/*!40000 ALTER TABLE `movie_genre` DISABLE KEYS */;
INSERT INTO `movie_genre` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `movie_genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ROLE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'HERO'),(2,'VILLAIN'),(3,'HEROINE'),(4,'COMEDIAN');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skills` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `SKILL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
INSERT INTO `skills` VALUES (1,'ACTING'),(2,'SINGING');
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_review`
--

DROP TABLE IF EXISTS `users_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_review` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `AGE` int DEFAULT NULL,
  `MOVIE` int DEFAULT NULL,
  `RATING` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `MOVIE` (`MOVIE`),
  CONSTRAINT `users_review_ibfk_1` FOREIGN KEY (`MOVIE`) REFERENCES `movie` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_review`
--

LOCK TABLES `users_review` WRITE;
/*!40000 ALTER TABLE `users_review` DISABLE KEYS */;
INSERT INTO `users_review` VALUES (1,'BENO',18,1,'GOOD'),(2,'PURUSHOTH',67,2,'VERYGOOD'),(3,'DENY',89,3,'GOOD');
/*!40000 ALTER TABLE `users_review` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-06 18:01:25
