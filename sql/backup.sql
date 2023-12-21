-- MySQL dump 10.13  Distrib 8.0.19, for Win64 (x86_64)
--
-- Host: localhost    Database: sistema_votacion
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `candidatos`
--

DROP TABLE IF EXISTS `candidatos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidatos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidatos`
--

LOCK TABLES `candidatos` WRITE;
/*!40000 ALTER TABLE `candidatos` DISABLE KEYS */;
INSERT INTO `candidatos` VALUES (1,'Juan Pérez',1),(2,'María González',1),(3,'Carlos Rodríguez',1),(4,'Laura Martínez',1);
/*!40000 ALTER TABLE `candidatos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comunas`
--

DROP TABLE IF EXISTS `comunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comunas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_comuna` varchar(255) NOT NULL,
  `id_region` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id_region` (`id_region`),
  CONSTRAINT `comunas_ibfk_1` FOREIGN KEY (`id_region`) REFERENCES `regiones` (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comunas`
--

LOCK TABLES `comunas` WRITE;
/*!40000 ALTER TABLE `comunas` DISABLE KEYS */;
INSERT INTO `comunas` VALUES (101,'Arica',1),(102,'Camarones',1),(103,'General Lagos',1),(104,'Putre',1),(105,'Iquique',2),(106,'Alto Hospicio',2),(107,'Pozo Almonte',2),(108,'Camiña',2),(109,'Colchane',2),(110,'Huara',2),(111,'Antofagasta',3),(112,'Mejillones',3),(113,'Sierra Gorda',3),(114,'Taltal',3),(115,'Calama',3),(116,'Ollagüe',3),(117,'San Pedro de Atacama',3),(118,'Copiapó',4),(119,'Caldera',4),(120,'Tierra Amarilla',4),(121,'Chañaral',4),(122,'Diego de Almagro',4),(123,'Vallenar',4),(124,'Alto del Carmen',4),(125,'Freirina',4),(126,'Huasco',4),(127,'La Serena',5),(128,'Coquimbo',5),(129,'Andacollo',5),(130,'La Higuera',5),(131,'Paiguano',5),(132,'Vicuña',5),(133,'Illapel',5),(134,'Canela',5),(135,'Los Vilos',5),(136,'Salamanca',5),(137,'Valparaíso',6),(138,'Casablanca',6),(139,'Concón',6),(140,'Juan Fernández',6),(141,'Puchuncaví',6),(142,'Quintero',6),(143,'Viña del Mar',6),(144,'Isla de Pascua',6),(145,'Los Andes',6),(146,'Calle Larga',6),(147,'Rinconada',6),(148,'San Esteban',6),(149,'La Ligua',6),(150,'Cabildo',6),(151,'Papudo',6),(152,'Petorca',6),(153,'Zapallar',6),(154,'Rancagua',7),(155,'Codegua',7),(156,'Coinco',7),(157,'Coltauco',7),(158,'Doñihue',7),(159,'Graneros',7),(160,'Las Cabras',7),(161,'Machalí',7),(162,'Malloa',7),(163,'Mostazal',7),(164,'Olivar',7),(165,'Peumo',7),(166,'Pichidegua',7),(167,'Quinta de Tilcoco',7),(168,'Rengo',7),(169,'Requínoa',7),(170,'San Vicente',7),(171,'Talca',8),(172,'Constitución',8),(173,'Curepto',8),(174,'Empedrado',8),(175,'Maule',8),(176,'Pelarco',8),(177,'Pencahue',8),(178,'Río Claro',8),(179,'San Clemente',8),(180,'San Rafael',8),(181,'Chillán',9),(182,'Bulnes',9),(183,'Cobquecura',9),(184,'Coelemu',9),(185,'Chillán Viejo',9),(186,'El Carmen',9),(187,'Ninhue',9),(188,'Ñiquén',9),(189,'Pemuco',9),(190,'Pinto',9),(191,'Portezuelo',9),(192,'Quillón',9),(193,'Quirihue',9),(194,'Ránquil',9),(195,'San Carlos',9),(196,'San Fabián',9),(197,'San Ignacio',9),(198,'Yungay',9),(199,'Concepción',10),(200,'Coronel',10),(201,'Chiguayante',10),(202,'Florida',10),(203,'Hualqui',10),(204,'Lota',10),(205,'Penco',10),(206,'San Pedro de la Paz',10),(207,'Santa Juana',10),(208,'Talcahuano',10),(209,'Tomé',10),(210,'Hualpén',10),(211,'Temuco',11),(212,'Carahue',11),(213,'Cunco',11),(214,'Curarrehue',11),(215,'Freire',11),(216,'Galvarino',11),(217,'Gorbea',11),(218,'Lautaro',11),(219,'Loncoche',11),(220,'Melipeuco',11),(221,'Nueva Imperial',11),(222,'Padre Las Casas',11),(223,'Perquenco',11),(224,'Pitrufquén',11),(225,'Pucón',11),(226,'Saavedra',11),(227,'Teodoro Schmidt',11),(228,'Toltén',11),(229,'Vilcún',11),(230,'Villarrica',11),(231,'Cholchol',11),(232,'Valdivia',12),(233,'Corral',12),(234,'Lanco',12),(235,'Los Lagos',12),(236,'Máfil',12),(237,'Mariquina',12),(238,'Paillaco',12),(239,'Panguipulli',12),(240,'Puerto Montt',13),(241,'Calbuco',13),(242,'Cochamó',13),(243,'Fresia',13),(244,'Frutillar',13),(245,'Los Muermos',13),(246,'Llanquihue',13),(247,'Maullín',13),(248,'Puerto Varas',13),(249,'Castro',13),(250,'Ancud',13),(251,'Chonchi',13),(252,'Curaco de Vélez',13),(253,'Dalcahue',13),(254,'Puqueldón',13),(255,'Queilén',13),(256,'Quellón',13),(257,'Quemchi',13),(258,'Quinchao',13),(259,'Coyhaique',14),(260,'Lago Verde',14),(261,'Aysén',14),(262,'Cisnes',14),(263,'Guaitecas',14),(264,'Cochrane',14),(265,'O’Higgins',14),(266,'Tortel',14),(267,'Punta Arenas',15),(268,'Laguna Blanca',15),(269,'Río Verde',15),(270,'San Gregorio',15),(271,'Cabo de Hornos (Ex Navarino)',15),(272,'Antártica',15),(273,'Santiago',16),(274,'Cerrillos',16),(275,'Cerro Navia',16),(276,'Conchalí',16),(277,'El Bosque',16),(278,'Estación Central',16),(279,'Huechuraba',16),(280,'Independencia',16),(281,'La Cisterna',16),(282,'La Florida',16),(283,'La Granja',16),(284,'La Pintana',16),(285,'La Reina',16),(286,'Las Condes',16),(287,'Lo Barnechea',16),(288,'Lo Espejo',16),(289,'Lo Prado',16),(290,'Macul',16),(291,'Maipú',16),(292,'Ñuñoa',16),(293,'Pedro Aguirre Cerda',16),(294,'Peñalolén',16),(295,'Providencia',16),(296,'Pudahuel',16),(297,'Puente Alto',16),(298,'Quilicura',16),(299,'Quinta Normal',16),(300,'Recoleta',16),(301,'Renca',16),(302,'San Joaquín',16),(303,'San Miguel',16),(304,'San Ramón',16),(305,'Vitacura',16);
/*!40000 ALTER TABLE `comunas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `regiones`
--

DROP TABLE IF EXISTS `regiones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `regiones` (
  `id_region` int NOT NULL AUTO_INCREMENT,
  `nombre_region` varchar(255) NOT NULL,
  PRIMARY KEY (`id_region`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `regiones`
--

LOCK TABLES `regiones` WRITE;
/*!40000 ALTER TABLE `regiones` DISABLE KEYS */;
INSERT INTO `regiones` VALUES (1,'Arica y Parinacota'),(2,'Tarapacá'),(3,'Antofagasta'),(4,'Atacama'),(5,'Coquimbo'),(6,'Valparaíso'),(7,'Región del Libertador Gral. Bernardo O’Higgins'),(8,'Región del Maule'),(9,'Región de Ñuble'),(10,'Región del Biobío'),(11,'Región de la Araucanía'),(12,'Región de Los Ríos'),(13,'Región de Los Lagos'),(14,'Región Aisén del Gral. Carlos Ibáñez del Campo'),(15,'Región de Magallanes y de la Antártica Chilena'),(16,'Región Metropolitana de Santiago');
/*!40000 ALTER TABLE `regiones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votos`
--

DROP TABLE IF EXISTS `votos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_apellido` varchar(255) NOT NULL,
  `alias` varchar(255) NOT NULL,
  `rut` varchar(20) NOT NULL,
  `email` varchar(255) NOT NULL,
  `id_comuna` int NOT NULL,
  `id_candidato` int NOT NULL,
  `medios_contacto` varchar(255) DEFAULT NULL,
  `fecha_registro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_comuna` (`id_comuna`),
  KEY `id_candidato` (`id_candidato`),
  CONSTRAINT `votos_ibfk_1` FOREIGN KEY (`id_comuna`) REFERENCES `comunas` (`id`),
  CONSTRAINT `votos_ibfk_2` FOREIGN KEY (`id_candidato`) REFERENCES `candidatos` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votos`
--

LOCK TABLES `votos` WRITE;
/*!40000 ALTER TABLE `votos` DISABLE KEYS */;
/*!40000 ALTER TABLE `votos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'sistema_votacion'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-21  0:38:09
