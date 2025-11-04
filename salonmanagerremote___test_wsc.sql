CREATE DATABASE  IF NOT EXISTS `salonmanager` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `salonmanager`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: salonmanager
-- ------------------------------------------------------
-- Server version	8.0.36

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cashier_workshifts`
--

DROP TABLE IF EXISTS `cashier_workshifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cashier_workshifts` (
  `cashier_workshift_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `cashier_workshift_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cashier_id_fkey` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`cashier_workshift_id`),
  KEY `cashier_id_fkey` (`cashier_id_fkey`),
  KEY `workshift_id_fkey` (`workshift_id_fkey`),
  CONSTRAINT `cashier_workshifts_ibfk_1` FOREIGN KEY (`cashier_id_fkey`) REFERENCES `users` (`user_id`),
  CONSTRAINT `cashier_workshifts_ibfk_2` FOREIGN KEY (`workshift_id_fkey`) REFERENCES `workshifts` (`workshift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cashier_workshifts`
--

LOCK TABLES `cashier_workshifts` WRITE;
/*!40000 ALTER TABLE `cashier_workshifts` DISABLE KEYS */;
INSERT INTO `cashier_workshifts` VALUES ('2','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','CCEpngEGfhLKMstgG81ELQ==','2');
/*!40000 ALTER TABLE `cashier_workshifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `category_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES ('vJE0iCtYQQkdgPmO1UHFrw=='),('oq+ndGGeFoWVRa7z+jTQTg=='),('QvhC0YyKkb+kHspXS3N7ug=='),('99y4KhBCS3ZbirBVAQd0ig=='),('cHJ6Jv8NGi+AtZJa4SPWZQ=='),('BsOSSiksfXMpJ2bjNzRm6A=='),('NlM2TVDCyk88sO9Bg19dRQ=='),('puEq3qaOs63+2iQpl2/EtQ=='),('ja/VBo/i753G3PBFQhwCiQ=='),('zatBMBmei9d068q239VJhA=='),('ME0GRKLK63WlQ4HSogwNQg=='),('/HiphkqA6tuhoJxd12hZkQ=='),('IQaqUCs7F9QVP6pskF+osA=='),('lTn5UNcRhKkPYRyje/XNxQ==');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chars`
--

DROP TABLE IF EXISTS `chars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chars` (
  `char_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chars`
--

LOCK TABLES `chars` WRITE;
/*!40000 ALTER TABLE `chars` DISABLE KEYS */;
INSERT INTO `chars` VALUES ('4DGEGm380j1veqRaESm0XA=='),('mp5Dplj/sbi3D5XKdGSOqg=='),('wkX9vSxYN2lKSHBEtQA9Ww=='),('m9zxrulihJiX6idVm17Nuw=='),('t9OP6Yue4LYUl3MxX98FnQ=='),('o42Gv9GJ8bMVgPemehHQOw=='),('pxWX9eR0L1daK4/bFbTuYQ=='),('e6hb1xIADTZW19PqacZFjw=='),('xUbBrCswPqYoULLBtI3lpQ=='),('tsoCPT0IQgTiDC6YA1WGaQ=='),('3Gt04JXQbjBdecdaxf0CGw==');
/*!40000 ALTER TABLE `chars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chef_workshifts`
--

DROP TABLE IF EXISTS `chef_workshifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chef_workshifts` (
  `chef_workshift_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `chef_workshift_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `chef_id_fkey` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`chef_workshift_id`),
  KEY `chef_id_fkey` (`chef_id_fkey`),
  KEY `workshift_id_fkey` (`workshift_id_fkey`),
  CONSTRAINT `chef_workshifts_ibfk_1` FOREIGN KEY (`chef_id_fkey`) REFERENCES `users` (`user_id`),
  CONSTRAINT `chef_workshifts_ibfk_2` FOREIGN KEY (`workshift_id_fkey`) REFERENCES `workshifts` (`workshift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chef_workshifts`
--

LOCK TABLES `chef_workshifts` WRITE;
/*!40000 ALTER TABLE `chef_workshifts` DISABLE KEYS */;
INSERT INTO `chef_workshifts` VALUES ('2','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','Yo1RbqTcPvBF2q3UkmIAfg==','2'),('3','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','vSk6aw1v8x4Z7EMKHqYojA==','2');
/*!40000 ALTER TABLE `chef_workshifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_actual`
--

DROP TABLE IF EXISTS `config_actual`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_actual` (
  `config_open_ws` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_open_ws_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_indexes_buttons` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_tokken` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_update_cashier` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_update_waiter` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_update_chef` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_update_map_tables` text COLLATE utf8mb4_general_ci,
  `config_update_map_item_monits` text COLLATE utf8mb4_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_actual`
--

LOCK TABLES `config_actual` WRITE;
/*!40000 ALTER TABLE `config_actual` DISABLE KEYS */;
INSERT INTO `config_actual` VALUES ('K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','2','x7bka9p5GM+yFNNZ6/H22g==','eH7zLrCVNDYRtF0fREidvQ==','gCwcTFRB5SAMUYO52Wl2sQ==','gCwcTFRB5SAMUYO52Wl2sQ==','gCwcTFRB5SAMUYO52Wl2sQ==','m+BC/x9C8dzscCrNe6AKnA==','m+BC/x9C8dzscCrNe6AKnA==');
/*!40000 ALTER TABLE `config_actual` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_defer_close_tabs`
--

DROP TABLE IF EXISTS `config_defer_close_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_defer_close_tabs` (
  `config_defer_close_tab_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `config_defer_close_tab_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`config_defer_close_tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_defer_close_tabs`
--

LOCK TABLES `config_defer_close_tabs` WRITE;
/*!40000 ALTER TABLE `config_defer_close_tabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `config_defer_close_tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_general`
--

DROP TABLE IF EXISTS `config_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `config_general` (
  `config_table_total` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_table_num_panes` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_table_name_panes` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_table_chart_panes` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_table_name_categories` varchar(2000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_table_tip` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_modkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_terminal_kitchen_1` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `config_terminal_waiter_1` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_general`
--

LOCK TABLES `config_general` WRITE;
/*!40000 ALTER TABLE `config_general` DISABLE KEYS */;
INSERT INTO `config_general` VALUES ('6:','G2H3a8RgTJzktiQ28nKaEg==','HvAr7HMgFxu3jaxIMKfejQ==','CJhWHxf5rgNRsIvW1vwccA==','yALOUvaDGUFzi3yAgbq1nlnK1A/gjKmVg98NNj/YLtc2Uj6qkgmq79G1ApHAYROiCwshhq0bCO0DfChF6YX97g==','21','dthhQYITGuY/5I6/tcf01g==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
/*!40000 ALTER TABLE `config_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consumers`
--

DROP TABLE IF EXISTS `consumers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumers` (
  `consumer_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `consumer_street` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_street_num` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_dept_floor` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_dept_num` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_district` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_area` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_details` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_lastname` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_phone` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_social_network` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `consumer_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`consumer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumers`
--

LOCK TABLES `consumers` WRITE;
/*!40000 ALTER TABLE `consumers` DISABLE KEYS */;
INSERT INTO `consumers` VALUES ('2','a8dssl4DwaUBZEVkOZ4l8w==','42di7RLCcJPHB4gxbrDoHQ==','MxyuI1iRndQg8r3ImtVuOA==','MxyuI1iRndQg8r3ImtVuOA==','xXYXf0+U+SRf5fFDYlin6w==','B+L83g+pb/bsT42oYrcItw==','g7pvkdEIWypwFeABOAFStA==','pI31lVQTA+ve9VBfyH/MaA==','JWOaojhyt9t8JsYUUCj4zw==','MHAfUtazhe8lzBp51ye08A==','yKQWXd2W9asS7zSZYFf2dc6MJgm7FH4QPxod2YDtRWc=','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('3','GlbjJioajyGW2QlJPAENolVaCre9Ird8JN47NjIrVHA=','wBHGlDusfSwPGfLCQj6heg==','MxyuI1iRndQg8r3ImtVuOA==','MxyuI1iRndQg8r3ImtVuOA==','BZZ72d2fh/olRRdPx2/iKQ==','kgDLXunllYyQw6VEjVkCZw==','WdEPWmTMFV8mCRxViufTpqfukJ0D4vyulgsEfunPC3Q=','+A8S6bLjh991D3bHASzdHQ==','4kPhtgfIwyHiussm3r2BzQ==','w3sn15pDmJJUJAQRazjYJA==','daEtqIb/iYeDgmNIji/Iba//to0rc5groyi2BksI9+c=','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
/*!40000 ALTER TABLE `consumers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deliverys`
--

DROP TABLE IF EXISTS `deliverys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deliverys` (
  `delivery_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `delivery_consumer_phone` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `delivery_tab_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `delivery_user_id` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `delivery_open` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `delivery_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`delivery_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deliverys`
--

LOCK TABLES `deliverys` WRITE;
/*!40000 ALTER TABLE `deliverys` DISABLE KEYS */;
/*!40000 ALTER TABLE `deliverys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `error_stacks`
--

DROP TABLE IF EXISTS `error_stacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `error_stacks` (
  `error_stack_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `error_stack_date` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `error_stack_text` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`error_stack_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `error_stacks`
--

LOCK TABLES `error_stacks` WRITE;
/*!40000 ALTER TABLE `error_stacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `error_stacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_attempts`
--

DROP TABLE IF EXISTS `failed_attempts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_attempts` (
  `attempt_user_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `attempt_ip_address` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attempt_time` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attempt_count` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attempt_is_blocked` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`attempt_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_attempts`
--

LOCK TABLES `failed_attempts` WRITE;
/*!40000 ALTER TABLE `failed_attempts` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_attempts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_attempts_tokken_k1`
--

DROP TABLE IF EXISTS `failed_attempts_tokken_k1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_attempts_tokken_k1` (
  `attempt_tokken_time` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attempt_tokken_count` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attempt_tokken_is_blocked` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_attempts_tokken_k1`
--

LOCK TABLES `failed_attempts_tokken_k1` WRITE;
/*!40000 ALTER TABLE `failed_attempts_tokken_k1` DISABLE KEYS */;
INSERT INTO `failed_attempts_tokken_k1` VALUES ('zRxkWw+Dyx6M+gv0zqO79A==','1','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
/*!40000 ALTER TABLE `failed_attempts_tokken_k1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_attempts_tokken_w1`
--

DROP TABLE IF EXISTS `failed_attempts_tokken_w1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_attempts_tokken_w1` (
  `attempt_tokken_time` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attempt_tokken_count` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `attempt_tokken_is_blocked` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_attempts_tokken_w1`
--

LOCK TABLES `failed_attempts_tokken_w1` WRITE;
/*!40000 ALTER TABLE `failed_attempts_tokken_w1` DISABLE KEYS */;
INSERT INTO `failed_attempts_tokken_w1` VALUES ('zRxkWw+Dyx6M+gv0zqO79A==','1','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
/*!40000 ALTER TABLE `failed_attempts_tokken_w1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_card_gift_tabs`
--

DROP TABLE IF EXISTS `item_card_gift_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_card_gift_tabs` (
  `item_card_gift_tab_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `item_card_gift_tab_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_gift_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`item_card_gift_tab_id`),
  KEY `item_card_gift_id_fkey` (`item_card_gift_id_fkey`),
  KEY `table_id_fkey` (`table_id_fkey`),
  CONSTRAINT `item_card_gift_tabs_ibfk_1` FOREIGN KEY (`item_card_gift_id_fkey`) REFERENCES `item_cards` (`item_card_id`),
  CONSTRAINT `item_card_gift_tabs_ibfk_2` FOREIGN KEY (`table_id_fkey`) REFERENCES `tabs` (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_card_gift_tabs`
--

LOCK TABLES `item_card_gift_tabs` WRITE;
/*!40000 ALTER TABLE `item_card_gift_tabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_card_gift_tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_card_order_tabs`
--

DROP TABLE IF EXISTS `item_card_order_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_card_order_tabs` (
  `item_card_order_tab_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `item_card_order_tab_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_order_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`item_card_order_tab_id`),
  KEY `item_card_order_id_fkey` (`item_card_order_id_fkey`),
  KEY `table_id_fkey` (`table_id_fkey`),
  CONSTRAINT `item_card_order_tabs_ibfk_1` FOREIGN KEY (`item_card_order_id_fkey`) REFERENCES `item_cards` (`item_card_id`),
  CONSTRAINT `item_card_order_tabs_ibfk_2` FOREIGN KEY (`table_id_fkey`) REFERENCES `tabs` (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_card_order_tabs`
--

LOCK TABLES `item_card_order_tabs` WRITE;
/*!40000 ALTER TABLE `item_card_order_tabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_card_order_tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_card_payed_nd_tabs`
--

DROP TABLE IF EXISTS `item_card_payed_nd_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_card_payed_nd_tabs` (
  `item_card_payed_nd_tab_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `item_card_payed_nd_tab_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_payed_nd_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`item_card_payed_nd_tab_id`),
  KEY `item_card_payed_nd_id_fkey` (`item_card_payed_nd_id_fkey`),
  KEY `table_id_fkey` (`table_id_fkey`),
  CONSTRAINT `item_card_payed_nd_tabs_ibfk_1` FOREIGN KEY (`item_card_payed_nd_id_fkey`) REFERENCES `item_cards` (`item_card_id`),
  CONSTRAINT `item_card_payed_nd_tabs_ibfk_2` FOREIGN KEY (`table_id_fkey`) REFERENCES `tabs` (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_card_payed_nd_tabs`
--

LOCK TABLES `item_card_payed_nd_tabs` WRITE;
/*!40000 ALTER TABLE `item_card_payed_nd_tabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_card_payed_nd_tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_card_payed_tabs`
--

DROP TABLE IF EXISTS `item_card_payed_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_card_payed_tabs` (
  `item_card_payed_tab_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `item_card_payed_tab_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_payed_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`item_card_payed_tab_id`),
  KEY `item_card_payed_id_fkey` (`item_card_payed_id_fkey`),
  KEY `table_id_fkey` (`table_id_fkey`),
  CONSTRAINT `item_card_payed_tabs_ibfk_1` FOREIGN KEY (`item_card_payed_id_fkey`) REFERENCES `item_cards` (`item_card_id`),
  CONSTRAINT `item_card_payed_tabs_ibfk_2` FOREIGN KEY (`table_id_fkey`) REFERENCES `tabs` (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_card_payed_tabs`
--

LOCK TABLES `item_card_payed_tabs` WRITE;
/*!40000 ALTER TABLE `item_card_payed_tabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_card_payed_tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_cards`
--

DROP TABLE IF EXISTS `item_cards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_cards` (
  `item_card_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `item_card_code` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_description` varchar(2500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_cost` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_price` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_stock` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_date_creation` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_date_update` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_tip` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_card_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`item_card_id`),
  UNIQUE KEY `item_card_code` (`item_card_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_cards`
--

LOCK TABLES `item_cards` WRITE;
/*!40000 ALTER TABLE `item_cards` DISABLE KEYS */;
INSERT INTO `item_cards` VALUES ('21','sXv9vBIoBOWsupafyn8taw==','/1GcI9xwraDwQqNMnn017nasNiFERFuQ+dMt3h08asA=','vJE0iCtYQQkdgPmO1UHFrw==','8BbRvt87p+kLBv+KKkzAvgBCiv8jQsdtK3uOAHiMMdOXQeuwOjj7N8zGNVZKbseDYZEDZBdmlYjeCNjcb/bDIlveTBtg53gTDRX1jdK+Y1M=','8111/1','yeW2K5bT0Z3EFnggMr9R59aSwWxOe8gK76eQEl4xcmE=','23','SuTQlOQ/N5iYiJon8Emiyg==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('22','NrvATbrJT1n2JF6DGICRHQ==','xBxCceYbODV56Nn8RBnqHg==','cHJ6Jv8NGi+AtZJa4SPWZQ==','ALcL+iUk2pSFsfJiMLSwZMCxWa6ZzZLjD3eIZi3UZn235HVvz9rij0HcXqU2xfftMYiVLGipFHYSrijIyC8dEJEf0TG+yXBEKbY8VEUtFgVMkLxwv5m6WRt+DqYAN9wY1zvcjMYyzoKZ5ThKd4lbgtjYSU58MlULcV1pTdTT5Nrh0XgnNTZSCNbTy2olqWei','4611/1','tFG1DInYbKP1erhKB2NJouEpL5+PWR+jV+wNxR0MOIE=','23','6l0SYLZviVo9sqjI/Eha5A==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('23','+4UbnH/QUgkXBfXMR199mg==','wwzMdVkgv3dM5lMxpmKAmryZHwOkYIXJcYzKvqgAgvI=','cHJ6Jv8NGi+AtZJa4SPWZQ==','CsAjjwnHX8fasOfY1RGnYxHAjaWWNAGLCItoCnDSi+aJxON/00BFfb91ykCT1hvxguMrKBsyYHczlkvkkRcnjXIhROEuG0R7TBUpkMOWFf0xcdRDW8Ncjrq6VPgoCntweaucS1V3VdCtyAzJICSK+VNNjLmHrcKb9sDy4IcnPkhnL3rfbKyDG0o3INpNyr3c','3111/1','/YGzaqGrJRy58wqnxsKxYuEpL5+PWR+jV+wNxR0MOIE=','23','BPHznfn5heov0Tv5JwqMDg==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('24','7drx+GveifhqYjceOq38qA==','mc1OXxAQI/eUcHBPBNqX4wsLIYatGwjtA3woRemF/e4=','cHJ6Jv8NGi+AtZJa4SPWZQ==','kgh4zGO1W65Hc5RDKGCd+5zMTlIjhlCeUFRki70vgSMxiJUsaKkUdhKuKMjILx0QZnHANwOWWgrRvP9oGYkDcl+I7Saqaoyc9NuvuyzXaSeqrKfhg3l/QGOqS9v2UvR6irEB6TidsZZka1a4/YSRdc9WkawGELHCjkOi0G8kV+CJXofJG2esNBOO1+3/AkOM','4111/1','rGZUQiZ81OMhjf2wZlzZnOEpL5+PWR+jV+wNxR0MOIE=','23','V4vBtE+b7ihQY9VHrCx1ZA==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('25','R64UrEX/JScqBMcUC0dUiA==','gKsifiP31rvqc/1HpL8RtQ==','cHJ6Jv8NGi+AtZJa4SPWZQ==','mahSDPfS6j7qEDHy5vJqGbD7hO47uLAVCdpCxAfZFbFgtxRdZTYg0Bu1fGoJ+6U5SWOdbPkvohDqXZ33JM2VJHnBYLCDp0TM5a5l5I0yLjIkQXBNbqtx25OUKvw9ijg9RzeTytdnIZu5tJ4+DKJhjlVrrtR1VDo8zs2iVPreMLRdBA6YglnWKs4SIe8uIeTOCwshhq0bCO0DfChF6YX97g==','5111/1','/w7q9FIOfmv9pLEeh9I4UeEpL5+PWR+jV+wNxR0MOIE=','23','GZJoo6Emhv+y2utrHaUVdQ==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('26','mfmxdlChCf5QrujuA4TFFg==','AHRQi8+/keQc4p/ovyCmqA==','cHJ6Jv8NGi+AtZJa4SPWZQ==','RY7EuAwrqzX9prseiI9XxbpBxFXpPf6v9eBSy8Thzc1NlVSOj0dBpdrIwQwQGybrKIwb2/lXpUN7IND6U8COWpvqZZacqbKv2yFyiP8sq60Uc0vIYbhfPFNA5MEPJ4o4tZWodELuoSbt8gql6toSMbZGDmsXn6R4TkcsFWhV/CoydNPNOIPBkqCE1hTVcihL','5111/1','/w7q9FIOfmv9pLEeh9I4UeEpL5+PWR+jV+wNxR0MOIE=','23','zNm+cg9XCHp66M9pDfSouQ==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('3','y3PGsd8HnJxFBx/C2pqCaA==','OVBT0qbXQN8kqR2Ellujng==','oq+ndGGeFoWVRa7z+jTQTg==','FJ2wr4H6At55DBm/9zwEZyyraaJxtmiwSRoaYGXPuq8=',':11/1','lnug34IzEKzvPAEBMYDBLOEpL5+PWR+jV+wNxR0MOIE=','35','YIowkPNeDYiS/h4B9wOi0w==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('4','8G+77TicvtTcmbpyVzXr5g==','DaL4r5my318qVoC9/DAzKQ==','vJE0iCtYQQkdgPmO1UHFrw==','9zBF3Gug15j/31ixbPqHnO2NTY513eIuFoDqVFlYiQYnER8+ZT8jz17iwh8AZhMPnIaTMW1cjxIirTUjSHnsv27OJbSA7zOhbKFvXAqBTJY=','5611/1','UO4oUroCGzkvoQSjpoSJCeEpL5+PWR+jV+wNxR0MOIE=','23','yYf34eImWvBvhL9gdFk80g==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('5','Wp+niVwi6v6LzKJbRjOudA==','6B54uSV9ZLxd3TbvVSD92gsLIYatGwjtA3woRemF/e4=','vJE0iCtYQQkdgPmO1UHFrw==','+scnP2qNMDw/m4UZWrgypyP4cef/g8F7wU0q8DbI2g8sDGG3LUSe+bAyWAwW2JvmTkH4ZzxfFl+nQCqf/NSi3e0u3RzeEaJ5rASg9yVzG0tmLSLVMY0mb52G3wamg3Um','6111/1','25iBUvKYbR/wX2dbqVvPkNaSwWxOe8gK76eQEl4xcmE=','23','m5AFzEh6TnhE2znoUOH4Qg==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('6','xiRKQWM7XC8mXJpXqbx70Q==','mL+MgchAmPqFGi9b/nU6eg==','vJE0iCtYQQkdgPmO1UHFrw==','atAt+5SVedUUav6rALxvUaAlHx6SNheaGaz3p+wn+hdgBzOX+ScztZxR8btKP9VyZFgSdWnRlPQw4UDfg2kgHE3tDUhS1QlOsVdyjWYefTK1aukQNvPFEssitB+28N13','7111/1','c6d6hIuzHCMHUPEfLoGVO9aSwWxOe8gK76eQEl4xcmE=','23','1UN/yMw1vStYVFYJ6ZVing==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('7','apu3jEYWzkJ2HraOmy3zaA==','Tr5ylQOddEl/pvCgcoHrsw==','vJE0iCtYQQkdgPmO1UHFrw==','enz3ZXgkLdxQ7gq9lvaj7JebByk+huRKsc82YnmnmgoQT7xA30K3iXNhXZ9R58sVOVbqKrnTsFxfZVn8FVIvo62p/GgamEZYbZAFGSRuDErVCvpuT1ZRXEDsQFTt4uLd','6111/1','25iBUvKYbR/wX2dbqVvPkNaSwWxOe8gK76eQEl4xcmE=','23','3lqkArUua1V//mG0nYxzvA==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('8','EXzNdTx1FpLoeEBBSYxZmg==','dsRdqSBQqcagj715QzQbZA==','vJE0iCtYQQkdgPmO1UHFrw==','yqpLFtloQN1z/mDIGWVJfQklgz86W5vYAhtgOmOn3VYYMXpCYMu0USKvngYHTzlyJibis4aiqL3oFjgDOr1NtIhmhmpdcW3S6IVXl7kxzRo=','7111/1','c6d6hIuzHCMHUPEfLoGVO9aSwWxOe8gK76eQEl4xcmE=','23','pw8FV2OoPv5sIGp7RKLIXg==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('9','dthUIxK1m3JpuZG/q1NV/g==','bq+DU4sBZT/kX3Qdyvxj3w==','vJE0iCtYQQkdgPmO1UHFrw==','mwZdt0co4efeP5ZE4EX0JJAkQgF61cys66gCrQ+yStpZN3VgMZLNcFUhJg6tp6wDy/AixqOuLK2qbgoNU5MklJFeCESKY5UcHjlJ/9ALbKM=','7111/1','c6d6hIuzHCMHUPEfLoGVO9aSwWxOe8gK76eQEl4xcmE=','23','3AmwPm8h/nPFZWrvTXH3sg==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),(':','BLCYxlw97rL6S2VYTJXTgg==','Jpw4kYPoESltLXBzugdCVg==','vJE0iCtYQQkdgPmO1UHFrw==','eYt4bJSTCyOG3gXkr0TUfyudlA5ozByahaQLtQtouUkgf62apFSdkDBd/Xm6gf595D9VWZm9qi2Bzs6cIu8cqhZ8oZcvx1EoZZixikPEeF8=','8111/1','yeW2K5bT0Z3EFnggMr9R59aSwWxOe8gK76eQEl4xcmE=','23','Kuf4RQecGYf495aZe+y7iw==',NULL,'K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
/*!40000 ALTER TABLE `item_cards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_monits`
--

DROP TABLE IF EXISTS `item_monits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_monits` (
  `item_monit_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `item_monit_table_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_item_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_ws_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_tipe` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_init_bool` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_init_date` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_cook_bool` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_cook_date` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_ready_bool` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_ready_date` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_otw_bool` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_otw_date` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_open` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_indications` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_to_watch` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_monit_anuled` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`item_monit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_monits`
--

LOCK TABLES `item_monits` WRITE;
/*!40000 ALTER TABLE `item_monits` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_monits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_sales_statics`
--

DROP TABLE IF EXISTS `item_sales_statics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_sales_statics` (
  `item_sale_static_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `item_sale_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_sale_category` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_sale_tab_pos` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_sale_waiter_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_sale_workshift_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_sale_cost` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_sale_price` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_sale_client_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_sale_date` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `item_sale_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`item_sale_static_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_sales_statics`
--

LOCK TABLES `item_sales_statics` WRITE;
/*!40000 ALTER TABLE `item_sales_statics` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_sales_statics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `money_flows`
--

DROP TABLE IF EXISTS `money_flows`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `money_flows` (
  `money_flow_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `money_flow_kind` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `money_flow_m_k` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `money_flow_amount` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `money_flow_comment` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `money_flow_date` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `money_flow_ws_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `money_flow_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`money_flow_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `money_flows`
--

LOCK TABLES `money_flows` WRITE;
/*!40000 ALTER TABLE `money_flows` DISABLE KEYS */;
/*!40000 ALTER TABLE `money_flows` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registers`
--

DROP TABLE IF EXISTS `registers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registers` (
  `register_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `register_ejecution` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_userId` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_object_kind` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_object_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_operation` varchar(900) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`register_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registers`
--

LOCK TABLES `registers` WRITE;
/*!40000 ALTER TABLE `registers` DISABLE KEYS */;
INSERT INTO `registers` VALUES ('RvWhpEOjloiaN+VvOPSq2A==','Qbkv/VUZgrsW414Ehe9zcQ==','CCEpngEGfhLKMstgG81ELQ==','OGcZWWuU5x4c90iZf9V0IQ==','blLvUsU8V7dogEDDLrtoQA==','QIWbb3+El2V3/jk7xfU55w==');
/*!40000 ALTER TABLE `registers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spaces`
--

DROP TABLE IF EXISTS `spaces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spaces` (
  `space_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spaces`
--

LOCK TABLES `spaces` WRITE;
/*!40000 ALTER TABLE `spaces` DISABLE KEYS */;
INSERT INTO `spaces` VALUES ('kr9FPCHZNULu2Rd+WRBKfw=='),('gBssOtGvtk5dum9jDlbmUw=='),('Nhqu7QVAElpZI2OUXnYcjw=='),('6t51xrHrtwbNyTCoXNCe6w=='),('f5WebHIAnVcMXPq3museXw=='),('0luuqsaK0U3+ykh/L2j5xQ=='),('Qj03zVC3VaugmycKGcJQow=='),('Iv9pyXUcQZlzYNyfJUPmgw=='),('quT9g3Ig6Ef5FejezGFUZw=='),('w3tURT+QFzvP8nvVc09Yrw=='),('xCos15Avkq9RZALZTaBVJw==');
/*!40000 ALTER TABLE `spaces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabs`
--

DROP TABLE IF EXISTS `tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabs` (
  `table_num` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_pos` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_open_time` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_close_time` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `table_open` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_bill` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_to_pay` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_discount` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_error` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_price_correction` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_amount_cash` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_amount_electronic` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_total` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_comments` varchar(500) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_workshift` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabs`
--

LOCK TABLES `tabs` WRITE;
/*!40000 ALTER TABLE `tabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `user_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_last_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_mail` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_role` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_image_route` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_image_name` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_password` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_shortpass` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_phone` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `user_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id` (`user_id`),
  UNIQUE KEY `user_mail` (`user_mail`),
  UNIQUE KEY `user_phone` (`user_phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('+4nmfIJvZS+4BjBP1O7JuQ==','NO5yj7pQy1xfFtgklexYxg==','uvbROt/OhL+sjODdHct6fA==','91YykS5APUj+hv37BWf3Sg==','INIKjDsbEsznKLwFmrgNAw==','CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDi7qqcr9bQj+WqoYWWXlInlx+aRV6D1ENTSIOEEnTf1r7NNuwoYVKrY2+0+z5Su9Zu','EJl5Rx42MVsOtfOvn7JcRA==','Cwshhq0bCO0DfChF6YX97g==','238','7xb/d+X2gc1sObFJRJm46A==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('0Y5fBhpjfddGEAL5j/tgiQ==','wd1VjMtB0vv9aVckQne63u6pWmTI3Ilc8iLlnlf5lfA=','WBdapT4Pe5436nTIBs9b4Q==','p8A//bVlvusZseb0/mYCFw==','INIKjDsbEsznKLwFmrgNAw==','CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDi7qqcr9bQj+WqoYWWXlInlx+aRV6D1ENTSIOEEnTf1r7NNuwoYVKrY2+0+z5Su9Zu','EJl5Rx42MVsOtfOvn7JcRA==','Cwshhq0bCO0DfChF6YX97g==','239','Zi8w6vzrmrlda2PL0TaOGw==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('2vvta/FxVZrx0LnHV1o1hQ==','QRCsHA2XcWk4Ac701foTQw==','sAO9BHdAVjaRXiIsWwilwQ==','hVFgEuga1V9Q3mPemVSRWQ==','bv2ha6jljpAl7dOl6aOVYg==','UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=','EJl5Rx42MVsOtfOvn7JcRA==','bksAKCCiy+276R0setIqgA==','236','A0qPUcwXR5TCVcPFTmhJvQ==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('c2OuJxQqABPRxKy/kPXW2A==','5FB3bF4LheVY0H6KFiHt/g==','+RzQUjtQ3UxomiHSZ0fmuQ==','S9FqHlkcN9TEgUKgVz/iTA==','M88re0RIWY4NF0w7/z6VRg==','CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDii4eUS9Zkgo93svn72ZXyX2r61k8ydfmPyOR1FhTHWuLmxVlzHSrQCRLmIortSRA5','fJ5rBMyacmtSuKFHHH34nA==','mfaEjOqNlJsxISmRZ33MdQ==','234','EtvVCnIlzRb1kVZUnbvHxg==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('CCEpngEGfhLKMstgG81ELQ==','/yr270qn8LzgLsh8bFQSOw==','83hg9YUAVATXP1jly5rY5g==','n8X9y4/ki7ZrWXPr4J5suA==','M88re0RIWY4NF0w7/z6VRg==','UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=','EJl5Rx42MVsOtfOvn7JcRA==','mfaEjOqNlJsxISmRZ33MdQ==','235','n5lKOAAxYzcV8wg8Ty/wWA==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('obZQObtlJpAhIUIIPLOHCA==','QRCsHA2XcWk4Ac701foTQw==','6f69CIAZqNMDNskG8gcD5A==','Sitwsd4DuUfe/Q7nccI0UrSCY4uIq8oA8PG4e754zm8=','INIKjDsbEsznKLwFmrgNAw==','CtarrfvT/WbyQwRI4y+J7ZxL3mwfw49jKVkGIX6LMVbnHbXQ/sEcQvTwCi+undDi7qqcr9bQj+WqoYWWXlInlx+aRV6D1ENTSIOEEnTf1r7NNuwoYVKrY2+0+z5Su9Zu','EJl5Rx42MVsOtfOvn7JcRA==','Cwshhq0bCO0DfChF6YX97g==','23:','SDWn0csok4GFznUslGXHAQ==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('Sj/an1ATwGJMnFdlYALugg==','XL8ni+01yoi1rijLH+M/QQ==','jhEO7tqfHYb3oxAUrLXQaQ==','2bQ4sPCWzqqNKSmr/1A8Lg==','bv2ha6jljpAl7dOl6aOVYg==','UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=','EJl5Rx42MVsOtfOvn7JcRA==','MuBNBKsKVk4mMQbdaaB4HQ==','237','5OWzUhs8mITFdLUxTMRorw==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('vSk6aw1v8x4Z7EMKHqYojA==','Qv1ZQRDXMqeWaUdA6qW6Cg==','HRks0cDZRTIJJkG4LbrYhw==','QXjkmfb79jJrq5T8TN11Xg==','sY15wMEn6OHKR/WVXUaJIA==','UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=','EJl5Rx42MVsOtfOvn7JcRA==','1eDBlDUvKGfxHMRQlH6hVQ==','774','pS6mMJhSWqVOmzhyxJCK7A==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u'),('Yo1RbqTcPvBF2q3UkmIAfg==','riUGD9ryVPk0CwhqPa4fWQ==','esWJlrE6I5ZjYzYef6VTPA==','09jQos69rQCImTC5XzoICw==','sY15wMEn6OHKR/WVXUaJIA==','UDxj6tOzyCbCCzCK+o8OWU6VXd33Ja4ql1yGC9Leufg=','EJl5Rx42MVsOtfOvn7JcRA==','1eDBlDUvKGfxHMRQlH6hVQ==','998','23CGswJD8Ktk9g14crCj/A==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_block_status`
--

DROP TABLE IF EXISTS `users_block_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_block_status` (
  `block_status_user_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `block_status` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `block_status_attempt_count` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `block_status_end` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `block_status_first_try` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`block_status_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_block_status`
--

LOCK TABLES `users_block_status` WRITE;
/*!40000 ALTER TABLE `users_block_status` DISABLE KEYS */;
INSERT INTO `users_block_status` VALUES ('+4nmfIJvZS+4BjBP1O7JuQ==','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1',NULL,NULL),('0Y5fBhpjfddGEAL5j/tgiQ==','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1',NULL,NULL),('2vvta/FxVZrx0LnHV1o1hQ==','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1',NULL,NULL),('c2OuJxQqABPRxKy/kPXW2A==','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1',NULL,NULL),('obZQObtlJpAhIUIIPLOHCA==','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1',NULL,NULL),('Sj/an1ATwGJMnFdlYALugg==','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1',NULL,NULL),('TDynq6oCQ/QJKl5gI3x/Yw==','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1',NULL,NULL),('vSk6aw1v8x4Z7EMKHqYojA==','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1',NULL,NULL),('Yo1RbqTcPvBF2q3UkmIAfg==','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1',NULL,NULL);
/*!40000 ALTER TABLE `users_block_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiter_tabs`
--

DROP TABLE IF EXISTS `waiter_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waiter_tabs` (
  `waiter_tab_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `waiter_tab_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `waiter_id_fkey` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `table_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`waiter_tab_id`),
  KEY `waiter_id_fkey` (`waiter_id_fkey`),
  KEY `table_id_fkey` (`table_id_fkey`),
  CONSTRAINT `waiter_tabs_ibfk_1` FOREIGN KEY (`waiter_id_fkey`) REFERENCES `users` (`user_id`),
  CONSTRAINT `waiter_tabs_ibfk_2` FOREIGN KEY (`table_id_fkey`) REFERENCES `tabs` (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiter_tabs`
--

LOCK TABLES `waiter_tabs` WRITE;
/*!40000 ALTER TABLE `waiter_tabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `waiter_tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waiter_workshifts`
--

DROP TABLE IF EXISTS `waiter_workshifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waiter_workshifts` (
  `waiter_workshift_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `waiter_workshift_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `waiter_id_fkey` varchar(200) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_id_fkey` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`waiter_workshift_id`),
  KEY `waiter_id_fkey` (`waiter_id_fkey`),
  KEY `workshift_id_fkey` (`workshift_id_fkey`),
  CONSTRAINT `waiter_workshifts_ibfk_1` FOREIGN KEY (`waiter_id_fkey`) REFERENCES `users` (`user_id`),
  CONSTRAINT `waiter_workshifts_ibfk_2` FOREIGN KEY (`workshift_id_fkey`) REFERENCES `workshifts` (`workshift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiter_workshifts`
--

LOCK TABLES `waiter_workshifts` WRITE;
/*!40000 ALTER TABLE `waiter_workshifts` DISABLE KEYS */;
INSERT INTO `waiter_workshifts` VALUES ('2','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','2vvta/FxVZrx0LnHV1o1hQ==','2'),('3','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','Sj/an1ATwGJMnFdlYALugg==','2');
/*!40000 ALTER TABLE `waiter_workshifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshift_unmod_tabs`
--

DROP TABLE IF EXISTS `workshift_unmod_tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshift_unmod_tabs` (
  `workshift_unmod_tab_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `workshift_unmod_tab_value` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_unmod_tab_ws_id` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`workshift_unmod_tab_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshift_unmod_tabs`
--

LOCK TABLES `workshift_unmod_tabs` WRITE;
/*!40000 ALTER TABLE `workshift_unmod_tabs` DISABLE KEYS */;
/*!40000 ALTER TABLE `workshift_unmod_tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workshifts`
--

DROP TABLE IF EXISTS `workshifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workshifts` (
  `workshift_id` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `workshift_open_time_shift` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_close_time_shift` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_state_shift` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_mount_cash` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_mount_electronic` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_total_mount_tabs` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_total_mount_ws` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_error_mount_tabs` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_error_mount_ws` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_cash_flow_cash` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_cash_flow_elec` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_comment` varchar(5000) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_error` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `workshift_active` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`workshift_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workshifts`
--

LOCK TABLES `workshifts` WRITE;
/*!40000 ALTER TABLE `workshifts` DISABLE KEYS */;
INSERT INTO `workshifts` VALUES ('2','My8DDZAiH089FcEpBdx2/A==','V7kE0Mi4Ezf3r1tquZkRcA==','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','1/1','1/1','1/1','1/1','1/1','1/1','1/1','1/1','Cwshhq0bCO0DfChF6YX97g==','K992SZTEVF57Ki/fu/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u','K992SZTEVF57Ki/ju/UUXu/Y1r6cqpvxCcVQRsD/kqMLCyGGrRsI7QN8KEXphf3u');
/*!40000 ALTER TABLE `workshifts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'salonmanager'
--

--
-- Dumping routines for database 'salonmanager'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-23 10:59:24
