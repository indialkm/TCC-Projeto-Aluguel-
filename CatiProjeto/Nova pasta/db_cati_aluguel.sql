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
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluguel`
--

LOCK TABLES `aluguel` WRITE;
/*!40000 ALTER TABLE `aluguel` DISABLE KEYS */;
INSERT INTO `aluguel` VALUES (31,1,1,'pago','Rua Exemplo','123','Apto 45','Centro','SÃ£o Paulo','SP','01000-000','(11) 91234-5678','PrÃ³ximo Ã  praÃ§a central',NULL,NULL),(32,2,2,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(33,1,2,'pago',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(35,1,3,'pendente','Rua A','123','Apto 101','Bairro A','Cidade A','SP','12345-678','(11) 98765-4321','PrÃ³ximo ao mercado',150.50,10),(95,62,2,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1199.97,3),(96,63,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,18899.37,63),(97,64,3,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,249.99,1),(98,65,3,'pendente','teste','teste','teste','teste','teste','sp','te','teste','teste',249.99,1),(99,66,1,'pendente','Rua teste','31','perto da viela Teste','Jd Teste','SÃ£o Paulo','SP','00000000','111111111111','teste',14399.52,48),(100,67,4,'pendente','Rua teste','1234','Complemento teste','Jd.Teste','Teste','SP','0000000','12345678','teste',350.00,1),(101,68,4,'pendente','teste','teste','teste','teste','teste','te','teste','teste','teste',350.00,1),(102,69,4,'pendente','t','t','t','t','t','t','t','t','t',350.00,1),(103,70,1,'pendente','t','t','t','t','t','t','t','t','t',299.99,1),(104,71,1,'pendente','a','s','d','d','f','d','f','f','f',599.98,2),(105,72,1,'pendente','teste','12','teste','teste','teste','SP','111111111','111111111','1111111',1799.94,6),(106,73,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,27299.09,91),(107,74,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6899.77,23),(108,75,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6899.77,23),(109,76,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6599.78,22),(110,77,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6599.78,22),(111,78,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6599.78,22),(112,79,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6599.78,22),(113,80,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6599.78,22),(114,81,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,6599.78,22),(115,82,4,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2450.00,7),(116,83,4,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2450.00,7),(117,84,4,'pendente','Estrada Velha Guarulhos-SÃ£o Miguel','3212','teste','Jardim Arapongas','Guarulhos','SP','07210250','1199999','12',2450.00,7),(118,86,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4499.85,15),(119,85,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4499.85,15),(120,87,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4499.85,15),(121,88,1,'pendente',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4499.85,15),(122,89,1,'pendente','Estrada Velha Guarulhos-SÃ£o Miguel','3212','LOTE 12','Jardim Arapongas','Guarulhos','SP','07210250','11987572',' 12',4499.85,15),(123,90,4,'pendente','Estrada Velha Guarulhos-SÃ£o Miguel','3212',' ','Jardim Arapongas','Guarulhos','SP','07210250','11898989',' ',4900.00,14),(124,91,4,'pendente','Estrada Velha Guarulhos-SÃ£o Miguel','3212','lote','Jardim Arapongas','Guarulhos','SP','07210250','11987572651','casa amarela',2450.00,7),(125,92,1,'pendente','Estrada Velha Guarulhos-SÃ£o Miguel','3212','Estacionamento','Jardim Arapongas','Guarulhos','SP','07210250','11986409927','Shopping X',3299.89,11),(126,93,1,'pendente','Estrada Velha Guarulhos-SÃ£o Miguel','91','Estacionamento','Jardim Arapongas','Guarulhos','SP','07210250','1199','Shopping x',2399.92,8);
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

-- Dump completed on 2024-12-12 15:00:38
