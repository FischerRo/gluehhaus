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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-16 15:32:29
