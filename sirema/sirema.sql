
CREATE DATABASE IF NOT EXISTS `sirema` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;


USE `sirema`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: sirema
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `anio_de_carrera`
--

DROP TABLE IF EXISTS `anio_de_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anio_de_carrera` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionAnioCarrera` varchar(5) DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anio_de_carrera`
--

LOCK TABLES `anio_de_carrera` WRITE;
/*!40000 ALTER TABLE `anio_de_carrera` DISABLE KEYS */;
INSERT INTO `anio_de_carrera` VALUES (1,'I',1),(2,'II',1),(3,'III',1),(4,'IV',1),(5,'V',1),(6,'VI',1),(7,'VII',1);
/*!40000 ALTER TABLE `anio_de_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anio_lectivo`
--

DROP TABLE IF EXISTS `anio_lectivo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `anio_lectivo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `AnioLectivo` int DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anio_lectivo`
--

LOCK TABLES `anio_lectivo` WRITE;
/*!40000 ALTER TABLE `anio_lectivo` DISABLE KEYS */;
INSERT INTO `anio_lectivo` VALUES (1,2023,0),(2,2024,1),(3,2025,0);
/*!40000 ALTER TABLE `anio_lectivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `areas_del_conocimiento`
--

DROP TABLE IF EXISTS `areas_del_conocimiento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `areas_del_conocimiento` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionAreaConocimiento` varchar(255) DEFAULT NULL,
  `Acronimo` varchar(30) DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `areas_del_conocimiento`
--

LOCK TABLES `areas_del_conocimiento` WRITE;
/*!40000 ALTER TABLE `areas_del_conocimiento` DISABLE KEYS */;
INSERT INTO `areas_del_conocimiento` VALUES (1,'Área del conocimiento de Ciencia de la Salud y Servicio Sociales','ACCSS',1),(2,'Área del Conocimiento de Educación, Arte y Humanidades','ACEAH',1),(3,'Área del conocimiento de Ciencias Económicas y Sociales','ACCES',1),(4,'Área del conocimiento de Ciencias y Tecnología','ACCT',1),(5,'Área del conocimiento de Ingeniería Industrial y Construcción.','ACIIC',1),(6,'Post - Grado y Educación Continua','PGEC',1);
/*!40000 ALTER TABLE `areas_del_conocimiento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionCarrera` varchar(255) DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  `AreasDelConocimiento_Id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Carrera_AreasDelConocimiento1_idx` (`AreasDelConocimiento_Id`),
  CONSTRAINT `fk_Carrera_AreasDelConocimiento1` FOREIGN KEY (`AreasDelConocimiento_Id`) REFERENCES `areas_del_conocimiento` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'Semestre Común',1,2),(2,'Licenciatura en Ciencias de la Educación con Mención en Ingles',1,2),(3,'Licenciatura en Ciencias de la Educación con Mención en Física - Matemática',1,2),(4,'Licenciatura en Ciencias de la Educación con Mención en Historia y Geografía',1,2),(5,'Licenciatura en Ciencias de la Educación con Mención en Ciencias Naturales',1,2),(6,'Licenciatura en Ciencias de la Educación con Mención en Educación Física, Deporte y Recreación',1,2),(7,'Licenciatura Administración de Empresas',1,3),(8,'Licenciatura Contaduría Publica y Finanzas',1,3),(9,'Licenciatura en Administración de Empresas Turísticas y Hoteleras',1,3),(10,'Licenciatura Administración de Puertos y Aeropuertos',1,3),(11,'Licenciatura en Derecho',1,3),(12,'Licenciatura en Ciencias Políticas con Mención en Gestión Autonómica',1,3),(13,'Licenciatura en Biología Marina',1,4),(14,'Ingeniería de Sistemas de Información',1,4),(15,'Técnico Superior en Diseño Grafico',1,4),(16,'Ingeniería Civil',1,5),(17,'Técnico Superior en Topografía',1,5),(18,'Medicina General',1,1),(19,'Licenciatura Enfermería Salud Comunitaria',1,1),(20,'Técnico Superior en Enfermería Profesional',1,1),(21,'Técnico Superior en Laboratorio Clínico',1,1),(22,'Licenciatura Enfermeria con mención en Obstetricia y Perinatologia',1,1),(23,'Maestría en Docencia Universitaria',1,6),(24,'Ingeniería Ambiental',1,4),(25,'Ingeniería en Zootecnia con Mención en Medicina Veterinaria',1,4),(26,'Técnico Superior Agropecuario',1,4),(27,'Ingeniería Agroforestal',1,4),(28,'Ingeniería  Agronómica',1,4),(29,'Técnico Superior en Construcción Civil',1,5),(30,'Licenciatura en Ecología de Recursos Naturales',1,4),(31,'Tecnico Superior en Electromecanica',1,4),(32,'Tecnico Superior en Geologia',1,4),(33,'Licenciatura en Ciencias de la Educación con Mención en Pedagogía Infantil',1,2),(35,'Licenciatura en Ciencias Ambientales',1,4),(36,'Técnico Superior en Cableado Estructurado de Redes',1,4),(45,'Tecnico Superior en Administración de Empresas con Mención en Marketing',1,3),(46,'Maestria en English As A Second Language',1,6),(47,'Maestria en Gerencia Estrategica',1,6),(48,'Ingeniería de Sistemas',1,4),(49,'Profesor de Educación Media con Mención en Ciencias Naturales',1,2),(50,'Profesor de Educación Media con Mención en Física - Matemática',1,2),(51,'Licenciatura en Ciencias Sociales con Mención en Historia y Geografía',1,2),(52,'Profesor de Educación Media con Mención en Historia y Geografía',1,2),(53,'Licenciatura en Ciencias de la Educación con Mención en Lengua y Literatura Hispánica',1,2),(54,'Profesor de Educación Media con Mención en Lengua y Literatura Hispánica',1,2),(55,'Licenciatura en Ciencias de la Educación con Mención en Matemática',1,2),(56,'Profesor de Educación Media con Mención en Pedagogía Infantil',1,2),(57,'Licenciatura en Ciencias de la Educación con Mención en Psicopedagogía',1,2),(58,'Profesor de Educación Media con Mención en Psicopedagogía',1,2),(59,'Profesor de Educación Media con Mención en Educación Física, Deporte y Recreación',1,2),(60,'Licenciatura en Turismo Sostenible',1,2),(61,'Licenciatura en Enfermería Gerencial',1,1),(62,'Enfermería Profesional',1,1),(63,'Licenciatura en Psicología',1,2),(64,'Ingeniería en Zootecnia',1,4),(65,'Técnico Superior en Acuicultura',1,4),(66,'Técnico Superior en Administración de Empresas',1,3),(67,'Técnico Superior en Administración de Empresas Turísticas y Hoteleras',1,3),(68,'Técnico Superior en Contaduría Pública y Finanzas',1,3),(69,'Técnico Superior en Agroforestal',1,4),(70,'Maestría en Contaduría con Énfasis en Auditoria',1,6),(71,'Maestría en Derecho Procesal',1,6),(72,'Maestría en Gestión Ambiental',1,6),(73,'Licenciatura en Teología',1,2);
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera_centro`
--

DROP TABLE IF EXISTS `carrera_centro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carrera_centro` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Centro_Id` int NOT NULL,
  `Carrera_Id` int NOT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `fk_CarreraCentro_Centro1_idx` (`Centro_Id`),
  KEY `fk_CarreraCentro_Carrera1_idx` (`Carrera_Id`),
  CONSTRAINT `fk_CarreraCentro_Carrera1` FOREIGN KEY (`Carrera_Id`) REFERENCES `carrera` (`Id`),
  CONSTRAINT `fk_CarreraCentro_Centro1` FOREIGN KEY (`Centro_Id`) REFERENCES `centro` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera_centro`
--

LOCK TABLES `carrera_centro` WRITE;
/*!40000 ALTER TABLE `carrera_centro` DISABLE KEYS */;
INSERT INTO `carrera_centro` VALUES (96,3,7,1),(97,3,45,1),(98,3,9,1),(99,3,10,1),(100,3,13,1),(101,3,36,1),(102,3,35,1),(103,3,5,1),(104,3,3,1),(105,3,4,1),(106,3,2,1),(107,3,12,1),(108,3,29,1),(109,3,8,1),(110,3,11,1),(111,3,50,1),(112,3,49,1),(113,3,52,1),(114,3,54,1),(115,3,56,1),(116,3,58,1),(117,3,59,1),(118,3,6,1),(119,3,51,1),(120,3,53,1),(121,3,55,1),(122,3,57,1),(123,3,33,1),(124,3,23,1),(125,3,30,1),(126,3,19,1),(127,3,22,1),(128,3,20,1),(129,3,46,1),(130,3,16,1),(131,3,48,1),(132,3,14,1),(133,3,21,1),(134,3,18,1),(135,3,17,1),(136,3,60,1),(137,3,47,1),(138,3,1,1),(139,3,61,1),(140,3,62,1),(141,3,15,1),(142,6,7,1),(143,6,9,1),(144,6,27,1),(145,6,28,1),(146,6,5,1),(147,6,49,1),(148,6,3,1),(149,6,50,1),(150,6,51,1),(151,6,4,1),(152,6,52,1),(153,6,55,1),(154,6,56,1),(155,6,33,1),(156,6,58,1),(157,6,57,1),(158,6,29,1),(159,6,8,1),(160,6,11,1),(161,6,23,1),(162,6,20,1),(163,6,14,1),(164,6,48,1),(165,6,25,1),(166,6,63,1),(167,6,64,1),(168,8,7,1),(169,8,9,1),(170,8,13,1),(171,8,2,1),(172,8,1,1),(173,8,8,1),(174,8,11,1),(175,8,20,1),(176,6,1,1),(177,8,65,1),(178,8,66,1),(179,8,67,1),(180,8,68,1),(181,26,7,0),(182,26,9,0),(183,26,67,0),(184,26,13,0),(185,26,5,1),(186,26,49,0),(187,26,3,0),(188,26,50,0),(189,26,2,0),(190,26,53,1),(191,26,54,0),(192,26,29,0),(193,26,11,0),(194,26,20,0),(195,26,14,0),(196,26,25,0),(198,7,7,1),(199,7,9,1),(200,7,67,1),(201,7,69,1),(202,7,13,1),(203,7,5,1),(204,7,49,1),(205,7,3,1),(206,7,50,1),(207,7,2,1),(208,7,53,1),(209,7,54,1),(210,7,29,1),(211,7,11,1),(212,7,20,1),(213,7,14,1),(214,7,25,1),(215,11,1,1),(216,11,7,1),(217,11,27,1),(218,11,28,1),(219,11,5,1),(220,11,49,1),(221,11,53,1),(222,11,54,1),(223,11,56,1),(224,11,33,1),(225,11,51,1),(226,11,52,1),(227,11,8,1),(228,11,11,1),(229,11,25,1),(230,11,64,1),(231,10,1,1),(232,10,7,1),(233,10,8,1),(234,10,11,1),(235,10,26,1),(236,10,20,1),(237,10,22,1),(238,10,5,1),(239,10,49,1),(240,10,3,1),(241,10,50,1),(242,10,4,1),(243,10,52,1),(244,10,54,1),(245,10,53,1),(246,9,7,1),(247,9,9,1),(248,9,27,1),(249,9,35,1),(250,9,29,1),(251,9,8,1),(252,9,11,1),(253,9,30,1),(254,9,32,1),(255,9,17,1),(256,9,14,1),(257,9,4,1),(258,9,52,1),(259,9,53,1),(260,9,54,1),(261,9,56,1),(262,9,33,1),(263,9,31,1),(264,5,1,1),(265,5,7,1),(266,5,9,1),(267,5,10,1),(268,5,27,1),(269,5,36,1),(270,5,12,1),(271,5,11,1),(272,5,8,1),(273,5,47,1),(274,5,24,1),(275,5,14,1),(276,5,48,1),(277,5,21,1),(278,5,62,1),(279,5,25,1),(280,5,64,1),(281,5,6,1),(282,5,59,1),(283,5,5,1),(284,5,49,1),(285,5,3,1),(286,5,50,1),(287,5,4,1),(288,5,52,1),(289,5,53,1),(290,5,54,1),(291,5,70,1),(292,5,71,1),(293,5,72,1),(294,5,73,1),(295,25,53,1),(296,25,33,1),(297,25,66,1),(298,25,29,1),(299,12,53,1),(300,12,33,1),(301,12,5,1),(302,12,4,1),(303,12,25,1),(304,12,17,1),(305,12,26,1),(306,26,55,1),(307,24,5,1),(308,24,3,1),(309,24,7,1),(310,24,8,1),(311,24,25,1);
/*!40000 ALTER TABLE `carrera_centro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro`
--

DROP TABLE IF EXISTS `centro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `centro` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionCentro` varchar(255) DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  `TipoDeCentro_Id` int NOT NULL,
  `Padre_Id` int DEFAULT NULL,
  `Comunidad_Id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Centro_TipoDeCentro_idx` (`TipoDeCentro_Id`),
  KEY `fk_Centro_Comunidad1_idx` (`Comunidad_Id`),
  CONSTRAINT `fk_Centro_Comunidad1` FOREIGN KEY (`Comunidad_Id`) REFERENCES `comunidad` (`Id`),
  CONSTRAINT `fk_Centro_TipoDeCentro` FOREIGN KEY (`TipoDeCentro_Id`) REFERENCES `tipo_de_centro` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro`
--

LOCK TABLES `centro` WRITE;
/*!40000 ALTER TABLE `centro` DISABLE KEYS */;
INSERT INTO `centro` VALUES (3,'Bluefields',1,1,0,1),(5,'Bilwi',1,2,0,23),(6,'El Rama',1,2,0,10),(7,'Laguna de Perlas',1,8,0,20),(8,'Corn Island',1,8,0,24),(9,'Bonanza',1,2,0,25),(10,'Waspam',1,8,0,26),(11,'Paiwas',1,8,0,27),(12,'La Cruz',1,6,3,6),(13,'Sahsa (Tasba Pri)',1,6,5,8),(14,'Santa Marta (Twi Yahbra)',1,6,5,9),(15,'El Rama',1,6,6,10),(16,'Muelle de los Buelles',1,6,6,11),(17,'Macnolia',1,6,6,12),(18,'Cooperna',1,6,9,13),(19,'Españolina',1,6,9,14),(20,'Sakalwas',1,6,9,15),(21,'Wasaking',1,6,9,16),(22,'Francia Sirpi',1,6,10,17),(23,'Awastigni (Amasau)',1,6,10,18),(24,'Ubu Norte',1,6,11,19),(25,'Karawala',1,6,3,21),(26,'Laguna de Perlas',1,6,7,20);
/*!40000 ALTER TABLE `centro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `centro_hijos`
--

DROP TABLE IF EXISTS `centro_hijos`;
/*!50001 DROP VIEW IF EXISTS `centro_hijos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `centro_hijos` AS SELECT 
 1 AS `Id`,
 1 AS `DescripcionCentro`,
 1 AS `Estado`,
 1 AS `DescripcionTipoCentro`,
 1 AS `DescripcionComunidad`,
 1 AS `TipoCentro`,
 1 AS `Padre`,
 1 AS `Padre_Id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `centro_padres`
--

DROP TABLE IF EXISTS `centro_padres`;
/*!50001 DROP VIEW IF EXISTS `centro_padres`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `centro_padres` AS SELECT 
 1 AS `Id`,
 1 AS `DescripcionCentro`,
 1 AS `Estado`,
 1 AS `DescripcionTipoCentro`,
 1 AS `DescripcionComunidad`,
 1 AS `TipoCentro`,
 1 AS `Padre`,
 1 AS `Padre_Id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `centros_todos`
--

DROP TABLE IF EXISTS `centros_todos`;
/*!50001 DROP VIEW IF EXISTS `centros_todos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `centros_todos` AS SELECT 
 1 AS `Id`,
 1 AS `DescripcionCentro`,
 1 AS `Estado`,
 1 AS `DescripcionTipoCentro`,
 1 AS `DescripcionComunidad`,
 1 AS `TipoCentro`,
 1 AS `Padre`,
 1 AS `Padre_Id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comunidad`
--

DROP TABLE IF EXISTS `comunidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunidad` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionComunidad` varchar(150) DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  `Municipio_Id` int NOT NULL,
  `latitud` float DEFAULT '0',
  `longitud` float DEFAULT '0',
  PRIMARY KEY (`Id`),
  KEY `fk_Comunidad_Municipio1_idx` (`Municipio_Id`),
  CONSTRAINT `fk_Comunidad_Municipio1` FOREIGN KEY (`Municipio_Id`) REFERENCES `municipio` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunidad`
--

LOCK TABLES `comunidad` WRITE;
/*!40000 ALTER TABLE `comunidad` DISABLE KEYS */;
INSERT INTO `comunidad` VALUES (1,'Bluefields',1,1,12.0057,-83.7707),(6,'La Cruz',1,2,13.1129,-84.1886),(8,'Sahsa (Tasba Pri)',1,3,0,0),(9,'Santa Marta (Twi Yahbra)',1,3,0,0),(10,'El Rama',1,4,12.1638,-84.2106),(11,'Muelle de los Buelles',1,4,12.0693,-84.5354),(12,'Macnolia',1,4,12.1009,-84.0629),(13,'Cooperna',1,5,0,0),(14,'Españolina',1,5,0,0),(15,'Sakalwas',1,5,0,0),(16,'Wasaking',1,5,0,0),(17,'Francia Sirpi',1,6,0,0),(18,'Awastigni (Amasau)',1,6,0,0),(19,'Ubu Norte',1,7,0,0),(20,'Laguna de Perlas',1,8,12.3179,-83.6782),(21,'Karawala',1,2,12.9276,-83.5765),(23,'Bilwi',1,3,14.0546,-83.4202),(24,'Corn Island',1,9,12.17,-83.0562),(25,'Bonanza',1,5,14.0383,-84.6188),(26,'Waspam',1,6,14.7448,-83.9684),(27,'Paiwas',1,7,12.7873,-85.123);
/*!40000 ALTER TABLE `comunidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_registro_matricula`
--

DROP TABLE IF EXISTS `detalle_registro_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_registro_matricula` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `registro_matricula_id` int NOT NULL,
  `anio_carrera_id` int NOT NULL,
  `modalidad_id` int NOT NULL,
  `grupo_id` int NOT NULL DEFAULT '1',
  `turno_id` int NOT NULL DEFAULT '1',
  `cantidad_femenino` int DEFAULT NULL,
  `cantidad_masculino` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `registro_matricula_id_idx` (`registro_matricula_id`),
  KEY `anio_carrera_id_idx` (`anio_carrera_id`),
  KEY `modalidad_id_idx` (`modalidad_id`),
  CONSTRAINT `anio_carrera_id` FOREIGN KEY (`anio_carrera_id`) REFERENCES `anio_de_carrera` (`Id`),
  CONSTRAINT `modalidad_id` FOREIGN KEY (`modalidad_id`) REFERENCES `modalidad` (`Id`),
  CONSTRAINT `registro_matricula_id` FOREIGN KEY (`registro_matricula_id`) REFERENCES `registro_matricula` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_registro_matricula`
--

LOCK TABLES `detalle_registro_matricula` WRITE;
/*!40000 ALTER TABLE `detalle_registro_matricula` DISABLE KEYS */;
INSERT INTO `detalle_registro_matricula` VALUES (1,1,1,1,1,1,50,150);
/*!40000 ALTER TABLE `detalle_registro_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etnia`
--

DROP TABLE IF EXISTS `etnia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `etnia` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionEtnia` varchar(45) DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etnia`
--

LOCK TABLES `etnia` WRITE;
/*!40000 ALTER TABLE `etnia` DISABLE KEYS */;
INSERT INTO `etnia` VALUES (1,'Mestizo',1),(2,'Garifuna',1),(3,'Creole',1),(4,'Rama',1),(5,'Mayagna',1),(6,'Miskitu',1),(7,'Matagalpa',1),(8,'Xiu',1),(9,'Nahao',1),(10,'Chorotega',1);
/*!40000 ALTER TABLE `etnia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones`
--

DROP TABLE IF EXISTS `funciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Controller` varchar(60) DEFAULT NULL,
  `Accion` varchar(45) DEFAULT NULL,
  `Acronimo` varchar(30) DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones`
--

LOCK TABLES `funciones` WRITE;
/*!40000 ALTER TABLE `funciones` DISABLE KEYS */;
INSERT INTO `funciones` VALUES (1,'Tipo Centro','index','TPCIN',1),(2,'Tipo Centro','create','TPCCR',1),(3,'Tipo Centro','update','TPCUP',1),(4,'Tipo Centro','cambiar estado','TPCCHS',1),(5,'Centros','index','CENIN',1),(6,'Centros','create','CENCR',1),(7,'Centros','update','CENUP',1),(8,'Centros','change state','CENCHS',1),(9,'Municipios','index','MUNIN',1),(10,'Municipios','create','MUNCR',1),(11,'Municipios','update','MUNUP',1),(12,'Municipios','change state','MUNCHS',1),(13,'Comunidades','index','COMIN',1),(14,'Comunidades','create','COMCR',1),(15,'Comunidades','update','COMUP',1),(16,'Comunidades','change state','COMCHS',1),(17,'Turnos','index','TURIN',1),(18,'Turnos','create','TURCR',1),(19,'Turnos','update','TURUP',1),(20,'Turnos','chage state','TURCHS',1),(21,'Grupos','index','GRPIN',1),(22,'Grupos','create','GRPCR',1),(23,'Grupos','update','GRPUP',1),(24,'Grupos','chage state','GRPCHS',1),(25,'Registros Matriculado','index','MATRIN',1),(26,'Registros Matriculado','create','MATRCR',1),(27,'Registros Matriculado','change state','MATRCHS',1),(28,'reporterTipoIngrSECE/CUR','ver','TPSECUEX',1),(29,'reporteIngresoUnicam','ver','TPINGUNIC',1),(30,'reporte Consolidado Centro','ver','CONSCEN',1),(31,'reporte Area Conocimiento','ver','REAREACON',1),(32,'Consolidado BICU-CNU','ver','CONSOBICCEN',1),(33,'Tipo Modalidad CNU','index','TMCNUIN',1),(34,'Tipo Modalidad CNU','create','TMCNUCR',1),(35,'Tipo Modalidad CNU','update','TMCNUUP',1),(36,'Tipo Modalidad CNU','change state','TMCNUCHS',1),(37,'Areas del Conocimiento','index','ARCIN',1),(38,'Areas del Conocimiento','create','ARCCR',1),(39,'Areas del Conocimiento','update','ARCUP',1),(40,'Areas del Conocimiento','change state','ARCCHS',1),(41,'Carrera','index','CARIN',1),(42,'Carrera','create','CARCR',1),(43,'Carrera','update','CARUP',1),(44,'Carrera','change state','CARCHS',1),(45,'Modalidad','index','MODIN',1),(46,'Modalidad','create','MODCR',1),(47,'Modalidad','update','MODUP',1),(48,'Modalidad','change state','MODCHS',1),(49,'Tipo de Ingreso','index','TININ',1),(50,'Tipo de Ingreso','create','TINCR',1),(51,'Tipo de Ingreso','update','TINUP',1),(52,'Tipo de Ingreso','change state','TINCHS',1),(53,'Semestre','index','SEMIN',1),(54,'Semestre','create','SEMCR',1),(55,'Semestre','update','SEMUP',1),(56,'Semestre','change state','SEMCHS',1),(57,'Anio de Carrera','index','ANCIN',1),(58,'Anio de Carrera','create','ANCCR',1),(59,'Anio de Carrera','update','ANCUP',1),(60,'Anio de Carrera','change state','ANCCHS',1),(61,'Anios Lectivos','index','ANLIN',1),(62,'Anios Lectivos','create','ANLCR',1),(63,'Anios Lectivos','update','ANLUP',1),(64,'Anios Lectivos','change state','ANLCHS',1),(65,'Funciones','index','FUNIN',1),(66,'Funciones','create','FUNCR',1),(67,'Funciones','update','FUNUP',1),(68,'Funciones','change state','FUNCHS',1),(69,'Enlaces','index','ENLIN',1),(70,'Enlaces','create','ENLCR',1),(71,'Enlaces','update','ENLUP',1),(72,'Enlaces','change state','ENLCHS',1),(73,'Usuarios','index','USIN',1),(74,'Usuarios','create','USCR',1),(75,'Usuarios','update','USUP',1),(76,'Usuarios','change state','USCHS',1),(77,'Carreras Centro','index','CACEIN',1),(78,'Carreras Centro','create','CACECR',1),(79,'Carreras Centro','update','CACEUP',1),(80,'Carreras Centro','change state','CACECHS',1),(81,'Funciones Usuario','index','FUUSIN',1),(82,'Funciones Usuario','create','FUUSCR',1),(83,'Funciones Usuario','update','FUUSUP',1),(84,'Funciones Usuario','change state','FUUSCHS',1),(85,'Menu Usuario','index','MEUSIN',1),(86,'Menu Usuario','create','MEUSCR',1),(87,'Menu Usuario','update','MEUSUP',1),(88,'Menu Usuario','change state','MEUSCHS',1);
/*!40000 ALTER TABLE `funciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funciones_usuario`
--

DROP TABLE IF EXISTS `funciones_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funciones_usuario` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Funciones_Id` int NOT NULL,
  `Usuarios_Id` int NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `fk_Funciones_has_Usuarios_Usuarios1_idx` (`Usuarios_Id`),
  KEY `fk_Funciones_has_Usuarios_Funciones1_idx` (`Funciones_Id`),
  CONSTRAINT `fk_Funciones_has_Usuarios_Funciones1` FOREIGN KEY (`Funciones_Id`) REFERENCES `funciones` (`Id`),
  CONSTRAINT `fk_Funciones_has_Usuarios_Usuarios1` FOREIGN KEY (`Usuarios_Id`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funciones_usuario`
--

LOCK TABLES `funciones_usuario` WRITE;
/*!40000 ALTER TABLE `funciones_usuario` DISABLE KEYS */;
INSERT INTO `funciones_usuario` VALUES (2,2,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(3,3,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(7,1,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(8,4,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(13,5,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(14,6,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(15,7,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(16,8,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(17,9,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(18,10,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(19,11,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(20,12,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(21,13,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(22,14,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(23,15,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(24,16,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(25,17,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(26,18,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(27,19,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(28,20,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(29,21,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(30,22,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(31,23,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(32,24,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(33,25,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(34,26,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(35,27,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(36,28,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(37,29,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(38,30,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(39,31,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(40,32,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(41,33,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(42,34,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(43,35,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(44,36,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(45,37,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(46,38,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(47,39,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(48,40,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(49,41,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(50,42,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(51,43,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(52,44,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(53,45,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(54,46,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(55,47,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(56,48,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(57,49,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(58,50,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(59,51,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(60,52,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(61,53,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(62,54,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(63,55,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(64,56,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(65,57,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(66,58,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(67,59,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(68,60,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(69,61,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(70,62,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(71,63,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(72,64,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(73,65,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(74,66,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(75,67,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(76,68,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(77,69,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(78,70,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(79,71,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(80,72,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(81,73,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(82,74,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(83,75,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(84,76,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(85,77,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(86,78,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(87,79,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(88,80,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(89,81,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(90,82,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(91,83,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(92,84,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(93,85,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(94,86,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(95,87,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1),(96,88,3,'2026-01-01 01:01:00','2026-12-01 01:01:00',1);
/*!40000 ALTER TABLE `funciones_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupos`
--

DROP TABLE IF EXISTS `grupos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grupos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionGrupo` varchar(3) DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupos`
--

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;
INSERT INTO `grupos` VALUES (1,'A',1),(2,'B',1),(3,'C',1),(4,'D',1);
/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TextoMostrar` varchar(60) DEFAULT NULL,
  `Modulo` varchar(60) DEFAULT NULL,
  `IconoModulo` varchar(45) DEFAULT NULL,
  `Accion` varchar(40) DEFAULT NULL,
  `IconoAccion` varchar(45) DEFAULT NULL,
  `Estado` tinyint DEFAULT NULL,
  `PadreId` int DEFAULT NULL,
  `Orden` int DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Administracion','','fas fa-cog','',NULL,1,0,1),(2,'Enlaces','admin_urls',NULL,'index',NULL,1,1,1),(3,'Usuarios','admin_users',NULL,'index',NULL,1,1,2),(5,'Catalogos',NULL,'fas fa-bars',NULL,NULL,1,0,2),(6,'Tipo de Centro','catalogo_tipocentros',NULL,'index',NULL,1,5,1),(7,'Centro','catalogo_centros',NULL,'index',NULL,1,5,2),(8,'Comunidad','catalogo_comunidades',NULL,'index',NULL,1,5,4),(9,'Municipio','catalogo_municipios',NULL,'index',NULL,1,5,3),(10,'Catalogos Educacion',NULL,'fas fa-school',NULL,NULL,1,0,3),(11,'Areas del Conocimiento','catalogoEdu_areasConocimiento',NULL,'index',NULL,1,10,1),(12,'Carrera','catalogoEdu_carreras',NULL,'index',NULL,1,10,2),(13,'Carrera Centro','catalogoEdu_carrerasCentro',NULL,'index',NULL,1,10,NULL),(14,'Modalidad','catalogoEdu_modalidades',NULL,'index',NULL,1,10,4),(15,'Tipo de Ingreso','catalogoEdu_tiposIngreso',NULL,'index',NULL,1,10,5),(16,'Semestre','catalogoEdu_semestres',NULL,'index',NULL,1,10,6),(17,'Anio de Carrera','catalogoEdu_aniosCarrera',NULL,'index',NULL,1,10,7),(18,'Años Lectivos','catalogoEdu_aniosLectivo',NULL,'index',NULL,1,10,8),(19,'Etnia','catalogo_etnias',NULL,'index',NULL,1,5,5),(21,'Carreras Centro','admin_carrerasCentro',NULL,'index',NULL,1,1,3),(22,'Funciones Usuario','admin_funcionesUsuario',NULL,'index',NULL,1,1,4),(24,'Menu Usuario','admin_menusUsuario',NULL,'index',NULL,1,1,5),(25,'Registros',NULL,'fas fa-archive','',NULL,1,0,4),(26,'Matriculados','registro_matriculados',NULL,'index',NULL,1,25,NULL),(27,'Reportes',NULL,'fas fa-file-alt',NULL,NULL,1,0,5),(28,'Tipo Ingreso por SEDE/CUR','modal',NULL,'reporteTipoIngreseCentro',NULL,1,27,NULL),(29,'Tipo Ingreso por Unicam','modal',NULL,'reporteTipoIngresoUnicam',NULL,1,27,NULL),(30,'Consolidado Por Centro','modal',NULL,'reporteConsolidadoPorCentro',NULL,1,27,NULL),(31,'Turnos','catalogoEdu_turnos',NULL,'index',NULL,1,10,NULL),(32,'Grupos','catalogoEdu_grupos',NULL,'index',NULL,1,10,NULL),(33,'Tipos Modalidad CNU','catalogoEdu_tiposModalidad',NULL,'index',NULL,1,10,NULL),(34,'Reporte por Área de Conocimiento','modal',NULL,'reporteConsolidadoPorAreaC',NULL,1,27,NULL),(35,'Consolidado de BICU para CNU','modal',NULL,'reporteConsolidadoBicuCnu',NULL,1,27,NULL),(36,'Funciones','admin_funciones',NULL,'index',NULL,1,1,NULL),(37,'Ultima Actualizacion por Carrera','modal',NULL,'ultimaActualizacionPorCarrera',NULL,1,27,NULL);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `menu_enlaces_hijos`
--

DROP TABLE IF EXISTS `menu_enlaces_hijos`;
/*!50001 DROP VIEW IF EXISTS `menu_enlaces_hijos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `menu_enlaces_hijos` AS SELECT 
 1 AS `Id`,
 1 AS `TextoMostrar`,
 1 AS `Modulo`,
 1 AS `IconoModulo`,
 1 AS `Accion`,
 1 AS `IconoAccion`,
 1 AS `Estado`,
 1 AS `PadreId`,
 1 AS `Orden`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `menu_enlaces_padres`
--

DROP TABLE IF EXISTS `menu_enlaces_padres`;
/*!50001 DROP VIEW IF EXISTS `menu_enlaces_padres`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `menu_enlaces_padres` AS SELECT 
 1 AS `Id`,
 1 AS `TextoMostrar`,
 1 AS `Modulo`,
 1 AS `IconoModulo`,
 1 AS `Accion`,
 1 AS `IconoAccion`,
 1 AS `Estado`,
 1 AS `PadreId`,
 1 AS `Orden`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `menu_usuario`
--

DROP TABLE IF EXISTS `menu_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_usuario` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Usuarios_Id` int NOT NULL,
  `Menu_Id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Usuarios_has_Menu_Menu1_idx` (`Menu_Id`),
  KEY `fk_Usuarios_has_Menu_Usuarios1_idx` (`Usuarios_Id`),
  CONSTRAINT `fk_Usuarios_has_Menu_Menu1` FOREIGN KEY (`Menu_Id`) REFERENCES `menu` (`Id`),
  CONSTRAINT `fk_Usuarios_has_Menu_Usuarios1` FOREIGN KEY (`Usuarios_Id`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_usuario`
--

LOCK TABLES `menu_usuario` WRITE;
/*!40000 ALTER TABLE `menu_usuario` DISABLE KEYS */;
INSERT INTO `menu_usuario` VALUES (16,3,1),(17,3,2),(18,3,3),(19,3,21),(20,3,22),(32,3,24),(36,3,25),(37,3,26),(38,3,5),(39,3,6),(40,3,7),(41,3,8),(42,3,9),(43,3,19),(44,3,10),(45,3,11),(46,3,12),(48,3,14),(49,3,15),(50,3,16),(51,3,17),(52,3,18),(53,3,27),(54,3,28),(55,3,29),(56,3,30),(90,3,31),(91,3,32),(92,3,33),(96,3,34),(98,3,35),(100,3,36),(136,3,37);
/*!40000 ALTER TABLE `menu_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modalidad`
--

DROP TABLE IF EXISTS `modalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modalidad` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionModalidad` varchar(100) DEFAULT NULL,
  `TipoModalidad_Id` int NOT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modalidad`
--

LOCK TABLES `modalidad` WRITE;
/*!40000 ALTER TABLE `modalidad` DISABLE KEYS */;
INSERT INTO `modalidad` VALUES (1,'Regular',1,1),(2,'Sabatino',2,1),(3,'Dominical',2,1),(4,'Por Encuentro',2,1);
/*!40000 ALTER TABLE `modalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `municipio` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionMunicipio` varchar(150) DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,'Bluefields',1),(2,'La Cruz del Río Grande',1),(3,'Bilwi',1),(4,'El Rama',1),(5,'Bonanza',1),(6,'Waspam',1),(7,'Paiwas',1),(8,'Laguna de Perlas',1),(9,'Corn Island',1);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `registro_matricula`
--

DROP TABLE IF EXISTS `registro_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `registro_matricula` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `CarreraCentro_Id` int NOT NULL,
  `FechaDeMatricula` datetime DEFAULT CURRENT_TIMESTAMP,
  `TipoIngreso_Id` int NOT NULL,
  `Semestre_Id` int NOT NULL,
  `AnioLectivo_Id` int NOT NULL,
  `Usuarios_Id` int NOT NULL,
  `Total` int DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`),
  KEY `fk_RegistroMatricula_CarreraCentro1_idx` (`CarreraCentro_Id`),
  KEY `fk_RegistroMatricula_TipoIngreso1_idx` (`TipoIngreso_Id`),
  KEY `fk_RegistroMatricula_Semestre1_idx` (`Semestre_Id`),
  KEY `fk_RegistroMatricula_AnioLectivo1_idx` (`AnioLectivo_Id`),
  KEY `fk_RegistroMatricula_Usuarios1_idx` (`Usuarios_Id`),
  CONSTRAINT `fk_RegistroMatricula_AnioLectivo1` FOREIGN KEY (`AnioLectivo_Id`) REFERENCES `anio_lectivo` (`Id`),
  CONSTRAINT `fk_RegistroMatricula_CarreraCentro1` FOREIGN KEY (`CarreraCentro_Id`) REFERENCES `carrera_centro` (`Id`),
  CONSTRAINT `fk_RegistroMatricula_Semestre1` FOREIGN KEY (`Semestre_Id`) REFERENCES `semestre` (`Id`),
  CONSTRAINT `fk_RegistroMatricula_TipoIngreso1` FOREIGN KEY (`TipoIngreso_Id`) REFERENCES `tipo_ingreso` (`Id`),
  CONSTRAINT `fk_RegistroMatricula_Usuarios1` FOREIGN KEY (`Usuarios_Id`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `registro_matricula`
--

LOCK TABLES `registro_matricula` WRITE;
/*!40000 ALTER TABLE `registro_matricula` DISABLE KEYS */;
INSERT INTO `registro_matricula` VALUES (1,138,'2026-08-03 16:06:35',1,1,2,3,200,1);
/*!40000 ALTER TABLE `registro_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resgistro_matricula_etnia`
--

DROP TABLE IF EXISTS `resgistro_matricula_etnia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resgistro_matricula_etnia` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Cantidad` int DEFAULT NULL,
  `RegistroMatricula_Id` int NOT NULL,
  `Etnia_Id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_ResgistroMatricula_Etnia_RegistroMatricula1_idx` (`RegistroMatricula_Id`),
  KEY `fk_ResgistroMatricula_Etnia_Etnia1_idx` (`Etnia_Id`),
  CONSTRAINT `fk_ResgistroMatricula_Etnia_Etnia1` FOREIGN KEY (`Etnia_Id`) REFERENCES `etnia` (`Id`),
  CONSTRAINT `fk_ResgistroMatricula_Etnia_RegistroMatricula1` FOREIGN KEY (`RegistroMatricula_Id`) REFERENCES `registro_matricula` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resgistro_matricula_etnia`
--

LOCK TABLES `resgistro_matricula_etnia` WRITE;
/*!40000 ALTER TABLE `resgistro_matricula_etnia` DISABLE KEYS */;
/*!40000 ALTER TABLE `resgistro_matricula_etnia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semestre` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionSemestre` varchar(45) DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
INSERT INTO `semestre` VALUES (1,'I Semestre',1),(2,'II Semestre',1);
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_centro`
--

DROP TABLE IF EXISTS `tipo_de_centro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_centro` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionTipoCentro` varchar(255) DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_centro`
--

LOCK TABLES `tipo_de_centro` WRITE;
/*!40000 ALTER TABLE `tipo_de_centro` DISABLE KEYS */;
INSERT INTO `tipo_de_centro` VALUES (1,'SEDE',0),(2,'CUR',1),(6,'UNI',1),(8,'EXT',1);
/*!40000 ALTER TABLE `tipo_de_centro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_de_modalidad`
--

DROP TABLE IF EXISTS `tipo_de_modalidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_de_modalidad` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionDeTipo` varchar(60) DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_de_modalidad`
--

LOCK TABLES `tipo_de_modalidad` WRITE;
/*!40000 ALTER TABLE `tipo_de_modalidad` DISABLE KEYS */;
INSERT INTO `tipo_de_modalidad` VALUES (1,'Cursos Diarios',1),(2,'Cursos por Encuentro',1);
/*!40000 ALTER TABLE `tipo_de_modalidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_ingreso`
--

DROP TABLE IF EXISTS `tipo_ingreso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_ingreso` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionTipoIngreso` varchar(25) DEFAULT NULL,
  `Estado` tinyint DEFAULT '1',
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_ingreso`
--

LOCK TABLES `tipo_ingreso` WRITE;
/*!40000 ALTER TABLE `tipo_ingreso` DISABLE KEYS */;
INSERT INTO `tipo_ingreso` VALUES (1,'1° Ingreso',1),(2,'Reingreso',1);
/*!40000 ALTER TABLE `tipo_ingreso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `turnos`
--

DROP TABLE IF EXISTS `turnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `turnos` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `DescripcionTurno` varchar(45) DEFAULT NULL,
  `Estado` tinyint(1) DEFAULT '1',
  `Modalidad_Id` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `Modalidad_Id_idx` (`Modalidad_Id`),
  CONSTRAINT `Modalidad` FOREIGN KEY (`Modalidad_Id`) REFERENCES `modalidad` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `turnos`
--

LOCK TABLES `turnos` WRITE;
/*!40000 ALTER TABLE `turnos` DISABLE KEYS */;
INSERT INTO `turnos` VALUES (1,'Matutino',1,1),(2,'Vespertino',1,1),(3,'Nocturno',1,1),(4,'Diurno',1,1),(5,'Sabatino',1,2),(6,'Dominical',1,3),(7,'Por Encuentro',1,4);
/*!40000 ALTER TABLE `turnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_centros`
--

DROP TABLE IF EXISTS `usuario_centros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_centros` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Centro_Id` int NOT NULL,
  `Usuarios_Id` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `fk_Centro_has_Usuarios_Usuarios1_idx` (`Usuarios_Id`),
  KEY `fk_Centro_has_Usuarios_Centro1_idx` (`Centro_Id`),
  CONSTRAINT `fk_Centro_has_Usuarios_Centro1` FOREIGN KEY (`Centro_Id`) REFERENCES `centro` (`Id`),
  CONSTRAINT `fk_Centro_has_Usuarios_Usuarios1` FOREIGN KEY (`Usuarios_Id`) REFERENCES `usuarios` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_centros`
--

LOCK TABLES `usuario_centros` WRITE;
/*!40000 ALTER TABLE `usuario_centros` DISABLE KEYS */;
INSERT INTO `usuario_centros` VALUES (19,3,3),(31,24,3),(33,9,3),(34,11,3),(35,8,3),(36,7,3),(37,10,3),(38,6,3),(39,5,3),(40,25,3),(41,12,3),(42,26,3),(66,13,3),(67,14,3),(68,15,3),(69,16,3),(70,17,3),(71,18,3),(72,19,3),(73,20,3),(74,21,3),(75,22,3),(76,23,3);
/*!40000 ALTER TABLE `usuario_centros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `NombreUsuario` varchar(150) NOT NULL,
  `Clave` longtext NOT NULL,
  `Centro_Id` int NOT NULL,
  `Estado` tinyint DEFAULT '1',
  `FechaCreacion` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `NombreUsuario_UNIQUE` (`NombreUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (3,'johndow@gmail.com','$2y$10$n2euyKAeDsXsP6S0u3wAr.IE1oUxTN4GXEB58WOJBRZghZGE6CZZa',3,1,'2024-09-09 17:21:23');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sirema'
--
/*!50003 DROP FUNCTION IF EXISTS `userHasMenu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `userHasMenu`(userId int, menuId int) RETURNS tinyint
BEGIN

declare has tinyint;

select
if(count(*) > 0, true, false) into has
from 
menu_usuario
where Usuarios_Id = userId
and Menu_Id = menuId;

RETURN has;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_carrera_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_carrera_actualizar`(
in Id_Consultar int,
in Descripcion varchar(4)
)
BEGIN

	update
    anio_de_carrera
    set
    DescripcionAnioCarrera = Descripcion
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_carrera_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_carrera_cambiar_estado`(
in Id_Consultar int,
in Estado_N tinyint
)
BEGIN

	update
    anio_de_carrera
    set    
    Estado = Estado_N
    where Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_carrera_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_carrera_crear`(
in Descripcion varchar(4)
)
BEGIN

	insert 
    into
    anio_de_carrera
    (DescripcionAnioCarrera)
    values
    (Descripcion);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_carrera_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_carrera_encontrar`(
in Id_Consultar int
)
BEGIN

	select
    *
    from
    anio_de_carrera
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_carrera_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_carrera_index`()
BEGIN
	declare activos int;
    
    select count(*) into activos from anio_de_carrera
    where Estado = 1;
	select
    *,activos
    from
    anio_de_carrera;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_carrera_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_carrera_validar_duplicado`(
in Descripcion varchar(4)
)
BEGIN

	select
    count(*) as count
    from
    anio_de_carrera
    where
    DescripcionAnioCarrera = Descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_lectivo_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_lectivo_actualizar`(
in Id_Consultar int,
in Anio int
)
BEGIN

	update
    anio_lectivo
    set
    AnioLectivo = Anio
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_lectivo_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_lectivo_cambiar_estado`(
in Id_Consultar int,
in Estado_N tinyint
)
BEGIN

	update
    anio_lectivo
    set
    Estado = Estado_N
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_lectivo_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_lectivo_crear`(
in Anio int
)
BEGIN

	insert into
    anio_lectivo
    (AnioLectivo)
    values
    (Anio);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_lectivo_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_lectivo_encontrar`(
in Id_Consultar int
)
BEGIN

	select
    *
    from
    anio_lectivo
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_lectivo_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_lectivo_index`(

)
BEGIN

declare activos int;

	select
    count(*) into activos
    from 
    anio_lectivo where Estado =1;

	select
    *,
    activos
    from 
    anio_lectivo;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anio_lectivo_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `anio_lectivo_validar_duplicado`(
in Anio int
)
BEGIN

	select
    count(*) as count
    from
    anio_lectivo
    where
    AnioLectivo = Anio;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `area_conocimiento_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `area_conocimiento_actualizar`(
in Id_Consultar int,
in Descripcion varchar(240),
in Acronimo_N varchar(25)
)
BEGIN

	UPDATE
    areas_del_conocimiento
    SET
    DescripcionAreaConocimiento = Descripcion,
    Acronimo = Acronimo_N
    WHERE Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `area_conocimiento_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `area_conocimiento_cambiar_estado`(
in Id_Consultar int, 
in Estado_N tinyint
)
BEGIN

	UPDATE 
    areas_del_conocimiento
    SET
    Estado = Estado_N
    WHERE Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `area_conocimiento_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `area_conocimiento_crear`(
in Descripcion varchar(240),
in Acro varchar(25)
)
BEGIN

	INSERT INTO areas_del_conocimiento
    (DescripcionAreaConocimiento, Acronimo)
    VALUES
    (Descripcion, Acro);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `area_conocimiento_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `area_conocimiento_encontrar`(
in Id_Consultar int
)
BEGIN
	SELECT
    *
    FROM 
	areas_del_conocimiento
    WHERE Id = Id_Consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `area_conocimiento_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `area_conocimiento_index`()
BEGIN

declare activos int;
	SELECT count(*) into activos FROM
    areas_del_conocimiento
    where Estado =1;

	SELECT *,activos FROM
    areas_del_conocimiento;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `area_conocimiento_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `area_conocimiento_validar_duplicado`(
in Descripcion varchar(240),
in Acro varchar(25)
)
BEGIN
	
    SELECT
    COUNT(*) as count
    FROM areas_del_conocimiento
    WHERE 
    DescripcionAreaConocimiento = Descripcion
    OR
    Acronimo = Acro;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `buscar_filtro_centro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `buscar_filtro_centro`(
in search varchar(200),
in nombre varchar(240)
)
BEGIN

declare usuarioId int;
	set @sql = ""; 
	
	select Id into usuarioId
	from 
	usuarios
	where NombreUsuario =nombre;

	if(usuarioId > 0)
    then
    
    set @sql = concat("
		select
		c.Id,
		concat(c.DescripcionCentro,\'\(\'\,tc.DescripcionTipoCentro,\'\)\'\) as DescripcionCentro
		from 
		centro as c
		inner join tipo_de_centro as tc
		on tc.Id = c.TipoDeCentro_Id
		where 
		c.Estado = 1 "); 
	
    if(search != '') then
    
	set @sql = concat(@sql, "  and c.DescripcionCentro like '%",search,"%'");
    end if;    
  
    prepare stmt from @sql;
	execute stmt;
	deallocate prepare stmt;
    
    
    else
    select "";
    end if; 

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `carrera_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `carrera_actualizar`(
in Id_Consultar int,
in Descripcion varchar(240),
in AreaConocimientoId int
)
BEGIN

	UPDATE
    carrera
    SET
    DescripcionCarrera = Descripcion,
    AreasDelConocimiento_Id = AreaConocimientoId
    WHERE
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `carrera_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `carrera_cambiar_estado`(
in Id_Consultar int,
in Estado_N tinyint
)
BEGIN

	UPDATE
    carrera
    SET
    Estado = Estado_N
    WHERE
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `carrera_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `carrera_crear`(
in Descripcion varchar(240),
in AreaConocimientoId int
)
BEGIN

	INSERT INTO
    carrera (DescripcionCarrera, AreasDelConocimiento_Id)
    VALUES
	(Descripcion, AreaConocimientoId);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `carrera_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `carrera_encontrar`(
in Id_Consultar int
)
BEGIN

	SELECT
    *
    FROM
    carrera
    WHERE 
    Id = Id_Consultar
    and 
    Estado = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `carrera_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `carrera_index`()
BEGIN

	SELECT 
	c.Id,
	c.DescripcionCarrera,
	ac.DescripcionAreaConocimiento as Area,
    c.Estado
	FROM 
	carrera as c
	INNER JOIN
	areas_del_conocimiento as ac
	on ac.Id = c.AreasDelConocimiento_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `carrera_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `carrera_validar_duplicado`(
in Descripcion varchar(240),
in AreaConocimientoId int
)
BEGIN

	SELECT
    count(*) as count
    FROM
    carrera
	WHERE
    DescripcionCarrera = Descripcion and
    AreasDelConocimiento_Id = AreaConocimientoId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `centro_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `centro_actualizar`(
in id_centro int,
in Descripcion varchar(240),
in TipoCentroId int,
in ComunidadId int,
in PadreId int
)
BEGIN
	
	UPDATE
    centro
    SET 
    DescripcionCentro = Descripcion,
    TipoDeCentro_Id = TipoCentroId,
    Comunidad_Id = ComunidadId,
    Padre_Id = PadreId
    WHERE Id = id_centro;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `centro_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `centro_cambiar_estado`(
in Estado_N tinyint,
in Id_Consultar int
)
BEGIN
	UPDATE 
    centro
    SET Estado = Estado_N
    Where 
    Id = Id_Consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `centro_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `centro_crear`(
in Descripcion varchar(240),
in TipoCentroId int, 
in ComunidadId int,
in PadreId int
)
BEGIN

	INSERT INTO centro
    (DescripcionCentro, 
    TipoDeCentro_Id, 
    Padre_Id, 
    Comunidad_Id) 
    VALUES
    (
		Descripcion,
        TipoCentroId,
        PadreId,
        ComunidadId
    );
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `centro_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `centro_encontrar`(
in Id_Consultar int
)
BEGIN

	SELECT 
    *
    FROM 
	centro
    WHERE 
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `centro_get_padres` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `centro_get_padres`()
BEGIN

	select 
	Id,
	DescripcionCentro as Padre
	from 
	centro 
	where Padre_Id < 1
	and Estado = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `centro_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `centro_index`()
BEGIN
	
    select 
	ch.*
	From
	centro_hijos as ch
	union 
	select 
	cp.*
	From
	centro_padres as cp
	order by Padre_Id,TipoCentro;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `centro_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `centro_validar_duplicado`(
in Descripcion varchar(240),
in TipoCentroId int,
in ComunidadId int
)
BEGIN

	SELECT 
    COUNT(*) as count
    FROM
    centro
    WHERE
    DescripcionCentro = Descripcion and
    TipoDeCentro_Id = TipoCentroId and
    Comunidad_Id = ComunidadId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comunidad_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comunidad_actualizar`(
in Descripcion varchar(140),
in MunicipioId int,
in Id_Consultar int
)
BEGIN
	
    UPDATE
    comunidad
    SET 
    DescripcionComunidad = Descripcion,
    Municipio_Id = MunicipioId
	WHERE Id = Id_Consultar;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comunidad_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comunidad_cambiar_estado`(
in Estado_N tinyint,
in Id_Consultar int
)
BEGIN
	UPDATE
    comunidad
    SET Estado = Estado_N
    WHERE Id = Id_Consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comunidad_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comunidad_crear`(
in Descripcion varchar(140),
in MunicipioId int
)
BEGIN
	INSERT INTO
    comunidad (DescripcionComunidad, Municipio_Id)
    VALUES
    (Descripcion, MunicipioId);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comunidad_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comunidad_encontrar`(
in Id_Consultar int
)
BEGIN
	SELECT 
    *
    FROM 
    comunidad
    WHERE Id = Id_Consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comunidad_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comunidad_index`()
BEGIN
	SELECT 
	c.Id,
	c.DescripcionComunidad,
	c.Estado,
	m.DescripcionMunicipio as Municipio
    FROM
    comunidad as c
    inner join municipio as m
    on m.Id = c.Municipio_Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `comunidad_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `comunidad_validar_duplicado`(
in Descripcion varchar(140),
in MunicipioId int
)
BEGIN
	SELECT
    count(*) as count
    FROM
    comunidad
    WHERE 
    DescripcionComunidad = Descripcion
    and Municipio_Id = MunicipioId
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etnia_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `etnia_actualizar`(
in Id_Consultar int,
in Descripcion varchar(40)
)
BEGIN

	update
    etnia
    set
    DescripcionEtnia = Descripcion
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etnia_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `etnia_cambiar_estado`(
in Id_Consultar int,
in Estado_N tinyint
)
BEGIN

	update
    etnia
    set
    Estado = Estado_N
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etnia_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `etnia_crear`(
in Descripcion varchar(40)
)
BEGIN

	insert into 
    etnia
    (DescripcionEtnia)
    values
    (Descripcion);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etnia_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `etnia_encontrar`(
in Id_Consultar int
)
BEGIN

	select
    *
    from
    etnia
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etnia_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `etnia_index`()
BEGIN

declare activos int;

	select
		count(*) into activos
    from 
    etnia where Estado =1;
    
	select
    *,activos
    from 
    etnia;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `etnia_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `etnia_validar_duplicado`(
in Descripcion varchar(40)
)
BEGIN

	select
    count(*) as count
    from
    etnia
    where
    DescripcionEtnia = Descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_actualizarFuncionUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_actualizarFuncionUsuario`(
	in FuncionId int,
	in UsuarioId int,
	in fechaN1 DateTime,
	in fechaN2 DateTime
)
BEGIN

set @existe = 0;

SELECT @existe := count(*) FROM sirema.funciones_usuario
where Funciones_Id = FuncionId and Usuarios_Id = UsuarioId;


if @existe < 1 then
	update
    funciones_usuario
    set 
    fecha_inicio = fechaN1, 
    fecha_fin= fechaN2
    where Funciones_Id = FuncionId
    and Usuarios_Id = UsuarioId;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_actualizar_carrera_centro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_actualizar_carrera_centro`(
in carreraId int,
in centroId int
)
BEGIN

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_agregarCentrosUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_agregarCentrosUsuario`(
in CentroId int,
in UsuarioId int
)
BEGIN

set @existe = 0;

SELECT @existe := count(*) FROM sirema.usuario_centros
where Centro_Id = CentroId and Usuarios_Id = UsuarioId;


if @existe < 1 then
	insert into
    usuario_centros
    (Centro_Id, Usuarios_Id)
    values
    (CentroId, UsuarioId);
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_agregarFuncionUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_agregarFuncionUsuario`(
in FuncionId int,
in UsuarioId int,
in fechaN1 DateTime,
in fechaN2 DateTime
)
BEGIN

set @existe = 0;

SELECT @existe := count(*) FROM sirema.funciones_usuario
where Funciones_Id = FuncionId and Usuarios_Id = UsuarioId;


if @existe < 1 then
	insert into
    funciones_usuario
    (Funciones_Id, Usuarios_Id, fecha_inicio, fecha_fin)
    values
    (FuncionId, UsuarioId,fechaN1,fechaN2);
    
    else 
		update
		funciones_usuario
		set 
		fecha_inicio = fechaN1, 
		fecha_fin= fechaN2
		where Funciones_Id = FuncionId
		and Usuarios_Id = UsuarioId;
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_agregarMenuUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_agregarMenuUsuario`(
in menuId int,
in usuarioId int
)
BEGIN

	set @existe = 0;
	
	SELECT @existe := count(*) FROM sirema.menu_usuario
	where Menu_Id = menuId and Usuarios_Id = usuarioId;

	
	if @existe < 1 then
		insert into
		menu_usuario
		(Menu_Id, Usuarios_Id)
		values
		(menuId, usuarioId);
	end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_deshabilitarCarreraCentro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_deshabilitarCarreraCentro`(
in Id_Consultar int
)
BEGIN
    update
	sirema.carrera_centro
    set
    Estado = 0
    where 
    Id = Id_Consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_eliminarCentrosUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_eliminarCentrosUsuario`(
in Id_Consultar int
)
BEGIN

	delete 
    from 
    usuario_centros
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_eliminarFuncionUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_eliminarFuncionUsuario`(
in Id_Consultar int
)
BEGIN

	delete 
    from 
    funciones_usuario
    where
    Id = Id_Consultar;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_eliminarMenuUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_eliminarMenuUsuario`(
in Id_Consultar int
)
BEGIN

	delete
    from
    menu_usuario
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getCarreraCentroPorCentro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getCarreraCentroPorCentro`(
in CentroId int
)
BEGIN

	SELECT 
    * 
    FROM 
    sirema.carrera_centro
    where 
    Centro_Id = CentroId
    ;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getCarrerasNoPertenecientesAlCentro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getCarrerasNoPertenecientesAlCentro`(
in CentroId int
)
BEGIN

	select
    car.Id,
    concat(car.DescripcionCarrera,'(',arc.Acronimo,')') as carrera
    from carrera as car
    inner join areas_del_conocimiento as arc
    on arc.Id = car.AreasDelConocimiento_Id
    where car.id 
    not in 
    (select 
    cc.Carrera_Id 
    from 
    carrera_centro as cc
    where Centro_Id = CentroId
    and cc.Estado = 1);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getCarrerasPertenecienteAlCentro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getCarrerasPertenecienteAlCentro`(
in CentroId int
)
BEGIN

	select
    car.Id,
    concat(car.DescripcionCarrera,'(',arc.Acronimo,')') as carrera
    from carrera as car
    inner join areas_del_conocimiento as arc
    on arc.Id = car.AreasDelConocimiento_Id
    where car.id 
	in 
    (select 
    cc.Carrera_Id 
    from 
    carrera_centro as cc
    where Centro_Id = CentroId
    and cc.Estado = 1);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getCentrosNoPertenecienesAUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getCentrosNoPertenecienesAUsuario`(
in UsuarioId int
)
BEGIN

	select
   c.Id,
   concat(c.DescripcionCentro,'(',tc.DescripcionTipoCentro,')') as Des
   from 
	centro as c
    inner join tipo_de_centro as tc
    on tc.Id = c.TipoDeCentro_Id
    where 
    c.Id not in
    (select Centro_Id from
    usuario_centros as uc
    where uc.Usuarios_Id = UsuarioId);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getCentrosPertenecientesAUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getCentrosPertenecientesAUsuario`(
in UsuarioId int
)
BEGIN

	select
   c.Id,
   concat(c.DescripcionCentro,'(',tc.DescripcionTipoCentro,')') as Des
   from 
	centro as c
    inner join tipo_de_centro as tc
    on tc.Id = c.TipoDeCentro_Id
	where 
	c.Id in
	(select Centro_Id from
	usuario_centros as uc
	where uc.Usuarios_Id = UsuarioId);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getCentrosUsuarioPorUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getCentrosUsuarioPorUsuario`(
in UsuarioId int
)
BEGIN

	select
    *
    from
    usuario_centros
    where 
    Usuarios_Id = UsuarioId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getFucionesPorUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getFucionesPorUsuario`(
in UsuarioId int
)
BEGIN

	select
    *
    from
    funciones_usuario
    where 
    Usuarios_Id = UsuarioId;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getFuncionesPertenecientesAlUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getFuncionesPertenecientesAlUsuario`(
in UsuarioId int
)
BEGIN
	select
	f.Id,
	concat (f.Controller,'(',f.Acronimo,')') as Des
	from funciones
	f
	inner join funciones_usuario fs
	on fs.Funciones_Id = f.Id
	where
	f.Id in
		(select fsu.Funciones_Id from
		funciones_usuario as fsu
		where fsu.Usuarios_Id = UsuarioId)
	and fs.Usuarios_Id = UsuarioId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getFuncionNoPertenecientesAlUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getFuncionNoPertenecientesAlUsuario`(
in UsuarioId int
)
BEGIN

select
f.Id,
concat (f.Controller,'(',f.Acronimo,')') as Des
from funciones
f
where
f.Id not in
    (select fsu.Funciones_Id from
    funciones_usuario as fsu
    where fsu.Usuarios_Id = UsuarioId);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getMenuActualDelUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getMenuActualDelUsuario`(
in UsuarioId int
)
BEGIN

  select
  *
  from 
  menu_usuario
  where
  Usuarios_Id = UsuarioId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getMenusHijosPorUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getMenusHijosPorUsuario`(
in UsuarioId int,
in Padre int
)
BEGIN

select
    mh.Id,
    mh.TextoMostrar as Des,
    
    true as Estado
    from
    menu_enlaces_hijos as mh
    left join menu_usuario as mu
    on mu.Menu_Id = mh.Id
    where 
    mh.PadreId = Padre
    and mu.Usuarios_Id = UsuarioId
    
    union
    
    select
    mh.Id,
    mh.TextoMostrar as Des,
    
    false as Estado
    from
    menu_enlaces_hijos as mh    
    where 
    mh.PadreId = Padre
    and mh.Id not in
    (select Menu_Id from menu_usuario
    where Usuarios_Id = UsuarioId);
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getMenusPadresPorUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getMenusPadresPorUsuario`(
in UsuarioId int
)
BEGIN

	select *
    from
    (select
    mp.Id,
    mp.TextoMostrar as Des,
   
	true as Estado
    from
    menu_enlaces_padres as mp
    left join menu_usuario as mu
    on mu.Menu_Id = mp.Id
    where
    mu.Usuarios_Id = UsuarioId
    
    union
    
    select
    mp.Id,
    mp.TextoMostrar as Des,
   
	false as Estado
    from
    menu_enlaces_padres as mp
    where
    mp.Id not in (select Menu_Id from menu_usuario
    where Usuarios_Id = UsuarioId))
    as a
    order by Id,Des, Estado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_getUsuariosActivos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_getUsuariosActivos`()
BEGIN

	SELECT 
		Id, 
		NombreUsuario as email
	FROM sirema.usuarios
	where 
	Estado = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_habilitar_carrera_centro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_habilitar_carrera_centro`(
in carreraId int,
in centroId int
)
BEGIN
set @existe = 0;
set @estado = 0;


SELECT @existe := count(*) FROM sirema.carrera_centro
where Centro_Id = centroId and Carrera_Id = carreraId;


if @existe > 0 then
	
	select @estado :=if(Estado =0, 1, 0) from carrera_centro
	where Centro_Id = centroId and Carrera_Id = carreraId;
    
    
    if @estado = 1 then
		update
		carrera_centro
		set 
		Estado = @estado
		where
		Centro_Id = centroId 
		and 
		Carrera_Id = carreraId;
	end if;

else
	insert into
    carrera_centro
    (Centro_Id, Carrera_Id)
    values
    (centroId, carreraId);
end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filtro_validarFuncionesUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `filtro_validarFuncionesUsuario`(
in nombre varchar(140)
)
BEGIN

	declare usuarioId int;
    declare caducado int;
    
    
    select Id into usuarioId
    from 
    usuarios
    where NombreUsuario =nombre;
    
    select
    count(*) into caducado
    from
    funciones_usuario
    where 
    Usuarios_Id = usuarioId
    and fecha_fin <= NOW();
    
    if(caducado > 0)
    then
		update funciones_usuario
        set Estado = 0
        where Usuarios_Id = usuarioId;
    end if;
    
    select caducado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `funcion_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `funcion_actualizar`(
in IdConsultar int,
in ControllerN varchar(55),
in AccionN varchar(40),
in AcronimoN varchar(25)
)
BEGIN

	update
    funciones
    SEt
    Controller = ControllerN,
    Accion = AccionN,
    Acronimo = AcronimoN
    Where
    Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `funcion_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `funcion_cambiar_estado`(
in IdConsultar int,
in EstadoN tinyint
)
BEGIN

	UPDATE
    funciones
    SET
    Estado = EstadoN
    Where
    Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `funcion_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `funcion_crear`(
in ControllerN varchar(55),
in AccionN varchar(40),
in AcronimoN varchar(25)
)
BEGIN

	insert into
    funciones
    (Controller, Accion, Acronimo)
    values
    (ControllerN,AccionN,AcronimoN);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `funcion_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `funcion_encontrar`(
in IdConsultar int
)
BEGIN

	select *
    from
    funciones
    where Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `funcion_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `funcion_index`()
BEGIN

	declare activos int;
    
    select
    count(*) into activos
    from funciones
    where Estado = 1;
    
    select
	*, activos
    from funciones;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `funcion_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `funcion_validar_duplicado`(
	in AcronimoN varchar(25)
)
BEGIN

	select
    count(*) count
    from 
    funciones
    where Acronimo = AcronimoN;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getCarrerasNoPertenecientesAlCentro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getCarrerasNoPertenecientesAlCentro`(
in CentroId int
)
BEGIN

	select
    car.Id,
    car.DescripcionCarrera as carrera
    from carrera as car
    where id 
    not in 
    (select 
    cc.Carrera_Id 
    from 
    carrera_centro as cc
    where Centro_Id = CentroId
    and cc.Estado = 1);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `grupo_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `grupo_actualizar`(
in IdConsultar int,
in Descripcion varchar(3)
)
BEGIN

	UPDATE
    grupos
    SET 
    DescripcionGrupo = Descripcion
    Where
    Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `grupo_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `grupo_cambiar_estado`(
in IdConsultar int,
in EstadoN tinyint
)
BEGIN

	UPDATE
    grupos
    SET
    Estado = EstadoN
    Where
    Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `grupo_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `grupo_crear`(
in Descripcion varchar(3)
)
BEGIN

	INSERT INTO
    grupos
    (DescripcionGrupo)
    values
    (Descripcion);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `grupo_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `grupo_encontrar`(
in IdConsultar int
)
BEGIN

	SELECT
    *
    From 
    grupos
    Where Id =IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `grupo_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `grupo_index`()
BEGIN

declare activos int;
select count(*) into activos
from
grupos where Estado = 1;

select *,activos
from
grupos;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `grupo_validad_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `grupo_validad_duplicado`(
in Descripcion varchar(3)
)
BEGIN

	select count(*) as count
    from 
    grupos
    where 
    DescripcionGrupo = Descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `grupo_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `grupo_validar_duplicado`(
in Descripcion varchar(3)
)
BEGIN

	select count(*) as count
    from 
    grupos
    where 
    DescripcionGrupo = Descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu_actualizar`(
in Id_Consultar int,
in Texto_Mostrar varchar(50),
in Modulo varchar(50),
in IconoModulo varchar(40),
in Accion varchar(30),
in IconoAccion varchar(40),
in PadreId int
)
BEGIN

	update
    menu
    set
    TextoMostrar = Texto_Mostrar
    ,Modulo = Modulo
    , IconoModulo = IconoModulo
    , Accion = Accion
    ,IconoAccion = IconoAccion
    , PadreId = PadreId
    where Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu_cambiar_estado`(
in Id_Consultar int,
in Estado_N tinyint
)
BEGIN

	update
    menu
    set
    Estado = Estado_N
    where Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu_crear`(
in Texto_Mostrar varchar(50),
in Modulo varchar(50),
in IconoModulo varchar(40),
in Accion varchar(30),
in IconoAccion varchar(40),
in Estado tinyint,
in PadreId int
)
BEGIN

INSERT INTO menu (TextoMostrar,Modulo, IconoModulo, Accion,IconoAccion, Estado, PadreId)
Values (Texto_Mostrar,Modulo, IconoModulo, Accion, IconoAccion, Estado, PadreId);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu_encontrar`(
in Id_Consultar int
)
BEGIN

	select
    *
    from 
    menu
    where 
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu_index`()
BEGIN
	SELECT 
    m1.Id,
    m1.TextoMostrar,
    m1.Modulo,
    m1.IconoModulo,
    m1.Accion,
    m1.IconoAccion,
    m1.Estado,
    m2.TextoMostrar as Padre
    FROM menu as m1
    inner join menu as m2
    on m1.PadreId = m2.Id
    where 
    m1.PadreId > 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu_mostrar_hijos_por_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu_mostrar_hijos_por_usuario`(
in nombre varchar(140)
)
BEGIN

	declare usuarioId int;
    
    
    select Id into usuarioId
    from 
    usuarios
    where NombreUsuario =nombre;
    
    select
		mh.*
		from
		menu_enlaces_hijos as mh
		join menu_usuario as mu
		on mu.Menu_Id = mh.Id
		where
		mu.Usuarios_Id = usuarioId; 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu_mostrar_padres_po_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu_mostrar_padres_po_usuario`(
in nombre varchar(140)
)
BEGIN

	declare usuarioId int;
    
    
    select Id into usuarioId
    from 
    usuarios
    where NombreUsuario =nombre;
    
	select
		mp.*
		from
		menu_enlaces_padres as mp
		join menu_usuario as mu
		on mu.Menu_Id = mp.Id
		where
		mu.Usuarios_Id = usuarioId
        
        order by mp.Orden;    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `menu_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `menu_validar_duplicado`()
BEGIN

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modalidad_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modalidad_actualizar`(
in Id_Consultar int, 
in Descripcion varchar(90),
in tipoModadlidad int
)
BEGIN

	UPDATE
    modalidad
    SET
    DescripcionModalidad = Descripcion,
    TipoModalidad_Id = tipoModadlidad
	WHERE
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modalidad_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modalidad_cambiar_estado`(
in Id_Consultar int,
in Estado_N tinyint
)
BEGIN

	update
    modalidad
    set
    Estado = Estado_N
    where Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modalidad_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modalidad_crear`(
in Descripcion varchar(90),
in tipoModadlidad int
)
BEGIN

	insert into
    modalidad
    (DescripcionModalidad, TipoModalidad_Id)
    values
    (Descripcion,tipoModadlidad);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modalidad_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modalidad_encontrar`(
in Id_Consultar int
)
BEGIN

	select
    *
    from 
    modalidad
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modalidad_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modalidad_index`()
BEGIN

declare activos int;

	select
    count(*) into activos
    from 
    modalidad
    where Estado = 1;
    
	select
    m.Id,
    m.DescripcionModalidad,
    tm.DescripcionDeTipo as Tipo,
    m.Estado,
    activos
    from 
    modalidad as m
    inner join tipo_de_modalidad as tm
    on tm.Id = m.TipoModalidad_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modalidad_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modalidad_validar_duplicado`(
in Descripcion varchar(90)
)
BEGIN

	select
    count(*) as count
    from
    modalidad
    where
    DescripcionModalidad = Descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `muncipio_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `muncipio_cambiar_estado`(
in Estado_N tinyint,
in Id_Consultar int
)
BEGIN
	UPDATE 
    municipio
    SET Estado = Estado_N
    Where Id = Id_Consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `municipio_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `municipio_actualizar`(
in Descripcion varchar(140),
in Id_Consultar int
)
BEGIN
	UPDATE 
    municipio
    SET DescripcionMunicipio = Descripcion
    WHERE Id = Id_Consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `municipio_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `municipio_cambiar_estado`(
in Estado_N tinyint,
in Id_Consultar int
)
BEGIN
	UPDATE 
    municipio
    SET Estado = Estado_N
    Where Id = Id_Consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `municipio_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `municipio_crear`(
in Descripcion varchar(140)
)
BEGIN
	INSERT INTO municipio (DescripcionMunicipio)
    VALUES (Descripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `municipio_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `municipio_encontrar`(
in Id_Consultar int
)
BEGIN

	SELECT
    *
    FROM
    municipio
    WHERE Id = Id_Consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `municipio_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `municipio_index`()
BEGIN
	SELECT 
    * 
    FROM
    municipio;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `municipio_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `municipio_validar_duplicado`(
in Descripcion varchar(140)
)
BEGIN
	SELECT 
    COUNT(*) AS count
    FROM
	municipio
    WHERE DescripcionMunicipio = Descripcion;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `permiso_carreras_centro_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `permiso_carreras_centro_usuario`(
in centroId int,
in nombre varchar(140)
)
BEGIN
	declare usuarioId int;
    
    
    select Id into usuarioId
    from 
    usuarios
    where NombreUsuario =nombre;
    
    set @sql = null;
    
	set @sql = concat('select distinct
		car.Id, 
		concat(car.DescripcionCarrera,\'\(\'\,arc.Acronimo,\'\)\'\) as DescripcionCarrera
	from 
	carrera as car
	inner join
	carrera_centro as cc 
	on cc.Carrera_Id = car.Id
	inner join 
	usuario_centros as uc
	on uc.Centro_Id = cc.Centro_Id
    inner join areas_del_conocimiento as arc
    on arc.Id = car.AreasDelConocimiento_Id
	where car.Estado = 1 
	and cc.Estado = 1
');
    
    if(centroId <> 0) then
    set @sql = concat(@sql, ' and 
	cc.Centro_Id = ', centroId);
    end if;
    
    if(usuarioId <> 0) then
    set @sql = concat(@sql, ' and 
	uc.Usuarios_Id = ', usuarioId);
    end if;
	
    set @sql = concat(@sql, ' order by car.Id');
    
	prepare stmt from @sql;
	execute stmt;
	deallocate prepare stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `permiso_centros_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `permiso_centros_usuario`(
in nombre varchar(140),
in tipo int
)
BEGIN

declare usuarioId int;
set @sql = "";
    
    
    select Id into usuarioId
    from 
    usuarios
    where NombreUsuario =nombre;
    
	set @sql = concat('select
	c.Id,
   concat(c.DescripcionCentro,\'\(\'\,tc.DescripcionTipoCentro,\'\)\'\) as Centro
   from 
	centro as c
    inner join tipo_de_centro as tc
    on tc.Id = c.TipoDeCentro_Id
    inner join usuario_centros as uc
    on uc.Centro_Id = c.Id
    where 
    c.Estado = 1
    and
    uc.Usuarios_Id = ', usuarioId);
	if(tipo = 1) then
	set @sql = concat(@sql, ' and tc.Id in (1,2,8)');
	end if;

	if(tipo = 2) then
	set @sql = concat(@sql, ' and tc.Id in (6)');
	end if;
    
    set @sql = concat(@sql, ' order by c.Padre_Id, c.TipoDeCentro_Id');
prepare stmt from @sql;
execute stmt;
deallocate prepare stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `permiso_funcion_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `permiso_funcion_usuario`(
in nombre varchar(140),
in AcronimoB varchar(25)
)
BEGIN
declare usuarioId int;
declare valido int;
	 
		select Id into usuarioId
		from 
		usuarios
		where NombreUsuario =nombre;
		
		select
		count(fs.Estado) into valido
		from
		funciones f
		inner join funciones_usuario fs
		on fs.Funciones_Id = f.Id

		where 
		f.Acronimo = AcronimoB
		and fs.Usuarios_Id = usuarioId
		and fs.Estado = 1;
        
        if(valido > 0) then
			select true Estado;
		else
			select false Estado;
		end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registro_detalle_matriculados_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_detalle_matriculados_crear`(
in matriculaId int,
in anioCarreraId int,
in modalidadId int,
in grupoId int,
in turnoId int,
in femenino int,
in masculino int
)
BEGIN

	insert into
    detalle_registro_matricula
    (registro_matricula_id,
    anio_carrera_id,
    modalidad_id,
    grupo_id,
    turno_id,
    cantidad_femenino,
    cantidad_masculino)
    values
    (matriculaId,
    anioCarreraId,
    modalidadId,
    grupoId,
    turnoId,
    femenino,
    masculino);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registro_matricula_anular` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_matricula_anular`(
in IdConsultar int
)
BEGIN

update registro_matricula
set Estado = 0 
where Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registro_matricula_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_matricula_crear`(
in CentroId int,
in CarreraId int,
in TipoIngresoId int,
in SemestreId int,
in AnioLectivoId int,
in nombre varchar(140),
in Total_R int
)
BEGIN
	declare usuarioId int;
    declare CarreraCentroId int;
    
    
    select Id into usuarioId
    from 
    usuarios
    where NombreUsuario =nombre;
    
        
    SELECT 
	Id into CarreraCentroId
	FROM 
	sirema.carrera_centro
	where 
	Centro_Id = CentroId
	and Carrera_Id = CarreraId;
    
    
    insert into
    registro_matricula
    (CarreraCentro_Id, 
    TipoIngreso_Id, 
    Semestre_Id, 
    AnioLectivo_Id,
    Usuarios_Id,
    Total)
    Values
    (CarreraCentroId,
    TipoIngresoId,
    SemestreId,
    AnioLectivoId,
    usuarioId,
    Total_R);
    
    select LAST_INSERT_ID() as lastId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registro_matricula_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registro_matricula_index`(
in nombre varchar(140),
in centroId int,
in carreraId int,
in anioLectivoId int,
in tipoIngresoId int
)
BEGIN
declare usuarioId int;
set @sql = null;    
    
    select Id into usuarioId
    from 
    usuarios
    where NombreUsuario =nombre;
    
set @sql = concat("select 
			rm.Id,
			rm.Total,
			cen.DescripcionCentro as Centro,
			car.DescripcionCarrera as Carrera,
			ti.DescripcionTipoIngreso as TipoIngreso,
			sem.DescripcionSemestre as Semestre,
			anl.AnioLectivo as Anio,
			rm.FechaDeMatricula as Fecha
			from 
			registro_matricula as rm
			inner join carrera_centro as car_cen
			on rm.CarreraCentro_Id = car_cen.Id
			inner join centro as cen
			on cen.Id = car_cen.Centro_Id
			inner join carrera as car
			on car.Id = car_cen.Carrera_Id
			inner join tipo_ingreso as ti
			on ti.Id = rm.TipoIngreso_Id
			inner join semestre as sem
			on sem.Id = rm.Semestre_Id
			inner join anio_lectivo as anl
			on anl.Id = rm.AnioLectivo_Id
            
            where rm.Usuarios_Id =",usuarioId);	

	if(centroId <> 0) then
		set @sql = concat(@sql, ' and cen.Id =',centroId);
    end if;
    
    if(carreraId <> 0) then
		set @sql = concat(@sql, ' and car.Id =',carreraId);
    end if;
    
    if(anioLectivoId <> 0) then
		set @sql = concat(@sql, ' and anl.Id =',anioLectivoId);
    end if;
    
    if(tipoIngresoId <> 0) then
		set @sql = concat(@sql, ' and ti.Id =',tipoIngresoId);
    end if;
    
    set @sql = concat(@sql, ' order by cen.Id');
	prepare stmt from @sql;
	execute stmt;
	deallocate prepare stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_consolidado_matriculados_bicu_cnu` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_consolidado_matriculados_bicu_cnu`(
in AnioId int,
in SemestreId int
)
BEGIN

		select distinct
	sum(drm.cantidad_femenino + drm.cantidad_masculino) as Total,
	rma.Semestre_Id,
	tr.Id as TurnoId,
	tr.DescripcionTurno,
	tmo.DescripcionDeTipo,
	tmo.Id as tipoId
	from 
	registro_matricula rma
	inner join detalle_registro_matricula drm
	on drm.registro_matricula_id = rma.Id
	inner join turnos as tr
	on tr.Id = drm.turno_id
	inner join modalidad mo
	on mo.Id = tr.Modalidad_Id
	inner join tipo_de_modalidad as tmo
	on tmo.Id = mo.TipoModalidad_Id

	where rma.AnioLectivo_Id = AnioId
    and rma.Semestre_Id = SemestreId
    and rma.Estado = 1

	group by 
	rma.Semestre_Id,
	tr.Id,
	tr.DescripcionTurno,
	tmo.DescripcionDeTipo,
	tmo.Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_consolidado_matriculados_centro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_consolidado_matriculados_centro`(
in nombre varchar(140),
in CentroId int,
in AnioId int,
in SemestreId int
)
BEGIN

declare usuarioId int;
	set @sql = ""; 
	
	select Id into usuarioId
	from 
	usuarios
	where NombreUsuario =nombre;
  
  set @sql = concat("
		select distinct
cen.DescripcionCentro,
cen.Id as centroId,
rma.TipoIngreso_Id,
anl.AnioLectivo,
cen.TipoDeCentro_Id,
sum(rma.Total) as Total
from registro_matricula as rma
inner join carrera_centro as cc
on cc.Id = rma.CarreraCentro_Id
inner join centro as cen
on cen.Id = cc.Centro_Id
inner join anio_lectivo as anl
on anl.Id = rma.AnioLectivo_Id
inner join usuario_centros as uc
on uc.Centro_Id = cen.Id

where cen.TipoDeCentro_Id in (1,2,8)
and rma.Estado = 1
and uc.Usuarios_Id=", usuarioId,' and anl.Id =',AnioId
,' and rma.Semestre_Id = ',SemestreId); 

if(CentroId > 0) then
    
	set @sql = concat(@sql, " and cen.Id = ",CentroId);
    end if;

 set @sql = concat(@sql, " group by cen.DescripcionCentro, rma.TipoIngreso_Id, 
							anl.AnioLectivo,cen.TipoDeCentro_Id,cen.Id
                            
                            order by cen.TipoDeCentro_Id,rma.TipoIngreso_Id");
    prepare stmt from @sql;
	execute stmt;
	deallocate prepare stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_consolidado_por_area_conocimiento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_consolidado_por_area_conocimiento`(
in anioId int,
in areaId int
)
BEGIN

	select distinct
	rma.TipoIngreso_Id as Tipo,
	sum(rma.Total) as Total
	from 
	registro_matricula as rma
	inner join carrera_centro as cc
	on cc.Id = rma.CarreraCentro_Id
	inner join carrera as car
	on car.Id = cc.Carrera_Id

	where car.AreasDelConocimiento_Id = areaId
	and rma.Estado =1
	and rma.AnioLectivo_Id = anioId

	group by 
	rma.TipoIngreso_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_consolidad_matriculados_unicam` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_consolidad_matriculados_unicam`(
in CentroId int
)
BEGIN

select distinct
rma.TipoIngreso_Id,
anl.AnioLectivo,
cen.TipoDeCentro_Id,
sum(rma.Total) as Total
from registro_matricula as rma
inner join carrera_centro as cc
on cc.Id = rma.CarreraCentro_Id
inner join centro as cen
on cen.Id = cc.Centro_Id
inner join anio_lectivo as anl
on anl.Id = rma.AnioLectivo_Id

where cen.TipoDeCentro_Id in (6) and cen.Padre_Id = CentroId

group by rma.TipoIngreso_Id, anl.AnioLectivo,cen.TipoDeCentro_Id

order by cen.TipoDeCentro_Id,rma.TipoIngreso_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_multiple_matriculados_por_tipoIngreso_centros` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_multiple_matriculados_por_tipoIngreso_centros`(
in nombre varchar(140),
in CentroId int,
in TipoIngresoId int,
in SemestreId int,
in AnioLectivoId int,
in tipo int
)
BEGIN
	declare usuarioId int;
	set @sql = ""; 
	
	select Id into usuarioId
	from 
	usuarios
	where NombreUsuario =nombre;

	

   
    
	if(usuarioId > 0)
    then
    set @sql = concat("
		SELECT distinct
		c.Id,
		c.DescripcionCentro as Centro,
        ti.DescripcionTipoIngreso as TI,
        sem.DescripcionSemestre as Sem,
        mun.DescripcionMunicipio as Mun,
        com.DescripcionComunidad as Com,
        c.Padre_Id,
        tc.DescripcionTipoCentro as TC,
        (select DescripcionCentro from centro_padres where Id = c.Padre_Id) as Padre
		FROM 
		 sirema.usuario_centros as uc
		 inner join centro as c 
		 on c.Id = uc.Centro_Id
         inner join carrera_centro as carcen
         on carcen.Centro_Id = c.Id
         inner join registro_matricula as regm
         on regm.CarreraCentro_Id = carcen.Id
         inner join tipo_ingreso as ti
         on ti.Id = regm.TipoIngreso_Id
         inner join semestre as sem
         on sem.Id = regm.Semestre_Id
         inner join comunidad as com
         on com.Id = c.Comunidad_Id
         inner join municipio as mun
         on mun.Id = com.Municipio_Id
		 inner join tipo_de_centro as tc
         on tc.Id = c.TipoDeCentro_Id         
         where uc.Usuarios_Id=", usuarioId
         ,' and regm.AnioLectivo_Id = ',AnioLectivoId); 
	
    if(CentroId > 0) then
    
	set @sql = concat(@sql, " and c.Id = ",CentroId);
    end if;
    
    if(TipoIngresoId > 0) then
    
	set @sql = concat(@sql, " and ti.Id = ",TipoIngresoId);
    end if;
    
    if(tipo = 1) then
	set @sql = concat(@sql, ' and c.TipoDeCentro_Id in (1,2,8) ');
	end if;

	if(tipo = 2) then
	set @sql = concat(@sql, ' and c.TipoDeCentro_Id in (6) ');
	end if;
    
    if(SemestreId > 0) then
    
	set @sql = concat(@sql, " and sem.Id = ",SemestreId);
    end if;
    
    set @sql = concat(@sql, " order by c.Padre_Id, c.Id");
    prepare stmt from @sql;
	execute stmt;
	deallocate prepare stmt;
    
    
    else
    select "";
    end if;   

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_multiple_matriculados_por_tipoIngreso_centros_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_multiple_matriculados_por_tipoIngreso_centros_detalle`(
in CentroId int,
in TipoIngresoId int,
in SemestreId int,
in AnioLectivoId int
)
BEGIN

select
	cen.DescripcionCentro as Centro,
	arco.DescripcionAreaConocimiento as AreaC,
    concat(arco.Id,'_',cen.Id) as ARC,
	car.DescripcionCarrera as Carrera,
	ac.DescripcionAnioCarrera as anio,
	m.DescripcionModalidad as modalidad,
	sum(drm.cantidad_femenino) as fem,
	sum(drm.cantidad_masculino) as mas,
    sum(drm.cantidad_femenino + drm.cantidad_masculino) as TotalR
	from 
	detalle_registro_matricula as drm
	inner join anio_de_carrera as ac
	on ac.Id = drm.anio_carrera_id
	inner join modalidad as m
	on m.Id = drm.modalidad_id
    inner join registro_matricula as rma
    on rma.Id = drm.registro_matricula_id
    inner join carrera_centro as cacen
    on cacen.Id = rma.CarreraCentro_Id
    inner join carrera as car
    on car.Id = cacen.Carrera_Id
    inner join areas_del_conocimiento as arco
    on arco.Id = car.AreasDelConocimiento_Id
    inner join centro as cen
    on cen.Id = cacen.Centro_Id
    where 
    cen.Id = CentroId and
    rma.TipoIngreso_Id = TipoIngresoId
    and rma.Semestre_Id = SemestreId
    and rma.Estado = 1 
    and rma.AnioLectivo_Id = AnioLectivoId
    
    group by
    cen.DescripcionCentro,
    arco.DescripcionAreaConocimiento,
    car.DescripcionCarrera,
    ac.DescripcionAnioCarrera,
    m.DescripcionModalidad,
    cen.Id,
    arco.Id,
    ac.Id,
    car.Id,
     m.Id
    order by 
    cen.Id,
    arco.Id,
    ac.Id,
    car.Id,
    m.Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_registro_matriculado_individual` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_registro_matriculado_individual`(
in Id_Consultar int
)
BEGIN
	select 
	rm.Id,
	rm.Total,
	cen.DescripcionCentro as Centro,
	car.DescripcionCarrera as Carrera,
	ti.DescripcionTipoIngreso as TipoIngreso,
	sem.DescripcionSemestre as Semestre,
	anl.AnioLectivo as Anio,
	rm.FechaDeMatricula as Fecha
	from 
	registro_matricula as rm
	inner join carrera_centro as car_cen
	on rm.CarreraCentro_Id = car_cen.Id
	inner join centro as cen
	on cen.Id = car_cen.Centro_Id
	inner join carrera as car
	on car.Id = car_cen.Carrera_Id
	inner join tipo_ingreso as ti
	on ti.Id = rm.TipoIngreso_Id
	inner join semestre as sem
	on sem.Id = rm.Semestre_Id
	inner join anio_lectivo as anl
	on anl.Id = rm.AnioLectivo_Id
    
    where
    rm.Id = Id_Consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_registro_matriculado_individual_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_registro_matriculado_individual_detalle`(
in Id_Consultar int
)
BEGIN

	select
	ac.DescripcionAnioCarrera as anio,
	m.DescripcionModalidad as modalidad,
	drm.cantidad_femenino as fem,
	drm.cantidad_masculino as mas,
    (drm.cantidad_femenino + drm.cantidad_masculino) as TotalR
	from 
	detalle_registro_matricula as drm
	inner join anio_de_carrera as ac
	on ac.Id = drm.anio_carrera_id
	inner join modalidad as m
	on m.Id = drm.modalidad_id
	where
	registro_matricula_id  = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_ultima_actualizacion_de_registros_por_centro` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_ultima_actualizacion_de_registros_por_centro`(
in nombre varchar(140),
in CentroId int,
in TipoIngresoId int,
in SemestreId int,
in AnioLectivoId int
)
BEGIN
declare usuarioId int;
	set @sql = ""; 
	
	select Id into usuarioId
	from 
	usuarios
	where NombreUsuario =nombre;
	

if(usuarioId > 0)
    then
    set @sql = concat("
		SELECT distinct
		c.Id,
		c.DescripcionCentro as Centro,
        ti.DescripcionTipoIngreso as TI,
        sem.DescripcionSemestre as Sem,
        mun.DescripcionMunicipio as Mun,
        c.Padre_Id,",
        "(select max(regm2.FechaDeMatricula) 
        from registro_matricula as regm2
        inner join carrera_centro as cc2
        inner join usuario_centros as uc2
        on uc2.Centro_Id = cc2.Centro_Id
        on cc2.Id = regm2.CarreraCentro_Id
        where uc2.Usuarios_Id =", usuarioId);
         if(AnioLectivoId > 0) then
    
		set @sql = concat(@sql, " and regm2.AnioLectivo_Id = ",AnioLectivoId);
		end if;
        
        if(TipoIngresoId > 0) then
    
		set @sql = concat(@sql, " and regm2.TipoIngreso_Id = ",TipoIngresoId);
		end if;
        
        if(SemestreId > 0) then
    
		set @sql = concat(@sql, " and regm2.Semestre_Id = ",SemestreId);
		end if;
        
		if(CentroId > 0) then
		
		set @sql = concat(@sql, " and cc2.Id = ",CentroId);
		end if;
	
        set @sql =concat(@sql,") Fecha
		FROM 
		 sirema.usuario_centros as uc
		 inner join centro as c 
		 on c.Id = uc.Centro_Id
         inner join carrera_centro as carcen
         on carcen.Centro_Id = c.Id
         inner join registro_matricula as regm
         on regm.CarreraCentro_Id = carcen.Id
         inner join tipo_ingreso as ti
         on ti.Id = regm.TipoIngreso_Id
         inner join semestre as sem
         on sem.Id = regm.Semestre_Id
         inner join comunidad as com
         on com.Id = c.Comunidad_Id
         inner join municipio as mun
         on mun.Id = com.Municipio_Id
         where uc.Usuarios_Id =", usuarioId); 
	
    if(CentroId > 0) then
    
	set @sql = concat(@sql, " and c.Id = ",CentroId);
    end if;
    
    if(TipoIngresoId > 0) then
    
	set @sql = concat(@sql, " and ti.Id = ",TipoIngresoId);
    end if;
    
    if(SemestreId > 0) then
    
	set @sql = concat(@sql, " and sem.Id = ",SemestreId);
    end if;
    
     if(AnioLectivoId > 0) then
    
	set @sql = concat(@sql, " and regm.AnioLectivo_Id = ",AnioLectivoId);
    end if;
    
    set @sql = concat(@sql, " order by c.Padre_Id, c.Id;");
    prepare stmt from @sql;
	execute stmt;
	deallocate prepare stmt;
    
    
    else
    select "";
    end if; 
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `reporte_ultima_actualizacion_de_registro_por_centro_detalle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `reporte_ultima_actualizacion_de_registro_por_centro_detalle`(
in nombre varchar(140),
in CentroId int,
in TipoIngresoId int,
in SemestreId int,
in AnioLectivoId int
)
BEGIN

declare usuarioId int;
	set @sql = ""; 
	
	select Id into usuarioId
	from 
	usuarios
	where NombreUsuario =nombre;
    
    select 
	cen.DescripcionCentro as Centro,
	arco.DescripcionAreaConocimiento as AreaC,
    concat(arco.Id,'_',cen.Id) as ARC,
	car.DescripcionCarrera as Carrera,
	ac.DescripcionAnioCarrera as anio,
	m.DescripcionModalidad as modalidad,
	sum(drm.cantidad_femenino) as fem,
	sum(drm.cantidad_masculino) as mas,
    sum(drm.cantidad_femenino + drm.cantidad_masculino) as TotalR,
    gr.DescripcionGrupo as grupo,
    tr.DescripcionTurno as turno,
   
    (select max(regm2.FechaDeMatricula) 
        from registro_matricula as regm2
        inner join carrera_centro as cc2
        on cc2.Id = regm2.CarreraCentro_Id
        inner join usuario_centros as uc2
        on uc2.Centro_Id = cc2.Centro_Id
        inner join detalle_registro_matricula as drm2
        on regm2.Id = drm2.registro_matricula_id
        where uc2.Usuarios_Id = usuarioId
        and regm2.AnioLectivo_Id = AnioLectivoId
        and regm2.TipoIngreso_Id = TipoIngresoId
        and regm2.Semestre_Id = SemestreId
        and cc2.Centro_Id = CentroId
        and cc2.Carrera_Id = car.Id
        and drm2.modalidad_id = m.Id
        and drm2.grupo_id = gr.Id
        and drm2.turno_id = tr.Id) as Fecha
	from 
	detalle_registro_matricula as drm
	inner join anio_de_carrera as ac
	on ac.Id = drm.anio_carrera_id
	inner join modalidad as m
	on m.Id = drm.modalidad_id
    inner join registro_matricula as rma
    on rma.Id = drm.registro_matricula_id
    inner join carrera_centro as cacen
    on cacen.Id = rma.CarreraCentro_Id
    inner join carrera as car
    on car.Id = cacen.Carrera_Id
    inner join areas_del_conocimiento as arco
    on arco.Id = car.AreasDelConocimiento_Id
    inner join centro as cen
    on cen.Id = cacen.Centro_Id
    inner join usuario_centros as ucen
    on ucen.Centro_Id = cen.Id
    inner join grupos as gr
    on gr.Id = drm.grupo_id
    inner join turnos as tr
    on tr.Id = drm.turno_id
    where 
    cen.Id = CentroId and
    rma.TipoIngreso_Id = TipoIngresoId
    and rma.Semestre_Id = SemestreId
    and rma.AnioLectivo_Id = AnioLectivoId
    and ucen.Usuarios_Id = usuarioId
    and rma.Estado = 1
    
    group by
    cen.DescripcionCentro,
    arco.DescripcionAreaConocimiento,
    car.DescripcionCarrera,
    ac.DescripcionAnioCarrera,
    m.DescripcionModalidad,
    gr.DescripcionGrupo,
    tr.DescripcionTurno,
    cen.Id,
    arco.Id,
    ac.Id,
    car.Id,
     gr.Id,
    tr.Id,
     m.Id
    order by 
    cen.Id,
    arco.Id,
    ac.Id,
    car.Id,
    m.Id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `semestre_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `semestre_actualizar`(
in Id_Consultar int,
in Descripcion varchar(40)
)
BEGIN

	update
    semestre
    set DescripcionSemestre = Descripcion
    where Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `semestre_actualizar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `semestre_actualizar_estado`(
in Id_Consultar int,
in Estado_N tinyint
)
BEGIN

	update
    semestre
    set 
    Estado = Estado_N
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `semestre_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `semestre_cambiar_estado`(
in Id_Consultar int,
in Estado_N tinyint
)
BEGIN

	update
    semestre
    set 
    Estado = Estado_N
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `semestre_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `semestre_crear`(
in Descripcion varchar(40)
)
BEGIN

	insert into
    semestre
    (DescripcionSemestre)
    values
    (Descripcion);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `semestre_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `semestre_encontrar`(
in Id_Consultar int
)
BEGIN

	select 
    *
    from
    semestre
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `semestre_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `semestre_index`()
BEGIN

declare activos int;
	select
    count(*) into activos
    from
    semestre
    where Estado = 1;
    
	select
    *, activos
    from
    semestre;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `semestre_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `semestre_validar_duplicado`(
in Descripcion varchar(40)
)
BEGIN

	select
    count(*) as count
    from 
    semestre
    where 
    DescripcionSemestre = Descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_centro_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_centro_actualizar`(
in Descripcion varchar(250),
in Id_consultar int
)
BEGIN
	UPDATE tipo_de_centro
    SET
    DescripcionTipoCentro = Descripcion
	WHERE Id = Id_consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_centro_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_centro_cambiar_estado`(
in Estado_N tinyint,
in id_consultar int
)
BEGIN
	UPDATE tipo_de_centro
    SET Estado = Estado_N
    WHERE Id = id_consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_centro_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_centro_crear`(
in Descripcion varchar(250)
)
BEGIN
		INSERT INTO tipo_de_centro (DescripcionTipoCentro)
        Values (Descripcion);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_centro_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_centro_encontrar`(
in id_consultar int
)
BEGIN
	SELECT 
    * 
    FROM 
    tipo_de_centro
    WHERE Id = id_consultar;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_centro_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_centro_index`()
BEGIN
	declare activos int;
	select 
    count(*) into activos
    from tipo_de_centro
    where Estado = 1;
    
	select 
    *, activos
    from tipo_de_centro;
    
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_centro_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_centro_validar_duplicado`(
in Descripcion varchar(250)
)
BEGIN
	SELECT COUNT(Id) as count from tipo_de_centro
    WHERE DescripcionTipoCentro = Descripcion
    and Estado = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_ingreso_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_ingreso_actualizar`(
in Id_Consultar int,
in Descripcion varchar(24)
)
BEGIN

	update
    tipo_ingreso
    set
    DescripcionTipoIngreso = Descripcion
    where 
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_ingreso_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_ingreso_cambiar_estado`(
in Id_Consultar int,
in Estado_N tinyint
)
BEGIN

	update
    tipo_ingreso
    set
    Estado = Estado_N
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_ingreso_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_ingreso_crear`(
in Descripcion varchar(24)
)
BEGIN

	insert into
    tipo_ingreso
    (DescripcionTipoIngreso)
    values
    (Descripcion);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_ingreso_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_ingreso_encontrar`(
in Id_Consultar int
)
BEGIN

	select
    *
    from
    tipo_ingreso
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_ingreso_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_ingreso_index`()
BEGIN

	select
    *
    from
    tipo_ingreso;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_ingreso_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_ingreso_validar_duplicado`(
in Descripcion varchar(24)
)
BEGIN

	select
    count(*) as count
    from
    tipo_ingreso
    where
    DescripcionTipoIngreso = Descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_modalidad_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_modalidad_actualizar`(
in IdConsultar int,
in DescripcionTipo varchar(50)
)
BEGIN

	UPDATE
    tipo_de_modalidad
    SET
    DescripcionDeTipo = DescripcionTipo
    Where
    Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_modalidad_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_modalidad_cambiar_estado`(
in IdConsultar int,
in EstadoN tinyint
)
BEGIN

	UPDATE
    tipo_de_modalidad
    SET
    Estado = EstadoN
    Where Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_modalidad_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_modalidad_crear`(
in DescripcionTipo varchar(50)
)
BEGIN

	INSERT INTO
    tipo_de_modalidad
    (DescripcionDeTipo)
    values
    (DescripcionTipo);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_modalidad_create` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_modalidad_create`(
in DescripcionTipo varchar(50)
)
BEGIN

	INSERT INTO
    tipo_de_modalidad
    (DescripcionDeTipo)
    values
    (DescripcionTipo);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_modalidad_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_modalidad_encontrar`(
in IdConsultar int
)
BEGIN

	select
    *
    From
    tipo_de_modalidad
    Where
    Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_modalidad_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_modalidad_index`()
BEGIN

declare activos int;
select 
count(*) into activos 
from tipo_de_modalidad
where Estado = 1;


select *,activos from tipo_de_modalidad;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `tipo_modalidad_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `tipo_modalidad_validar_duplicado`(
in Descripcion varchar(50)
)
BEGIN

select
    count(*) as count
    from
    tipo_de_modalidad
    where
    DescripcionDeTipo = Descripcion;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `turnos_de_modalidad` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `turnos_de_modalidad`(
in ModalidadId int
)
BEGIN

select
t.Id,
t.DescripcionTurno
from 
turnos as t
where t.Estado = 1
and t.Modalidad_Id = ModalidadId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `turno_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `turno_actualizar`(
in IdConsultar int,
in Descripcion varchar(40),
in Modalidad int
)
BEGIN

	UPDATE
    turnos
    Set
    DescripcionTurno = Descripcion,
    Modalidad_Id = Modalidad
    where
    Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `turno_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `turno_cambiar_estado`(
in IdConsultar int,
in EstadoN tinyint
)
BEGIN

	update
    turnos
    set
    Estado = EstadoN
    Where
    Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `turno_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `turno_crear`(
in Descripcion varchar(40),
in Modalidad int
)
BEGIN

	insert into
    turnos
    (DescripcionTurno, Modalidad_Id)
    values
    (Descripcion, Modalidad);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `turno_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `turno_encontrar`(
in IdConsultar int
)
BEGIN

	select
    *
    from 
    turnos
    where
    Id = IdConsultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `turno_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `turno_index`()
BEGIN

	select
    t.Id,
    t.DescripcionTurno,
    t.Estado,
    m.DescripcionModalidad as Modalidad
    from 
    turnos as t
    inner join modalidad as m
    on m.Id = t.Modalidad_Id
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `turno_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `turno_validar_duplicado`(
in Descripcion varchar(40),
in Modalidad int
)
BEGIN

	select
    count(*) as count
    from 
    turnos
    where
    DescripcionTurno = Descripcion
    and 
    Modalidad_Id = Modalidad;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuario_actualizar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_actualizar`(
in Id_Consultar int,
in Nombre varchar(140),
in CentroId int
)
BEGIN

	update
    usuarios
    set
    NombreUsuario = Nombre,
    Centro_Id = CentroId
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuario_actualizar_clave` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_actualizar_clave`(
in Id_Consultar int,
in Clave_N text
)
BEGIN

	update
    usuarios
    set
    Clave = Clave_N
    where
    Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuario_cambiar_estado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_cambiar_estado`(
in Id_Consultar int,
in Estado_N tinyint
)
BEGIN

	update
    usuarios
    set
    Estado = Estado_N
    where Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuario_crear` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_crear`(
in Nombre varchar(140),
in CentroId int,
in Contra text
)
BEGIN
	
    declare ActualDate datetime default Now();
    
	insert into
    usuarios
    (NombreUsuario, Centro_Id, Clave, FechaCreacion)
    values
    (Nombre, CentroId, Contra,ActualDate);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuario_encontrar` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_encontrar`(
in Id_Consultar int
)
BEGIN

	select
    Id,
    NombreUsuario,
    Estado,
    Centro_Id
    from 
    usuarios
    where Id = Id_Consultar;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuario_index` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_index`()
BEGIN

	select
    u.Id,
    u.NombreUsuario,
    u.Estado,
    u.FechaCreacion,
    c.DescripcionCentro as Centro
from usuarios as u
inner join
centro as c
on c.Id = u.Centro_Id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuario_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_login`(
in Nombre varchar(140)
)
BEGIN

	select
    u.NombreUsuario,
    u.Clave,
    c.DescripcionCentro as centro
    from
    usuarios as u
    inner join centro as c
    on c.Id = u.Centro_Id
    where
    u.NombreUsuario = Nombre
    and u.Estado = 1;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `usuario_validar_duplicado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb3_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `usuario_validar_duplicado`(
in Nombre varchar(140),
in CentroId int
)
BEGIN

	select
    count(*) as count
    from 
    usuarios
    where
    NombreUsuario = Nombre
    and Centro_Id = CentroId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `centro_hijos`
--

/*!50001 DROP VIEW IF EXISTS `centro_hijos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `centro_hijos` AS select `c`.`Id` AS `Id`,`c`.`DescripcionCentro` AS `DescripcionCentro`,`c`.`Estado` AS `Estado`,`tc`.`DescripcionTipoCentro` AS `DescripcionTipoCentro`,`com`.`DescripcionComunidad` AS `DescripcionComunidad`,`tc`.`Id` AS `TipoCentro`,`cp`.`DescripcionCentro` AS `Padre`,`c`.`Padre_Id` AS `Padre_Id` from (((`centro` `c` join `tipo_de_centro` `tc` on((`tc`.`Id` = `c`.`TipoDeCentro_Id`))) join `comunidad` `com` on((`com`.`Id` = `c`.`Comunidad_Id`))) join `centro_padres` `cp` on((`cp`.`Id` = `c`.`Padre_Id`))) where ((`c`.`Padre_Id` > 0) and (`c`.`TipoDeCentro_Id` = 6)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `centro_padres`
--

/*!50001 DROP VIEW IF EXISTS `centro_padres`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `centro_padres` AS select `c`.`Id` AS `Id`,`c`.`DescripcionCentro` AS `DescripcionCentro`,`c`.`Estado` AS `Estado`,`tc`.`DescripcionTipoCentro` AS `DescripcionTipoCentro`,`com`.`DescripcionComunidad` AS `DescripcionComunidad`,`tc`.`Id` AS `TipoCentro`,'Es Padre' AS `Padre`,`c`.`Padre_Id` AS `Padre_Id` from ((`centro` `c` join `tipo_de_centro` `tc` on((`tc`.`Id` = `c`.`TipoDeCentro_Id`))) join `comunidad` `com` on((`com`.`Id` = `c`.`Comunidad_Id`))) where ((`c`.`Padre_Id` = 0) and (`c`.`TipoDeCentro_Id` in (1,2,8))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `centros_todos`
--

/*!50001 DROP VIEW IF EXISTS `centros_todos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `centros_todos` AS select `ch`.`Id` AS `Id`,concat(`ch`.`DescripcionCentro`,'(',`ch`.`DescripcionTipoCentro`,')') AS `DescripcionCentro`,`ch`.`Estado` AS `Estado`,`ch`.`DescripcionTipoCentro` AS `DescripcionTipoCentro`,`ch`.`DescripcionComunidad` AS `DescripcionComunidad`,`ch`.`TipoCentro` AS `TipoCentro`,`ch`.`Padre` AS `Padre`,`ch`.`Padre_Id` AS `Padre_Id` from `centro_hijos` `ch` union select `cp`.`Id` AS `Id`,concat(`cp`.`DescripcionCentro`,'(',`cp`.`DescripcionTipoCentro`,')') AS `DescripcionCentro`,`cp`.`Estado` AS `Estado`,`cp`.`DescripcionTipoCentro` AS `DescripcionTipoCentro`,`cp`.`DescripcionComunidad` AS `DescripcionComunidad`,`cp`.`TipoCentro` AS `TipoCentro`,`cp`.`Padre` AS `Padre`,`cp`.`Padre_Id` AS `Padre_Id` from `centro_padres` `cp` order by `TipoCentro`,`Padre_Id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `menu_enlaces_hijos`
--

/*!50001 DROP VIEW IF EXISTS `menu_enlaces_hijos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `menu_enlaces_hijos` AS select `menu`.`Id` AS `Id`,`menu`.`TextoMostrar` AS `TextoMostrar`,`menu`.`Modulo` AS `Modulo`,`menu`.`IconoModulo` AS `IconoModulo`,`menu`.`Accion` AS `Accion`,`menu`.`IconoAccion` AS `IconoAccion`,`menu`.`Estado` AS `Estado`,`menu`.`PadreId` AS `PadreId`,`menu`.`Orden` AS `Orden` from `menu` where ((`menu`.`PadreId` > 0) and (`menu`.`Estado` = 1)) order by `menu`.`Orden` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `menu_enlaces_padres`
--

/*!50001 DROP VIEW IF EXISTS `menu_enlaces_padres`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb3_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `menu_enlaces_padres` AS select `menu`.`Id` AS `Id`,`menu`.`TextoMostrar` AS `TextoMostrar`,`menu`.`Modulo` AS `Modulo`,`menu`.`IconoModulo` AS `IconoModulo`,`menu`.`Accion` AS `Accion`,`menu`.`IconoAccion` AS `IconoAccion`,`menu`.`Estado` AS `Estado`,`menu`.`PadreId` AS `PadreId`,`menu`.`Orden` AS `Orden` from `menu` where ((`menu`.`PadreId` = 0) and (`menu`.`Estado` = 1)) */;
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

-- Dump completed on 2026-08-03 17:53:21
