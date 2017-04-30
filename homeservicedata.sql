CREATE DATABASE  IF NOT EXISTS `athomeservices` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `athomeservices`;
-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: athomeservices
-- ------------------------------------------------------
-- Server version	5.6.26-enterprise-commercial-advanced-log

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
-- Table structure for table `category_menu`
--

DROP TABLE IF EXISTS `category_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_menu` (
  `menu_id` int(11) NOT NULL,
  `menu_name` varchar(45) NOT NULL,
  `menu_status` varchar(1) NOT NULL,
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_menu`
--

LOCK TABLES `category_menu` WRITE;
/*!40000 ALTER TABLE `category_menu` DISABLE KEYS */;
INSERT INTO `category_menu` VALUES (1,'Business','Y'),(2,'Food','Y'),(3,'Health','Y'),(4,'Home','Y'),(5,'Maintenance','Y'),(6,'Others','Y'),(7,'Parties','Y');
/*!40000 ALTER TABLE `category_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `cust_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `f_name` varchar(45) DEFAULT NULL,
  `l_name` varchar(45) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `fathers_name` varchar(45) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `first_address` varchar(45) DEFAULT NULL,
  `second_address` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `dist` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `aadhar_number` int(11) DEFAULT NULL,
  `work` varchar(45) DEFAULT NULL,
  `facebook` varchar(45) DEFAULT NULL,
  `twitter` varchar(45) DEFAULT NULL,
  `linkedin` varchar(45) DEFAULT NULL,
  `feedback` text,
  `status` varchar(45) DEFAULT NULL,
  `profile_pic` varchar(40) DEFAULT NULL,
  `secretkey` varchar(45) DEFAULT NULL,
  `last_active_time` datetime DEFAULT NULL,
  `orderId` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cust_id`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'inayat786','111111','inayat','hussain','M','1994-09-14','zakir hussain','inayat.asdf@gmail.com','Monu Hostel','Near Shiv Mandir,Duhai','muradnagar','Ghaziabad','Uttar Pradesh','india',201026,'btech',123456789,'student','facebook.com/inayat.asdf','twitter.com/inyat.asdf','linkedin.com/inayat.asdf','wow very good deal','Active','inayat.jpg','78945','2016-08-24 14:34:17',NULL),(2,NULL,'4444444444','mmmm','mmmmmmmmmm',NULL,NULL,NULL,'isihihis.@',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(3,NULL,'123456','amit','chaudharty',NULL,NULL,NULL,'amit@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-20 08:54:19',NULL),(5,NULL,'123456','rahul','rahul',NULL,NULL,NULL,'rahul@mail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-20 08:59:46',NULL),(7,NULL,'4444444444','mmmm','mmmmmmmmmm',NULL,NULL,NULL,'isihihis.@g',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-20 09:20:28',NULL),(9,NULL,'123456','mmm','k,,',NULL,NULL,NULL,'ii@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-20 09:34:33',NULL),(10,NULL,'111111','janu','jaan',NULL,NULL,NULL,'janu@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2016-08-24 16:26:18',NULL),(11,NULL,'111111','545454','545454',NULL,NULL,NULL,'inayat.c@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'active',NULL,NULL,'2016-08-24 16:32:12',NULL),(12,NULL,'222222','omomo','omomomo',NULL,NULL,NULL,'om@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deactive',NULL,NULL,'2016-08-24 16:36:25',NULL),(13,NULL,'123456','pankaj','singh',NULL,NULL,NULL,'erpks143@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deactive',NULL,NULL,'2016-08-27 18:54:00',NULL);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderid` int(11) NOT NULL,
  `orderdateandtime` datetime DEFAULT NULL,
  `orderitemid` varchar(45) DEFAULT NULL,
  `ordercost` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`orderid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serviceprovider`
--

DROP TABLE IF EXISTS `serviceprovider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `serviceprovider` (
  `sp_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `f_name` varchar(45) DEFAULT NULL,
  `l_name` varchar(45) DEFAULT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `fathers_name` varchar(45) DEFAULT NULL,
  `email_id` varchar(45) DEFAULT NULL,
  `first_address` varchar(45) DEFAULT NULL,
  `second_address` varchar(45) DEFAULT NULL,
  `district` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `pincode` int(11) DEFAULT NULL,
  `qualification` varchar(45) DEFAULT NULL,
  `aadhar_number` varchar(45) DEFAULT NULL,
  `work` varchar(45) DEFAULT NULL,
  `facebook` varchar(45) DEFAULT NULL,
  `twitter` varchar(45) DEFAULT NULL,
  `linkedin` varchar(45) DEFAULT NULL,
  `rating` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `profile_pic` varchar(40) DEFAULT NULL,
  `secretkey` varchar(10) DEFAULT NULL,
  `pan_number` varchar(45) DEFAULT NULL,
  `fee_to_work` varchar(45) DEFAULT NULL,
  `available_from` varchar(20) DEFAULT NULL,
  `available_to` varchar(20) DEFAULT NULL,
  `availability_status` varchar(20) DEFAULT NULL,
  `feedback` varchar(45) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `last_active_time` datetime DEFAULT NULL,
  `about_me` text,
  `authentication` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sp_id`),
  UNIQUE KEY `email_id_UNIQUE` (`email_id`)
) ENGINE=InnoDB AUTO_INCREMENT=123521 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serviceprovider`
--

LOCK TABLES `serviceprovider` WRITE;
/*!40000 ALTER TABLE `serviceprovider` DISABLE KEYS */;
INSERT INTO `serviceprovider` VALUES (123456,'golu','123456','piyush','pal','M','1994-08-02','papa','piyush@gmail.com','delhi merrut','duhai','ghaziabad','bihar','india',848125,'Btech','4444444444','student','facebook.com/piyush','twitter.com/golu','linkedin.com/golu','5','active','golu.jpg','12345','','500','2016-02-05','2016-02-05','Available','very good experience','others','muradnagar','2016-08-24 14:36:05',NULL,NULL),(123511,'mkmkm','111111','raju','roy','','1994-08-02','kmkmk','raju@gmail.com','njnjn','knjn','jnjn','kmkmk','mkm',848125,'kmkm','kmkm','kkm','kmkm','kmkm','mkm','5','Active','','kmkm','kkm','','2016-02-05','2016-02-05','Available','kmkmk','MotorMechanic','kmkmk','2016-08-24 16:00:45','llm',NULL),(123514,NULL,'111111','shally','shalu',NULL,NULL,NULL,'shally@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'iini',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Doctor',NULL,'2016-08-24 16:12:09',NULL,NULL),(123515,NULL,'111111','lovely','sigh',NULL,NULL,NULL,'lovly@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Photographer',NULL,'2016-08-24 16:25:13',NULL,NULL),(123516,NULL,'111111','kmkmkxvk','l,lklk',NULL,NULL,NULL,'p@g.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'PersonalAssistent',NULL,'2016-08-24 16:46:56',NULL,NULL),(123517,NULL,'llllll','NISHA','KHAN',NULL,NULL,NULL,'inayat@gmail.com',NULL,NULL,'gzb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'5','Deactive',NULL,'44444',NULL,NULL,NULL,NULL,'Available',NULL,'dinner',NULL,'2016-08-24 16:49:34',NULL,NULL),(123518,NULL,'111111','LOVELY','ROY CHAUDHARY',NULL,NULL,NULL,'l@gmail.com',NULL,NULL,'gzb',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'3','Active',NULL,NULL,NULL,NULL,NULL,NULL,'Available',NULL,'dinner',NULL,'2016-08-24 17:22:50',NULL,NULL),(123519,NULL,'123456','mnmnm','jhjjh',NULL,NULL,NULL,'.@',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Deactive',NULL,NULL,NULL,NULL,NULL,NULL,'UnAvailable',NULL,'MotorMechanic',NULL,'2016-08-24 19:57:13',NULL,NULL),(123520,NULL,'111111','inayat','hussain',NULL,NULL,NULL,'inayat.rdec@gmail.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Active',NULL,NULL,NULL,NULL,NULL,NULL,'UnAvailable',NULL,'Home tutor',NULL,'2016-08-27 00:47:04',NULL,NULL);
/*!40000 ALTER TABLE `serviceprovider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_categories` (
  `sc_id` varchar(20) NOT NULL,
  `sc_name` varchar(45) DEFAULT NULL,
  `parent` varchar(45) DEFAULT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`sc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES ('1','PersonalAssistent','business','Y'),('10','dinner','food','Y'),('11','breakfast','food','Y'),('12','Electrician','maintenance','Y'),('13','Plumber','maintenance','Y'),('14','MotorMechanic','maintenance','Y'),('15','Home tutor','home','Y'),('16','Others','others','N'),('2','OnlineAssistent','business','Y'),('3','BusinessAnalysist','business','Y'),('4','Doctor','health','Y'),('5','Dietician','health','Y'),('6','Photographer','party','Y'),('7','Decorator','party','Y'),('8','pizza','food','Y'),('9','lunch','food','Y');
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-09-01 14:55:39
