-- MySQL dump 10.13  Distrib 5.1.53, for openwrt-linux-gnu (mips)
--
-- Host: localhost    Database: Module
-- ------------------------------------------------------
-- Server version	5.1.53

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
-- Table structure for table `Devices`
--

DROP TABLE IF EXISTS `Devices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Devices` (
  `obtaine_ip` varchar(15) DEFAULT NULL,
  `module_ip` varchar(15) DEFAULT NULL,
  `module_mac` varchar(17) DEFAULT NULL,
  `hw_ver` varchar(16) DEFAULT NULL,
  `module_info` longtext,
  `module_name` longtext,
  `module_func` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Devices`
--

LOCK TABLES `Devices` WRITE;
/*!40000 ALTER TABLE `Devices` DISABLE KEYS */;
INSERT INTO `Devices` VALUES ('192.168.2.101','  0.  0.  0.  0','000000000001','01','Relay control (6 relay). GSM function. Signal.','Ñèñòåìà ñèãíàëèçàöèè','Relay+GSM+Signal+Temp','2012-10-16 13:30:15');
/*!40000 ALTER TABLE `Devices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GSM`
--

DROP TABLE IF EXISTS `GSM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GSM` (
  `obtaine_ip` varchar(15) DEFAULT NULL,
  `call_num` varchar(255) DEFAULT NULL,
  `sms_message` varchar(255) DEFAULT NULL,
  `info_gsm` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `signal` varchar(1) DEFAULT NULL,
  `auto_answer` varchar(1) DEFAULT NULL,
  `pin` varchar(8) DEFAULT NULL,
  `remote_sms` varchar(1) DEFAULT NULL,
  `level` varchar(32) DEFAULT NULL,
  `ussd` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GSM`
--

LOCK TABLES `GSM` WRITE;
/*!40000 ALTER TABLE `GSM` DISABLE KEYS */;
INSERT INTO `GSM` VALUES ('192.168.2.101','+380671394511;F;F',NULL,NULL,NULL,'1','1','1111',NULL,NULL,'@\n\r\n+CMGS: 240\r\n\r\nOK\r\n');
/*!40000 ALTER TABLE `GSM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Relay`
--

DROP TABLE IF EXISTS `Relay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Relay` (
  `obtaine_ip` varchar(15) DEFAULT NULL,
  `relay_state` varchar(255) DEFAULT NULL,
  `relay_time` varchar(255) DEFAULT NULL,
  `relay_name` longtext
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Relay`
--

LOCK TABLES `Relay` WRITE;
/*!40000 ALTER TABLE `Relay` DISABLE KEYS */;
INSERT INTO `Relay` VALUES ('192.168.2.101','R1+0;R2+0;R3+0;R4+0;R5+0;R6+0','R1+          0;R2+          0;R3+          0;R4+          0;R5+          0;R6+          0','R1+Íàñîñ;R2+Êëàïàí 1;R3+Êëàïàí 2;R4+Relay4 name;R5+Relay5 name;R6+Ñèðåíà');
/*!40000 ALTER TABLE `Relay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Signal`
--

DROP TABLE IF EXISTS `Signal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Signal` (
  `obtaine_ip` varchar(15) DEFAULT NULL,
  `alarm_state` varchar(255) DEFAULT NULL,
  `alarm_relay` varchar(255) DEFAULT NULL,
  `alarm_name` varchar(255) DEFAULT NULL,
  `armed` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Signal`
--

LOCK TABLES `Signal` WRITE;
/*!40000 ALTER TABLE `Signal` DISABLE KEYS */;
INSERT INTO `Signal` VALUES ('192.168.2.101','A1+   927;A2+   918;A3+    91;A4+   925;A5+   106;A6+   921','A1+  0;A2+  0;A3+  0;A4+  0;A5+  0;A6+  0','A1+Äàò÷èê äâèæåíèÿ;A2+Alarm2 name;A3+Alarm3 name;A4+Alarm4 name;A5+Alarm5 name;A6+Alarm6 name','A1+  1;A2+  1;A3+  1;A4+  1;A5+  0;A6+  1');
/*!40000 ALTER TABLE `Signal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Temp`
--

DROP TABLE IF EXISTS `Temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Temp` (
  `obtaine_ip` varchar(15) DEFAULT NULL,
  `temp_state` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Temp`
--

LOCK TABLES `Temp` WRITE;
/*!40000 ALTER TABLE `Temp` DISABLE KEYS */;
INSERT INTO `Temp` VALUES ('192.168.2.101','   235');
/*!40000 ALTER TABLE `Temp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-11-30 15:27:01
