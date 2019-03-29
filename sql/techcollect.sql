-- MySQL dump 10.13  Distrib 5.7.23, for macos10.13 (x86_64)
--
-- Host: localhost    Database: techcollect
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
-- Current Database: `techcollect`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `techcollect` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `techcollect`;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `ad_id` char(36) NOT NULL,
  `ad_name` varchar(45) DEFAULT NULL,
  `ad_line_1` varchar(45) DEFAULT NULL,
  `ad_line_2` varchar(45) DEFAULT NULL,
  `ad_city` varchar(30) DEFAULT NULL,
  `ad_state` char(2) DEFAULT NULL,
  `ad_postal` varchar(10) DEFAULT NULL,
  `ad_d_id` char(36) DEFAULT NULL,
  `ad_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ad_id`),
  KEY `fk_ad_d_id` (`ad_d_id`),
  CONSTRAINT `fk_ad_d_id` FOREIGN KEY (`ad_d_id`) REFERENCES `domain` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `co_id` char(36) NOT NULL,
  `co_d_id` char(36) DEFAULT NULL,
  `co_comment` varchar(2000) DEFAULT NULL,
  `co_comment_type` varchar(20) DEFAULT NULL,
  `co_wu_id` char(36) DEFAULT NULL,
  `co_last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`co_id`),
  KEY `fk_co_d_id` (`co_d_id`),
  KEY `fk_co_wu_id` (`co_wu_id`),
  CONSTRAINT `fk_co_d_id` FOREIGN KEY (`co_d_id`) REFERENCES `domain` (`d_id`),
  CONSTRAINT `fk_co_wu_id` FOREIGN KEY (`co_wu_id`) REFERENCES "user" (u_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `cn_id` char(36) NOT NULL,
  `cn_last_name` varchar(45) DEFAULT NULL,
  `cn_first_name` varchar(45) DEFAULT NULL,
  `cn_middle_name` varchar(45) DEFAULT NULL,
  `cn_moble` varchar(20) DEFAULT NULL,
  `cn_fax` varchar(20) DEFAULT NULL,
  `cn_home` varchar(20) DEFAULT NULL,
  `cn_title` varchar(30) DEFAULT NULL,
  `cn_email` varchar(255) DEFAULT NULL,
  `cn_ref` varchar(20) DEFAULT NULL,
  `cn_d_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`cn_id`),
  KEY `fk_cn_d_id` (`cn_d_id`),
  CONSTRAINT `fk_cn_d_id` FOREIGN KEY (`cn_d_id`) REFERENCES `domain` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact`
--

LOCK TABLES `contact` WRITE;
/*!40000 ALTER TABLE `contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `c_id` char(36) NOT NULL,
  `c_no` varchar(20) DEFAULT NULL,
  `c_name` varchar(45) DEFAULT NULL,
  `c_status` varchar(10) DEFAULT NULL,
  `c_salesman` char(36) DEFAULT NULL,
  `c_orig_salesman` char(36) DEFAULT NULL,
  `c_timezone` int(11) DEFAULT NULL,
  `c_fee` int(11) DEFAULT NULL,
  `c_non_prime_fee` int(11) DEFAULT NULL,
  `c_last_update_by` char(36) DEFAULT NULL,
  `c_last_update_ts` datetime DEFAULT NULL,
  `c_d_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `fk_c_d_id` (`c_d_id`),
  KEY `fk_c_orig_salesman` (`c_orig_salesman`),
  KEY `fk_c_salesman` (`c_salesman`),
  CONSTRAINT `fk_c_d_id` FOREIGN KEY (`c_d_id`) REFERENCES `domain` (`d_id`),
  CONSTRAINT `fk_c_orig_salesman` FOREIGN KEY (`c_orig_salesman`) REFERENCES "user" (u_id),
  CONSTRAINT `fk_c_salesman` FOREIGN KEY (`c_salesman`) REFERENCES "user" (u_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_address`
--

