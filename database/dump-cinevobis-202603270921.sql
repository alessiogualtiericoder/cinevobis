-- MySQL dump 10.13  Distrib 8.4.8, for Linux (x86_64)
--
-- Host: localhost    Database: cinevobis
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
  `copertina_path` varchar(255) DEFAULT NULL,
  `trailer_id` varchar(20) DEFAULT NULL,
  `iso_code` char(2) DEFAULT NULL,
  PRIMARY KEY (`id_film`),
  KEY `fk_films_nazioni` (`iso_code`),
  CONSTRAINT `fk_films_nazioni` FOREIGN KEY (`iso_code`) REFERENCES `nazioni` (`iso_code`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films`
--

LOCK TABLES `films` WRITE;
/*!40000 ALTER TABLE `films` DISABLE KEYS */;
INSERT INTO `films` VALUES (1,'Inception','Ladri di sogni corporativi.',148,'2010-07-16',NULL,NULL,'US'),(2,'Interstellar','Viaggio in un wormhole.',169,'2014-11-07',NULL,NULL,'US'),(3,'The Dark Knight','Batman contro il Joker.',152,'2008-07-18',NULL,NULL,'US'),(4,'Dunkirk','Evacuazione dalla Francia.',106,'2017-07-21',NULL,NULL,'GB'),(5,'Oppenheimer','Padre della bomba atomica.',180,'2023-07-21',NULL,NULL,'US'),(6,'Memento','Uomo senza memoria a breve termine.',113,'2000-09-05',NULL,NULL,'US'),(7,'Tenet','Inversione temporale.',150,'2020-08-26',NULL,NULL,'US'),(8,'The Prestige','Illusionisti rivali.',130,'2006-10-20',NULL,NULL,'US'),(9,'Pulp Fiction','Storie criminali intrecciate.',154,'1994-10-14',NULL,NULL,'US'),(10,'Kill Bill: Vol. 1','Vendetta di una sposa.',111,'2003-10-10',NULL,NULL,'US'),(11,'Django Unchained','Schiavo liberato cerca la moglie.',165,'2012-12-25',NULL,NULL,'US'),(12,'Bastardi senza gloria','Caccia ai nazisti.',153,'2009-08-21',NULL,NULL,'US'),(13,'Le Iene','Rapina finita male.',99,'1992-10-09',NULL,NULL,'US'),(14,'The Hateful Eight','Otto sconosciuti in una baita.',168,'2015-12-25',NULL,NULL,'US'),(15,'C\'era una volta a... Hollywood','Attore al tramonto e il suo stuntman.',161,'2019-07-26',NULL,NULL,'US'),(16,'Jurassic Park','Dinosauri clonati sfuggono al controllo.',127,'1993-06-11',NULL,NULL,'US'),(17,'Schindler\'s List','Oskar Schindler salva ebrei.',195,'1993-12-15',NULL,NULL,'US'),(18,'E.T.','Alieno fa amicizia con un bambino.',115,'1982-06-11',NULL,NULL,'US'),(19,'Salvate il soldato Ryan','Missione in Normandia.',169,'1998-07-24',NULL,NULL,'US'),(20,'Indiana Jones e i predatori','Archeologo cerca l\'Arca.',115,'1981-06-12',NULL,NULL,'US'),(21,'Lo squalo','Squalo attacca una spiaggia.',124,'1975-06-20',NULL,NULL,'US'),(22,'Prova a prendermi','Truffatore inseguito dall\'FBI.',141,'2002-12-25',NULL,NULL,'US'),(23,'Quei bravi ragazzi','Vita nella mafia.',145,'1990-09-19',NULL,NULL,'US'),(24,'Taxi Driver','Tassista alienato a NY.',114,'1976-02-08',NULL,NULL,'US'),(25,'The Wolf of Wall Street','Eccessi di un broker.',180,'2013-12-25',NULL,NULL,'US'),(26,'The Departed','Talpe nella polizia e mafia.',151,'2006-10-06',NULL,NULL,'US'),(27,'Shutter Island','Indagine in un manicomio.',138,'2010-02-19',NULL,NULL,'US'),(28,'Casino','Gestione di un casinò a Vegas.',178,'1995-11-22',NULL,NULL,'US'),(29,'The Irishman','Storia di un sicario mafioso.',209,'2019-11-01',NULL,NULL,'US'),(30,'Toy Story','Giocattoli che prendono vita.',81,'1995-11-22',NULL,NULL,'US'),(31,'Up','Anziano viaggia con casa e palloncini.',96,'2009-05-29',NULL,NULL,'US'),(32,'Inside Out','Emozioni nella testa di una ragazzina.',95,'2015-06-19',NULL,NULL,'US'),(33,'Coco','Viaggio nel mondo dei morti.',105,'2017-11-22',NULL,NULL,'US'),(34,'Wall-E','Robot innamorato.',98,'2008-06-27',NULL,NULL,'US'),(35,'Alla ricerca di Nemo','Pesce cerca il figlio.',100,'2003-05-30',NULL,NULL,'US'),(36,'Gli Incredibili','Famiglia di supereroi.',115,'2004-11-05',NULL,NULL,'US'),(37,'Ratatouille','Topo chef a Parigi.',111,'2007-06-29',NULL,NULL,'US'),(38,'Il Re Leone','Simba rivendica il trono.',88,'1994-06-15',NULL,NULL,'US'),(39,'Aladdin','Ladruncolo e lampada magica.',90,'1992-11-25',NULL,NULL,'US'),(40,'Mulan','Ragazza si finge uomo in guerra.',88,'1998-06-05',NULL,NULL,'US'),(41,'Frozen','Principesse del ghiaccio.',102,'2013-11-27',NULL,NULL,'US'),(42,'La Bella e la Bestia','Amore oltre le apparenze.',84,'1991-11-22',NULL,NULL,'US'),(43,'Zootropolis','Città di animali.',108,'2016-03-04',NULL,NULL,'US'),(44,'Oceania','Ragazza in viaggio nell\'oceano.',107,'2016-11-23',NULL,NULL,'US'),(45,'Una battaglia dopo l\'altra','Scontri epici sul campo.',120,'2022-10-01',NULL,NULL,'US'),(46,'Civil War','America distopica in guerra civile.',109,'2024-04-12',NULL,NULL,'US'),(47,'Matrix','Il mondo è una simulazione.',136,'1999-03-31',NULL,NULL,'US'),(48,'Il Signore degli Anelli','La compagnia dell\'anello.',178,'2001-12-19',NULL,NULL,'US'),(49,'Il Padrino','Famiglia Corleone.',175,'1972-03-24',NULL,NULL,'US'),(50,'Forrest Gump','Vita di un uomo semplice.',142,'1994-07-06',NULL,NULL,'US'),(51,'Star Wars: Una nuova speranza','Ribelli contro l\'Impero.',121,'1977-05-25',NULL,NULL,'US'),(52,'Fight Club','Regole del club.',139,'1999-10-15',NULL,NULL,'US'),(53,'Il Gladiatore','Generale diventa gladiatore.',155,'2000-05-05',NULL,NULL,'US'),(54,'Alien','Creatura nello spazio.',117,'1979-05-25',NULL,NULL,'US'),(55,'Terminator 2','Cyborg protegge John Connor.',137,'1991-07-03',NULL,NULL,'US'),(56,'Ritorno al futuro','Viaggio nel tempo in DeLorean.',116,'1985-07-03',NULL,NULL,'US'),(57,'Titanic','Amore sul transatlantico.',195,'1997-12-19',NULL,NULL,'US'),(58,'Avatar','Scontro su Pandora.',162,'2009-12-18',NULL,NULL,'US'),(59,'Il silenzio degli innocenti','Agente FBI e cannibale.',118,'1991-02-14',NULL,NULL,'US'),(60,'Se7en','Killer dei 7 vizi capitali.',127,'1995-09-22',NULL,NULL,'US'),(61,'La vita è bella','Padre protegge figlio nel lager.',116,'1997-12-20',NULL,NULL,'IT'),(62,'Nuovo Cinema Paradiso','Amore per il cinema.',155,'1988-11-17',NULL,NULL,'IT'),(63,'Parasite','Famiglia povera si infiltra in una ricca.',132,'2019-05-30',NULL,NULL,'KR'),(64,'La città incantata','Bambina in un mondo magico.',125,'2001-07-20',NULL,NULL,'JP'),(65,'Blade Runner','Cacciatore di replicanti.',117,'1982-06-25',NULL,NULL,'US'),(66,'Arancia Meccanica','Giovane violento e cura.',136,'1971-12-19',NULL,NULL,'GB'),(67,'Il buono, il brutto, il cattivo','Tre uomini e un tesoro.',161,'1966-12-23',NULL,NULL,'IT'),(68,'Qualcuno volò sul nido del cuculo','Ribellione in manicomio.',133,'1975-11-19',NULL,NULL,'US'),(69,'Casablanca','Amore e guerra a Casablanca.',102,'1942-11-26',NULL,NULL,'US'),(70,'Psyco','Omicidio al Bates Motel.',109,'1960-09-08',NULL,NULL,'US'),(71,'Apocalypse Now','Missione in Vietnam.',147,'1979-08-15',NULL,NULL,'US'),(72,'Il miglio verde','Guardie e un detenuto speciale.',189,'1999-12-10',NULL,NULL,'US'),(73,'American History X','Neonazista si redime.',119,'1998-10-30',NULL,NULL,'US'),(74,'Whiplash','Batterista e insegnante severo.',106,'2014-10-10',NULL,NULL,'US'),(75,'Léon','Sicario protegge bambina.',110,'1994-09-14',NULL,NULL,'FR'),(76,'Il pianista','Musicista ebreo a Varsavia.',150,'2002-09-25',NULL,NULL,'US'),(77,'I soliti sospetti','Chi è Keyser Söze?',106,'1995-08-16',NULL,NULL,'US'),(78,'Memento','Amnesia e vendetta.',113,'2000-09-05',NULL,NULL,'US'),(79,'Joker','Origini del clown criminale.',122,'2019-10-04',NULL,NULL,'US'),(80,'Django Unchained','Cacciatore di taglie.',165,'2012-12-25',NULL,NULL,'US'),(81,'Spider-Man: Un nuovo universo','Multiverso dei ragni.',117,'2018-12-14',NULL,NULL,'US'),(82,'Avengers: Endgame','Battaglia finale contro Thanos.',181,'2019-04-26',NULL,NULL,'US'),(83,'Oldboy','Vendetta dopo 15 anni di prigionia.',120,'2003-11-21',NULL,NULL,'KR'),(84,'Principessa Mononoke','Uomo contro natura.',134,'1997-07-12',NULL,NULL,'JP'),(85,'C\'era una volta il West','Epopea western.',165,'1968-12-21',NULL,NULL,'IT'),(86,'Aliens','Scontro coi marine spaziali.',137,'1986-07-18',NULL,NULL,'US'),(87,'Amadeus','Rivalità tra Mozart e Salieri.',160,'1984-09-19',NULL,NULL,'US'),(88,'American Beauty','Crisi di mezza età.',122,'1999-09-17',NULL,NULL,'US'),(89,'Wall-E','Robot ecologista.',98,'2008-06-27',NULL,NULL,'US'),(90,'Braveheart','Eroe scozzese.',178,'1995-05-24',NULL,NULL,'US'),(91,'Toy Story 3','Giocattoli in asilo.',103,'2010-06-18',NULL,NULL,'US'),(92,'Requiem for a Dream','Discesa nella dipendenza.',102,'2000-10-27',NULL,NULL,'US'),(93,'Star Wars: L\'Impero colpisce ancora','Ribelli in fuga.',124,'1980-05-21',NULL,NULL,'US'),(94,'2001: Odissea nello spazio','Monolito ed evoluzione.',149,'1968-04-02',NULL,NULL,'US'),(95,'Eternal Sunshine','Cancellazione della memoria.',108,'2004-03-19',NULL,NULL,'US'),(96,'Snatch','Diamanti e zingari.',102,'2000-09-01',NULL,NULL,'GB'),(97,'A Clockwork Orange','Ultraviolenza.',136,'1971-12-19',NULL,NULL,'US'),(98,'Full Metal Jacket','Addestramento e Vietnam.',116,'1987-06-26',NULL,NULL,'US'),(99,'Scarface','Ascesa di Tony Montana.',170,'1983-12-09',NULL,NULL,'US'),(100,'Taxi Driver','Discesa nella follia.',114,'1976-02-08',NULL,NULL,'US'),(101,'Up','Volo in palloncino.',96,'2009-05-29',NULL,NULL,'US'),(102,'L.A. Confidential','Polizia corrotta.',138,'1997-09-19',NULL,NULL,'US'),(103,'Heat','Ladri e polizia a LA.',170,'1995-12-15',NULL,NULL,'US'),(104,'Die Hard','Poliziotto nel grattacielo.',132,'1988-07-15',NULL,NULL,'US'),(105,'Batman Begins','Le origini del cavaliere.',140,'2005-06-15',NULL,NULL,'US'),(106,'Jurassic Park','Clonazione.',127,'1993-06-11',NULL,NULL,'US'),(107,'V per Vendetta','Rivoluzione a Londra.',132,'2006-03-17',NULL,NULL,'US'),(108,'Good Will Hunting','Genio ribelle.',126,'1997-12-05',NULL,NULL,'US'),(109,'Blade Runner 2049','Ricerca del bambino replicante.',164,'2017-10-06',NULL,NULL,'US'),(110,'Il labirinto del fauno','Fantasia e guerra civile.',118,'2006-10-11',NULL,NULL,'ES'),(111,'Il sesto senso','Vedo la gente morta.',107,'1999-08-06',NULL,NULL,'US'),(112,'Trainspotting','Tossicodipendenza a Edimburgo.',93,'1996-02-23',NULL,NULL,'GB'),(113,'Fargo','Rapimento maldestro.',98,'1996-03-08',NULL,NULL,'US'),(114,'Mad Max: Fury Road','Inseguimento nel deserto.',120,'2015-05-15',NULL,NULL,'US'),(115,'Gran Torino','Veterano razzista cambia.',116,'2008-12-12',NULL,NULL,'US'),(116,'Kill Bill: Vol. 1','La sposa sanguinaria.',111,'2003-10-10',NULL,NULL,'US'),(117,'No Country for Old Men','Assassino con moneta.',122,'2007-11-09',NULL,NULL,'US'),(118,'Donnie Darko','Coniglio gigante premonitore.',113,'2001-10-26',NULL,NULL,'US'),(119,'Harry Potter e la pietra filosofale','Maghetto a Hogwarts.',152,'2001-11-16',NULL,NULL,'US'),(120,'Shutter Island','Mistero.',138,'2010-02-19',NULL,NULL,'US'),(121,'The Truman Show','Vita in un reality.',103,'1998-06-05',NULL,NULL,'US'),(122,'Jurassic World','Parco riaperto.',124,'2015-06-12',NULL,NULL,'US'),(123,'Sesto Senso','Thriller psicologico.',107,'1999-08-06',NULL,NULL,'US'),(124,'Gattaca','Mondo genetico.',106,'1997-10-24',NULL,NULL,'US'),(125,'The Avengers','Supereroi uniti.',143,'2012-05-04',NULL,NULL,'US'),(126,'A Beautiful Mind','Genio matematico.',135,'2001-12-21',NULL,NULL,'US'),(127,'The Social Network','Nascita di Facebook.',120,'2010-10-01',NULL,NULL,'US'),(128,'Zodiac','Serial killer di San Francisco.',157,'2007-03-02',NULL,NULL,'US'),(129,'Prisoners','Padre cerca figlie rapite.',153,'2013-09-20',NULL,NULL,'US'),(130,'Arrival','Alieni ed eptapodi.',116,'2016-11-11',NULL,NULL,'US'),(131,'La La Land','Musical a LA.',128,'2016-12-09',NULL,NULL,'US'),(132,'Logan','L\'ultimo Wolverine.',137,'2017-03-03',NULL,NULL,'US'),(133,'Dune','Sabbia e spezia.',155,'2021-10-22',NULL,NULL,'US'),(134,'Top Gun: Maverick','Ritorno nei cieli.',130,'2022-05-27',NULL,NULL,'US'),(135,'Spider-Man: No Way Home','Tre Spider-Man.',148,'2021-12-17',NULL,NULL,'US'),(136,'Guardiani della Galassia','Misfit spaziali.',121,'2014-08-01',NULL,NULL,'US'),(137,'Iron Man','Inizio del MCU.',126,'2008-05-02',NULL,NULL,'US'),(138,'Black Panther','Re di Wakanda.',134,'2018-02-16',NULL,NULL,'US'),(139,'Thor: Ragnarok','Distruzione di Asgard.',130,'2017-11-03',NULL,NULL,'US'),(140,'Captain America: Civil War','Scontro tra eroi.',147,'2016-05-06',NULL,NULL,'US'),(141,'Deadpool','Mercenario chiacchierone.',108,'2016-02-12',NULL,NULL,'US'),(142,'Wonder Woman','Amazzone nella grande guerra.',141,'2017-06-02',NULL,NULL,'US'),(143,'Aquaman','Re di Atlantide.',143,'2018-12-21',NULL,NULL,'US'),(144,'Justice League','Uniti.',120,'2017-11-17',NULL,NULL,'US'),(145,'Man of Steel','Origini di Superman.',143,'2013-06-14',NULL,NULL,'US'),(146,'The Batman','Indagine oscura.',176,'2022-03-04',NULL,NULL,'US'),(147,'Joker','Follia.',122,'2019-10-04',NULL,NULL,'US'),(148,'Super Mario Bros','Viaggio nel regno dei funghi.',92,'2023-04-05',NULL,NULL,'US'),(149,'Barbie','Bambola nel mondo reale.',114,'2023-07-21',NULL,NULL,'US'),(150,'Avatar: La via dell\'acqua','Ritorno su Pandora.',192,'2022-12-16',NULL,NULL,'US');
/*!40000 ALTER TABLE `films` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `films_generi`
--

DROP TABLE IF EXISTS `films_generi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `films_generi` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_film` int NOT NULL,
  `id_genere` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_film` (`id_film`,`id_genere`),
  KEY `id_genere` (`id_genere`),
  CONSTRAINT `films_generi_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `films_generi_ibfk_2` FOREIGN KEY (`id_genere`) REFERENCES `generi` (`id_genere`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_generi`
--

LOCK TABLES `films_generi` WRITE;
/*!40000 ALTER TABLE `films_generi` DISABLE KEYS */;
INSERT INTO `films_generi` VALUES (1,1,1),(2,1,2),(3,2,2),(4,2,3),(5,3,1),(6,3,10),(7,9,10),(8,10,1),(10,16,2),(9,16,9),(11,23,10),(12,25,5),(13,30,8),(14,38,8),(15,45,11),(16,46,1),(17,46,11);
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
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `films_persone`
--

LOCK TABLES `films_persone` WRITE;
/*!40000 ALTER TABLE `films_persone` DISABLE KEYS */;
INSERT INTO `films_persone` VALUES (22,1,1,'Regista'),(23,1,5,'Attore'),(24,2,1,'Regista'),(25,2,18,'Attore'),(26,3,1,'Regista'),(27,3,12,'Attore'),(28,9,2,'Regista'),(29,9,6,'Attore'),(30,9,15,'Attore'),(31,10,2,'Regista'),(32,10,14,'Attore'),(33,16,3,'Regista'),(34,19,3,'Regista'),(35,19,7,'Attore'),(36,23,4,'Regista'),(37,23,8,'Attore'),(38,23,16,'Attore'),(39,25,4,'Regista'),(40,25,5,'Attore'),(41,46,10,'Regista'),(42,46,11,'Attore');
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `generi`
--

LOCK TABLES `generi` WRITE;
/*!40000 ALTER TABLE `generi` DISABLE KEYS */;
INSERT INTO `generi` VALUES (1,'Azione'),(2,'Fantascienza'),(3,'Drammatico'),(4,'Thriller'),(5,'Commedia'),(6,'Romantico'),(7,'Horror'),(8,'Animazione'),(9,'Avventura'),(10,'Crime'),(11,'Guerra'),(12,'Documentario'),(13,'Fantasy'),(14,'Musical'),(15,'Mistero'),(16,'Western');
/*!40000 ALTER TABLE `generi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nazioni`
--

DROP TABLE IF EXISTS `nazioni`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nazioni` (
  `iso_code` char(2) NOT NULL,
  `nome_nazione` varchar(100) NOT NULL,
  PRIMARY KEY (`iso_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nazioni`
--

LOCK TABLES `nazioni` WRITE;
/*!40000 ALTER TABLE `nazioni` DISABLE KEYS */;
INSERT INTO `nazioni` VALUES ('AD','Andorra'),('AE','Emirati Arabi Uniti'),('AF','Afghanistan'),('AG','Antigua e Barbuda'),('AL','Albania'),('AM','Armenia'),('AO','Angola'),('AR','Argentina'),('AT','Austria'),('AU','Australia'),('AZ','Azerbaigian'),('BA','Bosnia ed Erzegovina'),('BB','Barbados'),('BD','Bangladesh'),('BE','Belgio'),('BF','Burkina Faso'),('BG','Bulgaria'),('BH','Bahrein'),('BI','Burundi'),('BJ','Benin'),('BN','Brunei'),('BO','Bolivia'),('BR','Brasile'),('BS','Bahamas'),('BT','Bhutan'),('BW','Botswana'),('BY','Bielorussia'),('BZ','Belize'),('CA','Canada'),('CD','Repubblica Democratica del Congo'),('CF','Repubblica Centrafricana'),('CG','Congo'),('CH','Svizzera'),('CI','Costa d\'Avorio'),('CL','Cile'),('CM','Camerun'),('CN','Cina'),('CO','Colombia'),('CR','Costa Rica'),('CU','Cuba'),('CV','Capo Verde'),('CY','Cipro'),('CZ','Repubblica Ceca'),('DE','Germania'),('DJ','Gibuti'),('DK','Danimarca'),('DM','Dominica'),('DO','Repubblica Dominicana'),('DZ','Algeria'),('EC','Ecuador'),('EE','Estonia'),('EG','Egitto'),('ER','Eritrea'),('ES','Spagna'),('ET','Etiopia'),('FI','Finlandia'),('FJ','Figi'),('FM','Micronesia'),('FR','Francia'),('GA','Gabon'),('GB','Regno Unito'),('GD','Grenada'),('GE','Georgia'),('GH','Ghana'),('GM','Gambia'),('GN','Guinea'),('GQ','Guinea Equatoriale'),('GR','Grecia'),('GT','Guatemala'),('GW','Guinea-Bissau'),('GY','Guyana'),('HN','Honduras'),('HR','Croazia'),('HT','Haiti'),('HU','Ungheria'),('ID','Indonesia'),('IE','Irlanda'),('IL','Israele'),('IN','India'),('IQ','Iraq'),('IR','Iran'),('IS','Islanda'),('IT','Italia'),('JM','Giamaica'),('JO','Giordania'),('JP','Giappone'),('KE','Kenya'),('KG','Kirghizistan'),('KH','Cambogia'),('KI','Kiribati'),('KM','Comore'),('KN','Saint Kitts e Nevis'),('KP','Corea del Nord'),('KR','Corea del Sud'),('KW','Kuwait'),('KZ','Kazakistan'),('LA','Laos'),('LB','Libano'),('LC','Santa Lucia'),('LI','Liechtenstein'),('LK','Sri Lanka'),('LR','Liberia'),('LS','Lesotho'),('LT','Lituania'),('LU','Lussemburgo'),('LV','Lettonia'),('LY','Libia'),('MA','Marocco'),('MC','Monaco'),('MD','Moldavia'),('ME','Montenegro'),('MG','Madagascar'),('MH','Isole Marshall'),('MK','Macedonia del Nord'),('ML','Mali'),('MM','Myanmar'),('MN','Mongolia'),('MR','Mauritania'),('MT','Malta'),('MU','Mauritius'),('MV','Maldive'),('MW','Malawi'),('MX','Messico'),('MY','Malesia'),('MZ','Mozambico'),('NA','Namibia'),('NE','Niger'),('NG','Nigeria'),('NI','Nicaragua'),('NL','Paesi Bassi'),('NO','Norvegia'),('NP','Nepal'),('NR','Nauru'),('NZ','Nuova Zelanda'),('OM','Oman'),('PA','Panama'),('PE','Perù'),('PG','Papua Nuova Guinea'),('PH','Filippine'),('PK','Pakistan'),('PL','Polonia'),('PT','Portogallo'),('PW','Palau'),('PY','Paraguay'),('QA','Qatar'),('RO','Romania'),('RS','Serbia'),('RU','Russia'),('RW','Ruanda'),('SA','Arabia Saudita'),('SB','Isole Salomone'),('SC','Seychelles'),('SD','Sudan'),('SE','Svezia'),('SG','Singapore'),('SI','Slovenia'),('SK','Slovacchia'),('SL','Sierra Leone'),('SM','San Marino'),('SN','Senegal'),('SO','Somalia'),('SR','Suriname'),('SS','Sud Sudan'),('ST','Sao Tome e Principe'),('SV','El Salvador'),('SY','Siria'),('SZ','Eswatini'),('TD','Ciad'),('TG','Togo'),('TH','Thailandia'),('TJ','Tagikistan'),('TL','Timor Est'),('TM','Turkmenistan'),('TN','Tunisia'),('TO','Tonga'),('TR','Turchia'),('TT','Trinidad e Tobago'),('TV','Tuvalu'),('TZ','Tanzania'),('UA','Ucraina'),('UG','Uganda'),('US','Stati Uniti'),('UY','Uruguay'),('UZ','Uzbekistan'),('VA','Città del Vaticano'),('VC','Saint Vincent e Grenadine'),('VE','Venezuela'),('VN','Vietnam'),('VU','Vanuatu'),('WS','Samoa'),('YE','Yemen'),('ZA','Sudafrica'),('ZM','Zambia'),('ZW','Zimbabwe');
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
  `iso_code` char(2) DEFAULT NULL,
  `foto` varchar(255) DEFAULT NULL,
  `wikipedia_slug` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_persona`),
  KEY `iso_code` (`iso_code`),
  CONSTRAINT `persone_ibfk_1` FOREIGN KEY (`iso_code`) REFERENCES `nazioni` (`iso_code`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persone`
--

LOCK TABLES `persone` WRITE;
/*!40000 ALTER TABLE `persone` DISABLE KEYS */;
INSERT INTO `persone` VALUES (1,'Christopher','Nolan','GB',NULL,NULL),(2,'Quentin','Tarantino','US',NULL,NULL),(3,'Steven','Spielberg','US',NULL,NULL),(4,'Martin','Scorsese','US',NULL,NULL),(5,'Leonardo','DiCaprio','US',NULL,NULL),(6,'John','Travolta','US',NULL,NULL),(7,'Tom','Hanks','US',NULL,NULL),(8,'Robert','De Niro','US',NULL,NULL),(9,'John','Lasseter','US',NULL,NULL),(10,'Alex','Garland','GB',NULL,NULL),(11,'Kirsten','Dunst','US',NULL,NULL),(12,'Christian','Bale','GB',NULL,NULL),(13,'Brad','Pitt','US',NULL,NULL),(14,'Uma','Thurman','US',NULL,NULL),(15,'Samuel L.','Jackson','US',NULL,NULL),(16,'Joe','Pesci','US',NULL,NULL),(17,'Cillian','Murphy','IE',NULL,NULL),(18,'Matthew','McConaughey','US',NULL,NULL),(19,'Liam','Neeson','GB',NULL,NULL),(20,'Harrison','Ford','US',NULL,NULL);
/*!40000 ALTER TABLE `persone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `preferiti`
--

DROP TABLE IF EXISTS `preferiti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `preferiti` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_film` int NOT NULL,
  `id_utente` int NOT NULL,
  `data_inserimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_film` (`id_film`,`id_utente`),
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
  `id_recensione` int NOT NULL AUTO_INCREMENT,
  `id_film` int NOT NULL,
  `id_utente` int NOT NULL,
  `voto` decimal(2,1) DEFAULT NULL,
  `testo` text,
  `data_inserimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id_recensione`),
  UNIQUE KEY `id_film` (`id_film`,`id_utente`),
  KEY `id_utente` (`id_utente`),
  CONSTRAINT `recensioni_ibfk_1` FOREIGN KEY (`id_film`) REFERENCES `films` (`id_film`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recensioni_ibfk_2` FOREIGN KEY (`id_utente`) REFERENCES `utenti` (`id_utente`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recensioni`
--

LOCK TABLES `recensioni` WRITE;
/*!40000 ALTER TABLE `recensioni` DISABLE KEYS */;
INSERT INTO `recensioni` VALUES (1,1,2,5.0,'Capolavoro Nolan!','2026-03-25 18:25:23'),(2,1,3,4.5,'Sbalorditivo.','2026-03-25 18:25:23'),(3,1,4,4.0,'Intrippante.','2026-03-25 18:25:23'),(4,2,5,5.0,'Musiche divine.','2026-03-25 18:25:23'),(5,2,6,4.5,'Pianeta di Miller pazzesco.','2026-03-25 18:25:23'),(6,2,7,5.0,'Lacrime.','2026-03-25 18:25:23'),(7,3,8,5.0,'Heath Ledger leggenda.','2026-03-25 18:25:23'),(8,3,9,4.5,'Il miglior Batman.','2026-03-25 18:25:23'),(9,3,10,5.0,'Epico.','2026-03-25 18:25:23'),(10,9,11,5.0,'Tarantino allo stato puro.','2026-03-25 18:25:23'),(11,9,12,4.5,'Iconico.','2026-03-25 18:25:23'),(12,9,13,4.0,'Pulp.','2026-03-25 18:25:23'),(13,10,14,4.5,'Sangue e katana.','2026-03-25 18:25:23'),(14,10,15,4.0,'Uma Thurman top.','2026-03-25 18:25:23'),(15,10,16,4.5,'Spettacolo.','2026-03-25 18:25:23'),(16,16,17,5.0,'Infanzia pura.','2026-03-25 18:25:23'),(17,16,18,4.5,'Dinosauri perfetti.','2026-03-25 18:25:23'),(18,16,19,4.0,'T Rex.','2026-03-25 18:25:23'),(19,17,20,5.0,'Doloroso ma bellissimo.','2026-03-25 18:25:23'),(20,17,21,5.0,'Da vedere a scuola.','2026-03-25 18:25:23'),(21,17,22,5.0,'Maestoso.','2026-03-25 18:25:23'),(22,23,23,5.0,'La vera mafia.','2026-03-25 18:25:23'),(23,23,24,4.5,'Pesci assurdo.','2026-03-25 18:25:23'),(24,23,25,4.5,'Ritmo folle.','2026-03-25 18:25:23'),(25,25,26,4.0,'Divertente ed eccessivo.','2026-03-25 18:25:23'),(26,25,27,4.5,'Leo scatenato.','2026-03-25 18:25:23'),(27,25,28,4.0,'Soldi.','2026-03-25 18:25:23'),(28,30,29,5.0,'Pixar rivoluzionaria.','2026-03-25 18:25:23'),(29,30,30,4.5,'Buzz!','2026-03-25 18:25:23'),(30,30,31,5.0,'Verso l\'infinito.','2026-03-25 18:25:23'),(31,38,32,5.0,'Hakuna matata.','2026-03-25 18:25:23'),(32,38,33,4.5,'Animazione top.','2026-03-25 18:25:23'),(33,38,34,5.0,'Mufasa...','2026-03-25 18:25:23'),(34,45,35,3.5,'Buona regia.','2026-03-25 18:25:23'),(35,45,36,4.0,'Bel ritmo.','2026-03-25 18:25:23'),(36,45,37,3.0,'Un po lungo.','2026-03-25 18:25:23'),(37,46,38,4.5,'Fotografia stupenda.','2026-03-25 18:25:23'),(38,46,39,4.0,'Ansia pura.','2026-03-25 18:25:23'),(39,46,40,4.5,'Angosciante.','2026-03-25 18:25:23'),(40,47,41,5.0,'Pillola rossa.','2026-03-25 18:25:23'),(41,47,42,4.5,'Rallenty epico.','2026-03-25 18:25:23'),(42,48,43,5.0,'Fantasy puro.','2026-03-25 18:25:23'),(43,49,44,5.0,'Il cinema.','2026-03-25 18:25:23'),(44,50,45,5.0,'Scatola di cioccolatini.','2026-03-25 18:25:23'),(45,51,46,5.0,'La Forza.','2026-03-25 18:25:23'),(46,52,47,4.5,'Tyler Durden.','2026-03-25 18:25:23'),(47,53,48,4.5,'Massimo.','2026-03-25 18:25:23'),(48,54,49,4.5,'Spazio profondo.','2026-03-25 18:25:23'),(49,55,50,4.5,'Hasta la vista.','2026-03-25 18:25:23'),(50,56,2,5.0,'Grande Giove.','2026-03-25 18:25:23'),(51,57,3,4.0,'Jack!','2026-03-25 18:25:23'),(52,58,4,4.5,'Effetti 3D pazzeschi.','2026-03-25 18:25:23'),(53,59,5,5.0,'Hannibal da brividi.','2026-03-25 18:25:23'),(54,60,6,4.5,'Cosa c\'è nella scatola?','2026-03-25 18:25:23'),(55,61,7,5.0,'Capolavoro di Benigni.','2026-03-25 18:25:23'),(56,62,8,5.0,'La magia del cinema.','2026-03-25 18:25:23'),(57,63,9,4.5,'Parasite meritatissimo.','2026-03-25 18:25:23'),(58,64,10,5.0,'Miyazaki genio.','2026-03-25 18:25:23'),(59,65,11,4.5,'Lacrime nella pioggia.','2026-03-25 18:25:23'),(60,66,12,4.0,'Ultraviolenza.','2026-03-25 18:25:23'),(61,67,13,5.0,'Leone immenso.','2026-03-25 18:25:23'),(62,68,14,4.5,'Jack Nicholson gigante.','2026-03-25 18:25:23'),(63,69,15,5.0,'Sempre a Parigi.','2026-03-25 18:25:23'),(64,70,16,4.5,'La doccia.','2026-03-25 18:25:23'),(65,71,17,5.0,'Orrore in Vietnam.','2026-03-25 18:25:23'),(66,72,18,5.0,'Commovente.','2026-03-25 18:25:23'),(67,73,19,4.5,'Edward Norton spaventoso.','2026-03-25 18:25:23'),(68,74,20,4.5,'Il mio tempo.','2026-03-25 18:25:23'),(69,75,21,4.5,'Natalie Portman bravissima.','2026-03-25 18:25:23'),(70,76,22,5.0,'Dolore vero.','2026-03-25 18:25:23'),(71,77,23,4.5,'Finale wow.','2026-03-25 18:25:23'),(72,78,24,4.0,'Tatuaggi.','2026-03-25 18:25:23'),(73,79,25,4.5,'Phoenix da oscar.','2026-03-25 18:25:23'),(74,80,26,4.0,'La D è muta.','2026-03-25 18:25:23');
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
INSERT INTO `sessioni` VALUES ('1427dbbb647869250dff50346ccebf67',2,'2026-03-25 19:22:08','2026-03-25 19:24:39'),('16571ac889b5cefc8f0bfe7a94dd9847',1,'2026-03-25 18:29:10','2026-03-25 18:39:26'),('465e3238ffc522b2805a9ba74c1c99f6',2,'2026-03-25 18:41:39',NULL),('4b960c31d175a7419ef1f0c5273ef1a5',2,'2026-03-25 23:16:55','2026-03-25 23:16:59'),('7ce18c445789eee0f5a4b2063b518698',2,'2026-03-25 18:41:28','2026-03-25 18:41:32'),('86a3dbd4354229c3c5b737110fa25798',2,'2026-03-25 19:30:24','2026-03-25 19:30:32'),('8728ce84b027b0afd50bf431e2d7d22a',1,'2026-03-25 19:24:57','2026-03-25 19:26:40'),('9f3fa601096c26b4994ecb4a3c8306a8',1,'2026-03-25 18:23:48',NULL),('a477f9ef5225a29f395fe3fc0e596464',1,'2026-03-25 18:20:29','2026-03-25 18:22:05'),('bc43366d58b172cff0a4336ba922093d',1,'2026-03-25 18:22:14','2026-03-25 18:22:48'),('bc76cfd9f3cb5e4ab157efef871b68f9',1,'2026-03-25 23:17:10',NULL),('d14eed9bbfcca0519cfc673d405a5dc4',2,'2026-03-25 19:40:09','2026-03-25 19:53:23'),('da3f07ec30e02ad0d9b7d19f80b195a4',1,'2026-03-25 19:26:56',NULL);
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
  `iso_code` char(2) DEFAULT NULL,
  `attivo` tinyint(1) DEFAULT '1',
  `foto_profilo` varchar(255) DEFAULT NULL,
  `data_registrazione` datetime DEFAULT NULL,
  PRIMARY KEY (`id_utente`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `id_profilo` (`id_profilo`),
  KEY `iso_code` (`iso_code`),
  CONSTRAINT `utenti_ibfk_1` FOREIGN KEY (`id_profilo`) REFERENCES `profili` (`id_profilo`) ON UPDATE CASCADE,
  CONSTRAINT `utenti_ibfk_2` FOREIGN KEY (`iso_code`) REFERENCES `nazioni` (`iso_code`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utenti`
--

LOCK TABLES `utenti` WRITE;
/*!40000 ALTER TABLE `utenti` DISABLE KEYS */;
INSERT INTO `utenti` VALUES (1,'alessio','$2y$12$UZsjtBpHifZRYxdNOxfUF.jvdAfcn8XGBEN1Q2sV7xhq1khjsu.z.','alessio.gualtieri24@istitutotecnicomarconipilla.edu.it','Alessio','Gualtieri','Baranello',1,'IT',1,NULL,'2026-03-25 17:19:40'),(2,'mario.rossi','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','mario.rossi@mail.it','Mario','Rossi','Roma',2,'IT',1,NULL,'2026-03-25 18:22:28'),(3,'luca.bianchi','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','luca.b@mail.it','Luca','Bianchi','Milano',2,'IT',1,NULL,'2026-03-25 18:22:28'),(4,'giulia.verdi','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','giulia.v@mail.it','Giulia','Verdi','Napoli',2,'IT',1,NULL,'2026-03-25 18:22:28'),(5,'john.smith','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','jsmith@mail.com','John','Smith','New York',2,'US',1,NULL,'2026-03-25 18:22:28'),(6,'emma.watson','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','ewatson@mail.co.uk','Emma','Watson','Londra',2,'GB',1,NULL,'2026-03-25 18:22:28'),(7,'pierre.dupont','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','pierre@mail.fr','Pierre','Dupont','Parigi',2,'FR',1,NULL,'2026-03-25 18:22:28'),(8,'hans.muller','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','hans@mail.de','Hans','Muller','Berlino',2,'DE',1,NULL,'2026-03-25 18:22:28'),(9,'carlos.santana','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','carlos@mail.es','Carlos','Santana','Madrid',2,'ES',1,NULL,'2026-03-25 18:22:28'),(10,'kenji.sato','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','kenji@mail.jp','Kenji','Sato','Tokyo',2,'JP',1,NULL,'2026-03-25 18:22:28'),(11,'min.ji','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','minji@mail.kr','Min','Ji','Seoul',2,'KR',1,NULL,'2026-03-25 18:22:28'),(12,'chen.wei','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','chen@mail.cn','Chen','Wei','Pechino',2,'CN',1,NULL,'2026-03-25 18:22:28'),(13,'olivia.brown','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','olivia@mail.ca','Olivia','Brown','Toronto',2,'CA',1,NULL,'2026-03-25 18:22:28'),(14,'liam.neeson','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','liam.n@mail.ie','Liam','Neeson','Dublino',2,'IE',1,NULL,'2026-03-25 18:22:28'),(15,'maria.garcia','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','maria@mail.mx','Maria','Garcia','Città del Messico',2,'MX',1,NULL,'2026-03-25 18:22:28'),(16,'joao.silva','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','joao@mail.br','Joao','Silva','Rio de Janeiro',2,'BR',1,NULL,'2026-03-25 18:22:28'),(17,'diego.maradona','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','diego@mail.ar','Diego','Maradona','Buenos Aires',2,'AR',1,NULL,'2026-03-25 18:22:28'),(18,'lars.svensson','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','lars@mail.se','Lars','Svensson','Stoccolma',2,'SE',1,NULL,'2026-03-25 18:22:28'),(19,'peter.jackson','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','peter@mail.nz','Peter','Jackson','Wellington',2,'NZ',1,NULL,'2026-03-25 18:22:28'),(20,'raj.patel','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','raj@mail.in','Raj','Patel','Mumbai',2,'IN',1,NULL,'2026-03-25 18:22:28'),(21,'ivan.drago','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','ivan@mail.ru','Ivan','Drago','Mosca',2,'RU',1,NULL,'2026-03-25 18:22:28'),(22,'ahmed.ali','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','ahmed@mail.eg','Ahmed','Ali','Il Cairo',2,'EG',1,NULL,'2026-03-25 18:22:28'),(23,'charlize.theron','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','charlize@mail.za','Charlize','Theron','Pretoria',2,'ZA',1,NULL,'2026-03-25 18:22:28'),(24,'sofia.gomez','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','sofia@mail.co','Sofia','Gomez','Bogotá',2,'CO',1,NULL,'2026-03-25 18:22:28'),(25,'andrea.romano','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','andrea@mail.it','Andrea','Romano','Torino',2,'IT',1,NULL,'2026-03-25 18:22:28'),(26,'marta.ferrari','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','marta@mail.it','Marta','Ferrari','Venezia',2,'IT',1,NULL,'2026-03-25 18:22:28'),(27,'william.wallace','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','william@mail.gb','William','Wallace','Edimburgo',2,'GB',1,NULL,'2026-03-25 18:22:28'),(28,'elena.kournikova','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','elena@mail.ru','Elena','Kournikova','San Pietroburgo',2,'RU',1,NULL,'2026-03-25 18:22:28'),(29,'david.beckham','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','david@mail.gb','David','Beckham','Manchester',2,'GB',1,NULL,'2026-03-25 18:22:28'),(30,'yuki.tsunoda','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','yuki@mail.jp','Yuki','Tsunoda','Osaka',2,'JP',1,NULL,'2026-03-25 18:22:28'),(31,'alessandro.delpiero','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','alex@mail.it','Alessandro','Del Piero','Padova',2,'IT',1,NULL,'2026-03-25 18:22:28'),(32,'sarah.connor','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','sarah@mail.us','Sarah','Connor','Los Angeles',2,'US',1,NULL,'2026-03-25 18:22:28'),(33,'bruce.wayne','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','bruce@mail.us','Bruce','Wayne','Gotham',2,'US',1,NULL,'2026-03-25 18:22:28'),(34,'clark.kent','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','clark@mail.us','Clark','Kent','Metropolis',2,'US',1,NULL,'2026-03-25 18:22:28'),(35,'diana.prince','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','diana@mail.us','Diana','Prince','Washington',2,'US',1,NULL,'2026-03-25 18:22:28'),(36,'peter.parker','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','peter.p@mail.us','Peter','Parker','New York',2,'US',1,NULL,'2026-03-25 18:22:28'),(37,'tony.stark','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','tony@mail.us','Tony','Stark','Malibu',2,'US',1,NULL,'2026-03-25 18:22:28'),(38,'steve.rogers','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','steve@mail.us','Steve','Rogers','Brooklyn',2,'US',1,NULL,'2026-03-25 18:22:28'),(39,'natasha.romanoff','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','natasha@mail.ru','Natasha','Romanoff','Stalingrado',2,'RU',1,NULL,'2026-03-25 18:22:28'),(40,'wanda.maximoff','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','wanda@mail.rs','Wanda','Maximoff','Sokovia',2,'RS',1,NULL,'2026-03-25 18:22:28'),(41,'stephen.strange','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','stephen@mail.us','Stephen','Strange','New York',2,'US',1,NULL,'2026-03-25 18:22:28'),(42,'thor.odinson','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','thor@mail.no','Thor','Odinson','Asgard',2,'NO',1,NULL,'2026-03-25 18:22:28'),(43,'loki.laufeyson','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','loki@mail.no','Loki','Laufeyson','Jotunheim',2,'NO',1,NULL,'2026-03-25 18:22:28'),(44,'bruce.banner','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','banner@mail.us','Bruce','Banner','Dayton',2,'US',1,NULL,'2026-03-25 18:22:28'),(45,'clint.barton','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','clint@mail.us','Clint','Barton','Waverly',2,'US',1,NULL,'2026-03-25 18:22:28'),(46,'sam.wilson','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','sam@mail.us','Sam','Wilson','Harlem',2,'US',1,NULL,'2026-03-25 18:22:28'),(47,'bucky.barnes','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','bucky@mail.us','Bucky','Barnes','Brooklyn',2,'US',1,NULL,'2026-03-25 18:22:28'),(48,'scott.lang','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','scott@mail.us','Scott','Lang','San Francisco',2,'US',1,NULL,'2026-03-25 18:22:28'),(49,'hope.vandyne','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','hope@mail.us','Hope','Van Dyne','San Francisco',2,'US',1,NULL,'2026-03-25 18:22:28'),(50,'carol.danvers','$2y$10$4TMwlTJPm4uzHZyA20UEVeRtjQ7qNW5jeXsrfwJ4AXPg.3iLvHb9e','carol@mail.us','Carol','Danvers','Boston',2,'US',1,NULL,'2026-03-25 18:22:28');
/*!40000 ALTER TABLE `utenti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `watched`
--

DROP TABLE IF EXISTS `watched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `watched` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_film` int NOT NULL,
  `id_utente` int NOT NULL,
  `data_inserimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_film` (`id_film`,`id_utente`),
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
  `id` int NOT NULL AUTO_INCREMENT,
  `id_film` int NOT NULL,
  `id_utente` int NOT NULL,
  `data_inserimento` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_film` (`id_film`,`id_utente`),
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

-- Dump completed on 2026-03-27  9:21:33
