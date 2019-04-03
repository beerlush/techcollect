-- MySQL dump 10.13  Distrib 5.7.22, for macos10.13 (x86_64)
--
-- Host: localhost    Database: techcollect
-- ------------------------------------------------------
-- Server version	5.7.22

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
  `co_u_id` char(36) DEFAULT NULL,
  `co_last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`co_id`),
  KEY `fk_co_d_id` (`co_d_id`),
  KEY `fk_co_u_id` (`co_u_id`),
  CONSTRAINT `fk_co_d_id` FOREIGN KEY (`co_d_id`) REFERENCES `domain` (`d_id`),
  CONSTRAINT `fk_co_u_id` FOREIGN KEY (`co_u_id`) REFERENCES `user` (`u_id`)
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
  `c_next_update_ts` datetime DEFAULT NULL,
  `c_d_id` char(36) DEFAULT NULL,
  `c_last_update_ts` datetime DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `fk_c_d_id` (`c_d_id`),
  KEY `fk_c_orig_salesman` (`c_orig_salesman`),
  KEY `fk_c_salesman` (`c_salesman`),
  CONSTRAINT `fk_c_d_id` FOREIGN KEY (`c_d_id`) REFERENCES `domain` (`d_id`),
  CONSTRAINT `fk_c_orig_salesman` FOREIGN KEY (`c_orig_salesman`) REFERENCES `user` (`u_id`),
  CONSTRAINT `fk_c_salesman` FOREIGN KEY (`c_salesman`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES ('38a4112c-537d-467b-8929-ac572716e6f6','67145','Restaurant Services','REMIT DUE','62106315-7929-46ea-b778-1916df2e3c9a','62106315-7929-46ea-b778-1916df2e3c9a',NULL,NULL,NULL,'','2019-03-31 22:57:44','0499345f-59be-4b64-9fdc-35c06b963e36','2019-03-31 22:58:27');
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
  CONSTRAINT `fk_cco_wu_id` FOREIGN KEY (`cco_wu_id`) REFERENCES `user` (`u_id`)
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
  CONSTRAINT `fk_dc_wu_id` FOREIGN KEY (`dc_wu_id`) REFERENCES `user` (`u_id`)
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
  CONSTRAINT `fk_dp_agent_id` FOREIGN KEY (`dp_agent_id`) REFERENCES `user` (`u_id`),
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
  `d_timezone` varchar(40) NOT NULL,
  `d_active` int(1) DEFAULT '0',
  PRIMARY KEY (`d_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES ('0499345f-59be-4b64-9fdc-35c06b963e36','TechCollect','US/Eastern',1),('85d13bf0-1065-458a-9c78-af41dc645ff4','TechCollect 2','US/Eastern',1);
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain_user`
--

DROP TABLE IF EXISTS `domain_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_user` (
  `du_id` char(36) NOT NULL,
  `du_d_id` char(36) NOT NULL,
  `du_u_id` char(36) NOT NULL,
  PRIMARY KEY (`du_id`),
  KEY `du_d_id_fk` (`du_d_id`),
  KEY `du_u_id_fk` (`du_u_id`),
  CONSTRAINT `du_d_id_fk` FOREIGN KEY (`du_d_id`) REFERENCES `domain` (`d_id`),
  CONSTRAINT `du_u_id_fk` FOREIGN KEY (`du_u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain_user`
--

LOCK TABLES `domain_user` WRITE;
/*!40000 ALTER TABLE `domain_user` DISABLE KEYS */;
INSERT INTO `domain_user` VALUES ('0811a564-9a43-4b8c-a960-e2ef55813712','0499345f-59be-4b64-9fdc-35c06b963e36','62106315-7929-46ea-b778-1916df2e3c9a'),('72a3fe46-ce0a-4624-bc63-f72ae9285bf5','85d13bf0-1065-458a-9c78-af41dc645ff4','62106315-7929-46ea-b778-1916df2e3c9a');
/*!40000 ALTER TABLE `domain_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `r_id` char(36) NOT NULL,
  `r_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('013a0522-9a10-457f-b51a-4bc5b76c7af8','DomainAdmin'),('02594af0-8b3d-4daf-8daf-5a2863c67117','SysAdmin'),('3469c8b8-3528-461a-bd60-10e8f4fc921f','Agent'),('8b5f5636-3e6b-4fce-95ca-a23b1e706ecf','Sales'),('acafbdd9-33e3-484b-a168-e56cb1ef9015','Payments');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `u_id` char(36) DEFAULT NULL,
  `u_num` varchar(20) DEFAULT NULL,
  `u_first_name` varchar(40) DEFAULT NULL,
  `u_last_name` varchar(40) DEFAULT NULL,
  `u_security` int(11) DEFAULT NULL,
  `u_password` varchar(255) DEFAULT NULL,
  `u_active` int(1) DEFAULT '0',
  `u_last_login` bigint(20) DEFAULT NULL,
  `u_payments` int(1) DEFAULT '0',
  `u_sales` int(1) DEFAULT '0',
  `u_agent` int(1) DEFAULT '0',
  `u_alias` varchar(255) DEFAULT NULL,
  `u_title` varchar(40) DEFAULT NULL,
  `u_quota` decimal(9,2) DEFAULT NULL,
  `u_phone` varchar(10) DEFAULT NULL,
  `u_email` varchar(255) DEFAULT NULL,
  `u_r_default_id` char(36) DEFAULT NULL,
  `u_d_default_id` char(36) DEFAULT NULL,
  UNIQUE KEY `web_user_pk` (`u_id`),
  KEY `fk_u_d_default_id` (`u_d_default_id`),
  KEY `fk_u_r_default_id` (`u_r_default_id`),
  CONSTRAINT `fk_u_d_default_id` FOREIGN KEY (`u_d_default_id`) REFERENCES `domain` (`d_id`),
  CONSTRAINT `fk_u_r_default_id` FOREIGN KEY (`u_r_default_id`) REFERENCES `role` (`r_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('62106315-7929-46ea-b778-1916df2e3c9a','1','Test','User',1,'$2a$10$VguyXAFGKpcpLm7H5KyMu.cLOTwLn.UPTQQMPg80Ch1/PCXCjPUqW',1,1548887966345,1,1,1,'Test User','Admin',NULL,'7708800987','testman@test.com','8b5f5636-3e6b-4fce-95ca-a23b1e706ecf','0499345f-59be-4b64-9fdc-35c06b963e36');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role` (
  `ur_id` char(36) NOT NULL,
  `ur_u_id` char(36) DEFAULT NULL,
  `ur_r_id` char(36) DEFAULT NULL,
  PRIMARY KEY (`ur_id`),
  KEY `fk_ur_r_id` (`ur_r_id`),
  KEY `fk_ur_u_id` (`ur_u_id`),
  CONSTRAINT `fk_ur_r_id` FOREIGN KEY (`ur_r_id`) REFERENCES `role` (`r_id`),
  CONSTRAINT `fk_ur_u_id` FOREIGN KEY (`ur_u_id`) REFERENCES `user` (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('2b213fcc-6868-484e-b4a6-fe79d781c2aa','62106315-7929-46ea-b778-1916df2e3c9a','acafbdd9-33e3-484b-a168-e56cb1ef9015'),('82846414-c7c7-4b54-876e-cfdbd899005b','62106315-7929-46ea-b778-1916df2e3c9a','3469c8b8-3528-461a-bd60-10e8f4fc921f'),('a5e30d5b-1a9d-47f1-ae9d-c9e31a8c1895','62106315-7929-46ea-b778-1916df2e3c9a','8b5f5636-3e6b-4fce-95ca-a23b1e706ecf'),('b384dbca-1149-42c7-8ffe-2d1e5bf477b1','62106315-7929-46ea-b778-1916df2e3c9a','02594af0-8b3d-4daf-8daf-5a2863c67117'),('bf167390-073c-4322-9031-a02f65f2e90d','62106315-7929-46ea-b778-1916df2e3c9a','013a0522-9a10-457f-b51a-4bc5b76c7af8');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-04-02 22:21:17