DROP TABLE IF EXISTS `customer_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_address` (
  `ca_id` char(36) NOT NULL,
  `ca_c_id` char(36) DEFAULT NULL,
  `ca_ad_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`ca_id`),
  KEY `fk_ca_ad_id` (`ca_ad_id`),
  KEY `fk_ca_c_id` (`ca_c_id`),
  CONSTRAINT `fk_ca_ad_id` FOREIGN KEY (`ca_ad_id`) REFERENCES `address` (`ad_id`),
  CONSTRAINT `fk_ca_c_id` FOREIGN KEY (`ca_c_id`) REFERENCES `customer` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_address`
--

LOCK TABLES `customer_address` WRITE;
/*!40000 ALTER TABLE `customer_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_comment`
--

DROP TABLE IF EXISTS `customer_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_comment` (
  `cco_id` char(36) NOT NULL,
  `cco_c_id` char(36) DEFAULT NULL,
  `cco_co_id` char(36) DEFAULT NULL,
  `cco_updt_ts` datetime DEFAULT NULL,
  `cco_wu_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`cco_id`),
  KEY `fk_cco_c_id` (`cco_c_id`),
  KEY `fk_cco_co_id` (`cco_co_id`),
  KEY `fk_cco_wu_id` (`cco_wu_id`),
  CONSTRAINT `fk_cco_c_id` FOREIGN KEY (`cco_c_id`) REFERENCES `customer` (`c_id`),
  CONSTRAINT `fk_cco_co_id` FOREIGN KEY (`cco_co_id`) REFERENCES `comment` (`co_id`),
  CONSTRAINT `fk_cco_wu_id` FOREIGN KEY (`cco_wu_id`) REFERENCES "user" (u_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_comment`
--

LOCK TABLES `customer_comment` WRITE;
/*!40000 ALTER TABLE `customer_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_contact`
--

DROP TABLE IF EXISTS `customer_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_contact` (
  `cc_id` char(36) NOT NULL,
  `cc_c_id` char(36) DEFAULT NULL,
  `cc_cn_id` char(36) DEFAULT NULL,
  `cc_primary` int(11) DEFAULT NULL,
  PRIMARY KEY (`cc_id`),
  KEY `fk_cc_c_id` (`cc_c_id`),
  KEY `fk_cc_cn_id` (`cc_cn_id`),
  CONSTRAINT `fk_cc_c_id` FOREIGN KEY (`cc_c_id`) REFERENCES `customer` (`c_id`),
  CONSTRAINT `fk_cc_cn_id` FOREIGN KEY (`cc_cn_id`) REFERENCES `contact` (`cn_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_contact`
--

LOCK TABLES `customer_contact` WRITE;
/*!40000 ALTER TABLE `customer_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debtor`
--

DROP TABLE IF EXISTS `debtor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debtor` (
  `de_id` char(36) NOT NULL,
  `de_name` varchar(45) DEFAULT NULL,
  `de_timezone` int(11) DEFAULT NULL,
  `de_import_loan_amt` decimal(9,2) DEFAULT NULL,
  `de_import_date` datetime DEFAULT NULL,
  `de_ssn` varchar(255) DEFAULT NULL,
  `de_dob` varchar(10) DEFAULT NULL,
  `de_original_loan_amt` decimal(9,2) DEFAULT NULL,
  `de_original_loan_date` datetime DEFAULT NULL,
  `de_last_payment_amt` decimal(9,2) DEFAULT NULL,
  `de_balance_due` decimal(9,2) DEFAULT NULL,
  `de_last_payment_date` datetime DEFAULT NULL,
  `de_charge_off_date` datetime DEFAULT NULL,
  `de_c_id` char(36) DEFAULT NULL,
  `de_last_update_by` char(36) DEFAULT NULL,
  `de_last_update_date` datetime DEFAULT NULL,
  `de_sif_date` datetime DEFAULT NULL,
  `de_sif_credit` decimal(9,2) DEFAULT NULL,
  `de_reason` varchar(255) DEFAULT NULL,
  `de_commission_rate` float DEFAULT NULL,
  `de_attorney` char(36) DEFAULT NULL,
  `de_payments` decimal(9,2) DEFAULT NULL,
  `de_prime` int(1) DEFAULT '0',
  `de_d_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`de_id`),
  KEY `fk_de_c_id` (`de_c_id`),
  KEY `fk_de_d_id` (`de_d_id`),
  CONSTRAINT `fk_de_c_id` FOREIGN KEY (`de_c_id`) REFERENCES `customer` (`c_id`),
  CONSTRAINT `fk_de_d_id` FOREIGN KEY (`de_d_id`) REFERENCES `domain` (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debtor`
--

LOCK TABLES `debtor` WRITE;
/*!40000 ALTER TABLE `debtor` DISABLE KEYS */;
/*!40000 ALTER TABLE `debtor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debtor_address`
--

DROP TABLE IF EXISTS `debtor_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debtor_address` (
  `da_id` char(36) NOT NULL,
  `da_de_id` char(36) DEFAULT NULL,
  `da_ad_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`da_id`),
  KEY `fk_da_ad_id` (`da_ad_id`),
  KEY `fk_da_de_id` (`da_de_id`),
  CONSTRAINT `fk_da_ad_id` FOREIGN KEY (`da_ad_id`) REFERENCES `address` (`ad_id`),
  CONSTRAINT `fk_da_de_id` FOREIGN KEY (`da_de_id`) REFERENCES `debtor` (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debtor_address`
--

LOCK TABLES `debtor_address` WRITE;
/*!40000 ALTER TABLE `debtor_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `debtor_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debtor_comment`
--

DROP TABLE IF EXISTS `debtor_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debtor_comment` (
  `dc_id` char(36) NOT NULL,
  `dc_de_id` char(36) DEFAULT NULL,
  `dc_co_id` char(36) DEFAULT NULL,
  `dc_updt_ts` datetime DEFAULT NULL,
  `dc_wu_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`dc_id`),
  KEY `fk_dc_co_id` (`dc_co_id`),
  KEY `fk_dc_de_id` (`dc_de_id`),
  KEY `fk_dc_wu_id` (`dc_wu_id`),
  CONSTRAINT `fk_dc_co_id` FOREIGN KEY (`dc_co_id`) REFERENCES `comment` (`co_id`),
  CONSTRAINT `fk_dc_de_id` FOREIGN KEY (`dc_de_id`) REFERENCES `debtor` (`de_id`),
  CONSTRAINT `fk_dc_wu_id` FOREIGN KEY (`dc_wu_id`) REFERENCES "user" (u_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debtor_comment`
--

LOCK TABLES `debtor_comment` WRITE;
/*!40000 ALTER TABLE `debtor_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `debtor_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `debtor_payment`
--

DROP TABLE IF EXISTS `debtor_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `debtor_payment` (
  `dp_id` char(36) NOT NULL,
  `dp_de_id` char(36) DEFAULT NULL,
  `dp_agent_id` char(36) DEFAULT NULL,
  `dp_amt` decimal(9,2) DEFAULT NULL,
  `dp_card_holder` varchar(45) DEFAULT NULL,
  `dp_payment_date` datetime DEFAULT NULL,
  `dp_addr_id` char(36) DEFAULT NULL,
  `dp_card_number` varchar(255) DEFAULT NULL,
  `dp_card_expiration` varchar(255) DEFAULT NULL,
  `dp_card_security_code` varchar(255) DEFAULT NULL,
  `dp_type` varchar(10) DEFAULT NULL,
  `dp_bank_name` varchar(45) DEFAULT NULL,
  `dp_bank_phone` varchar(10) DEFAULT NULL,
  `dp_bank_routing` varchar(20) DEFAULT NULL,
  `dp_bank_account` varchar(255) DEFAULT NULL,
  `dp_bank_account_type` varchar(10) DEFAULT NULL,
  `dp_status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dp_id`),
  KEY `fk_dp_addr_id` (`dp_addr_id`),
  KEY `fk_dp_agent_id` (`dp_agent_id`),
  KEY `fk_dp_de_id` (`dp_de_id`),
  CONSTRAINT `fk_dp_addr_id` FOREIGN KEY (`dp_addr_id`) REFERENCES `address` (`ad_id`),
  CONSTRAINT `fk_dp_agent_id` FOREIGN KEY (`dp_agent_id`) REFERENCES "user" (u_id),
  CONSTRAINT `fk_dp_de_id` FOREIGN KEY (`dp_de_id`) REFERENCES `debtor` (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `debtor_payment`
--

LOCK TABLES `debtor_payment` WRITE;
/*!40000 ALTER TABLE `debtor_payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `debtor_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain`
--

DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `d_id` char(36) NOT NULL,
  `d_name` varchar(40) NOT NULL,
  `d_time_zone` varchar(40) NOT NULL,
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES ('0499345f-59be-4b64-9fdc-35c06b963e36','TechCollect','US/Eastern');
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain_web_user`
--

DROP TABLE IF EXISTS `domain_web_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_web_user` (
  `dwu_id` char(36) NOT NULL,
  `dwu_d_id` char(36) NOT NULL,
  `dwu_wu_id` char(36) NOT NULL,
  PRIMARY KEY (`dwu_id`),
  KEY `dwu_d_id_fk` (`dwu_d_id`),
  KEY `dwu_wu_id_fk` (`dwu_wu_id`),
  CONSTRAINT `dwu_d_id_fk` FOREIGN KEY (`dwu_d_id`) REFERENCES `domain` (`d_id`),
  CONSTRAINT `dwu_wu_id_fk` FOREIGN KEY (`dwu_wu_id`) REFERENCES "user" (u_id)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain_web_user`
--

LOCK TABLES `domain_web_user` WRITE;
/*!40000 ALTER TABLE `domain_web_user` DISABLE KEYS */;
INSERT INTO domain_user VALUES ('0811a564-9a43-4b8c-a960-e2ef55813712','0499345f-59be-4b64-9fdc-35c06b963e36','62106315-7929-46ea-b778-1916df2e3c9a');
/*!40000 ALTER TABLE `domain_web_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `web_user`
--

DROP TABLE IF EXISTS `web_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `web_user` (
  `wu_id` char(36) DEFAULT NULL,
  `wu_num` varchar(20) DEFAULT NULL,
  `wu_first_name` varchar(40) DEFAULT NULL,
  `wu_last_name` varchar(40) DEFAULT NULL,
  `wu_security` int(11) DEFAULT NULL,
  `wu_password` varchar(255) DEFAULT NULL,
  `wu_active` int(1) DEFAULT '0',
  `wu_last_login` bigint(20) DEFAULT NULL,
  `wu_payments` int(1) DEFAULT '0',
  `wu_sales` int(1) DEFAULT '0',
  `wu_agent` int(1) DEFAULT '0',
  `wu_alias` varchar(255) DEFAULT NULL,
  `wu_title` varchar(40) DEFAULT NULL,
  `wu_quota` decimal(9,2) DEFAULT NULL,
  `wu_phone` varchar(10) DEFAULT NULL,
  `wu_email` varchar(255) DEFAULT NULL,
  UNIQUE KEY `web_user_pk` (`wu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `web_user`
--

LOCK TABLES `web_user` WRITE;
/*!40000 ALTER TABLE `web_user` DISABLE KEYS */;
INSERT INTO "user" VALUES ('62106315-7929-46ea-b778-1916df2e3c9a','1','Test','User',1,'$2a$10$VguyXAFGKpcpLm7H5KyMu.cLOTwLn.UPTQQMPg80Ch1/PCXCjPUqW',1,1548887966345,1,1,1,'Test User','Admin',NULL,'7708800987','testman@test.com');
/*!40000 ALTER TABLE `web_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-28 21:30:37
