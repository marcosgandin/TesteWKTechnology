CREATE DATABASE  IF NOT EXISTS `testewk` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `testewk`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: testewk
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_clientes` int NOT NULL,
  `cli_nome` varchar(100) NOT NULL,
  `cli_cidade` varchar(70) DEFAULT NULL,
  `cli_uf` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_clientes`),
  KEY `IDX_CLINOME` (`cli_nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Cliente 01','Florianópolis','SC'),(2,'Cliente 02','São José','SC'),(3,'Cliente 03','Biguaçu','SC'),(4,'Cliente 04','Palhoça','SC'),(5,'Cliente 05','Joinville','SC'),(6,'Cliente 06','Itajaí','SC'),(7,'Cliente 07','Chapecó','SC'),(8,'Cliente 08','Curitiba','PR'),(9,'Cliente 09','Foz do Iguaçu','PR'),(10,'Cliente 10','Londrina','PR'),(11,'Cliente 11','Florianópolis','SC'),(12,'Cliente 12','Porto Alegre','RS'),(13,'Cliente 13','Caxias do Sul','RS'),(14,'Cliente 14','Bento Gonçalves','RS'),(15,'Cliente 15','Gramado','RS'),(16,'Cliente 16','Canela','RS'),(17,'Cliente 17','Passo Fundo','RS'),(18,'Cliente 18','Florianópolis','SC'),(19,'Cliente 19','Florianópolis','SC'),(20,'Cliente 20','Florianópolis','SC');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_dados_gerais`
--

DROP TABLE IF EXISTS `pedidos_dados_gerais`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_dados_gerais` (
  `id_ped_dados_gerais` int NOT NULL,
  `pdg_dt_emissao` date NOT NULL,
  `pdg_vl_total` float NOT NULL,
  `id_clientes` int NOT NULL,
  PRIMARY KEY (`id_ped_dados_gerais`),
  KEY `fk_pedidos_dados_gerais_clientes_idx` (`id_clientes`),
  CONSTRAINT `fk_pedidos_dados_gerais_clientes` FOREIGN KEY (`id_clientes`) REFERENCES `clientes` (`id_clientes`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_dados_gerais`
--

LOCK TABLES `pedidos_dados_gerais` WRITE;
/*!40000 ALTER TABLE `pedidos_dados_gerais` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_dados_gerais` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedidos_produtos`
--

DROP TABLE IF EXISTS `pedidos_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos_produtos` (
  `id_pedidos_produtos` int NOT NULL AUTO_INCREMENT,
  `pedpro_quantidade` int NOT NULL,
  `pedpro_vlr_unitario` float NOT NULL,
  `pedpro_vlr_total` float NOT NULL,
  `id_ped_dados_gerais` int NOT NULL,
  `id_produtos` int NOT NULL,
  PRIMARY KEY (`id_pedidos_produtos`),
  KEY `fk_pedidos_produtos_pedidos_dados_gerais_idx` (`id_ped_dados_gerais`),
  KEY `fk_pedidos_produtos_produtos_idx` (`id_produtos`),
  CONSTRAINT `fk_pedidos_produtos_pedidos_dados_gerais` FOREIGN KEY (`id_ped_dados_gerais`) REFERENCES `pedidos_dados_gerais` (`id_ped_dados_gerais`),
  CONSTRAINT `fk_pedidos_produtos_produtos` FOREIGN KEY (`id_produtos`) REFERENCES `produtos` (`id_produtos`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedidos_produtos`
--

LOCK TABLES `pedidos_produtos` WRITE;
/*!40000 ALTER TABLE `pedidos_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedidos_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `id_produtos` int NOT NULL AUTO_INCREMENT,
  `pro_descricao` varchar(100) NOT NULL,
  `pro_vlr_venda` float NOT NULL,
  PRIMARY KEY (`id_produtos`),
  KEY `IDX_PRODESC` (`pro_descricao`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,'Produto 01',3.9),(2,'Produto 02',5.5),(3,'Produto 03',2),(4,'Produto 04',8.3),(5,'Produto 05',7.2),(6,'Produto 06',10.6),(7,'Produto 07',15.5),(8,'Produto 08',5),(9,'Produto 09',6.99),(10,'Produto 10',23.3),(11,'Produto 11',14.9),(12,'Produto 12',21.9),(13,'Produto 13',52.3),(14,'Produto 14',11.4),(15,'Produto 15',9.1),(16,'Produto 16',3.5),(17,'Produto 17',35.45),(18,'Produto 18',24.9),(19,'Produto 19',16.59),(20,'Produto 20',15.31);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'testewk'
--

--
-- Dumping routines for database 'testewk'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-13  9:41:52
