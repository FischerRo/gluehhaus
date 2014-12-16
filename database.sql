CREATE DATABASE  IF NOT EXISTS `gluehhaus` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gluehhaus`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: damo-ws2014.cjwjwimid7kf.eu-central-1.rds.amazonaws.com    Database: gluehhaus
-- ------------------------------------------------------
-- Server version	5.6.19-log

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
-- Table structure for table `Bestellposition`
--

DROP TABLE IF EXISTS `Bestellposition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bestellposition` (
  `Bestellung_Id` int(10) unsigned NOT NULL,
  `Wein_Id` int(10) unsigned NOT NULL,
  `Zutat_Id` int(10) unsigned NOT NULL,
  `Anzahl` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Bestellung_Id`,`Wein_Id`,`Zutat_Id`),
  KEY `Wein_Id` (`Wein_Id`,`Zutat_Id`),
  CONSTRAINT `Bestellposition_ibfk_1` FOREIGN KEY (`Bestellung_Id`) REFERENCES `Bestellung` (`Bestellung_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Bestellposition_ibfk_2` FOREIGN KEY (`Wein_Id`, `Zutat_Id`) REFERENCES `Gluehwein` (`Wein_Id`, `Zutat_Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bestellposition`
--

LOCK TABLES `Bestellposition` WRITE;
/*!40000 ALTER TABLE `Bestellposition` DISABLE KEYS */;
INSERT INTO `Bestellposition` VALUES (1,1,6,3),(1,2,5,1),(2,2,5,1),(2,3,1,2),(3,3,1,2),(4,1,6,1),(5,2,5,2),(6,3,1,1),(7,1,6,2),(8,2,5,4),(9,1,6,2),(10,1,6,4),(10,3,4,4),(11,1,6,3),(11,2,5,5),(11,3,5,2),(12,2,5,3),(12,3,4,3),(13,3,1,1),(14,2,5,3),(15,3,1,1),(16,1,6,1),(16,2,5,2),(17,1,6,2),(18,3,5,3),(19,3,4,4),(20,1,6,1),(20,2,5,5),(21,1,6,4),(22,2,5,3),(23,2,5,4),(23,3,4,1),(24,1,6,5),(25,2,5,2),(26,1,6,4),(26,3,5,3),(27,1,6,2),(27,2,5,4),(28,2,5,1),(28,3,4,1),(29,1,6,2),(29,3,5,4),(30,1,6,4),(31,3,1,2),(32,1,6,5),(33,2,5,3),(33,3,4,2),(34,1,6,2),(34,3,4,4),(35,3,5,1),(36,3,4,5);
/*!40000 ALTER TABLE `Bestellposition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Bestellung`
--

DROP TABLE IF EXISTS `Bestellung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Bestellung` (
  `Bestellung_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Bestellzeit` timestamp NULL DEFAULT NULL,
  `Kassierer_Id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Bestellung_Id`),
  KEY `Kassierer_Id` (`Kassierer_Id`),
  CONSTRAINT `Bestellung_ibfk_1` FOREIGN KEY (`Kassierer_Id`) REFERENCES `Kassierer` (`Kassierer_Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Bestellung`
--

LOCK TABLES `Bestellung` WRITE;
/*!40000 ALTER TABLE `Bestellung` DISABLE KEYS */;
INSERT INTO `Bestellung` VALUES (1,'2014-12-12 15:45:37',2),(2,'2014-12-12 16:45:37',2),(3,'2014-12-13 10:36:55',3),(4,'2014-12-13 10:45:04',1),(5,'2014-12-13 10:18:31',1),(6,'2014-12-13 18:36:55',3),(7,'2014-12-13 18:39:04',1),(8,'2014-12-13 18:40:13',1),(9,'2014-12-13 18:42:22',1),(10,'2014-12-13 18:59:31',2),(11,'2014-12-13 19:17:40',3),(12,'2014-12-13 20:39:49',1),(13,'2014-12-13 19:23:58',1),(14,'2014-12-13 19:24:07',3),(15,'2014-12-13 19:24:16',1),(16,'2014-12-13 19:24:25',1),(17,'2014-12-13 19:24:34',2),(18,'2014-12-13 19:24:43',3),(19,'2014-12-13 19:24:52',3),(20,'2014-12-13 19:25:01',3),(21,'2014-12-14 17:45:37',3),(22,'2014-12-14 17:47:51',2),(23,'2014-12-14 17:50:05',1),(24,'2014-12-14 17:52:19',2),(25,'2014-12-14 17:54:33',1),(26,'2014-12-14 17:56:47',1),(27,'2014-12-14 17:59:01',2),(28,'2014-12-14 18:01:15',2),(29,'2014-12-14 18:03:29',3),(30,'2014-12-14 18:05:43',1),(31,'2014-12-14 18:07:57',1),(32,'2014-12-14 18:10:11',2),(33,'2014-12-14 18:12:25',3),(34,'2014-12-14 18:14:39',3),(35,'2014-12-14 18:16:53',1),(36,'2014-12-14 18:19:07',2);
/*!40000 ALTER TABLE `Bestellung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Gluehwein`
--

DROP TABLE IF EXISTS `Gluehwein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Gluehwein` (
  `Wein_Id` int(10) unsigned NOT NULL,
  `Zutat_Id` int(10) unsigned NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Basispreis` decimal(3,2) NOT NULL,
  PRIMARY KEY (`Wein_Id`,`Zutat_Id`),
  KEY `Zutat_Id` (`Zutat_Id`),
  CONSTRAINT `Gluehwein_ibfk_1` FOREIGN KEY (`Wein_Id`) REFERENCES `Wein` (`Wein_Id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  CONSTRAINT `Gluehwein_ibfk_2` FOREIGN KEY (`Zutat_Id`) REFERENCES `Zutat` (`Zutat_Id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Gluehwein`
--

LOCK TABLES `Gluehwein` WRITE;
/*!40000 ALTER TABLE `Gluehwein` DISABLE KEYS */;
INSERT INTO `Gluehwein` VALUES (1,6,'Orangenweihnacht',3.00),(2,5,'Santas Darling',3.50),(3,1,'Weiße Weihnacht',4.00),(3,4,'Rudolphs Rachenputzer',4.00),(3,5,'Kristmas Kracher',4.00);
/*!40000 ALTER TABLE `Gluehwein` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Kassierer`
--

DROP TABLE IF EXISTS `Kassierer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Kassierer` (
  `Kassierer_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nachname` varchar(50) DEFAULT NULL,
  `Vorname` varchar(50) DEFAULT NULL,
  `Provision` decimal(1,0) DEFAULT NULL,
  PRIMARY KEY (`Kassierer_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Kassierer`
--

LOCK TABLES `Kassierer` WRITE;
/*!40000 ALTER TABLE `Kassierer` DISABLE KEYS */;
INSERT INTO `Kassierer` VALUES (1,'Janiesch','Christian',6),(2,'Bühler','Robin',5),(3,'Imgrund','Florian',3);
/*!40000 ALTER TABLE `Kassierer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wein`
--

DROP TABLE IF EXISTS `Wein`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Wein` (
  `Wein_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Prozente` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`Wein_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wein`
--

LOCK TABLES `Wein` WRITE;
/*!40000 ALTER TABLE `Wein` DISABLE KEYS */;
INSERT INTO `Wein` VALUES (1,'Lemberger',13.00),(2,'Trollinger',12.00),(3,'Chardonnay',12.50);
/*!40000 ALTER TABLE `Wein` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Zutat`
--

DROP TABLE IF EXISTS `Zutat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Zutat` (
  `Zutat_Id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  `Ranking` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`Zutat_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Zutat`
--

LOCK TABLES `Zutat` WRITE;
/*!40000 ALTER TABLE `Zutat` DISABLE KEYS */;
INSERT INTO `Zutat` VALUES (1,'Eierlikör',3),(2,'Nelke',4),(3,'Zimt',5),(4,'Brandy',4),(5,'Rum',4),(6,'Orange',4);
/*!40000 ALTER TABLE `Zutat` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-16 17:27:27
