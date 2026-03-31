-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: student_mn_project
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorities` (
  `user_id` int NOT NULL,
  `role` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`,`role`),
  KEY `FKbkojx02x1ivd086sjrtkl2u9r` (`role`),
  CONSTRAINT `FKbkojx02x1ivd086sjrtkl2u9r` FOREIGN KEY (`role`) REFERENCES `role` (`name`),
  CONSTRAINT `FKk91upmbueyim93v469wj7b2qh` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES (4,'ROLE_ADMIN'),(3,'ROLE_NURSE'),(1,'ROLE_PARENT'),(5,'ROLE_STUDENT'),(2,'ROLE_TEACHER'),(9,'ROLE_USER'),(11,'ROLE_USER'),(12,'ROLE_USER');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `class`
--

DROP TABLE IF EXISTS `class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `class` (
  `id_class` int NOT NULL AUTO_INCREMENT,
  `grade` int DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `year` varchar(255) DEFAULT NULL,
  `id_school` int DEFAULT NULL,
  `id_teacher` int DEFAULT NULL,
  PRIMARY KEY (`id_class`),
  UNIQUE KEY `UKlf6jvlo0ko2l91bfyeboakq85` (`id_teacher`),
  KEY `FKh8cniqsdpt2y7l12kj8gj2s2s` (`id_school`),
  CONSTRAINT `FK6bvc5kk62dbp5a0oy874xw4b2` FOREIGN KEY (`id_teacher`) REFERENCES `employee` (`id_employee`),
  CONSTRAINT `FKh8cniqsdpt2y7l12kj8gj2s2s` FOREIGN KEY (`id_school`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `class`
--

LOCK TABLES `class` WRITE;
/*!40000 ALTER TABLE `class` DISABLE KEYS */;
INSERT INTO `class` VALUES (1,1,'1A','2025-2026',1,1),(2,3,'3C','2025-2026',1,3),(3,2,'2D','2023-2024',2,5),(4,5,'5D','2025-2026',2,6),(5,6,'6A1','2025-2026',3,7),(6,9,'9A2','2025-2026',3,9),(7,10,'10A2','2025-2026',4,11),(8,11,'11A3','2025-2026',4,12),(9,12,'12A5','2025-2026',5,13),(21,12,'12A2','2025-2026',12,NULL),(24,7,'7B5','2025-2026',3,NULL),(25,6,'6C5','2025-2026',3,NULL);
/*!40000 ALTER TABLE `class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `id_employee` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `id_school` int DEFAULT NULL,
  PRIMARY KEY (`id_employee`),
  KEY `FKqti28b9sa9r8sgulpyg00v4r4` (`id_school`),
  CONSTRAINT `FKqti28b9sa9r8sgulpyg00v4r4` FOREIGN KEY (`id_school`) REFERENCES `school` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'ngocmy@gmail.com','Mỹ','Hà Ngọc','033 2910','Giáo viên',1),(2,'tohoa@gmail.com','Hoa','Trịnh Tố','033 2011','Y tế',1),(3,'xuanmai@gmail.com','Mai','Nguyễn Xuân','033 2112','Giáo viên',1),(4,'tranha@gmail.com','Hạ','Trần','033 2213','Hành chính',2),(5,'minhngoc@gmail.com','Minh Ngọc','Trần','033 3250','Giáo viên',2),(6,'tuancuong@gmail.com','Cường','Lý Tuấn','033 2415','Giáo viên',2),(7,'binhduong@gmail.com','Dương','Nguyễn Bình ','033 2516','Giáo viên',3),(8,'ngocha@gmail.com','Hà','Lê Ngọc','033 2617','Hành chính',3),(9,'yennhi@gmail.com','Nhi','Lê Yến','033 2718','Giáo viên',3),(10,'quynhmai@gmail.com','Mai','Nguyễn Quỳnh','033 2819','Y tế',4),(11,'phioanh@gmail.com','Oanh','Võ Phi','033 2920','Giáo viên',4),(12,'khanhvy@gmail.com','Vy','Võ Khánh','033 2021','Giáo viên',4),(13,'nhuquynh@gmail.com','Quỳnh','Huỳnh Như','033 2122','Giáo viên',5),(14,'tuyetnghi@gmail.com','Nghi','Huỳnh Tuyết','033 2223','Y tế',5),(15,'minhtriet@gmail.com','Triết','Nguyễn Minh','033 2314','Giáo viên',5),(16,'haanh@gmail.com','Hạ Anh','Lê','033 2920','Giáo viên',4),(18,'congtru@gmail.com','Công Trứ','Nguyễn','035 1893','Giáo viên',NULL),(19,'ngocson@gmail.com','Ngọc Sơn','Trần Nguyễn','0355 2874','Hành chính',NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parent`
--

DROP TABLE IF EXISTS `parent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parent` (
  `id_parent` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_parent`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parent`
--

LOCK TABLES `parent` WRITE;
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` VALUES (1,'huuluan@gmail.com','Luận','Trần Hữu','0142 3124'),(2,'trungthien@gmail.com','Thiên','Thái Trung','0142 3225'),(3,'myan@gmail.com','Mỹ An','Trần Đào','0142 0808'),(5,'ngochue@gmail.com','Huệ','Nguyễn Ngọc','0142 3528'),(6,'tontran@gmail.com','Trân','Huỳnh Tôn','0142 3629'),(7,'haiphuc@gmail.com','Phúc','Lê Hải','0142 3730'),(8,'minhthu@gmail.com','Thư','Nguyễn Minh','0142 3831'),(9,'thaongan@gmail.com','Ngân','Trịnh Thảo','0142 3932'),(10,'thuyvi@gmail.com','Vi','Nguyễn Thúy','0142 4033'),(11,'minhquang@gmail.com','Quang','Trần Minh','0142 4134'),(12,'trithuc@gmail.com','Thức','Trần Trí','0142 4235'),(13,'hoanglong@gmail.com','Long','Trần Hoàng','0142 4336'),(14,'thanhquoc@gmail.com','Quốc','Trần Thanh','0142 4437'),(15,'myxuyen@gmail.com','Xuyên','Nguyễn Mỹ','0142 4538'),(16,'uyenthy@gmail.com','Thy','Trần Uyên','0142 4639'),(17,'trucngan@gmail.com','Ngân','Trần Trúc','0142 4740'),(18,'nhathoa@gmail.com','Hòa','Trương Nhật','0142 4841'),(19,'myanh@gmail.com','Mỹ Anh','Trần','0142 7474'),(20,'hoangminh@gmail.com','Hoàng Minh','Nguyễn','0142 6565'),(21,'kimnhung@gmail.com','Kim Nhung','Trần','0142 3215');
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report_card`
--

DROP TABLE IF EXISTS `report_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_card` (
  `id_card` int NOT NULL AUTO_INCREMENT,
  `gpa` double DEFAULT NULL,
  `comment_of_teacher` varchar(255) DEFAULT NULL,
  `conduct` varchar(255) DEFAULT NULL,
  `semester` varchar(255) DEFAULT NULL,
  `id_student` int DEFAULT NULL,
  PRIMARY KEY (`id_card`),
  UNIQUE KEY `UKeujwgvwjtvijmkan1gt9h9qgf` (`id_student`),
  CONSTRAINT `FK9g8v9p92icq2bn5c0hqbndhis` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_card`
--

LOCK TABLES `report_card` WRITE;
/*!40000 ALTER TABLE `report_card` DISABLE KEYS */;
INSERT INTO `report_card` VALUES (1,9.5,'Good','Good','1',31),(2,10,'Very Good','Very Good','1',32),(3,8.5,'Good','Good','1',33),(4,8,'Good','Good','1',34),(5,9.25,'Very Good','Very Good','1',35),(6,9.75,'Good','Good','1',36),(7,8.25,'Good','Very Good','1',37),(8,8.75,'Good','Good','1',38),(9,10,'Very Good','Good','1',39),(10,9.5,'Good','Very Good','1',40),(11,9,'Good','Good','1',41),(12,8.5,'Very Good','Good','1',42),(13,9.25,'Good','Good','1',43),(14,9.75,'Good','Good','1',44),(15,8.25,'Very Good','Good','1',45),(16,8.75,'Good','Very Good','1',46),(17,8,'Very Good','Very Good','1',47),(18,9.5,'Good','Good','1',48),(19,10,'Good','Very Good','1',49),(20,9,'Very Good','Good','1',50),(21,8,'Good','Good','1',51),(22,9.5,'Good','Very Good','1',52),(23,8.5,'Good','Good','1',53),(24,8.75,'Very Good','Very Good','1',54),(25,9.25,'Good','Good','1',55),(27,9.5,'Very Good','Good','1',57),(28,9.75,'Good','Good','1',58),(29,9.25,'Good','Very Good','1',59),(30,9,'Good','Good','1',60),(31,9.5,'Good','Good','2',61),(32,9,'Good','Good','2',56);
/*!40000 ALTER TABLE `report_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('ROLE_ADMIN'),('ROLE_NURSE'),('ROLE_PARENT'),('ROLE_STUDENT'),('ROLE_TEACHER'),('ROLE_USER');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `school`
--

DROP TABLE IF EXISTS `school`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `school` (
  `id` int NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `principal` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `school`
--

LOCK TABLES `school` WRITE;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` VALUES (1,'Sóc Trăng','Tiểu học Kế Sách 1','0211 234','Trần Hùng'),(2,'Sóc Trăng','Tiểu học Kế Sách 2','0211 335','Trịnh Bằng'),(3,'Sóc Trăng','Trung học cơ sở Kế Sách','0211 436','Tô Tâm'),(4,'Hà Nội','Trung học phổ thông Phan Văn Hùng','0211 537','Nguyễn Phượng'),(5,'Sóc Trăng','Trung học phổ thông Thiều Văn Chỏi','0211 638','Đinh Nơi'),(11,'Bình Phước','Trung học phổ thông Tân Xuân','0211 739','Đào Thị Hường'),(12,'Cần Thơ','Trung học phổ thông Lê Văn Tám','0211 640','Trần Hòa Bình'),(13,'An Lạc Tây','Trung học cơ sở An Lạc Tây','039 7523','Trần Hoàng Luân'),(14,'Phú Lợi','Trung học nội trú Huỳnh Cương','033 2567','Sơn Nal');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `score_sheet`
--

DROP TABLE IF EXISTS `score_sheet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `score_sheet` (
  `id_sheet` int NOT NULL AUTO_INCREMENT,
  `date_of_test` date DEFAULT NULL,
  `score` double DEFAULT NULL,
  `id_student` int DEFAULT NULL,
  `id_subject` int DEFAULT NULL,
  PRIMARY KEY (`id_sheet`),
  KEY `FKk3a31fn022jjh9l68aaa6h0qr` (`id_student`),
  KEY `FKt7u631acyihn90se6y16wb8gv` (`id_subject`),
  CONSTRAINT `FKk3a31fn022jjh9l68aaa6h0qr` FOREIGN KEY (`id_student`) REFERENCES `student` (`id_student`),
  CONSTRAINT `FKt7u631acyihn90se6y16wb8gv` FOREIGN KEY (`id_subject`) REFERENCES `subject` (`id_subject`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `score_sheet`
--

LOCK TABLES `score_sheet` WRITE;
/*!40000 ALTER TABLE `score_sheet` DISABLE KEYS */;
INSERT INTO `score_sheet` VALUES (1,'2026-01-19',8.75,31,1),(2,'2026-01-20',8,32,3),(3,'2026-02-10',9.75,60,5),(4,'2025-09-11',9.5,45,1),(5,'2025-10-25',8.75,35,2),(6,'2025-12-19',9.25,56,1),(7,'2025-11-09',8,43,2),(8,'2026-03-18',8.5,38,5),(9,'2026-02-18',8.75,57,5),(10,'2026-01-30',9.25,57,3),(11,'2026-03-05',9.75,42,3),(12,'2026-03-19',9.5,33,1),(13,'2026-03-19',8,37,2);
/*!40000 ALTER TABLE `score_sheet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id_student` int NOT NULL AUTO_INCREMENT,
  `date_of_birth` date DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `id_class` int DEFAULT NULL,
  `id_parent` int DEFAULT NULL,
  PRIMARY KEY (`id_student`),
  KEY `FKshc46mdj0m904blhs6fduc9r2` (`id_class`),
  KEY `FK4xpwyqq4umosl8r5j0lni7rbe` (`id_parent`),
  CONSTRAINT `FK4xpwyqq4umosl8r5j0lni7rbe` FOREIGN KEY (`id_parent`) REFERENCES `parent` (`id_parent`),
  CONSTRAINT `FKshc46mdj0m904blhs6fduc9r2` FOREIGN KEY (`id_class`) REFERENCES `class` (`id_class`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (31,'2019-12-03','vana@gmail.com','A','Trần Văn',1,1),(32,'2019-11-05','vanb@gmail.com','B','Nguyễn Văn',1,2),(33,'2009-04-20','nvt@gmail.com','Tùng','Nguyễn Văn',9,3),(34,'2017-02-13','vand@gmail.com','D','Trịnh Văn',2,20),(35,'2017-11-19','nguyene@gmail.com','E','Trần Nguyễn',2,5),(36,'2017-07-25','hoangf@gmail.com','F','Nguyễn Hoàng',2,6),(37,'2018-01-01','vang@gmail.com','G','Vũ Văn',3,7),(38,'2018-03-17','minhh@gmail.com','H','Nguyễn Minh',3,8),(39,'2018-04-20','minhi@gmail.com','I','Võ Minh',3,9),(40,'2015-05-19','chauj@gmail.com','J','Hoàng Châu',4,10),(41,'2015-06-09','thik@gmail.com','K','Võ Thị',4,13),(42,'2015-07-17','vietl@gmail.com','L','Lê Việt',4,12),(43,'2014-08-24','vanm@gmail.com','M','Lê Văn',5,12),(44,'2014-09-27','thin@gmail.com','N','Trần Thị',5,14),(45,'2014-10-14','huuo@gmail.com','O','Đào Hữu',5,15),(46,'2011-11-20','vanp@gmail.com','P','Trương Văn',6,16),(47,'2011-12-24','daoq@gmail.com','Q','Trần Đào',6,17),(48,'2011-04-09','ngocr@gmail.com','R','Hoàng Ngọc',6,18),(49,'2010-05-01','vans@gmail.com','S','Đinh Văn',7,5),(50,'2010-04-30','thanht@gmail.com','T','Lý Thanh',7,19),(51,'2010-09-02','vanu@gmail.com','U','Kim Văn',7,2),(52,'2009-08-15','ngocv@gmail.com','V','Phan Ngọc',8,3),(53,'2009-06-05','ngocw@gmail.com','W','Trương Ngọc',8,16),(54,'2009-11-23','tuanx@gmail.com','X','Lý Tuấn',8,15),(55,'2008-03-18','ngocz@gmail.com','Z','Lý Ngọc',9,15),(56,'2008-02-21','minha@gmail.com','Â','Châu Minh',9,10),(57,'2008-10-02','phonga@gmail.com','Ă','Vũ Phong',9,11),(58,'2009-01-20','thanhe@gmail.com','Ê','Lê Thánh',8,12),(59,'2009-01-02','nhano@gmail.com','Ô','Trần Nhân',9,1),(60,'2009-07-19','phongo@gmail.com','Ơ','Vũ Phong',8,11),(61,'2011-05-30','vmp@gmail.com','Phong','Vũ Minh',6,20),(64,'2009-12-03','ngoctram@gmail.com','Ngọc Trâm','Đặng Nguyễn',NULL,NULL),(65,'2008-02-20','minhngoc@gmail.com','Minh Ngọc','Đặng Nguyễn',NULL,NULL),(66,'2009-01-12','kimngan@gmail.com','Kim Ngân','Trần Đặng',NULL,NULL);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id_subject` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_subject`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (1,'Sinh','45'),(2,'Ngữ văn','45'),(3,'Tiếng Anh','45'),(4,'Thể dục','30'),(5,'Tin học','30'),(6,'GDCD','30'),(7,'Lịch sử','30'),(8,'Địa lý','30'),(9,'Quốc phòng','30'),(10,'Khoa học','30'),(12,'Vật lý','30'),(13,'Hóa học','45');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `password` varchar(255) DEFAULT NULL,
  `enabled` bit(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('$2a$12$4bnr0.43W87ARqWd4Mb5XO7LGk7npddYI01W1rK8hTeeRpltfo71C',_binary '','huuluan@gmail.com','Hữu Luận','Trần ',1,'huuluan'),('$2a$12$a/V0neGJdREhRt3lvam7l.bqMotPmcGzkv/quXlMSvzgb9eV4MDq2',_binary '','ngocmy@gmail.com','Mỹ','Hà Ngọc',2,'ngocmy'),('$2a$12$ckGCy8zMqkgJrz88KIqCMe3f9w0eXJTqge6DgXRICIsfiZme2MW1m',_binary '','tohoa@gmail.com','Hoa','Trịnh Tố',3,'tohoa'),('$2a$12$Zd6/b2GPNqyMBDCxKtRPfONRwpfhHNMA7vw9szV9OWTba06VNhQaO',_binary '','tranha@gmail.com','Hạ','Trần',4,'tranha'),('$2a$12$QlLwG4E1ET70aIB2X6/1kuqWPtNr7lE6sVSf7bStug1a/avNIqORm',_binary '','vana@gmail.com','A','Trần Văn',5,'vana'),('$2a$10$QgGbCKobHtBEIHbuBSEqyO1Q/z4P9XB6GbBjeqhSHmLz/vCfnpkQ.',_binary '','congkhanh@gmail.com','Công Khanh','Huỳnh',9,'congkhanh'),('$2a$10$a.dd4o4Mg3YsTLqZp/HpZuwXo.h08CHU7bHGw4w6r98G9LIPXd9pW',_binary '','minhphong@gmail.com','Minh Phong','Vũ',11,'minhphong'),('$2a$10$9v435QhnngcH.yfobEjiBuM1lkCIlZbhI.8XZ7RGYtlpV2ipNEa3C',_binary '','minhchau@gmail.com','Minh Châu','Nguyễn',12,'minhchau');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'student_mn_project'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-31 10:49:55
