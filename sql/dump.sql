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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='Товары';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'1111','Кресло-качалка','Кресло-качалка','2023-05-02 04:33:02'),(2,'2222','Глобус-бар','Глобус-бар','2023-05-02 04:36:36'),(3,'3333','Подвесное кресло','Подвесное кресло','2023-05-02 04:36:36'),(4,'4444','Набор для каллиграфии','Набор для каллиграфии','2023-05-02 04:36:36'),(5,'5555','Кресло из ротанга','Кресло из ротанга','2023-05-02 04:36:36');
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
  `date_planned` date NOT NULL COMMENT 'Дата плановая',
  `address` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Адрес',
  `person` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Контактное лицо',
  `phone` varchar(32) NOT NULL COMMENT 'Телефон',
  `company` varchar(64) DEFAULT NULL COMMENT 'Организация',
  `transport_id` int DEFAULT NULL COMMENT 'Транспортная компания',
  `cost` int NOT NULL DEFAULT '0' COMMENT 'Стоимость',
  `comment` text COMMENT 'Примечание',
  `courier_id` int DEFAULT NULL COMMENT 'Исполнитель',
  `is_finished` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'Признак выполнения',
  `date_finished` date DEFAULT NULL COMMENT 'Дата выполнения',
  `status` enum('new','finished','canceled','failed') NOT NULL DEFAULT 'new' COMMENT 'Статус задания',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  KEY `type_id` (`type_id`),
  KEY `transport_id` (`transport_id`),
  KEY `courier_id` (`courier_id`),
  CONSTRAINT `task_ibfk_1` FOREIGN KEY (`type_id`) REFERENCES `type` (`id`),
  CONSTRAINT `task_ibfk_2` FOREIGN KEY (`transport_id`) REFERENCES `transport` (`id`),
  CONSTRAINT `task_ibfk_3` FOREIGN KEY (`courier_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COMMENT='Задания';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task`
--

LOCK TABLES `task` WRITE;
/*!40000 ALTER TABLE `task` DISABLE KEYS */;
INSERT INTO `task` VALUES (1,1,'2023-05-01','8 Марта, 197','Иванов Иван Иванович','123-45-67',NULL,NULL,0,NULL,NULL,1,NULL,'new','2023-05-02 10:34:41'),(2,1,'2023-05-01','Город, улица, дом','Петров Петр Петрович','345-67-89',NULL,1,0,NULL,NULL,1,NULL,'new','2023-05-02 10:39:20'),(3,1,'2023-05-02','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:25:27'),(4,1,'2023-05-02','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,1,NULL,'new','2023-05-04 05:28:55'),(5,1,'2023-05-02','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,1,NULL,'new','2023-05-04 05:28:55'),(6,1,'2023-05-03','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,1,NULL,'new','2023-05-04 05:28:55'),(7,1,'2023-05-04','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,1,NULL,'new','2023-05-04 05:28:55'),(8,1,'2023-05-04','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(9,1,'2023-05-04','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,1,NULL,'new','2023-05-04 05:28:55'),(10,1,'2023-05-04','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,2,0,NULL,NULL,1,NULL,'new','2023-05-04 05:28:55'),(11,1,'2023-05-05','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,1,NULL,'new','2023-05-04 05:28:55'),(12,1,'2023-05-05','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(13,1,'2023-05-06','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(14,1,'2023-05-06','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(15,1,'2023-05-06','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(16,1,'2023-04-26','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(17,1,'2023-04-27','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(18,1,'2023-04-27','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(19,1,'2023-04-27','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(20,1,'2023-04-28','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(21,1,'2023-04-28','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(22,1,'2023-05-08','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(23,1,'2023-05-08','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(24,1,'2023-05-08','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(25,1,'2023-05-10','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(26,1,'2023-05-10','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55'),(27,1,'2023-05-11','Улица, Дом','Неизвестный покупатель','000-00-00',NULL,NULL,0,NULL,NULL,0,NULL,'new','2023-05-04 05:28:55');
/*!40000 ALTER TABLE `task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_product`
--

DROP TABLE IF EXISTS `task_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_product` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Идентификатор',
  `task_id` int NOT NULL COMMENT 'Задание',
  `product_id` int NOT NULL COMMENT 'Товар',
  `price` int NOT NULL DEFAULT '0' COMMENT 'Цена',
  `count` int NOT NULL DEFAULT '1' COMMENT 'Количество',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`),
  KEY `task_id` (`task_id`),
  KEY `product_id` (`product_id`),
  CONSTRAINT `task_product_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `task` (`id`),
  CONSTRAINT `task_product_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3 COMMENT='Товары в задании';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_product`
--

LOCK TABLES `task_product` WRITE;
/*!40000 ALTER TABLE `task_product` DISABLE KEYS */;
INSERT INTO `task_product` VALUES (1,1,1,0,1,'2023-05-04 10:37:30'),(2,2,2,0,1,'2023-05-04 10:41:55'),(3,4,3,0,1,'2023-05-04 10:41:55'),(4,4,4,0,1,'2023-05-04 10:41:55'),(5,5,5,0,1,'2023-05-04 10:41:55'),(6,6,1,0,1,'2023-05-04 10:41:55'),(7,7,2,0,1,'2023-05-04 10:41:55'),(8,9,3,0,1,'2023-05-04 10:41:55'),(9,9,4,0,1,'2023-05-04 10:41:55'),(10,10,5,0,1,'2023-05-04 10:41:55'),(11,11,1,0,1,'2023-05-04 10:41:55'),(12,12,2,0,1,'2023-05-04 10:41:55'),(13,13,3,0,1,'2023-05-04 10:41:55'),(14,14,4,0,1,'2023-05-04 10:41:55'),(15,15,5,0,1,'2023-05-04 10:41:55'),(16,16,1,0,1,'2023-05-04 10:41:55'),(17,17,2,0,1,'2023-05-04 10:41:55'),(18,18,3,0,1,'2023-05-04 10:41:55'),(19,19,4,0,1,'2023-05-04 10:41:55'),(20,20,5,0,1,'2023-05-04 10:41:55'),(21,21,1,0,1,'2023-05-04 10:41:55'),(22,22,2,0,1,'2023-05-04 10:41:55'),(23,23,3,0,1,'2023-05-04 10:41:55'),(24,24,4,0,1,'2023-05-04 10:41:55'),(25,25,5,0,1,'2023-05-04 10:41:55'),(26,26,1,0,1,'2023-05-04 10:41:55'),(27,27,2,0,1,'2023-05-04 10:41:55');
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
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Название',
  `address` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Адрес',
  `phone` varchar(32) NOT NULL COMMENT 'Телефон',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='Транспортная компания';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'Кит','8 Марта, 269','','2023-05-02 05:13:40'),(2,'CDEK','Титова, 19','','2023-05-02 05:13:40');
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
  `name` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'Название типа задания',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Время создания записи',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='Тип задания';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Доставка','2023-05-02 04:29:23'),(2,'Получение','2023-05-02 04:29:23'),(3,'Возврат','2023-05-02 04:30:09');
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

-- Dump completed on 2023-05-05 10:22:14
