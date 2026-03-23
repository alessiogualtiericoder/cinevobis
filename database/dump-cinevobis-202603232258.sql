-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: cinevobis
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films` (
  `id_film` int NOT NULL AUTO_INCREMENT,
  `titolo` varchar(255) NOT NULL,
  `trama` text,
  `durata_minuti` int DEFAULT NULL,
  `data_uscita` date DEFAULT NULL,
  `copertina` varchar(255) DEFAULT NULL,
  `youtube_id` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_film`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_generi`
--

DROP TABLE IF EXISTS `films_generi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_generi` (
  `id_film` int NOT NULL,
  `id_genere` int NOT NULL,
  PRIMARY KEY (`id_film`,`id_genere`),
  KEY `id_genere` (`id_genere`),
  CONSTRAINT `films_generi_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `films_generi_ibfk_2` FOREIGN KEY (`id_genere`) REFERENCES `generi` (`id_genere`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_generi`
--

LOCK TABLES `films_generi` WRITE;
/*!40000 ALTER TABLE `films_generi` DISABLE KEYS */;
/*!40000 ALTER TABLE `films_generi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_persone`
--

DROP TABLE IF EXISTS `films_persone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_persone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_film` int NOT NULL,
  `id_persona` int NOT NULL,
  `ruolo` enum('Regista','Attore') DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_film` (`id_film`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `films_persone_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `films_persone_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persone` (`id_persona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_persone`
--

LOCK TABLES `films_persone` WRITE;
/*!40000 ALTER TABLE `films_persone` DISABLE KEYS */;
/*!40000 ALTER TABLE `films_persone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `generi`
--

DROP TABLE IF EXISTS `generi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `generi` (
  `id_genere` int NOT NULL AUTO_INCREMENT,
  `nome_genere` varchar(100) NOT NULL,
  PRIMARY KEY (`id_genere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generi`
--

LOCK TABLES `generi` WRITE;
/*!40000 ALTER TABLE `generi` DISABLE KEYS */;
/*!40000 ALTER TABLE `generi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nazioni`
--

DROP TABLE IF EXISTS `nazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nazioni` (
  `id_nazione` int NOT NULL AUTO_INCREMENT,
  `nome_nazione` varchar(100) NOT NULL,
  PRIMARY KEY (`id_nazione`)
) ENGINE=InnoDB AUTO_INCREMENT=184 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nazioni`
--

LOCK TABLES `nazioni` WRITE;
/*!40000 ALTER TABLE `nazioni` DISABLE KEYS */;
INSERT INTO `nazioni` VALUES (1,'Afghanistan'),(2,'Albania'),(3,'Algeria'),(4,'Andorra'),(5,'Angola'),(6,'Arabia Saudita'),(7,'Argentina'),(8,'Armenia'),(9,'Australia'),(10,'Austria'),(11,'Azerbaigian'),(12,'Bahamas'),(13,'Bahrain'),(14,'Bangladesh'),(15,'Belgio'),(16,'Belize'),(17,'Benin'),(18,'Bielorussia'),(19,'Bolivia'),(20,'Bosnia ed Erzegovina'),(21,'Botswana'),(22,'Brasile'),(23,'Brunei'),(24,'Bulgaria'),(25,'Burkina Faso'),(26,'Burundi'),(27,'Cambogia'),(28,'Camerun'),(29,'Canada'),(30,'Capo Verde'),(31,'Ciad'),(32,'Cile'),(33,'Cina'),(34,'Cipro'),(35,'Colombia'),(36,'Comore'),(37,'Congo'),(38,'Corea del Nord'),(39,'Corea del Sud'),(40,'Costa Rica'),(41,'Costa d\'Avorio'),(42,'Croazia'),(43,'Cuba'),(44,'Danimarca'),(45,'Ecuador'),(46,'Egitto'),(47,'El Salvador'),(48,'Emirati Arabi Uniti'),(49,'Eritrea'),(50,'Estonia'),(51,'Eswatini'),(52,'Etiopia'),(53,'Figi'),(54,'Filippine'),(55,'Finlandia'),(56,'Francia'),(57,'Gabon'),(58,'Gambia'),(59,'Georgia'),(60,'Germania'),(61,'Ghana'),(62,'Giamaica'),(63,'Giappone'),(64,'Gibuti'),(65,'Giordania'),(66,'Grecia'),(67,'Guatemala'),(68,'Guinea'),(69,'Guinea Equatoriale'),(70,'Guinea-Bissau'),(71,'Guyana'),(72,'Haiti'),(73,'Honduras'),(74,'India'),(75,'Indonesia'),(76,'Iran'),(77,'Iraq'),(78,'Irlanda'),(79,'Islanda'),(80,'Israele'),(81,'Italia'),(82,'Kazakhstan'),(83,'Kenya'),(84,'Kirghizistan'),(85,'Kiribati'),(86,'Kuwait'),(87,'Laos'),(88,'Lesotho'),(89,'Lettonia'),(90,'Libano'),(91,'Liberia'),(92,'Libia'),(93,'Liechtenstein'),(94,'Lituania'),(95,'Lussemburgo'),(96,'Macedonia del Nord'),(97,'Madagascar'),(98,'Malawi'),(99,'Malaysia'),(100,'Maldive'),(101,'Mali'),(102,'Malta'),(103,'Marocco'),(104,'Mauritania'),(105,'Mauritius'),(106,'Messico'),(107,'Moldavia'),(108,'Monaco'),(109,'Mongolia'),(110,'Montenegro'),(111,'Mozambico'),(112,'Myanmar'),(113,'Namibia'),(114,'Nepal'),(115,'Nicaragua'),(116,'Niger'),(117,'Nigeria'),(118,'Norvegia'),(119,'Nuova Zelanda'),(120,'Oman'),(121,'Paesi Bassi'),(122,'Pakistan'),(123,'Palau'),(124,'Panama'),(125,'Papua Nuova Guinea'),(126,'Paraguay'),(127,'Perù'),(128,'Polonia'),(129,'Portogallo'),(130,'Qatar'),(131,'Repubblica Ceca'),(132,'Repubblica Centrafricana'),(133,'Repubblica Democratica del Congo'),(134,'Repubblica Dominicana'),(135,'Romania'),(136,'Ruanda'),(137,'Russia'),(138,'Saint Kitts e Nevis'),(139,'Saint Lucia'),(140,'Saint Vincent e Grenadine'),(141,'Samoa'),(142,'San Marino'),(143,'São Tomé e Príncipe'),(144,'Senegal'),(145,'Serbia'),(146,'Seychelles'),(147,'Sierra Leone'),(148,'Singapore'),(149,'Siria'),(150,'Slovakia'),(151,'Slovenia'),(152,'Somalia'),(153,'Spagna'),(154,'Sri Lanka'),(155,'Stati Uniti'),(156,'Sudafrica'),(157,'Sudan'),(158,'Sudan del Sud'),(159,'Suriname'),(160,'Svezia'),(161,'Svizzera'),(162,'Tagikistan'),(163,'Tanzania'),(164,'Thailandia'),(165,'Timor Est'),(166,'Togo'),(167,'Tonga'),(168,'Trinidad e Tobago'),(169,'Tunisia'),(170,'Turchia'),(171,'Turkmenistan'),(172,'Tuvalu'),(173,'Ucraina'),(174,'Uganda'),(175,'Ungheria'),(176,'Uruguay'),(177,'Uzbekistan'),(178,'Vanuatu'),(179,'Venezuela'),(180,'Vietnam'),(181,'Yemen'),(182,'Zambia'),(183,'Zimbabwe');
/*!40000 ALTER TABLE `nazioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persone`
--

DROP TABLE IF EXISTS `persone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persone` (
  `id_persona` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `id_nazione` int DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `wikipedia_slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `id_nazione` (`id_nazione`),
  CONSTRAINT `persone_ibfk_1` FOREIGN KEY (`id_nazione`) REFERENCES `nazioni` (`id_nazione`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persone`
--

LOCK TABLES `persone` WRITE;
/*!40000 ALTER TABLE `persone` DISABLE KEYS */;
/*!40000 ALTER TABLE `persone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferiti`
--

DROP TABLE IF EXISTS `preferiti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferiti` (
  `id_film` int NOT NULL,
  `id_utente` int NOT NULL,
  `data_inserimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_film`,`id_utente`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `preferiti_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `preferiti_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `preferiti`
--

LOCK TABLES `preferiti` WRITE;
/*!40000 ALTER TABLE `preferiti` DISABLE KEYS */;
/*!40000 ALTER TABLE `preferiti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profili`
--

DROP TABLE IF EXISTS `profili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profili` (
  `id_profilo` int NOT NULL AUTO_INCREMENT,
  `nome_profilo` varchar(100) NOT NULL,
  PRIMARY KEY (`id_profilo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profili`
--

LOCK TABLES `profili` WRITE;
/*!40000 ALTER TABLE `profili` DISABLE KEYS */;
INSERT INTO `profili` VALUES (1,'Admin'),(2,'User');
/*!40000 ALTER TABLE `profili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recensioni`
--

DROP TABLE IF EXISTS `recensioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recensioni` (
  `id_film` int NOT NULL,
  `id_utente` int NOT NULL,
  `voto` decimal(3,1) DEFAULT NULL,
  `testo` text,
  `data_inserimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_film`,`id_utente`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `recensioni_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recensioni_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recensioni`
--

LOCK TABLES `recensioni` WRITE;
/*!40000 ALTER TABLE `recensioni` DISABLE KEYS */;
/*!40000 ALTER TABLE `recensioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessioni`
--

DROP TABLE IF EXISTS `sessioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessioni` (
  `id_sessione` varchar(255) NOT NULL,
  `id_utente` int NOT NULL,
  `data_login` datetime DEFAULT NULL,
  `data_logout` datetime DEFAULT NULL,
  PRIMARY KEY (`id_sessione`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `sessioni_ibfk_1` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessioni`
--

LOCK TABLES `sessioni` WRITE;
/*!40000 ALTER TABLE `sessioni` DISABLE KEYS */;
INSERT INTO `sessioni` VALUES ('aab8eba889e0f3da2895d994145f379d',1,'2026-03-23 16:59:03','2026-03-23 16:59:41'),('b6a1a0d1c14339d8088586607e847689',2,'2026-03-23 17:02:18','2026-03-23 17:02:39'),('db8b8d4c879adede1b7d265f98604fd7',1,'2026-03-23 17:00:57','2026-03-23 17:01:39'),('e76942e1e5ff489c83646f7fb5910a9e',4,'2026-03-23 17:05:27','2026-03-23 17:05:32'),('f0206927e09929e7e820428b54763174',3,'2026-03-23 17:04:05','2026-03-23 17:04:09'),('f6847836291835588bc64ea3e3705f04',1,'2026-03-23 17:05:37','2026-03-23 17:05:59');
/*!40000 ALTER TABLE `sessioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utenti` (
  `id_utente` int NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `cognome` varchar(100) NOT NULL,
  `citta` varchar(100) DEFAULT NULL,
  `id_profilo` int DEFAULT NULL,
  `id_nazione` int DEFAULT NULL,
  `attivo` tinyint(1) DEFAULT '1',
  `foto_profilo` varchar(255) DEFAULT NULL,
  `data_registrazione` datetime DEFAULT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `id_profilo` (`id_profilo`),
  KEY `id_nazione` (`id_nazione`),
  CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`id_profilo`) REFERENCES `profili` (`id_profilo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `utenti_ibfk_2` FOREIGN KEY (`id_nazione`) REFERENCES `nazioni` (`id_nazione`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

LOCK TABLES `utenti` WRITE;
/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES (1,'alessio','$2y$12$rdj0kXwymmx1u55ykdb/g.DhAnhiHv8Flod8pODB.1IWWqArriAjW','alessio.gualtieri24@istitutotecnicomarconipilla.edu.it','Alessio','Gualtieri','Baranello',1,81,1,NULL,'2026-03-23 15:58:56'),(2,'emma','$2y$12$dww87aWvkTjIIIHGGfFr..vMjcZtcP8LPGROU718dXbq6vLFMLwrG','emmacooper@gmail.com','Emma','Cooper','New York',2,155,1,NULL,'2026-03-23 16:02:12'),(3,'luca','$2y$12$Ly8Ny5wiO19/l5J3IOUyj.8pbsM0KUivYyEU2dWSFtmuNIqy/Aita','lucaleone@gmail.com','Luca','Leone','Wellington',2,119,1,NULL,'2026-03-23 16:04:00'),(4,'yoru','$2y$12$kBjFGfjD6nnNzrkW5kyP0eN8QPZNqoVWFSjh9ggyKxJDHJc9qHmvW','yorusatoshi@gmail.com','Yoru','Satoshi','Tokyo',2,63,1,NULL,'2026-03-23 16:05:17');
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watched`
--

DROP TABLE IF EXISTS `watched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watched` (
  `id_film` int NOT NULL,
  `id_utente` int NOT NULL,
  `data_inserimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_film`,`id_utente`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `watched_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `watched_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watched`
--

LOCK TABLES `watched` WRITE;
/*!40000 ALTER TABLE `watched` DISABLE KEYS */;
/*!40000 ALTER TABLE `watched` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watchlist`
--

DROP TABLE IF EXISTS `watchlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watchlist` (
  `id_film` int NOT NULL,
  `id_utente` int NOT NULL,
  `data_inserimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_film`,`id_utente`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `watchlist_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `watchlist_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `watchlist`
--

LOCK TABLES `watchlist` WRITE;
/*!40000 ALTER TABLE `watchlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `watchlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'cinevobis'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-23 22:58:32
