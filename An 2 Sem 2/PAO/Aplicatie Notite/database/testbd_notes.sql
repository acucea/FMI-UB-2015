-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: ihatethis.ddns.net    Database: testbd
-- ------------------------------------------------------
-- Server version	5.7.18-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `notes`
--

DROP TABLE IF EXISTS `notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notes`
--

LOCK TABLES `notes` WRITE;
/*!40000 ALTER TABLE `notes` DISABLE KEYS */;
INSERT INTO `notes` VALUES (1,'note mea','calin','password'),(2,'note mea','calin',NULL),(3,'note mea','calin',NULL),(4,'sha lala ,','calin','password'),(5,'pam pam ','calin',NULL),(6,'NOTITA MEA','a80dcd35-3fb0-4ded-80ed-0a4be84a0ce4','asd'),(7,'NOTITA MEA','a80dcd35-3fb0-4ded-80ed-0a4be84a0ce4','asd'),(8,'NOTITA MEA','a80dcd35-3fb0-4ded-80ed-0a4be84a0ce4',NULL),(9,'Note text ..','calin',NULL),(10,'Editat','calin','Editat'),(11,'Salutare cumetre','5cf3685b-3631-4f0a-ac36-5fb54be63fd9','12345'),(12,'qweasd','5cf3685b-3631-4f0a-ac36-5fb54be63fd9',NULL),(13,'qweasd','5cf3685b-3631-4f0a-ac36-5fb54be63fd9',NULL),(14,'qweasd','5cf3685b-3631-4f0a-ac36-5fb54be63fd9',NULL),(15,'qweasd','5cf3685b-3631-4f0a-ac36-5fb54be63fd9',NULL),(16,'qweasd','5cf3685b-3631-4f0a-ac36-5fb54be63fd9',NULL),(17,'qweasd','5cf3685b-3631-4f0a-ac36-5fb54be63fd9',NULL),(18,'qweasd','5cf3685b-3631-4f0a-ac36-5fb54be63fd9','23'),(19,'Calin','d3e671c9-afb2-4ee6-b3c5-6d57b383f5c1','pass'),(20,'Note1','81dd5817-6462-4ba6-87f9-e8b4a8168df8',NULL),(21,'Note3','81dd5817-6462-4ba6-87f9-e8b4a8168df8','passs'),(22,'Note','81dd5817-6462-4ba6-87f9-e8b4a8168df8','pass'),(23,'nota','ae940fca-f25d-43a9-a224-3a1b0a9c2633','any'),(24,'Nota2','ae940fca-f25d-43a9-a224-3a1b0a9c2633','any'),(25,'nota2 ','ae940fca-f25d-43a9-a224-3a1b0a9c2633','pass'),(26,'nota1','d59598b1-cd9c-478a-83ab-ac6d7ab54596',NULL),(27,'nota1','d59598b1-cd9c-478a-83ab-ac6d7ab54596','any'),(28,'nota2','d59598b1-cd9c-478a-83ab-ac6d7ab54596','any'),(29,'nota nota ','calin','any'),(30,'Nota1','f696aa76-a1ac-4a18-a5a8-47f063be5d91',NULL),(31,'Nota2','f696aa76-a1ac-4a18-a5a8-47f063be5d91','password'),(32,'calin','f696aa76-a1ac-4a18-a5a8-47f063be5d91',NULL),(33,'Nota1','faadbad3-9bf9-48ff-87b9-6c8db625503b','password'),(34,'Nota2','faadbad3-9bf9-48ff-87b9-6c8db625503b',NULL),(35,'Aceasta notita are parola pass','1e0a7d0e-1a1c-4e6f-8407-1d4bf5c6106b','pass'),(36,'Aceasti notita nu are parola','1e0a7d0e-1a1c-4e6f-8407-1d4bf5c6106b','any'),(37,'Notita cu parola','b9de61f1-3a71-423d-a8ce-0d5e0aec7503','pass'),(38,'Notita fara parola','b9de61f1-3a71-423d-a8ce-0d5e0aec7503',NULL),(39,'NotaMea2','dc4d5483-d456-4380-9159-f730f8f305d1','pass'),(40,'Nota2','dc4d5483-d456-4380-9159-f730f8f305d1',NULL),(41,'Nota3','dc4d5483-d456-4380-9159-f730f8f305d1','parola'),(42,'NotaCuParolaasd','9c8bb6b7-1997-47f8-abc0-d6f312f236f1','pass'),(43,'NotaFaraParola','9c8bb6b7-1997-47f8-abc0-d6f312f236f1',NULL);
/*!40000 ALTER TABLE `notes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-24 16:44:52
