-- MySQL dump 10.13  Distrib 8.4.8, for Linux (x86_64)
--
-- Host: localhost    Database: accessi
-- ------------------------------------------------------
-- Server version	8.4.8-0ubuntu0.25.10.1

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
-- Table structure for table `profili`
--

DROP TABLE IF EXISTS `profili`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profili` (
  `idRuolo` int NOT NULL AUTO_INCREMENT,
  `nomeProfilo` varchar(50) NOT NULL,
  PRIMARY KEY (`idRuolo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profili`
--

LOCK TABLES `profili` WRITE;
/*!40000 ALTER TABLE `profili` DISABLE KEYS */;
INSERT INTO `profili` VALUES (1,'Amministratore'),(2,'Utente'),(3,'Ospite');
/*!40000 ALTER TABLE `profili` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessioni`
--

DROP TABLE IF EXISTS `sessioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessioni` (
  `idSessione` varchar(128) NOT NULL,
  `idUtente` int DEFAULT NULL,
  `dataLogin` datetime DEFAULT NULL,
  `dataLogout` datetime DEFAULT NULL,
  PRIMARY KEY (`idSessione`),
  KEY `fk_sessioni_utenti` (`idUtente`),
  CONSTRAINT `fk_sessioni_utenti` FOREIGN KEY (`idUtente`) REFERENCES `utenti` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessioni`
--

LOCK TABLES `sessioni` WRITE;
/*!40000 ALTER TABLE `sessioni` DISABLE KEYS */;
INSERT INTO `sessioni` VALUES ('0451123c868fc3ccceb62240a30d2bf9',3,'2026-03-14 16:40:08','2026-03-14 16:43:56'),('09dc9fe08a24e5029386560ff50fdca3',3,'2026-03-14 16:44:02','2026-03-14 16:44:16'),('0f886fca3737825ea45beb0d7e860471',3,'2026-03-13 18:04:48',NULL),('12a935f67ac0e06b67f5846f49d8c463',3,'2026-03-13 17:54:10',NULL),('16679e56dcd8d8da4d51825f21205009',6,'2026-03-10 21:52:42','2026-03-10 21:52:50'),('16e1f54f10ee4f8f7ccfa5b3224c63c4',3,'2026-03-10 20:46:35',NULL),('17c47a1b16da82082cbc161b8c7e0b1d',3,'2026-03-13 15:43:46','2026-03-13 16:31:44'),('18fe9605e8b14375a3ac66cca24a151c',3,'2026-03-14 11:04:25','2026-03-14 11:04:28'),('1ff86aafc5e49c13e121fa840ee352e1',3,'2026-03-14 11:05:30','2026-03-14 11:05:32'),('20069124371e369417b7648246e217b5',3,'2026-03-10 21:49:25',NULL),('254102a457874ca8953715532286f5f2',2,'2026-03-14 11:04:42','2026-03-14 11:04:46'),('2b0479454adb36162ea759dd4b382d61',3,'2026-03-14 10:59:12','2026-03-14 10:59:15'),('2cba118a64f88eedb800d4d01ce4f956',3,'2026-03-14 16:44:21','2026-03-14 16:48:30'),('2f3c4a8ab807714d1c4ccfd2081c84df',3,'2026-03-14 16:23:30','2026-03-14 16:26:12'),('2faac53f7f82f6c06d2b1d3df2c8edce',3,'2026-03-13 22:32:05',NULL),('324914130375bf46962ec349b87dc06b',3,'2026-03-21 14:10:12',NULL),('34300f61998a0e7d31b717ed7fdcaab5',3,'2026-03-14 17:09:21','2026-03-14 17:10:24'),('3971860cc5e62ac14cb281a72aefacf4',3,'2026-03-04 19:31:32','2026-03-04 19:32:00'),('3c761eea30f3bcbfc5c9bea44096763b',3,'2026-03-13 22:34:16','2026-03-13 22:42:19'),('420049c717730536aa46557916e05c43',2,'2026-03-10 20:39:00',NULL),('423cd9ee1168f3b9add716edc6191212',3,'2026-03-13 21:25:11',NULL),('50cf868d84b1b70b6bdbada4001dd5fe',2,'2026-03-14 09:48:54',NULL),('5485dc877a07ce3d714a21864118b63c',3,'2026-03-14 08:19:42',NULL),('55625cfda9c95e69e595e8200a8c5570',3,'2026-03-14 10:08:20','2026-03-14 10:08:24'),('5ac879510ba79d3bcd1535973dae51e0',6,'2026-03-10 21:53:06','2026-03-10 21:53:32'),('5b3bf0c5efbd667424f87c812a2f2a82',3,'2026-03-14 11:16:00','2026-03-14 11:16:03'),('60d3c881828515c8fa26d550b9d30554',3,'2026-03-14 17:14:16','2026-03-14 17:20:55'),('61e9fa3519fe2f911c10b7ea2975d94c',2,'2026-03-21 11:12:39',NULL),('6b04ebea9a44f429fc4c9bc2aba24ab5',3,'2026-03-13 22:44:52',NULL),('6c1466a3ff290bee40e6b9044649d166',2,'2026-03-10 20:39:20',NULL),('6d6a4742cf580776815a3cba2b174fe0',3,'2026-03-14 09:26:15','2026-03-14 09:29:07'),('6fda31d0897060b9bbccdbb6c05336ae',3,'2026-03-14 09:38:14','2026-03-14 09:39:22'),('77c37f34d4509f3364c9ff8e9c1b3a78',2,'2026-03-14 09:52:44','2026-03-14 09:52:46'),('7812bb1e89c9a400029e2a44a31b539c',3,'2026-03-14 10:51:13','2026-03-14 10:51:14'),('7e1d1369ee4645ebc9910f497d293ee4',2,'2026-03-10 20:42:31',NULL),('85872952438ea08a9b86fcb358d26b46',3,'2026-03-14 00:04:19',NULL),('8725458d626b08ddec9656ebd213c94b',2,'2026-03-14 11:05:22','2026-03-14 11:05:25'),('916f9188894201594339e27679bdf741',6,'2026-03-10 22:01:33','2026-03-10 22:01:41'),('972007f9e925971f50d00f9a09dddf6f',3,'2026-03-14 16:51:56','2026-03-14 17:07:41'),('97274d3e6baf150b1a0e8480c5287652',2,'2026-03-10 20:38:50',NULL),('97e49c6a341c6f3441f58e7bd62d9513',6,'2026-03-13 15:31:06','2026-03-13 15:43:05'),('9951e79637a1cdc8a828554edb07707b',2,'2026-03-14 16:51:32','2026-03-14 16:51:51'),('a03950856ace46b05c30eb5b267e5e8e',3,'2026-03-14 16:27:28','2026-03-14 16:39:35'),('aea23c6fbb9eba3936ba3d5461ee1c1a',2,'2026-03-21 09:23:43',NULL),('b4759cbedf2d7c03fe121fbe9e6156ba',3,'2026-03-14 10:46:00','2026-03-14 10:46:09'),('b6476d15c403d912879c4855dd7933b1',2,'2026-03-04 19:29:04','2026-03-04 19:29:07'),('b870d15ca979efeff03b459d5cd2ecd9',3,'2026-03-21 16:02:55',NULL),('c89b19d946ccc6619262fc0eb5e84f27',3,'2026-03-14 09:39:49','2026-03-14 09:48:41'),('c9e625edd374d2f4c1c06bf3970eb0b7',2,'2026-03-04 19:15:22','2026-03-04 19:18:01'),('d472b8ea49a9fbb2545596dd8b448bd0',3,'2026-03-14 11:01:23','2026-03-14 11:01:25'),('d4930f2e00c7c665b4aca07fa1e0a224',2,'2026-03-14 16:48:40','2026-03-14 16:49:39'),('e2546a996f17258a846011b341a92eac',2,'2026-03-04 19:28:50','2026-03-04 19:28:57'),('e58e8911d0846b87a7efb2453b104db0',3,'2026-03-14 10:50:25','2026-03-14 10:50:28'),('ea169708b09695e76889681cd500bfdf',3,'2026-03-14 10:41:32','2026-03-14 10:45:22'),('ea3e0ddf8e8c447772505e8197f859ca',3,'2026-03-14 09:37:55',NULL),('f14e64e400cb31f44fa313701ac74ad3',3,'2026-03-21 14:10:06',NULL),('f38b12ddde0df7f8998e766900f91781',3,'2026-03-13 16:37:48',NULL),('f657d03bd5591267aeb7835ff3b6bd6d',3,'2026-03-14 09:30:54',NULL),('fc465ec6ae3a174d1ddff9053fb0a7a1',3,'2026-03-14 00:02:38','2026-03-14 00:04:12'),('fceffc3218e4a7f514f976a6758091e1',3,'2026-03-14 10:45:29','2026-03-14 10:45:32');
/*!40000 ALTER TABLE `sessioni` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utenti`
--

DROP TABLE IF EXISTS `utenti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utenti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nome` varchar(50) NOT NULL,
  `cognome` varchar(50) NOT NULL,
  `indirizzo` varchar(100) DEFAULT NULL,
  `citta` varchar(50) DEFAULT NULL,
  `cap` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `attivo` tinyint(1) NOT NULL DEFAULT '1',
  `idProfilo` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_utenti_profili` (`idProfilo`),
  CONSTRAINT `fk_utenti_profili` FOREIGN KEY (`idProfilo`) REFERENCES `profili` (`idRuolo`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

LOCK TABLES `utenti` WRITE;
/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES (2,'jesse','$2y$12$kACIeHyWeg297MzzDvrDieR5l6mzhIDMdxjRCO7kQa4L55wdj0.MS','Giovanni','Barone','SW Street','Albuquerque','20100','jessepinkman@gmail.com','3201234567',1,2),(3,'alessio','$2y$12$dS9RthB24BUr9ybtvcoTl.pZcsFjGI5xMEeHTno/Wpalku9aag/2W','Alessio','Gualtieri','contrada gaudo','baranello','86011','alessio.gualtieri@gmail.com','3518878990',1,1),(4,'mario','$2y$12$pe.T7FWHyXIRrTAVAVS0FOKTKykdVLNQXvQRFhwBzVI3aSN/LvoLm','Marco','Rossi','Via Roma 1','Milano','20100','mario@email.com','3331234567',1,2),(6,'white','$2y$12$b/8EN2XRJUQUE8gh3gcWMeF5iKM./k2ww0pYI1BDLwHNEH.9b0Zge','Walter','White','Via cesi','Bologna','89091','walterwhite@gmail.com','3518874321',0,2);
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'accessi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-21 16:36:01
