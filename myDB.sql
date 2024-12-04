-- MySQL dump 10.13  Distrib 8.0.37, for Win64 (x86_64)
--
-- Host: localhost    Database: trukhmanov_driving_school
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
-- Table structure for table `cadet_group`
--

DROP TABLE IF EXISTS `cadet_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cadet_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cadet_id` int NOT NULL,
  `study_group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_instructor_vehicle` (`study_group_id`,`cadet_id`),
  KEY `cadet_id` (`cadet_id`),
  KEY `study_group_id` (`study_group_id`),
  CONSTRAINT `cadet_group_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `users` (`id`),
  CONSTRAINT `cadet_group_ibfk_2` FOREIGN KEY (`study_group_id`) REFERENCES `study_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadet_group`
--

LOCK TABLES `cadet_group` WRITE;
/*!40000 ALTER TABLE `cadet_group` DISABLE KEYS */;
INSERT INTO `cadet_group` VALUES (1,5,1),(2,6,1),(3,7,1);
/*!40000 ALTER TABLE `cadet_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instructor_id` int NOT NULL,
  `cadet_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_instructor_vehicle` (`instructor_id`,`cadet_id`),
  KEY `instructor_id` (`instructor_id`),
  KEY `cadet_id` (`cadet_id`),
  CONSTRAINT `chats_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`),
  CONSTRAINT `chats_ibfk_2` FOREIGN KEY (`cadet_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chats`
--

LOCK TABLES `chats` WRITE;
/*!40000 ALTER TABLE `chats` DISABLE KEYS */;
INSERT INTO `chats` VALUES (2,3,5),(3,3,6),(4,4,7);
/*!40000 ALTER TABLE `chats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group_lessons`
--

DROP TABLE IF EXISTS `group_lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group_lessons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `teacher_id` int NOT NULL,
  `study_group_id` int NOT NULL,
  `start_date_time` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `teacher_id` (`teacher_id`),
  KEY `study_group_id` (`study_group_id`),
  CONSTRAINT `group_lessons_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `users` (`id`),
  CONSTRAINT `group_lessons_ibfk_2` FOREIGN KEY (`study_group_id`) REFERENCES `study_groups` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group_lessons`
--

LOCK TABLES `group_lessons` WRITE;
/*!40000 ALTER TABLE `group_lessons` DISABLE KEYS */;
INSERT INTO `group_lessons` VALUES (3,2,1,'2024-10-01 11:20:00'),(4,2,1,'2024-10-03 11:20:00'),(5,2,1,'2024-10-05 13:00:00');
/*!40000 ALTER TABLE `group_lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `individual_lessons`
--

DROP TABLE IF EXISTS `individual_lessons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `individual_lessons` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instructor_vehicle_id` int NOT NULL,
  `cadet_id` int NOT NULL,
  `start_date_time` timestamp NOT NULL,
  `end_date_time` timestamp NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cadet_id` (`cadet_id`),
  KEY `instructor_vehicle_id` (`instructor_vehicle_id`),
  CONSTRAINT `individual_lessons_ibfk_1` FOREIGN KEY (`cadet_id`) REFERENCES `users` (`id`),
  CONSTRAINT `individual_lessons_ibfk_2` FOREIGN KEY (`instructor_vehicle_id`) REFERENCES `instructor_vehicle` (`id`),
  CONSTRAINT `check_start_before_end` CHECK ((`start_date_time` < `end_date_time`))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual_lessons`
--

LOCK TABLES `individual_lessons` WRITE;
/*!40000 ALTER TABLE `individual_lessons` DISABLE KEYS */;
INSERT INTO `individual_lessons` VALUES (1,2,5,'2024-10-06 07:00:00','2024-10-06 08:30:00'),(2,2,6,'2024-10-06 08:40:00','2024-10-06 10:10:00'),(3,2,6,'2024-10-08 09:00:00','2024-10-08 10:30:00'),(4,2,5,'2024-10-08 07:00:00','2024-10-08 08:30:00'),(5,4,7,'2024-10-08 07:00:00','2024-10-08 08:30:00');
/*!40000 ALTER TABLE `individual_lessons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor_vehicle`
--

DROP TABLE IF EXISTS `instructor_vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor_vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `instructor_id` int NOT NULL,
  `vehicle_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_instructor_vehicle` (`instructor_id`,`vehicle_id`),
  KEY `instructor_id` (`instructor_id`),
  KEY `vehicle_id` (`vehicle_id`),
  CONSTRAINT `instructor_vehicle_ibfk_1` FOREIGN KEY (`instructor_id`) REFERENCES `users` (`id`),
  CONSTRAINT `instructor_vehicle_ibfk_2` FOREIGN KEY (`vehicle_id`) REFERENCES `vehicle` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor_vehicle`
--

LOCK TABLES `instructor_vehicle` WRITE;
/*!40000 ALTER TABLE `instructor_vehicle` DISABLE KEYS */;
INSERT INTO `instructor_vehicle` VALUES (2,3,2),(3,4,4),(4,4,5);
/*!40000 ALTER TABLE `instructor_vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chat_id` int NOT NULL,
  `user_id` int NOT NULL,
  `text` varchar(500) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `chat_id` (`chat_id`),
  CONSTRAINT `messages_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `messages_ibfk_2` FOREIGN KEY (`chat_id`) REFERENCES `chats` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (1,2,3,'Добрый день! Вы сегодня будете на занятии?'),(2,2,5,'Здравствуйте. Да, но немного задержусь'),(3,2,3,'Хорошо'),(4,2,5,'Здравствуйте, когда следующее занятие?'),(25,2,2,'Привет, Сидор! Когда следующая встреча?'),(26,2,3,'Привет, Петр! Встреча в понедельник.'),(27,3,4,'Добрый вечер! Как прошел день?'),(28,3,1,'Все хорошо, спасибо. А у тебя?'),(29,3,4,'Отлично, спасибо за вопрос.'),(30,4,2,'Привет, Алексей! Мы можем встретиться?'),(31,4,4,'Да, Петр! Встречаемся в 6.00');
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'Администратор'),(2,'Лектор'),(3,'Инструктор'),(4,'Бухгалтер'),(5,'Курсант');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `student_groups`
--

DROP TABLE IF EXISTS `student_groups`;
/*!50001 DROP VIEW IF EXISTS `student_groups`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `student_groups` AS SELECT 
 1 AS `student_id`,
 1 AS `student_name`,
 1 AS `student_role`,
 1 AS `study_group`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `study_groups`
--

DROP TABLE IF EXISTS `study_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `study_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study_groups`
--

LOCK TABLES `study_groups` WRITE;
/*!40000 ALTER TABLE `study_groups` DISABLE KEYS */;
INSERT INTO `study_groups` VALUES (1,'B-1 Дневная');
/*!40000 ALTER TABLE `study_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `full_name` varchar(50) NOT NULL,
  `phone_number` varchar(11) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_number` (`phone_number`),
  UNIQUE KEY `unique_phone_number` (`phone_number`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Иванов Иван Иванович','89011234567','ivanov@mail.ru','2024-12-04 01:06:09'),(2,2,'Петров Петр Петрович','89015249021',NULL,'2024-12-04 01:06:09'),(3,3,'Сидоров Сидор Сидорович','89019876543','sidorov@mail.ru','2024-12-04 01:06:09'),(4,3,'Кузнецов Алексей Викторович','89019876513','sidorov@mail.ru','2024-12-04 01:10:06'),(5,5,'Смирнова Мария Вадимовна','89019616513',NULL,'2024-12-04 01:06:09'),(6,5,'Смирнова Екатерина Вадимовна','89014616513',NULL,'2024-12-04 01:06:09'),(7,5,'Горшенев Михаил Юрьевич','89114616513','gorshok@mail.ru','2024-12-04 01:06:09'),(12,1,'Иванов Иван Иванович','89011234560','ivanov@mail.ru','2024-12-04 01:06:09'),(13,2,'Петров Петр Петрович','89015249020','petrov@mail.ru','2024-12-04 01:06:09'),(14,3,'Сидоров Сидор Сидорович','89019876540','sidorov@mail.ru','2024-12-04 01:06:09'),(15,4,'Кузнецов Алексей Викторович','89019876510','kuznecov@mail.ru','2024-12-04 01:06:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp866 */ ;
