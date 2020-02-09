-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: modelatge-BBDD
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `idAddress` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(45) DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  `floor` int(11) DEFAULT NULL,
  `apartment` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zipCode` int(11) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idAddress`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
INSERT INTO `Address` VALUES (1,'Alfonso XIII',22,1,'A','Barcelona',8045,'España'),(2,'Ramón Berenguer',7,3,'2','Barcelona',8041,'España'),(3,'Padilla',54,0,'C','Barcelona',8041,'España'),(4,'Lepant',117,2,'D','Barcelona',8041,'España'),(5,'Córcega',223,1,'B','Barcelona',8041,'España'),(6,'Sardenya',15,1,'3','Barcelona',8022,'España');
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Brand`
--

DROP TABLE IF EXISTS `Brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Brand` (
  `idBrand` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `Supplier_idSupplier` int(11) DEFAULT NULL,
  PRIMARY KEY (`idBrand`),
  KEY `fk_Brand_Supplier1_idx` (`Supplier_idSupplier`),
  CONSTRAINT `fk_Brand_Supplier1` FOREIGN KEY (`Supplier_idSupplier`) REFERENCES `Supplier` (`idSupplier`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Brand`
--

LOCK TABLES `Brand` WRITE;
/*!40000 ALTER TABLE `Brand` DISABLE KEYS */;
INSERT INTO `Brand` VALUES (1,'Tous',1),(2,'Sting',2),(3,'Lozza',1),(4,'Ray Ban',2),(5,'Fila',2),(6,'Vogue',2),(7,'Christian Dior',2),(8,'Eschenbach',3),(9,'Emporio Armani',NULL),(10,'Police',NULL),(11,'Silhouette',NULL);
/*!40000 ALTER TABLE `Brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customer` (
  `idCustomer` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `Customer_idCustomer` int(11) DEFAULT NULL,
  `Address_idAddress` int(11) NOT NULL,
  PRIMARY KEY (`idCustomer`),
  KEY `fk_Customer_Customer1_idx` (`Customer_idCustomer`),
  KEY `fk_Customer_Address1_idx` (`Address_idAddress`),
  CONSTRAINT `fk_Customer_Address1` FOREIGN KEY (`Address_idAddress`) REFERENCES `Address` (`idAddress`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Customer_Customer1` FOREIGN KEY (`Customer_idCustomer`) REFERENCES `Customer` (`idCustomer`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES (1,'Carlos Vega','632584758','carlos@vega.com','2020-02-01 15:30:00',NULL,4),(2,'Rossy Riccio','936874521','rossy@riccio.es','2020-02-03 00:00:00',1,5),(3,'David Sanchez','635254125','david@sanchez.com','2020-02-08 00:00:00',1,6);
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employee` (
  `idEmployee` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idEmployee`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (1,'Daniel'),(2,'Alejandro'),(3,'Laura'),(4,'Marc'),(5,'Maria');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Glasses`
--

DROP TABLE IF EXISTS `Glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Glasses` (
  `idGlasses` int(11) NOT NULL AUTO_INCREMENT,
  `graduationRE` varchar(45) DEFAULT NULL,
  `graduationLE` varchar(45) DEFAULT NULL,
  `frame` enum('flotant','pasta','metàl·lica') DEFAULT NULL,
  `frameColor` varchar(45) DEFAULT NULL,
  `glassesColor` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `Brand_idBrand` int(11) NOT NULL,
  PRIMARY KEY (`idGlasses`),
  KEY `fk_Glasses_Brand1_idx` (`Brand_idBrand`),
  CONSTRAINT `fk_Glasses_Brand1` FOREIGN KEY (`Brand_idBrand`) REFERENCES `Brand` (`idBrand`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Glasses`
--

LOCK TABLES `Glasses` WRITE;
/*!40000 ALTER TABLE `Glasses` DISABLE KEYS */;
INSERT INTO `Glasses` VALUES (1,'-3.25 (-0.75) 110º','-2.25 (-1.25) 90º','pasta','negre','transparent',150,1),(2,'+1.25','+2.00','flotant','blanc','transparent',199.99,2),(3,'-2.75','-1.25','metàl·lica','marró','blau',225,4),(4,'-4.00 (+0.75) 20º','-3.50 (+1.25) 180º','pasta','verd','verd',175.45,6),(5,'+2.00 (-0.5) 80º Ad +2.00','+1.50 (-1.00) 45º Ad +2.25','flotant','vermell','vermell',89.99,7);
/*!40000 ALTER TABLE `Glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Glasses_has_Invoice`
--

DROP TABLE IF EXISTS `Glasses_has_Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Glasses_has_Invoice` (
  `Glasses_idGlasses` int(11) NOT NULL,
  `Invoice_idInvoice` int(11) NOT NULL,
  PRIMARY KEY (`Glasses_idGlasses`,`Invoice_idInvoice`),
  KEY `fk_Glasses_has_Invoice_Invoice1_idx` (`Invoice_idInvoice`),
  KEY `fk_Glasses_has_Invoice_Glasses1_idx` (`Glasses_idGlasses`),
  CONSTRAINT `fk_Glasses_has_Invoice_Glasses1` FOREIGN KEY (`Glasses_idGlasses`) REFERENCES `Glasses` (`idGlasses`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Glasses_has_Invoice_Invoice1` FOREIGN KEY (`Invoice_idInvoice`) REFERENCES `Invoice` (`idInvoice`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Glasses_has_Invoice`
--

LOCK TABLES `Glasses_has_Invoice` WRITE;
/*!40000 ALTER TABLE `Glasses_has_Invoice` DISABLE KEYS */;
INSERT INTO `Glasses_has_Invoice` VALUES (1,1),(2,1),(3,1),(1,2),(4,2),(2,3),(3,3),(5,3);
/*!40000 ALTER TABLE `Glasses_has_Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Invoice`
--

DROP TABLE IF EXISTS `Invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Invoice` (
  `idInvoice` int(11) NOT NULL AUTO_INCREMENT,
  `Employee_idEmployee` int(11) NOT NULL,
  `Customer_idCustomer` int(11) NOT NULL,
  PRIMARY KEY (`idInvoice`),
  KEY `fk_Invoice_Employee1_idx` (`Employee_idEmployee`),
  KEY `fk_Invoice_Customer1_idx` (`Customer_idCustomer`),
  CONSTRAINT `fk_Invoice_Customer1` FOREIGN KEY (`Customer_idCustomer`) REFERENCES `Customer` (`idCustomer`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_Invoice_Employee1` FOREIGN KEY (`Employee_idEmployee`) REFERENCES `Employee` (`idEmployee`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Invoice`
--

LOCK TABLES `Invoice` WRITE;
/*!40000 ALTER TABLE `Invoice` DISABLE KEYS */;
INSERT INTO `Invoice` VALUES (1,1,1),(2,1,2),(3,2,3);
/*!40000 ALTER TABLE `Invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Supplier`
--

DROP TABLE IF EXISTS `Supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Supplier` (
  `idSupplier` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `faxNumber` int(11) DEFAULT NULL,
  `vatNumber` varchar(45) DEFAULT NULL,
  `Address_idAddress` int(11) NOT NULL,
  PRIMARY KEY (`idSupplier`),
  KEY `fk_Supplier_Address1_idx` (`Address_idAddress`),
  CONSTRAINT `fk_Supplier_Address1` FOREIGN KEY (`Address_idAddress`) REFERENCES `Address` (`idAddress`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Supplier`
--

LOCK TABLES `Supplier` WRITE;
/*!40000 ALTER TABLE `Supplier` DISABLE KEYS */;
INSERT INTO `Supplier` VALUES (1,'Lentes Superiores S.L.','933815764',933918496,'B76223578',1),(2,'Gafas Moreno S.A.','933987654',933216547,'A65478525',2),(3,'Barcelona Visión S.L.','936549877',931564897,'B98456324',3);
/*!40000 ALTER TABLE `Supplier` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-09 13:20:09
