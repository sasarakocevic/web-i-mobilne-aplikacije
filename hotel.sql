CREATE DATABASE  IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `hotel`;
-- MySQL dump 10.13  Distrib 8.0.16, for macos10.14 (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	5.7.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `drzava`
--

DROP TABLE IF EXISTS `drzava`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `drzava` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drzava`
--

LOCK TABLES `drzava` WRITE;
/*!40000 ALTER TABLE `drzava` DISABLE KEYS */;
INSERT INTO `drzava` VALUES (1,'Crna Gora'),(2,'Bosna i  Hercegovina'),(3,'Srbija'),(4,'Albanija'),(5,'Hrvatsla'),(6,'Slovenija');
/*!40000 ALTER TABLE `drzava` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gost`
--

DROP TABLE IF EXISTS `gost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gost` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ime` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `prezime` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  `email` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  `drzava_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `gost_drzava_fk_idx` (`drzava_id`),
  CONSTRAINT `gost_drzava_fk` FOREIGN KEY (`drzava_id`) REFERENCES `drzava` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gost`
--

LOCK TABLES `gost` WRITE;
/*!40000 ALTER TABLE `gost` DISABLE KEYS */;
/*!40000 ALTER TABLE `gost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gost_rezervacija`
--

DROP TABLE IF EXISTS `gost_rezervacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `gost_rezervacija` (
  `id` int(11) NOT NULL,
  `gost_id` int(10) unsigned NOT NULL,
  `rezervacija_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `gost_rezervacija_unq` (`gost_id`,`rezervacija_id`),
  KEY `gost_rezervacija_gost_fk_idx` (`gost_id`),
  KEY `gost_rezervacija_rezervacija_fk_idx` (`rezervacija_id`),
  CONSTRAINT `gost_rezervacija_gost_fk` FOREIGN KEY (`gost_id`) REFERENCES `gost` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `gost_rezervacija_rezervacija_fk` FOREIGN KEY (`rezervacija_id`) REFERENCES `rezervacija` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gost_rezervacija`
--

LOCK TABLES `gost_rezervacija` WRITE;
/*!40000 ALTER TABLE `gost_rezervacija` DISABLE KEYS */;
/*!40000 ALTER TABLE `gost_rezervacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `popust`
--

DROP TABLE IF EXISTS `popust`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `popust` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `cijena` decimal(5,2) DEFAULT NULL,
  `datum` date DEFAULT NULL,
  `soba_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `popust_soba_fk_idx` (`soba_id`),
  CONSTRAINT `popust_soba_fk` FOREIGN KEY (`soba_id`) REFERENCES `soba` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `popust`
--

LOCK TABLES `popust` WRITE;
/*!40000 ALTER TABLE `popust` DISABLE KEYS */;
/*!40000 ALTER TABLE `popust` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rezervacija`
--

DROP TABLE IF EXISTS `rezervacija`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `rezervacija` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `datum_od` date NOT NULL,
  `datum_do` date NOT NULL,
  `soba_id` int(10) unsigned NOT NULL,
  `kontakt` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rezervacija_soba_fk_idx` (`soba_id`),
  CONSTRAINT `rezervacija_soba_fk` FOREIGN KEY (`soba_id`) REFERENCES `soba` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rezervacija`
--

LOCK TABLES `rezervacija` WRITE;
/*!40000 ALTER TABLE `rezervacija` DISABLE KEYS */;
/*!40000 ALTER TABLE `rezervacija` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slika`
--

DROP TABLE IF EXISTS `slika`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `slika` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `putanja` varchar(255) COLLATE utf8_bin NOT NULL,
  `soba_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `slika_soba_fk_idx` (`soba_id`),
  CONSTRAINT `slika_soba_fk` FOREIGN KEY (`soba_id`) REFERENCES `soba` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slika`
--

LOCK TABLES `slika` WRITE;
/*!40000 ALTER TABLE `slika` DISABLE KEYS */;
/*!40000 ALTER TABLE `slika` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soba`
--

DROP TABLE IF EXISTS `soba`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `soba` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `broj` varchar(45) COLLATE utf8_bin NOT NULL,
  `tip_sobe_id` int(10) unsigned NOT NULL,
  `sprat_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sprat_fk_idx` (`sprat_id`),
  KEY `tip_sobe_fk_idx` (`tip_sobe_id`),
  CONSTRAINT `sprat_fk` FOREIGN KEY (`sprat_id`) REFERENCES `sprat` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tip_sobe_fk` FOREIGN KEY (`tip_sobe_id`) REFERENCES `tip_sobe` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soba`
--

LOCK TABLES `soba` WRITE;
/*!40000 ALTER TABLE `soba` DISABLE KEYS */;
INSERT INTO `soba` VALUES (1,'101',1,1);
/*!40000 ALTER TABLE `soba` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sprat`
--

DROP TABLE IF EXISTS `sprat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sprat` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sprat`
--

LOCK TABLES `sprat` WRITE;
/*!40000 ALTER TABLE `sprat` DISABLE KEYS */;
INSERT INTO `sprat` VALUES (1,'I sprat'),(2,'II sprat'),(3,'III sprat'),(4,'IV sprat');
/*!40000 ALTER TABLE `sprat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tip_sobe`
--

DROP TABLE IF EXISTS `tip_sobe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tip_sobe` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `naziv` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `cijena` double(5,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tip_sobe`
--

LOCK TABLES `tip_sobe` WRITE;
/*!40000 ALTER TABLE `tip_sobe` DISABLE KEYS */;
INSERT INTO `tip_sobe` VALUES (1,'Dvokrevetna soba',35.00),(2,'Trokrevetna soba',50.00);
/*!40000 ALTER TABLE `tip_sobe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hotel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-24 10:43:47