/*!50003 SET character_set_results = cp866 */ ;
/*!50003 SET collation_connection  = cp866_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `update_user_last_updated` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
    SET NEW.last_updated = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `vehicle`
--

DROP TABLE IF EXISTS `vehicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vehicle_type_id` int NOT NULL,
  `registration_number` varchar(9) DEFAULT NULL,
  `date_of_registration` timestamp NULL DEFAULT NULL,
  `sts_number` varchar(10) DEFAULT NULL,
  `pts_number` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `vehicle_type_id` (`vehicle_type_id`),
  CONSTRAINT `vehicle_ibfk_1` FOREIGN KEY (`vehicle_type_id`) REFERENCES `vehicle_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle`
--

LOCK TABLES `vehicle` WRITE;
/*!40000 ALTER TABLE `vehicle` DISABLE KEYS */;
INSERT INTO `vehicle` VALUES (1,1,'А123ВС77','2024-09-19 21:00:00','1234567890','0987654321'),(2,2,'В456СД78','2024-09-20 21:00:00','2345678901','1987654320'),(3,3,'С789ДЕ79','2024-09-21 21:00:00','3456789012','2987654319'),(4,1,'Д012ЕФ80','2024-09-19 21:00:00','4567890123','3987654318'),(5,2,'Е345ФГ770','2024-09-20 21:00:00','5678901234','4987654317');
/*!40000 ALTER TABLE `vehicle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vehicle_type`
--

DROP TABLE IF EXISTS `vehicle_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vehicle_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_vehicle_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vehicle_type`
--

LOCK TABLES `vehicle_type` WRITE;
/*!40000 ALTER TABLE `vehicle_type` DISABLE KEYS */;
INSERT INTO `vehicle_type` VALUES (1,'A'),(2,'B'),(3,'C'),(4,'D');
/*!40000 ALTER TABLE `vehicle_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `student_groups`
--

/*!50001 DROP VIEW IF EXISTS `student_groups`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = cp866 */;
/*!50001 SET character_set_results     = cp866 */;
/*!50001 SET collation_connection      = cp866_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `student_groups` AS select `users`.`id` AS `student_id`,`users`.`full_name` AS `student_name`,`role`.`role` AS `student_role`,`study_groups`.`name` AS `study_group` from (((`users` join `role` on((`users`.`role_id` = `role`.`id`))) join `cadet_group` on((`cadet_group`.`cadet_id` = `users`.`id`))) join `study_groups` on((`cadet_group`.`study_group_id` = `study_groups`.`id`))) where (`role`.`role` = '���ᠭ�') */;
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

-- Dump completed on 2024-12-04  4:16:53
