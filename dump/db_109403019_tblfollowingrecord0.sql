CREATE DATABASE  IF NOT EXISTS `db_109403019` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_109403019`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: db_109403019
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `tblfollowingrecord`
--

DROP TABLE IF EXISTS `tblfollowingrecord`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblfollowingrecord` (
  `following_record_id` int NOT NULL AUTO_INCREMENT,
  `proposal_id` int NOT NULL,
  `member_id` int NOT NULL,
  PRIMARY KEY (`following_record_id`,`proposal_id`,`member_id`),
  KEY `member_id_member_idx` (`member_id`) /*!80000 INVISIBLE */,
  KEY `proposal_id_proposal_idx` (`proposal_id`) /*!80000 INVISIBLE */,
  KEY `following_record_id` (`following_record_id`),
  CONSTRAINT `tblFollowingRecord_link_to_member_id` FOREIGN KEY (`member_id`) REFERENCES `tblmember` (`member_id`),
  CONSTRAINT `tblFollowingRecord_lnik_to_proposal_id` FOREIGN KEY (`proposal_id`) REFERENCES `tblproposal` (`proposal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblfollowingrecord`
--

LOCK TABLES `tblfollowingrecord` WRITE;
/*!40000 ALTER TABLE `tblfollowingrecord` DISABLE KEYS */;
INSERT INTO `tblfollowingrecord` VALUES (1,6,9),(2,1,10),(3,1,3),(4,5,4),(5,4,8),(6,10,1),(7,1,2),(8,2,6),(9,1,7),(10,3,1);
/*!40000 ALTER TABLE `tblfollowingrecord` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-14  6:59:16
