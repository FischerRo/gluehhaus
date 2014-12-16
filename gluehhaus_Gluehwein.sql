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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-12-16 15:32:28
