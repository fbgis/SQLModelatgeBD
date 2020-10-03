-- MySQL dump 10.13  Distrib 5.7.23, for macos10.13 (x86_64)
--
-- Host: localhost    Database: ITAcademy_Bloc comú_M2SQL_Modelatge BBDD
-- ------------------------------------------------------
-- Server version	5.7.23

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
-- Current Database: `ITAcademy_Bloc comú_M2SQL_Modelatge BBDD`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `ITAcademy_Bloc comú_M2SQL_Modelatge BBDD` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `ITAcademy_Bloc comú_M2SQL_Modelatge BBDD`;

--
-- Table structure for table `Brand`
--

DROP TABLE IF EXISTS `Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Brand` (
  `id_brand` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `Provider_nif` varchar(9) NOT NULL,
  PRIMARY KEY (`id_brand`),
  KEY `fk_Brand_Provider1_idx` (`Provider_nif`),
  CONSTRAINT `fk_Brand_Provider1` FOREIGN KEY (`Provider_nif`) REFERENCES `Provider` (`nif`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brand`
--

LOCK TABLES `Brand` WRITE;
/*!40000 ALTER TABLE `Brand` DISABLE KEYS */;
INSERT INTO `Brand` VALUES (1,'FashioA','11111111A'),(2,'FashioB','22222222B'),(3,'FashioBB','22222222B');
/*!40000 ALTER TABLE `Brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `id_customer` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `adress` varchar(200) NOT NULL,
  `phone` int(11) NOT NULL,
  `email` varchar(45) NOT NULL,
  `date` date NOT NULL,
  `Customer_id_customer` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_customer`),
  KEY `fk_Customer_Customer1_idx` (`Customer_id_customer`),
  CONSTRAINT `fk_Customer_Customer1` FOREIGN KEY (`Customer_id_customer`) REFERENCES `Customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Joan A','Carrer de la Baixada',444444444,'joan@mail.com','2020-01-01',NULL),(2,'Pep B','Carrer de la Pujada',555555555,'pep@mail.com','2020-01-01',1);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `id_employee` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_employee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Jordi C'),(2,'Pere D');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Glasses`
--

DROP TABLE IF EXISTS `Glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Glasses` (
  `id_glasses` int(11) NOT NULL,
  `Brand_id_brand` int(11) NOT NULL,
  `graduation_left` decimal(4,2) NOT NULL,
  `graduation_right` decimal(4,2) NOT NULL,
  `frame_type` enum('floating','paste','metal') NOT NULL,
  `frame_color` varchar(45) NOT NULL,
  `glass_color_left` varchar(45) NOT NULL,
  `glass_color_right` varchar(45) NOT NULL,
  `price` decimal(7,2) DEFAULT NULL,
  PRIMARY KEY (`id_glasses`),
  KEY `fk_Glasses_Brand1_idx` (`Brand_id_brand`),
  CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`Brand_id_brand`) REFERENCES `Brand` (`id_brand`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Glasses`
--

LOCK TABLES `Glasses` WRITE;
/*!40000 ALTER TABLE `Glasses` DISABLE KEYS */;
INSERT INTO `Glasses` VALUES (1,1,1.10,0.70,'metal','Blue','Black','Black',99.99),(2,2,5.50,5.50,'paste','Black','White','White',199.99);
/*!40000 ALTER TABLE `Glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Provider`
--

DROP TABLE IF EXISTS `Provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Provider` (
  `nif` varchar(9) NOT NULL,
  `name` varchar(45) NOT NULL,
  `adress_street` varchar(45) NOT NULL,
  `adress_number` int(11) NOT NULL,
  `adress_floor` int(11) DEFAULT NULL,
  `adress_door` varchar(2) DEFAULT NULL,
  `adress_city` varchar(45) NOT NULL,
  `adress_zip` varchar(5) NOT NULL,
  `adress_country` varchar(45) NOT NULL,
  `phone` int(11) NOT NULL,
  `fax` int(11) DEFAULT NULL,
  PRIMARY KEY (`nif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Provider`
--

LOCK TABLES `Provider` WRITE;
/*!40000 ALTER TABLE `Provider` DISABLE KEYS */;
INSERT INTO `Provider` VALUES ('11111111A','UlleresA','Carrer A',1,1,'1','Barcelona','8015','Catalunya',111111111,111111112),('22222222B','UlleresB','Carrer B',2,2,'2','Barcelona','8022','Catalunya',222222222,222225223),('33333333C','Ulleresc','Carrer C',3,3,'3','Barcelona','8033','Catalunya',333333333,333333334);
/*!40000 ALTER TABLE `Provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sale`
--

DROP TABLE IF EXISTS `Sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sale` (
  `id_sale` int(11) NOT NULL,
  `date` date NOT NULL,
  `Glasses_id_glasses` int(11) NOT NULL,
  `Customer_id_customer` int(11) NOT NULL,
  `Employee_id_employee` int(11) NOT NULL,
  PRIMARY KEY (`id_sale`),
  KEY `fk_Sale_Glasses1_idx` (`Glasses_id_glasses`),
  KEY `fk_Sale_Customer1_idx` (`Customer_id_customer`),
  KEY `fk_Sale_Employee1_idx` (`Employee_id_employee`),
  CONSTRAINT `fk_Sale_Customer1` FOREIGN KEY (`Customer_id_customer`) REFERENCES `Customer` (`id_customer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_Employee1` FOREIGN KEY (`Employee_id_employee`) REFERENCES `Employee` (`id_employee`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Sale_Glasses1` FOREIGN KEY (`Glasses_id_glasses`) REFERENCES `Glasses` (`id_glasses`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sale`
--

LOCK TABLES `Sale` WRITE;
/*!40000 ALTER TABLE `Sale` DISABLE KEYS */;
INSERT INTO `Sale` VALUES (1,'2020-01-01',2,2,1);
/*!40000 ALTER TABLE `Sale` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-03 14:31:16
