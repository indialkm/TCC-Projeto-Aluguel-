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
-- Table structure for table `aluguel`
--

DROP TABLE IF EXISTS `aluguel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `aluguel` (
  `idAluguel` int NOT NULL AUTO_INCREMENT,
  `idPedido` int NOT NULL,
  `idEstoque` int NOT NULL,
  `status` enum('pendente','pago','cancelado') NOT NULL DEFAULT 'pendente',
  `entregaendereco` varchar(100) DEFAULT NULL,
  `entregaNumero` varchar(10) DEFAULT NULL,
  `entregaCompl` varchar(300) DEFAULT NULL,
  `entregaBairro` varchar(100) DEFAULT NULL,
  `entregaCidade` varchar(50) DEFAULT NULL,
  `entregaUF` varchar(2) DEFAULT NULL,
  `entregaCEP` varchar(9) DEFAULT NULL,
  `entregaTelefone` varchar(15) DEFAULT NULL,
  `entregaRefer` varchar(255) DEFAULT NULL,
  `valorTotal` decimal(12,2) DEFAULT NULL,
  `diasAluguel` int DEFAULT NULL,
  PRIMARY KEY (`idAluguel`),
  KEY `idEstoque` (`idEstoque`),
  KEY `aluguelitem_ibfk_2` (`idPedido`),
  CONSTRAINT `aluguel_ibfk_1` FOREIGN KEY (`idEstoque`) REFERENCES `estoque` (`idEstoque`),
  CONSTRAINT `aluguel_ibfk_2` FOREIGN KEY (`idPedido`) REFERENCES `pedido` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluguel`
--

LOCK TABLES `aluguel` WRITE;
/*!40000 ALTER TABLE `aluguel` DISABLE KEYS */;
INSERT INTO `aluguel` VALUES (31,1,1,'pago','Rua Exemplo','123','Apto 45','Centro','SÃ£o Paulo','SP','01000-000','(11) 91234-5678','PrÃ³ximo Ã  praÃ§a central',NULL,NULL),(32,2,2,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,1,2,'pago',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,1,3,'pendente','Rua A','123','Apto 101','Bairro A','Cidade A','SP','12345-678','(11) 98765-4321','PrÃ³ximo ao mercado',150.50,10),(95,62,2,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1199.97,3),(96,63,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18899.37,63),(97,64,3,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,249.99,1),(98,65,3,'pendente','teste','teste','teste','teste','teste','sp','te','teste','teste',249.99,1),(99,66,1,'pendente','Rua teste','31','perto da viela Teste','Jd Teste','SÃ£o Paulo','SP','00000000','111111111111','teste',14399.52,48),(100,67,4,'pendente','Rua teste','1234','Complemento teste','Jd.Teste','Teste','SP','0000000','12345678','teste',350.00,1),(101,68,4,'pendente','teste','teste','teste','teste','teste','te','teste','teste','teste',350.00,1),(102,69,4,'pendente','t','t','t','t','t','t','t','t','t',350.00,1),(103,70,1,'pendente','t','t','t','t','t','t','t','t','t',299.99,1);
/*!40000 ALTER TABLE `aluguel` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-29 14:47:03
