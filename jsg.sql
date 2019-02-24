-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 45.40.205.50    Database: jsg
-- ------------------------------------------------------
-- Server version	5.5.57

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
-- Table structure for table `t_appointment`
--

DROP TABLE IF EXISTS `t_appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_appointment` (
  `APPOINTMENT_ID` varchar(20) NOT NULL,
  `APPOINTMENT_STATUS` int(11) NOT NULL,
  `USER_ID` varchar(50) NOT NULL,
  `USER_NAME` varchar(20) NOT NULL,
  `USER_TEL` varchar(11) NOT NULL,
  `USER_QQ` varchar(10) DEFAULT NULL,
  `APPOINTMENT_ADRESS` varchar(50) NOT NULL,
  `APPOINTMENT_TIME` datetime NOT NULL,
  `APPOINTMENT_UP_TIME` datetime NOT NULL,
  `APPOINTMENT_NUM` int(11) NOT NULL,
  `APPOINTMENT_CELL` varchar(1) NOT NULL,
  `SEND_USER_ID` varchar(50) DEFAULT NULL,
  `UPDOOR_TIME` datetime DEFAULT NULL,
  `UPDOOR_NUM` int(11) DEFAULT NULL,
  `UPDOOR_CELL` varchar(1) DEFAULT NULL,
  `UPDOOR_QQ` varchar(10) DEFAULT NULL,
  `UPDOOR_TEL` varchar(11) DEFAULT NULL,
  `UPDOOR_NAME` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`APPOINTMENT_ID`),
  KEY `FK_REFERENCE_7` (`USER_ID`),
  CONSTRAINT `FK_REFERENCE_7` FOREIGN KEY (`USER_ID`) REFERENCES `t_user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_book`
--

