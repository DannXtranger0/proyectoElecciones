CREATE DATABASE  IF NOT EXISTS `elecciones_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `elecciones_db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: elecciones_db
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `candidatos`
--

DROP TABLE IF EXISTS `candidatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidatos` (
  `id_candidato` int NOT NULL AUTO_INCREMENT,
  `nombre_candidato` varchar(100) DEFAULT NULL,
  `frase_candidato` text,
  PRIMARY KEY (`id_candidato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatos`
--

LOCK TABLES `candidatos` WRITE;
/*!40000 ALTER TABLE `candidatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `candidatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elecciones`
--

DROP TABLE IF EXISTS `elecciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elecciones` (
  `id_eleccion` int NOT NULL AUTO_INCREMENT,
  `nombre_eleccion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_eleccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elecciones`
--

LOCK TABLES `elecciones` WRITE;
/*!40000 ALTER TABLE `elecciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `elecciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos_candidatos`
--

DROP TABLE IF EXISTS `fotos_candidatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos_candidatos` (
  `id_imagen` int NOT NULL AUTO_INCREMENT,
  `id_candidato` int DEFAULT NULL,
  `ruta_imagen` text,
  PRIMARY KEY (`id_imagen`),
  KEY `id_candidato` (`id_candidato`),
  CONSTRAINT `fotos_candidatos_ibfk_1` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos_candidatos`
--

LOCK TABLES `fotos_candidatos` WRITE;
/*!40000 ALTER TABLE `fotos_candidatos` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotos_candidatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fotos_elecciones`
--

DROP TABLE IF EXISTS `fotos_elecciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fotos_elecciones` (
  `id_imagen` int NOT NULL AUTO_INCREMENT,
  `id_eleccion` int DEFAULT NULL,
  `ruta_imagen` text,
  PRIMARY KEY (`id_imagen`),
  KEY `id_eleccion` (`id_eleccion`),
  CONSTRAINT `fotos_elecciones_ibfk_1` FOREIGN KEY (`id_eleccion`) REFERENCES `elecciones` (`id_eleccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fotos_elecciones`
--

LOCK TABLES `fotos_elecciones` WRITE;
/*!40000 ALTER TABLE `fotos_elecciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `fotos_elecciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id_rol` int NOT NULL AUTO_INCREMENT,
  `nombre_rol` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Administrador'),(2,'Usuario');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `documento_usuario` varchar(11) DEFAULT NULL,
  `id_rol` int DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `documento_usuario` (`documento_usuario`),
  KEY `id_rol` (`id_rol`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_rol`) REFERENCES `roles` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'1123970378',1);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votos`
--

DROP TABLE IF EXISTS `votos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votos` (
  `id_voto` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_candidato` int DEFAULT NULL,
  `id_eleccion` int DEFAULT NULL,
  PRIMARY KEY (`id_voto`),
  KEY `id_candidato` (`id_candidato`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_eleccion` (`id_eleccion`),
  CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id_candidato`),
  CONSTRAINT `votos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`),
  CONSTRAINT `votos_ibfk_3` FOREIGN KEY (`id_eleccion`) REFERENCES `elecciones` (`id_eleccion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votos`
--

LOCK TABLES `votos` WRITE;
/*!40000 ALTER TABLE `votos` DISABLE KEYS */;
/*!40000 ALTER TABLE `votos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22 21:19:23
