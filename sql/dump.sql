-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: delivery
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор',
  `code` varchar(32) NOT NULL COMMENT 'Артикул',
  `name` varchar(64) NOT NULL COMMENT 'Название товара',
  `description` text COMMENT 'Описание товара',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Товары';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task`
--

DROP TABLE IF EXISTS `task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор',
  `type_id` int NOT NULL COMMENT 'Тип задания',
  `date_planned` datetime NOT NULL COMMENT 'Дата плановая',
  `address` varchar(255) NOT NULL COMMENT 'Адрес',
  `name` varchar(64) NOT NULL COMMENT 'Контактное лицо',
  `phone` varchar(32) NOT NULL COMMENT 'Телефон',
  `company` varchar(64) DEFAULT NULL COMMENT 'Организация',
  `transport_id` int DEFAULT NULL COMMENT 'Транспортная компания',
  `cost` int NOT NULL DEFAULT '0' COMMENT 'Стоимость',
  `comment` text COMMENT 'Примечание',
  `courier_id` int DEFAULT NULL COMMENT 'Исполнитель',
  `is_finished` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Признак выполнения',
  `date_finished` datetime DEFAULT NULL COMMENT 'Дата выполнения',
  `status` enum('new','finished','canceled','failed') NOT NULL DEFAULT 'new' COMMENT 'Статус задания',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `transport_id` (`transport_id`),
  KEY `courier_id` (`courier_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`id`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`courier_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Задания';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_product`
--

DROP TABLE IF EXISTS `task_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_product` (
  `task_id` int NOT NULL COMMENT 'Задание',
  `product_id` int NOT NULL COMMENT 'Товар',
  `price` int NOT NULL DEFAULT '0' COMMENT 'Цена',
  `count` int NOT NULL DEFAULT '1' COMMENT 'Количество',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  KEY `task_id` (`task_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `task_product_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `task_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Товары в задании';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_product`
--

LOCK TABLES `task_product` WRITE;
/*!40000 ALTER TABLE `task_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `task_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transport` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор',
  `name` varchar(64) NOT NULL COMMENT 'Название',
  `address` varchar(255) NOT NULL COMMENT 'Адрес',
  `phone` varchar(32) NOT NULL COMMENT 'Телефон',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Транспортная компания';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `type` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор',
  `name` varchar(64) NOT NULL COMMENT 'Название типа задания',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COMMENT='Тип задания';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор',
  `login` varchar(32) NOT NULL COMMENT 'Логин',
  `password` varchar(64) NOT NULL COMMENT 'Пароль',
  `role` enum('admin','manager','courier') CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Роль пользователя',
  `name` varchar(64) NOT NULL COMMENT 'Имя пользователя',
  `phone` varchar(32) DEFAULT NULL COMMENT 'Телефон',
  `email` varchar(64) DEFAULT NULL COMMENT 'E-mail',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='Пользователи';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'admin','$2y$10$YBLpTWvF/aoicGvdNi5Yb.Z0cCxHU4cIdI6UjbdIWmomK.3yJCMme','admin','Admin',NULL,NULL,'2023-04-26 08:28:54');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-27  9:16:23
