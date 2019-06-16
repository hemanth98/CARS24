-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: cars24
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buyer` (
  `buyerid` bigint(12) NOT NULL,
  `sellerid` bigint(8) DEFAULT NULL,
  `bcarno` bigint(7) DEFAULT NULL,
  `buyername` varchar(20) NOT NULL,
  `phoneno` bigint(12) NOT NULL,
  `address` varchar(60) NOT NULL,
  PRIMARY KEY (`buyerid`),
  KEY `bcarno` (`bcarno`),
  KEY `sellerid` (`sellerid`),
  CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`bcarno`) REFERENCES `car` (`carno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `buyer_ibfk_2` FOREIGN KEY (`sellerid`) REFERENCES `seller` (`sellerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (911001,901001,900001,'Hemanth',8951443608,'Chennai'),(911002,901002,900002,'Vignesh',8851013608,'Pune'),(911003,901003,900003,'Pavan',9844013608,'Bangalore'),(911004,901004,900004,'Sri Ram',9884014608,'Goa'),(911005,901005,900005,'Manoj',9784015608,'Bangalore');
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `buyer_phone`
--

DROP TABLE IF EXISTS `buyer_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `buyer_phone` (
  `buyerid` bigint(8) DEFAULT NULL,
  `phno` bigint(12) DEFAULT NULL,
  KEY `buyerid` (`buyerid`),
  CONSTRAINT `buyer_phone_ibfk_1` FOREIGN KEY (`buyerid`) REFERENCES `buyer` (`buyerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer_phone`
--

LOCK TABLES `buyer_phone` WRITE;
/*!40000 ALTER TABLE `buyer_phone` DISABLE KEYS */;
INSERT INTO `buyer_phone` VALUES (911001,8051360408),(911002,8050390408),(911003,9050390408),(911004,8050650408),(911005,8050659508);
/*!40000 ALTER TABLE `buyer_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `car` (
  `carno` bigint(7) NOT NULL,
  `brand` varchar(20) NOT NULL,
  `model` varchar(20) NOT NULL,
  `year` date NOT NULL,
  `state` varchar(15) NOT NULL,
  `kms_driven` bigint(7) NOT NULL,
  PRIMARY KEY (`carno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (900001,'Honda','Amaze','2012-10-01','Karnataka',55000),(900002,'Honda','Brio','2014-11-09','Goa',45000),(900003,'Audi','A3','2016-12-09','Chennai',60000),(900004,'Volkwagen','Polo','2010-12-09','Chennai',65000),(900005,'Maruthi','Swift','2015-08-19','Pune',35000);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cost`
--

DROP TABLE IF EXISTS `cost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `cost` (
  `pcarno` bigint(7) DEFAULT NULL,
  `cost_price` bigint(10) NOT NULL,
  `tax` bigint(8) DEFAULT NULL,
  `profit` bigint(8) DEFAULT NULL,
  `selling_price` double GENERATED ALWAYS AS (((`cost_price` + `tax`) + `profit`)) VIRTUAL,
  KEY `pcarno` (`pcarno`),
  CONSTRAINT `cost_ibfk_1` FOREIGN KEY (`pcarno`) REFERENCES `car` (`carno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cost`
--

LOCK TABLES `cost` WRITE;
/*!40000 ALTER TABLE `cost` DISABLE KEYS */;
INSERT INTO `cost` (`pcarno`, `cost_price`, `tax`, `profit`) VALUES (900001,350000,20000,75000),(900002,150000,12000,100000),(900003,2300000,200000,400000),(900004,200000,15000,150000),(900005,150000,15000,200000);
/*!40000 ALTER TABLE `cost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller`
--

DROP TABLE IF EXISTS `seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seller` (
  `scarno` bigint(7) DEFAULT NULL,
  `sellerid` bigint(8) NOT NULL,
  `sellername` varchar(20) NOT NULL,
  `phoneno` bigint(12) NOT NULL,
  `address` varchar(60) NOT NULL,
  PRIMARY KEY (`sellerid`),
  KEY `scarno` (`scarno`),
  CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`scarno`) REFERENCES `car` (`carno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller`
--

LOCK TABLES `seller` WRITE;
/*!40000 ALTER TABLE `seller` DISABLE KEYS */;
INSERT INTO `seller` VALUES (900001,901001,'Harish',9448872605,'Bangalore'),(900002,901002,'Hrishikesh',9847872605,'Mangalore'),(900003,901003,'Sam',9857878805,'Madurai'),(900004,901004,'Ram',8747878805,'Chennai'),(900005,901005,'Deepak',8797008805,'Pune');
/*!40000 ALTER TABLE `seller` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_buyer`
--

DROP TABLE IF EXISTS `seller_buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seller_buyer` (
  `sellerid` bigint(8) DEFAULT NULL,
  `buyerid` bigint(12) DEFAULT NULL,
  KEY `fk1` (`sellerid`),
  KEY `fk2` (`buyerid`),
  CONSTRAINT `fk1` FOREIGN KEY (`sellerid`) REFERENCES `seller` (`sellerid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk2` FOREIGN KEY (`buyerid`) REFERENCES `buyer` (`buyerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_buyer`
--

LOCK TABLES `seller_buyer` WRITE;
/*!40000 ALTER TABLE `seller_buyer` DISABLE KEYS */;
INSERT INTO `seller_buyer` VALUES (NULL,NULL),(901001,911001),(901002,911002),(901003,911003),(901004,911004),(901005,911005);
/*!40000 ALTER TABLE `seller_buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_phone`
--

DROP TABLE IF EXISTS `seller_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `seller_phone` (
  `sellerid` bigint(8) DEFAULT NULL,
  `phno` bigint(12) DEFAULT NULL,
  KEY `sellerid` (`sellerid`),
  CONSTRAINT `seller_phone_ibfk_1` FOREIGN KEY (`sellerid`) REFERENCES `seller` (`sellerid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_phone`
--

LOCK TABLES `seller_phone` WRITE;
/*!40000 ALTER TABLE `seller_phone` DISABLE KEYS */;
INSERT INTO `seller_phone` VALUES (901001,8951364408),(901002,8851360408),(901003,9951364408),(901004,9881364408),(901005,8801364408);
/*!40000 ALTER TABLE `seller_phone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variant`
--

DROP TABLE IF EXISTS `variant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `variant` (
  `vcarno` bigint(7) DEFAULT NULL,
  `ac` varchar(5) NOT NULL DEFAULT 'yes',
  `abs` varchar(5) NOT NULL DEFAULT 'no',
  `airbag` varchar(5) NOT NULL DEFAULT 'no',
  `alloy_wheels` varchar(10) NOT NULL,
  KEY `vcarno` (`vcarno`),
  CONSTRAINT `variant_ibfk_1` FOREIGN KEY (`vcarno`) REFERENCES `car` (`carno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variant`
--

LOCK TABLES `variant` WRITE;
/*!40000 ALTER TABLE `variant` DISABLE KEYS */;
INSERT INTO `variant` VALUES (900001,'yes','no','no','yes'),(900002,'yes','yes','no','no'),(900003,'yes','yes','yes','yes'),(900004,'yes','yes','no','yes'),(900005,'yes','yes','no','no');
/*!40000 ALTER TABLE `variant` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-04 13:51:18
