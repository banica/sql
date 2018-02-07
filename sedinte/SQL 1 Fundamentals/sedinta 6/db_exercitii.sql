create database testsedinta6;

use testsedinta6;


-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: bit_acad_sedinta_6
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.04.1

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
-- Table structure for table `angajat_proiect`
--

DROP TABLE IF EXISTS `angajat_proiect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `angajat_proiect` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_angajat` int(11) DEFAULT NULL,
  `id_proiect` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_angajat_idx` (`id_angajat`),
  KEY `fk_proiect_idx` (`id_proiect`),
  CONSTRAINT `fk_angajat` FOREIGN KEY (`id_angajat`) REFERENCES `angajati` (`id_angajat`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_proiect` FOREIGN KEY (`id_proiect`) REFERENCES `proiecte` (`id_proiect`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angajat_proiect`
--

LOCK TABLES `angajat_proiect` WRITE;
/*!40000 ALTER TABLE `angajat_proiect` DISABLE KEYS */;
INSERT INTO `angajat_proiect` VALUES (1,1,1),(2,2,5),(3,3,1),(4,6,1),(5,8,5),(6,12,5),(7,2,1),(8,12,1),(9,7,2),(10,10,2),(11,7,6),(12,9,3),(13,13,4),(14,14,4),(15,15,4),(16,14,7);
/*!40000 ALTER TABLE `angajat_proiect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `angajati`
--

DROP TABLE IF EXISTS `angajati`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `angajati` (
  `id_angajat` int(5) NOT NULL AUTO_INCREMENT,
  `nume` varchar(100) DEFAULT NULL,
  `prenume` varchar(100) DEFAULT NULL,
  `data_nasterii` date DEFAULT NULL,
  `data_angajarii` date DEFAULT NULL,
  `salariu` double(7,2) DEFAULT NULL,
  `manager` int(5) DEFAULT NULL,
  `id_departament` int(5) DEFAULT NULL,
  PRIMARY KEY (`id_angajat`),
  KEY `id_departament` (`id_departament`),
  CONSTRAINT `angajati_ibfk_1` FOREIGN KEY (`id_departament`) REFERENCES `departamente` (`id_departament`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `angajati`
--

LOCK TABLES `angajati` WRITE;
/*!40000 ALTER TABLE `angajati` DISABLE KEYS */;
INSERT INTO `angajati` VALUES (1,'Ionescu','Ioana','1984-10-20','2013-05-01',1500.00,2,1),(2,'Popescu','Maria','1981-07-05','2012-11-10',2900.00,7,1),(3,'Georgescu','Adrian','1975-02-11','2011-08-14',2300.00,2,1),(4,'Vlad','Adrian','1980-01-20','2015-02-01',1500.00,2,3),(5,'Ionescu','Alexandru','1968-03-02','2013-09-01',1800.00,4,3),(6,'Popescu','Ioana','1984-10-01','2015-05-18',1200.00,2,1),(7,'Stefan','Marian','1970-06-11','2010-08-23',3500.00,7,2),(8,'Ionescu','Ion','1971-11-22','2013-06-19',1500.00,2,1),(9,'Cristea','Andreea','1989-01-20','2015-06-01',1200.00,4,3),(10,'Gheorgiu','Alin','1978-08-14','2010-11-01',2300.00,7,2),(11,'Teodorescu','Maria','1980-10-20','2013-05-24',1500.00,2,1),(12,'Ionescu','Alina','1989-10-22','2015-06-01',2100.00,2,1),(13,'Popescu','Alina','1989-01-01','2015-06-01',1850.00,4,4),(14,'Stefan','Cristian','1978-01-14','2010-03-01',1450.00,4,4),(15,'Teodorescu','Teodor','1986-10-20','2014-08-01',1500.00,4,4);
/*!40000 ALTER TABLE `angajati` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamente`
--

DROP TABLE IF EXISTS `departamente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamente` (
  `id_departament` int(5) NOT NULL AUTO_INCREMENT,
  `denumire` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_departament`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamente`
--

LOCK TABLES `departamente` WRITE;
/*!40000 ALTER TABLE `departamente` DISABLE KEYS */;
INSERT INTO `departamente` VALUES (1,'Financiar'),(2,'Juridic'),(3,'IT'),(4,'Logistica');
/*!40000 ALTER TABLE `departamente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proiecte`
--

DROP TABLE IF EXISTS `proiecte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proiecte` (
  `id_proiect` int(11) NOT NULL AUTO_INCREMENT COMMENT ' ',
  `nume` varchar(45) DEFAULT NULL,
  `buget` float DEFAULT NULL,
  `data_inceput` date DEFAULT NULL,
  `data_sfarsit` date DEFAULT NULL,
  `project_manager` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_proiect`),
  KEY `fk_pm_idx` (`project_manager`),
  CONSTRAINT `fk_pm` FOREIGN KEY (`project_manager`) REFERENCES `angajati` (`id_angajat`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proiecte`
--

LOCK TABLES `proiecte` WRITE;
/*!40000 ALTER TABLE `proiecte` DISABLE KEYS */;
INSERT INTO `proiecte` VALUES (1,'Analiza financiara',22000,'2016-02-10','2016-12-31',2),(2,'Selectie dosare',10000,'2016-02-21','2016-11-02',7),(3,'Conectare Wi-Fi',20000,'2016-10-01','2016-11-10',5),(4,'Planificare operatii',11000,'2016-09-11','2017-01-01',13),(5,'Calcul indemnizatii',15000,'2016-09-12','2016-12-01',2),(6,'Intampinari procese',10000,'2016-01-01','2016-11-01',7),(7,'Repartizare masini',8000,'2016-09-22','2016-11-01',13);
/*!40000 ALTER TABLE `proiecte` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-10-26 16:33:08