DROP TABLE IF EXISTS `t_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_book` (
  `BOOK_ID` varchar(20) NOT NULL,
  `BOOK_ISBN` varchar(13) NOT NULL,
  `BOOK_NAME` varchar(50) NOT NULL,
  `BOOK_IMG` varchar(200) NOT NULL,
  `BOOK_TYPE_ID` varchar(2) DEFAULT NULL,
  `BOOK_TYPE_ID_CHILD` varchar(4) NOT NULL,
  `BOOK_AUTHOR` varchar(50) NOT NULL,
  `BOOK_PUBLISHER` varchar(50) NOT NULL,
  `BOOK_PUBLISH_YEAR` varchar(20) NOT NULL,
  `BOOK_INTRODUCE` varchar(10000) DEFAULT NULL,
  `BOOK_CONTENT` varchar(10000) DEFAULT NULL,
  `BOOK_PRICE` decimal(4,2) NOT NULL,
  PRIMARY KEY (`BOOK_ID`),
  KEY `IN_BOOK_ID` (`BOOK_ID`),
  KEY `FK_REFERENCE_8` (`BOOK_TYPE_ID`),
  CONSTRAINT `FK_REFERENCE_8` FOREIGN KEY (`BOOK_TYPE_ID`) REFERENCES `t_book_types` (`BOOK_TYPE_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_book_borrow_rec`
--

DROP TABLE IF EXISTS `t_book_borrow_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_book_borrow_rec` (
  `SHARE_ID` varchar(20) NOT NULL,
  `USER_ID` varchar(50) NOT NULL,
  `BORROW_TIME` datetime NOT NULL,
  PRIMARY KEY (`SHARE_ID`),
  KEY `USER_idx` (`USER_ID`),
  CONSTRAINT `shareInfo` FOREIGN KEY (`SHARE_ID`) REFERENCES `t_share_book` (`SHARE_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `USER` FOREIGN KEY (`USER_ID`) REFERENCES `t_user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_book_types`
--

DROP TABLE IF EXISTS `t_book_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_book_types` (
  `BOOK_TYPE_ID` varchar(4) NOT NULL,
  `TYPE_NAME` varchar(20) NOT NULL,
  `PARENT_ID` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`BOOK_TYPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_order_detail`
--

DROP TABLE IF EXISTS `t_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_order_detail` (
  `ORDER_ID` varchar(50) NOT NULL,
  `BOOK_ID` varchar(20) NOT NULL,
  `BOOK_NEW` int(1) NOT NULL,
  `BOOK_NUM` int(11) NOT NULL,
  `TOTAL_PRICE` decimal(4,2) NOT NULL,
  PRIMARY KEY (`ORDER_ID`,`BOOK_ID`),
  CONSTRAINT `FK_REFERENCE_14` FOREIGN KEY (`ORDER_ID`) REFERENCES `t_order_rec` (`ORDER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_order_rec`
--

DROP TABLE IF EXISTS `t_order_rec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_order_rec` (
  `ORDER_ID` varchar(50) NOT NULL,
  `ORDER_TIME` datetime NOT NULL,
  `ORDER_STATUS` int(1) NOT NULL,
  `USER_ID` varchar(50) NOT NULL,
  PRIMARY KEY (`ORDER_ID`),
  KEY `FK_REFERENCE_11` (`USER_ID`),
  CONSTRAINT `FK_REFERENCE_11` FOREIGN KEY (`USER_ID`) REFERENCES `t_user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_receive_info`
--

DROP TABLE IF EXISTS `t_receive_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_receive_info` (
  `ORDER_ID` varchar(50) NOT NULL,
  `SEND_TIME` datetime NOT NULL,
  `REVEIVE_PERSON` varchar(20) NOT NULL,
  `REVEIVE_TEL` varchar(11) NOT NULL,
  `REVEIVE_QQ` varchar(10) DEFAULT NULL,
  `REVEIVE_ADRESS` varchar(50) NOT NULL,
  PRIMARY KEY (`ORDER_ID`),
  CONSTRAINT `FK_REFERENCE_12` FOREIGN KEY (`ORDER_ID`) REFERENCES `t_order_rec` (`ORDER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_sail_book`
--

DROP TABLE IF EXISTS `t_sail_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sail_book` (
  `SAIL_ID` varchar(20) NOT NULL,
  `BOOK_ID` varchar(20) NOT NULL,
  `BOOK_IMGS` varchar(1000) NOT NULL,
  `BOOK_MARKS` varchar(10) DEFAULT NULL,
  `UNIVERCITY_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`SAIL_ID`),
  KEY `FK_REFERENCE_17` (`UNIVERCITY_ID`),
  KEY `FK_REFERENCE_9` (`BOOK_ID`),
  CONSTRAINT `FK_REFERENCE_17` FOREIGN KEY (`UNIVERCITY_ID`) REFERENCES `t_univercity` (`UNIVERCITY_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REFERENCE_9` FOREIGN KEY (`BOOK_ID`) REFERENCES `t_book` (`BOOK_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_sail_book_stock`
--

DROP TABLE IF EXISTS `t_sail_book_stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_sail_book_stock` (
  `STOCK_ID` varchar(20) NOT NULL,
  `SAIL_ID` varchar(20) DEFAULT NULL,
  `BOOK_NEW` int(1) NOT NULL,
  `BOOK_STOCK` int(11) NOT NULL,
  `BOOK_PRICE` decimal(4,2) NOT NULL,
  PRIMARY KEY (`STOCK_ID`),
  KEY `FK_REFERENCE_18` (`SAIL_ID`),
  CONSTRAINT `FK_REFERENCE_18` FOREIGN KEY (`SAIL_ID`) REFERENCES `t_sail_book` (`SAIL_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_send_info`
--

DROP TABLE IF EXISTS `t_send_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_send_info` (
  `ORDER_ID` varchar(50) NOT NULL,
  `SEND_PERSON_ID` varchar(50) NOT NULL,
  `RECEIVE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ORDER_ID`),
  CONSTRAINT `FK_REFERENCE_13` FOREIGN KEY (`ORDER_ID`) REFERENCES `t_order_rec` (`ORDER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_session`
--

DROP TABLE IF EXISTS `t_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_session` (
  `session_key` varchar(32) NOT NULL,
  `time` datetime NOT NULL,
  `data` varchar(1000) NOT NULL,
  PRIMARY KEY (`session_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_share_book`
--

DROP TABLE IF EXISTS `t_share_book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_share_book` (
  `SHARE_ID` varchar(20) NOT NULL,
  `BOOK_NAME` varchar(50) DEFAULT NULL,
  `BOOK_ISBN` varchar(13) DEFAULT NULL,
  `USER_ID` varchar(50) NOT NULL,
  `BOOK_IMGS` varchar(1000) DEFAULT NULL,
  `RELEASE_TIME` datetime NOT NULL,
  `CANBORROWTIME_BEGIN` date NOT NULL,
  `CANBORROWTIME_END` date NOT NULL,
  `SHARE_MARKS` varchar(300) DEFAULT NULL,
  `STATUS` int(1) NOT NULL,
  `BOOK_AUTHOR` varchar(100) NOT NULL,
  PRIMARY KEY (`SHARE_ID`),
  KEY `FK_REFERENCE_3` (`USER_ID`),
  CONSTRAINT `FK_REFERENCE_3` FOREIGN KEY (`USER_ID`) REFERENCES `t_user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_shopping_car`
--

DROP TABLE IF EXISTS `t_shopping_car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_shopping_car` (
  `SHOPPING_ID` varchar(20) NOT NULL,
  `USER_ID` varchar(50) NOT NULL,
  `SAIL_ID` varchar(20) NOT NULL,
  `NEW` int(1) NOT NULL,
  `NUM` int(11) NOT NULL,
  PRIMARY KEY (`SHOPPING_ID`),
  KEY `FK_REFERENCE_1` (`USER_ID`),
  KEY `FK_REFERENCE_2` (`SAIL_ID`),
  CONSTRAINT `FK_REFERENCE_1` FOREIGN KEY (`USER_ID`) REFERENCES `t_user` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_REFERENCE_2` FOREIGN KEY (`SAIL_ID`) REFERENCES `t_book` (`BOOK_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_univercity`
--

DROP TABLE IF EXISTS `t_univercity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_univercity` (
  `UNIVERCITY_ID` varchar(10) NOT NULL,
  `UNIVERCITY_NAME` varchar(50) NOT NULL,
  PRIMARY KEY (`UNIVERCITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_user` (
  `USER_ID` varchar(50) NOT NULL,
  `USER_LOGO` varchar(200) NOT NULL,
  `USER_NAME` varchar(20) NOT NULL,
  `NAME` varchar(20) NOT NULL,
  `USER_PASSWD` varchar(50) NOT NULL,
  `USER_TEL` varchar(11) NOT NULL,
  `USER_EMAIL` varchar(50) NOT NULL,
  `USER_QQ` varchar(10) DEFAULT NULL,
  `USER_ADRESS` varchar(50) DEFAULT NULL,
  `UNIVERCITY_ID` varchar(10) NOT NULL,
  `IS_MANAGER` int(1) NOT NULL,
  PRIMARY KEY (`USER_ID`),
  KEY `FK_REFERENCE_16` (`UNIVERCITY_ID`),
  CONSTRAINT `FK_REFERENCE_16` FOREIGN KEY (`UNIVERCITY_ID`) REFERENCES `t_univercity` (`UNIVERCITY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Temporary view structure for view `v_sail_book`
--

DROP TABLE IF EXISTS `v_sail_book`;
/*!50001 DROP VIEW IF EXISTS `v_sail_book`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_sail_book` AS SELECT 
 1 AS `SAIL_ID`,
 1 AS `UNIVERCITY_ID`,
 1 AS `BOOK_ID`,
 1 AS `BOOK_ISBN`,
 1 AS `BOOK_NAME`,
 1 AS `BOOK_IMG`,
 1 AS `BOOK_TYPE_ID`,
 1 AS `BOOK_TYPE_ID_CHILD`,
 1 AS `BOOK_AUTHOR`,
 1 AS `BOOK_PUBLISHER`,
 1 AS `BOOK_PUBLISH_YEAR`,
 1 AS `BOOK_INTRODUCE`,
 1 AS `BOOK_CONTENT`,
 1 AS `BOOK_PRICE`,
 1 AS `IMGS`,
 1 AS `MARKS`,
 1 AS `TYPE_NAME`,
 1 AS `TYPE_NAME_CHILD`,
 1 AS `SAILEDNUM`,
 1 AS `STOCK_TOTAL`,
 1 AS `SAIL_PRICE`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'jsg'
--

--
-- Dumping routines for database 'jsg'
--

--
-- Final view structure for view `v_sail_book`
--

/*!50001 DROP VIEW IF EXISTS `v_sail_book`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`Ricky`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_sail_book` AS select `t_sail_book`.`SAIL_ID` AS `SAIL_ID`,`t_sail_book`.`UNIVERCITY_ID` AS `UNIVERCITY_ID`,`t_book`.`BOOK_ID` AS `BOOK_ID`,`t_book`.`BOOK_ISBN` AS `BOOK_ISBN`,`t_book`.`BOOK_NAME` AS `BOOK_NAME`,`t_book`.`BOOK_IMG` AS `BOOK_IMG`,`t_book`.`BOOK_TYPE_ID` AS `BOOK_TYPE_ID`,`t_book`.`BOOK_TYPE_ID_CHILD` AS `BOOK_TYPE_ID_CHILD`,`t_book`.`BOOK_AUTHOR` AS `BOOK_AUTHOR`,`t_book`.`BOOK_PUBLISHER` AS `BOOK_PUBLISHER`,`t_book`.`BOOK_PUBLISH_YEAR` AS `BOOK_PUBLISH_YEAR`,`t_book`.`BOOK_INTRODUCE` AS `BOOK_INTRODUCE`,`t_book`.`BOOK_CONTENT` AS `BOOK_CONTENT`,`t_book`.`BOOK_PRICE` AS `BOOK_PRICE`,`t_sail_book`.`BOOK_IMGS` AS `IMGS`,`t_sail_book`.`BOOK_MARKS` AS `MARKS`,(select `t_book_types`.`TYPE_NAME` from `t_book_types` where (`t_book`.`BOOK_TYPE_ID` = `t_book_types`.`BOOK_TYPE_ID`)) AS `TYPE_NAME`,(select `t_book_types`.`TYPE_NAME` from `t_book_types` where (`t_book`.`BOOK_TYPE_ID_CHILD` = `t_book_types`.`BOOK_TYPE_ID`)) AS `TYPE_NAME_CHILD`,(select count(0) from `t_order_detail` where (`t_order_detail`.`BOOK_ID` = `t_book`.`BOOK_ID`)) AS `SAILEDNUM`,(select sum(`st`.`BOOK_STOCK`) from (`t_sail_book` `s` join `t_sail_book_stock` `st`) where ((`s`.`BOOK_ID` = `t_book`.`BOOK_ID`) and (`s`.`SAIL_ID` = `st`.`SAIL_ID`) and (`s`.`UNIVERCITY_ID` = `t_sail_book`.`UNIVERCITY_ID`))) AS `STOCK_TOTAL`,(select min(`st`.`BOOK_PRICE`) from (`t_sail_book` `s` join `t_sail_book_stock` `st`) where ((`s`.`BOOK_ID` = `t_book`.`BOOK_ID`) and (`s`.`SAIL_ID` = `st`.`SAIL_ID`) and (`s`.`UNIVERCITY_ID` = `t_sail_book`.`UNIVERCITY_ID`))) AS `SAIL_PRICE` from (`t_book` join `t_sail_book`) where (`t_book`.`BOOK_ID` = `t_sail_book`.`BOOK_ID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-26 22:05:49
