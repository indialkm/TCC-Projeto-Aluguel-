-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: db_cati
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
-- Table structure for table `reservas`
--

DROP TABLE IF EXISTS `reservas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reservas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_inicio` date DEFAULT NULL,
  `data_fim` date DEFAULT NULL,
  `aluguel_id` int NOT NULL,
  `status` enum('pendente','confirmada','cancelada') DEFAULT 'pendente',
  `idEstoque` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `reservas_ibfk_1_idx` (`idEstoque`),
  KEY `reservas_ibfk_1` (`aluguel_id`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`aluguel_id`) REFERENCES `aluguel` (`idAluguel`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reservas`
--

LOCK TABLES `reservas` WRITE;
/*!40000 ALTER TABLE `reservas` DISABLE KEYS */;
INSERT INTO `reservas` VALUES (1,'2024-11-01','2024-11-10',31,'confirmada',1),(2,'2024-11-15','2024-11-20',32,'pendente',2),(3,'2024-10-10','2024-10-20',31,'confirmada',2),(4,'2024-12-01','2024-12-15',32,'pendente',3),(55,'2024-10-30','2024-11-02',95,'pendente',2),(56,'2025-05-03','2025-07-05',96,'pendente',1),(57,'2024-11-29','2024-11-30',97,'pendente',3),(58,'2024-11-29','2024-11-30',98,'pendente',3),(59,'2025-05-30','2025-07-17',99,'pendente',1),(60,'2024-11-01','2024-11-02',100,'pendente',4),(61,'2024-11-28','2024-11-29',101,'pendente',4),(62,'2024-11-28','2024-11-29',102,'pendente',4),(63,'2025-01-30','2025-01-31',103,'confirmada',1);
/*!40000 ALTER TABLE `reservas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-29 14:47:04
