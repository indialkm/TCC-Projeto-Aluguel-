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
-- Table structure for table `equipamento`
--

DROP TABLE IF EXISTS `equipamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipamento` (
  `idEquipamento` int NOT NULL AUTO_INCREMENT,
  `idFornecedor` int NOT NULL,
  `nome` varchar(100) NOT NULL,
  `preco` decimal(10,2) NOT NULL,
  `marca` varchar(100) DEFAULT NULL,
  `modelo` varchar(100) DEFAULT NULL,
  `idCategoria` int DEFAULT NULL,
  `descricao` text NOT NULL,
  `unidadeMedida` varchar(15) DEFAULT NULL,
  `largura` decimal(10,3) DEFAULT NULL COMMENT '9999999.999',
  `altura` decimal(10,3) DEFAULT NULL COMMENT '9999999.999',
  `profundidade` decimal(10,3) DEFAULT NULL COMMENT '9999999.999',
  `peso` decimal(10,3) DEFAULT NULL COMMENT '9999999.999',
  `cor` varchar(7) DEFAULT NULL,
  `estadoConservacao` decimal(3,2) DEFAULT NULL,
  `foto` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`idEquipamento`),
  KEY `idCategoria` (`idCategoria`),
  KEY `idFornecedor` (`idFornecedor`),
  CONSTRAINT `equipamento_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categorias` (`idCategoria`),
  CONSTRAINT `equipamento_ibfk_2` FOREIGN KEY (`idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipamento`
--

LOCK TABLES `equipamento` WRITE;
/*!40000 ALTER TABLE `equipamento` DISABLE KEYS */;
INSERT INTO `equipamento` VALUES (1,1,'Tenda Pirâmide',299.99,'Marca X','Modelo Y',1,'Tenda pirâmide com calhas para eventos.','unidade',5.500,4.000,4.000,20.000,'#FFFFFF',0.85,'tenda-piramide-com-calhas.jpg'),(2,2,'Tenda Retangular',399.99,'Marca Z','Modelo W',2,'Tenda retangular resistente para casamentos.','unidade',6.000,3.500,5.000,25.000,'#FF5733',0.90,'tenda-retangular.jpg'),(3,1,'Tenda Redonda',249.99,'Marca X','Modelo Z',1,'Tenda redonda ideal para feiras.','unidade',4.000,3.000,3.000,15.000,'#0000FF',0.80,'tenda-redonda.jpg'),(4,2,'Tenda Quadrada',350.00,'Marca Y','Modelo V',2,'Tenda quadrada com alta resistência a intempéries.','unidade',4.500,4.500,4.500,18.000,'#FF0000',0.88,'tenda-quadrada.jpg');
/*!40000 ALTER TABLE `equipamento` ENABLE KEYS */;
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
