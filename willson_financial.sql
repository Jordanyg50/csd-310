-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: willson_financial
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `AccountID` int NOT NULL AUTO_INCREMENT,
  `ClientID` int NOT NULL,
  `Balance` decimal(15,2) NOT NULL,
  `AccountType` varchar(50) NOT NULL,
  `OpenDate` date NOT NULL,
  PRIMARY KEY (`AccountID`),
  KEY `ClientID` (`ClientID`),
  CONSTRAINT `account_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billing`
--

DROP TABLE IF EXISTS `billing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing` (
  `BillingID` int NOT NULL AUTO_INCREMENT,
  `ClientID` int NOT NULL,
  `Amount` decimal(15,2) NOT NULL,
  `BillingDate` date NOT NULL,
  `BillingPeriod` varchar(10) NOT NULL,
  PRIMARY KEY (`BillingID`),
  KEY `ClientID` (`ClientID`),
  CONSTRAINT `billing_ibfk_1` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing`
--

LOCK TABLES `billing` WRITE;
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `ClientID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Address` varchar(80) NOT NULL,
  `PhoneNumber` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `DateAdded` date NOT NULL,
  `TotalAccounts` int NOT NULL,
  PRIMARY KEY (`ClientID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `complianceactivity`
--

DROP TABLE IF EXISTS `complianceactivity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `complianceactivity` (
  `ComplianceActivityID` int NOT NULL AUTO_INCREMENT,
  `ComplianceManagerID` int NOT NULL,
  `ActivityDate` date NOT NULL,
  `ActivityType` varchar(255) NOT NULL,
  `Description` varchar(2000) NOT NULL,
  PRIMARY KEY (`ComplianceActivityID`),
  KEY `fk_ComplianceManager` (`ComplianceManagerID`),
  CONSTRAINT `fk_ComplianceManager` FOREIGN KEY (`ComplianceManagerID`) REFERENCES `compliancemanager` (`ComplianceManagerID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `complianceactivity`
--

LOCK TABLES `complianceactivity` WRITE;
/*!40000 ALTER TABLE `complianceactivity` DISABLE KEYS */;
/*!40000 ALTER TABLE `complianceactivity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compliancemanager`
--

DROP TABLE IF EXISTS `compliancemanager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compliancemanager` (
  `ComplianceManagerID` int NOT NULL,
  `ComplianceDetails` varchar(2000) NOT NULL,
  PRIMARY KEY (`ComplianceManagerID`),
  CONSTRAINT `compliancemanager_ibfk_1` FOREIGN KEY (`ComplianceManagerID`) REFERENCES `employee` (`EmployeeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compliancemanager`
--

LOCK TABLES `compliancemanager` WRITE;
/*!40000 ALTER TABLE `compliancemanager` DISABLE KEYS */;
/*!40000 ALTER TABLE `compliancemanager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `EmployeeID` int NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Position` varchar(50) NOT NULL,
  `HireDate` date NOT NULL,
  PRIMARY KEY (`EmployeeID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employeeclient`
--

DROP TABLE IF EXISTS `employeeclient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employeeclient` (
  `EmployeeID` int NOT NULL,
  `ClientID` int NOT NULL,
  `Role` varchar(50) NOT NULL,
  KEY `EmployeeID` (`EmployeeID`),
  KEY `ClientID` (`ClientID`),
  CONSTRAINT `employeeclient_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`EmployeeID`),
  CONSTRAINT `employeeclient_ibfk_2` FOREIGN KEY (`ClientID`) REFERENCES `client` (`ClientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employeeclient`
--

LOCK TABLES `employeeclient` WRITE;
/*!40000 ALTER TABLE `employeeclient` DISABLE KEYS */;
/*!40000 ALTER TABLE `employeeclient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transaction`
--

DROP TABLE IF EXISTS `transaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction` (
  `TransactionID` int NOT NULL AUTO_INCREMENT,
  `AccountID` int NOT NULL,
  `TransactionDate` date NOT NULL,
  `Amount` decimal(15,2) NOT NULL,
  `TransactionType` varchar(50) NOT NULL,
  PRIMARY KEY (`TransactionID`),
  KEY `fk_Account` (`AccountID`),
  CONSTRAINT `fk_Account` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction`
--

LOCK TABLES `transaction` WRITE;
/*!40000 ALTER TABLE `transaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `transaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-17 22:15:46
