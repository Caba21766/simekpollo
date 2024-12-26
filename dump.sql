-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: simekpollo
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add categoria',7,'add_categoria'),(26,'Can change categoria',7,'change_categoria'),(27,'Can delete categoria',7,'delete_categoria'),(28,'Can view categoria',7,'view_categoria'),(29,'Can add libro',8,'add_libro'),(30,'Can change libro',8,'change_libro'),(31,'Can delete libro',8,'delete_libro'),(32,'Can view libro',8,'view_libro'),(33,'Can add opinion',9,'add_opinion'),(34,'Can change opinion',9,'change_opinion'),(35,'Can delete opinion',9,'delete_opinion'),(36,'Can view opinion',9,'view_opinion'),(37,'Can add contacto',10,'add_contacto'),(38,'Can change contacto',10,'change_contacto'),(39,'Can delete contacto',10,'delete_contacto'),(40,'Can view contacto',10,'view_contacto'),(41,'Can add profile',11,'add_profile'),(42,'Can change profile',11,'change_profile'),(43,'Can delete profile',11,'delete_profile'),(44,'Can view profile',11,'view_profile'),(45,'Can add producto',12,'add_producto'),(46,'Can change producto',12,'change_producto'),(47,'Can delete producto',12,'delete_producto'),(48,'Can view producto',12,'view_producto'),(49,'Can add profile image',13,'add_profileimage'),(50,'Can change profile image',13,'change_profileimage'),(51,'Can delete profile image',13,'delete_profileimage'),(52,'Can view profile image',13,'view_profileimage'),(53,'Can add compra',14,'add_compra'),(54,'Can change compra',14,'change_compra'),(55,'Can delete compra',14,'delete_compra'),(56,'Can view compra',14,'view_compra'),(57,'Can add venta',15,'add_venta'),(58,'Can change venta',15,'change_venta'),(59,'Can delete venta',15,'delete_venta'),(60,'Can view venta',15,'view_venta'),(61,'Can add provedor',16,'add_provedor'),(62,'Can change provedor',16,'change_provedor'),(63,'Can delete provedor',16,'delete_provedor'),(64,'Can view provedor',16,'view_provedor'),(65,'Can add categ_producto',17,'add_categ_producto'),(66,'Can change categ_producto',17,'change_categ_producto'),(67,'Can delete categ_producto',17,'delete_categ_producto'),(68,'Can view categ_producto',17,'view_categ_producto'),(69,'Can add factura',18,'add_factura'),(70,'Can change factura',18,'change_factura'),(71,'Can delete factura',18,'delete_factura'),(72,'Can view factura',18,'view_factura'),(73,'Can add factura producto',19,'add_facturaproducto'),(74,'Can change factura producto',19,'change_facturaproducto'),(75,'Can delete factura producto',19,'delete_facturaproducto'),(76,'Can view factura producto',19,'view_facturaproducto'),(77,'Can add perfil usuario',20,'add_perfilusuario'),(78,'Can change perfil usuario',20,'change_perfilusuario'),(79,'Can delete perfil usuario',20,'delete_perfilusuario'),(80,'Can view perfil usuario',20,'view_perfilusuario'),(81,'Can add blog auth',21,'add_blogauth'),(82,'Can change blog auth',21,'change_blogauth'),(83,'Can delete blog auth',21,'delete_blogauth'),(84,'Can view blog auth',21,'view_blogauth'),(85,'Can add producto',22,'add_producto'),(86,'Can change producto',22,'change_producto'),(87,'Can delete producto',22,'delete_producto'),(88,'Can view producto',22,'view_producto');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `dni_usuario` varchar(20) DEFAULT NULL,
  `domicilio_usuario` varchar(255) DEFAULT NULL,
  `imagen_usuario` varchar(100) DEFAULT NULL,
  `tel1_usuario` varchar(15) DEFAULT NULL,
  `tel2_usuario` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (22,'pbkdf2_sha256$870000$IUXMf1KJE9HTBxyhYzfH2m$mC4bqfW5HKQ7/uinVrTozbXQOG+GuAS76LlHxtVG5H8=','2024-11-29 22:41:29.604907',0,'popo','Morales','Juan','popo@gmail.com',0,1,'2024-11-09 13:47:13.227236',NULL,NULL,NULL,NULL,NULL),(23,'pbkdf2_sha256$870000$UAnVmmOUZYZ016eIN8ndIo$D1GwlmMWGmRZKlBO/boJmlqD0j3wGTAWdtyLdXEZTfg=','2024-12-23 01:59:01.477483',1,'German','Osiris German','Simek','simek@gmail.com',1,1,'2024-11-13 22:01:50.552197','49741852','Avda Guemes','usuarios/Persona5.jfif','3644-852542','3644-852411'),(24,'pbkdf2_sha256$870000$a7iZTtgb0aRhHI1V2CIeZw$MuPOEnOB+w639/XLrcoLar+/MyTt69FQEhSB5Swcszg=','2024-12-23 01:54:54.346320',0,'Carlin','Carlito1','Caballero1','Carlito@gmail.com',0,1,'2024-11-27 18:05:21.929568','22222222','Alberdi 789','usuarios/Persona3.jfif','3644-741841','8541-7418'),(25,'pbkdf2_sha256$870000$05C9YKrKdexD0KZmeokTyH$jolO0FtuLZKweyRlsKcTW/3n2lKsE4kcxjt9IJzUeiE=','2024-12-23 20:48:09.394962',0,'Pololo','Pololo','Pololo','pololo@gmail.com',0,1,'2024-11-27 19:35:10.899715','42789877','moreno 789','usuarios/toy.jfif','3644-852874','3644-852412'),(26,'pbkdf2_sha256$870000$iuyowNqZN0HE0jofKKxJ6B$+MmEwboJUvoLbUu6WrOeD8BPZfDp2EmOK7pCn0vdEAo=','2024-12-01 17:29:12.001098',0,'Marcelo','Marcelo','Marcelo','Marcelo@gmail.com',0,1,'2024-11-30 12:58:34.733247',NULL,NULL,NULL,NULL,NULL),(27,'pbkdf2_sha256$870000$PzQFxHVmB8j99BQmqAOwdk$9+Wc4OM7ptOt7tdCknorgW0gLxk3qFjt59+OxwU7wFE=','2024-12-01 17:29:40.995508',0,'Luna','Mario Alberto','Luna','luna@gmail.com',0,1,'2024-12-01 12:45:35.904806','21898745','Brasil 564','usuarios/Persona6.jpg','3644-857412','3644-852741'),(28,'pbkdf2_sha256$870000$VGbTqizM2waKmQN1kCLwoy$OHvOjiB9Kgg1/WqeuB8mzdaLeTHq+f+gk5f5Yqgy5zQ=','2024-12-23 20:47:47.681957',0,'Gustavo','Gustavo','Gustavo','gustavo@gmail.com',0,1,'2024-12-20 15:57:26.101256','21766817','Brasil 564','usuarios/20191022_175052.jpg','3644-857412','3644-852411');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_auth_perfilusuario`
--

DROP TABLE IF EXISTS `blog_auth_perfilusuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_auth_perfilusuario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `DNI_usuario` varchar(20) DEFAULT NULL,
  `domicilio_usuario` varchar(255) DEFAULT NULL,
  `tel1_usuario` varchar(15) DEFAULT NULL,
  `tel2_usuario` varchar(15) DEFAULT NULL,
  `imagen_usuario` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `blog_auth_perfilusuario_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_auth_perfilusuario`
--

LOCK TABLES `blog_auth_perfilusuario` WRITE;
/*!40000 ALTER TABLE `blog_auth_perfilusuario` DISABLE KEYS */;
INSERT INTO `blog_auth_perfilusuario` VALUES (1,22,NULL,NULL,NULL,NULL,''),(2,23,NULL,NULL,NULL,NULL,''),(3,24,NULL,NULL,NULL,NULL,''),(4,25,NULL,NULL,NULL,NULL,''),(5,26,NULL,NULL,NULL,NULL,'');
/*!40000 ALTER TABLE `blog_auth_perfilusuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_auth_profile`
--

DROP TABLE IF EXISTS `blog_auth_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_auth_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `blog_auth_profile_user_id_5d5f2f88_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_auth_profile`
--

LOCK TABLES `blog_auth_profile` WRITE;
/*!40000 ALTER TABLE `blog_auth_profile` DISABLE KEYS */;
INSERT INTO `blog_auth_profile` VALUES (11,22,'profile_pics/Persona2_8smct02.webp'),(12,23,'profile_pics/Persona2.webp'),(13,24,'profile_pics/Foto.jpg'),(14,25,'profile_pics/Persona1.webp'),(15,26,''),(16,27,'profile_pics/Persona5.jfif'),(17,28,'');
/*!40000 ALTER TABLE `blog_auth_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritoapp_categ_producto`
--

DROP TABLE IF EXISTS `carritoapp_categ_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritoapp_categ_producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CarritoApp_categ_producto_nombre_c87b0a96_uniq` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritoapp_categ_producto`
--

LOCK TABLES `carritoapp_categ_producto` WRITE;
/*!40000 ALTER TABLE `carritoapp_categ_producto` DISABLE KEYS */;
INSERT INTO `carritoapp_categ_producto` VALUES (11,'Ave'),(1,'Aves Derivado'),(13,'Carne Vacuno'),(15,'Lechon'),(21,'Pescado'),(18,'Vacuno Chacinados');
/*!40000 ALTER TABLE `carritoapp_categ_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritoapp_compra`
--

DROP TABLE IF EXISTS `carritoapp_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritoapp_compra` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `precio_compra` decimal(10,2) NOT NULL,
  `factura_compra` varchar(100) NOT NULL,
  `fecha_compra` date NOT NULL,
  `producto_id` bigint NOT NULL,
  `provedor_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CarritoApp_compra_producto_id_7f9a6275_fk_CarritoApp_producto_id` (`producto_id`),
  KEY `CarritoApp_compra_provedor_id_de2aa932_fk_CarritoApp_provedor_id` (`provedor_id`),
  CONSTRAINT `CarritoApp_compra_producto_id_7f9a6275_fk_CarritoApp_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `carritoapp_producto` (`id`),
  CONSTRAINT `CarritoApp_compra_provedor_id_de2aa932_fk_CarritoApp_provedor_id` FOREIGN KEY (`provedor_id`) REFERENCES `carritoapp_provedor` (`id`),
  CONSTRAINT `CarritoApp_compra_cantidad_667f9a35_check` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritoapp_compra`
--

LOCK TABLES `carritoapp_compra` WRITE;
/*!40000 ALTER TABLE `carritoapp_compra` DISABLE KEYS */;
INSERT INTO `carritoapp_compra` VALUES (41,100,50.00,'0001-4444-4444','2024-12-20',36,1),(42,100,50.00,'0001-4444-4444','2024-12-20',37,3),(43,200,50.00,'0001-4444-4444','2024-12-20',38,5),(44,100,50.00,'0001-4444-4444','2024-12-20',39,1),(45,100,50.00,'0001-4444-4444','2024-12-20',40,3),(46,100,50.00,'0001-4444-4444','2024-12-20',41,5),(47,100,50.00,'0001-4444-4444','2024-12-20',42,6),(48,100,50.00,'0001-4444-4444','2024-12-20',43,2),(49,100,50.00,'0001-4444-4444','2024-12-20',44,3),(50,100,50.00,'0001-4444-4444','2024-12-20',45,1),(51,100,50.00,'0001-4444-4445','2024-12-20',46,1),(52,100,50.00,'0001-4444-4448','2024-12-20',47,2),(53,100,60.00,'0001-4444-5555','2024-12-21',36,2),(57,100,60.00,'0001-4444-8000','2024-12-21',38,1),(58,5,50.00,'00011-4888-9999','2024-12-21',48,2);
/*!40000 ALTER TABLE `carritoapp_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritoapp_factura`
--

DROP TABLE IF EXISTS `carritoapp_factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritoapp_factura` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `numero_factura` varchar(10) NOT NULL,
  `fecha` date NOT NULL,
  `nombre_cliente` varchar(255) NOT NULL,
  `apellido_cliente` varchar(255) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `metodo_pago` varchar(50) NOT NULL,
  `detalle_productos` longtext NOT NULL DEFAULT (_utf8mb3'Sin detalles'),
  `imagen_factura` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritoapp_factura`
--

LOCK TABLES `carritoapp_factura` WRITE;
/*!40000 ALTER TABLE `carritoapp_factura` DISABLE KEYS */;
INSERT INTO `carritoapp_factura` VALUES (65,'00001','2024-12-20','Osiris German','Simek',500.00,'Efectivo','[{\"nombre_producto\": \"Milanesa de Pechuga\", \"cantidad_vendida\": 5, \"precio_unitario\": 100.0, \"subtotal\": 500.0}]',''),(66,'00002','2024-12-20','Osiris German','Simek',1500.00,'Efectivo','[{\"nombre_producto\": \"Pernil\", \"cantidad_vendida\": 10, \"precio_unitario\": 100.0, \"subtotal\": 1000.0}, {\"nombre_producto\": \"Costilla\", \"cantidad_vendida\": 5, \"precio_unitario\": 100.0, \"subtotal\": 500.0}]',''),(67,'00003','2024-12-20','Osiris German','Simek',500.00,'Tarjeta Tuya','[{\"nombre_producto\": \"Pechuga\", \"cantidad_vendida\": 5, \"precio_unitario\": 100.0, \"subtotal\": 500.0}]',''),(68,'00004','2024-12-20','Osiris German','Simek',1000.00,'Mercado Pago','[{\"nombre_producto\": \"Huevos\", \"cantidad_vendida\": 10, \"precio_unitario\": 100.0, \"subtotal\": 1000.0}]',''),(69,'00005','2024-12-20','Osiris German','Simek',2000.00,'Tarjeta Débito','[{\"nombre_producto\": \"Alita\", \"cantidad_vendida\": 20, \"precio_unitario\": 100.0, \"subtotal\": 2000.0}]',''),(70,'00006','2024-12-20','Osiris German','Simek',500.00,'Tarjeta Tuya','[{\"nombre_producto\": \"Pollo N\\u00ba10\", \"cantidad_vendida\": 5, \"precio_unitario\": 100.0, \"subtotal\": 500.0}]',''),(71,'00007','2024-12-20','Osiris German','Simek',1000.00,'Cuenta Corriente','[{\"nombre_producto\": \"Pollo N\\u00ba9\", \"cantidad_vendida\": 10, \"precio_unitario\": 100.0, \"subtotal\": 1000.0}]',''),(72,'00008','2024-12-20','Osiris German','Simek',1000.00,'Efectivo','[{\"nombre_producto\": \"Pollo N\\u00ba7\", \"cantidad_vendida\": 10, \"precio_unitario\": 100.0, \"subtotal\": 1000.0}]',''),(73,'00009','2024-12-20','Osiris German','Simek',2000.00,'Tarjeta Débito','[{\"nombre_producto\": \"Grasa\", \"cantidad_vendida\": 20, \"precio_unitario\": 100.0, \"subtotal\": 2000.0}]',''),(74,'00010','2024-12-20','Gustavo','Gustavo',1000.00,'Efectivo','[{\"nombre_producto\": \"Costilla\", \"cantidad_vendida\": 10, \"precio_unitario\": 100.0, \"subtotal\": 1000.0}]',''),(75,'00011','2024-12-20','Gustavo','Gustavo',1000.00,'Efectivo','[{\"nombre_producto\": \"Huevos\", \"cantidad_vendida\": 10, \"precio_unitario\": 100.0, \"subtotal\": 1000.0}]',''),(76,'00012','2024-12-20','Gustavo','Gustavo',900.00,'Efectivo','[{\"nombre_producto\": \"Pollo N\\u00ba9\", \"cantidad_vendida\": 9, \"precio_unitario\": 100.0, \"subtotal\": 900.0}]',''),(77,'00013','2024-12-20','Carlito1','Caballero1',1000.00,'Efectivo','[{\"nombre_producto\": \"Pollo N\\u00ba10\", \"cantidad_vendida\": 10, \"precio_unitario\": 100.0, \"subtotal\": 1000.0}]',''),(78,'00014','2024-12-20','Carlito1','Caballero1',2500.00,'Efectivo','[{\"nombre_producto\": \"Pollo N\\u00ba7\", \"cantidad_vendida\": 10, \"precio_unitario\": 100.0, \"subtotal\": 1000.0}, {\"nombre_producto\": \"Pechuga\", \"cantidad_vendida\": 5, \"precio_unitario\": 100.0, \"subtotal\": 500.0}, {\"nombre_producto\": \"Costilla\", \"cantidad_vendida\": 5, \"precio_unitario\": 100.0, \"subtotal\": 500.0}, {\"nombre_producto\": \"Milanesa de Pechuga\", \"cantidad_vendida\": 5, \"precio_unitario\": 100.0, \"subtotal\": 500.0}]',''),(79,'00015','2024-12-20','Pololo','Pololo',4000.00,'Efectivo','[{\"nombre_producto\": \"Pollo N\\u00ba9\", \"cantidad_vendida\": 10, \"precio_unitario\": 100.0, \"subtotal\": 1000.0}, {\"nombre_producto\": \"Pollo N\\u00ba10\", \"cantidad_vendida\": 10, \"precio_unitario\": 100.0, \"subtotal\": 1000.0}, {\"nombre_producto\": \"Grasa\", \"cantidad_vendida\": 20, \"precio_unitario\": 100.0, \"subtotal\": 2000.0}]',''),(80,'00016','2024-12-21','Osiris German','Simek',500.00,'Efectivo','[{\"nombre_producto\": \"Milanesa de Pechuga\", \"cantidad_vendida\": 5, \"precio_unitario\": 100.0, \"subtotal\": 500.0}]',''),(81,'00017','2024-12-22','Osiris German','Simek',100.00,'Efectivo','[{\"nombre_producto\": \"Suruv\\u00ed Rodajas\", \"cantidad_vendida\": 1, \"precio_unitario\": 100.0, \"subtotal\": 100.0}]',''),(82,'00018','2024-12-22','Osiris German','Simek',200.00,'Efectivo','[{\"nombre_producto\": \"Suruv\\u00ed Rodajas\", \"cantidad_vendida\": 1, \"precio_unitario\": 100.0, \"subtotal\": 100.0}, {\"nombre_producto\": \"Pernil\", \"cantidad_vendida\": 1, \"precio_unitario\": 100.0, \"subtotal\": 100.0}]','');
/*!40000 ALTER TABLE `carritoapp_factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritoapp_facturaproducto`
--

DROP TABLE IF EXISTS `carritoapp_facturaproducto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritoapp_facturaproducto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int unsigned NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `factura_id` bigint NOT NULL,
  `producto_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CarritoApp_facturapr_factura_id_f31adaa8_fk_CarritoAp` (`factura_id`),
  KEY `CarritoApp_facturapr_producto_id_9468bca9_fk_CarritoAp` (`producto_id`),
  CONSTRAINT `CarritoApp_facturapr_factura_id_f31adaa8_fk_CarritoAp` FOREIGN KEY (`factura_id`) REFERENCES `carritoapp_factura` (`id`),
  CONSTRAINT `CarritoApp_facturapr_producto_id_9468bca9_fk_CarritoAp` FOREIGN KEY (`producto_id`) REFERENCES `carritoapp_producto` (`id`),
  CONSTRAINT `carritoapp_facturaproducto_chk_1` CHECK ((`cantidad` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritoapp_facturaproducto`
--

LOCK TABLES `carritoapp_facturaproducto` WRITE;
/*!40000 ALTER TABLE `carritoapp_facturaproducto` DISABLE KEYS */;
/*!40000 ALTER TABLE `carritoapp_facturaproducto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritoapp_producto`
--

DROP TABLE IF EXISTS `carritoapp_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritoapp_producto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `descripcion` longtext NOT NULL,
  `imagen` varchar(100) NOT NULL,
  `categoria_id` bigint NOT NULL,
  `nombre_producto` varchar(255) NOT NULL,
  `stock` int unsigned NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `imagen2` varchar(100) DEFAULT NULL,
  `imagen3` varchar(100) DEFAULT NULL,
  `imagen4` varchar(100) DEFAULT NULL,
  `imagen5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `CarritoApp_producto_categoria_id_9f878cff_fk_CarritoAp` (`categoria_id`),
  CONSTRAINT `CarritoApp_producto_categoria_id_9f878cff_fk_CarritoAp` FOREIGN KEY (`categoria_id`) REFERENCES `carritoapp_categ_producto` (`id`),
  CONSTRAINT `carritoapp_producto_chk_1` CHECK ((`stock` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritoapp_producto`
--

LOCK TABLES `carritoapp_producto` WRITE;
/*!40000 ALTER TABLE `carritoapp_producto` DISABLE KEYS */;
INSERT INTO `carritoapp_producto` VALUES (36,'con pan rallado de Rialdo','productos/milanesa.jfif',1,'Milanesa de Pechuga',185,100.00,'','','',''),(37,'al Horno','productos/pernil_BEaSAoP.jfif',15,'Pernil',88,100.00,'','','',''),(38,'de Ternera','productos/costilla_de_vaca.jfif',13,'Costilla',280,100.00,'','','',''),(39,'limpias','productos/pechuga1.jpg',1,'Pechuga',90,100.00,'','','',''),(40,'caseros','productos/huevo.jfif',1,'Huevos',80,100.00,'','','',''),(41,'de pollo al menudeo','productos/alita.jfif',1,'Alita',80,100.00,'','','',''),(42,'Grande','productos/pollo1.jpg',11,'Pollo Nº10',75,100.00,'','','',''),(43,'Mediano','productos/pollo1_Bwq7pfu.jpg',11,'Pollo Nº9',71,100.00,'','','',''),(44,'Chicos especial para parrillas','productos/pollo1_JYSpFFn.jpg',11,'Pollo Nº7',80,100.00,'','','',''),(45,'grasa de lechon... limpia','productos/grasa.jfif',15,'Grasa',60,100.00,'','','',''),(46,'Chorizo muy bueno... mucho cerdo','productos/Chorizo.jfif',18,'Chorizo',100,100.00,'','','',''),(47,'pancitas de pollo','productos/pancita.jfif',1,'Pancitas',100,100.00,'','','',''),(48,'Rodajas','productos/rodajas-de-surubi.jpg',21,'Suruví Rodajas',3,100.00,'','','',''),(49,'Limpio para la parrilla','productos/pacu.jfif',21,'Pacu',0,100.00,'','','','');
/*!40000 ALTER TABLE `carritoapp_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritoapp_provedor`
--

DROP TABLE IF EXISTS `carritoapp_provedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritoapp_provedor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `direccion` longtext,
  `telefono` varchar(20) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritoapp_provedor`
--

LOCK TABLES `carritoapp_provedor` WRITE;
/*!40000 ALTER TABLE `carritoapp_provedor` DISABLE KEYS */;
INSERT INTO `carritoapp_provedor` VALUES (1,'Gustavo Ventas Varios','Brasil 237','3644-563925','neagestion@gmail.com'),(2,'Soychuk','Saenz Peña','3624-563985','Soychuk@gmail.com'),(3,'Super pollo','Resistencia','3624-789854','superpollo@gmail.com'),(5,'Todo Carne','Saenz Peña','3624-563877','Todo@gmail.com'),(6,'Homelzuk Huevo','Saenz Peña','3624-214588','huevo@gmail.com');
/*!40000 ALTER TABLE `carritoapp_provedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carritoapp_venta`
--

DROP TABLE IF EXISTS `carritoapp_venta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carritoapp_venta` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cantidad` int NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `producto_id` bigint NOT NULL,
  `usuario_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CarritoApp_venta_producto_id_63d1e5ef_fk_CarritoApp_producto_id` (`producto_id`),
  KEY `CarritoApp_venta_usuario_id_dca1adaf_fk_auth_user_id` (`usuario_id`),
  CONSTRAINT `CarritoApp_venta_producto_id_63d1e5ef_fk_CarritoApp_producto_id` FOREIGN KEY (`producto_id`) REFERENCES `carritoapp_producto` (`id`),
  CONSTRAINT `CarritoApp_venta_usuario_id_dca1adaf_fk_auth_user_id` FOREIGN KEY (`usuario_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carritoapp_venta`
--

LOCK TABLES `carritoapp_venta` WRITE;
/*!40000 ALTER TABLE `carritoapp_venta` DISABLE KEYS */;
/*!40000 ALTER TABLE `carritoapp_venta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=225 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (3,'2024-11-15 22:13:47.228092','1','Título por defecto',1,'[{\"added\": {}}]',12,23),(4,'2024-11-15 22:14:35.478008','2','Pollo9',1,'[{\"added\": {}}]',12,23),(5,'2024-11-15 22:15:08.638658','3','alita',1,'[{\"added\": {}}]',12,23),(6,'2024-11-16 19:52:16.354099','1','Pollo6',2,'[{\"changed\": {\"fields\": [\"Titulo\"]}}]',12,23),(7,'2024-11-16 19:53:04.667600','4','Pechuga',1,'[{\"added\": {}}]',12,23),(8,'2024-11-16 19:53:47.597202','5','Pata Muslo',1,'[{\"added\": {}}]',12,23),(9,'2024-11-17 19:18:44.547388','11','LECHUGA',1,'[{\"added\": {}}]',12,23),(10,'2024-11-17 19:29:50.467890','12','hUEVO',1,'[{\"added\": {}}]',12,23),(11,'2024-11-17 19:48:19.307631','1','Compra de hUEVO - Factura 001',1,'[{\"added\": {}}]',14,23),(12,'2024-11-17 19:48:34.896524','2','Compra de LECHUGA - Factura 001',1,'[{\"added\": {}}]',14,23),(13,'2024-11-17 19:48:49.654546','3','Compra de Pata Muslo - Factura 001',1,'[{\"added\": {}}]',14,23),(14,'2024-11-17 19:49:20.435915','4','Compra de Patitas - Factura 001',1,'[{\"added\": {}}]',14,23),(15,'2024-11-18 19:10:05.902642','12','HUEVO',2,'[{\"changed\": {\"fields\": [\"Titulo\", \"Descripcion\"]}}]',12,23),(16,'2024-11-18 20:39:42.945378','1','Gustavo',1,'[{\"added\": {}}]',16,23),(17,'2024-11-18 20:40:35.562651','2','Soychuk',1,'[{\"added\": {}}]',16,23),(18,'2024-11-18 20:47:02.437417','5','Pollo6 - 10 unidades',1,'[{\"added\": {}}]',14,23),(19,'2024-11-18 22:20:13.317946','1','Pollo6',1,'[{\"added\": {}}]',17,23),(20,'2024-11-18 22:23:52.868348','2','Pollo7',1,'[{\"added\": {}}]',17,23),(21,'2024-11-18 22:24:01.030645','3','Pollo8',1,'[{\"added\": {}}]',17,23),(22,'2024-11-18 22:24:06.850795','4','Pollo9',1,'[{\"added\": {}}]',17,23),(23,'2024-11-18 22:24:11.604186','5','Alitas',1,'[{\"added\": {}}]',17,23),(24,'2024-11-18 22:24:19.055472','6','Pechuga',1,'[{\"added\": {}}]',17,23),(25,'2024-11-18 22:24:25.621085','7','Pata Muslo',1,'[{\"added\": {}}]',17,23),(26,'2024-11-18 22:24:32.137743','8','Pescado',1,'[{\"added\": {}}]',17,23),(27,'2024-11-18 22:24:47.274677','9','Menudo',1,'[{\"added\": {}}]',17,23),(28,'2024-11-18 22:25:14.438717','10','Pollo10',1,'[{\"added\": {}}]',17,23),(29,'2024-11-19 18:37:30.723207','10','Pollo10',3,'',17,23),(30,'2024-11-19 18:37:30.723207','9','Menudo',3,'',17,23),(31,'2024-11-19 18:37:30.723207','8','Pescado',3,'',17,23),(32,'2024-11-19 18:37:30.723207','7','Pata Muslo',3,'',17,23),(33,'2024-11-19 18:37:30.723207','6','Pechuga',3,'',17,23),(34,'2024-11-19 18:37:30.723207','5','Alitas',3,'',17,23),(35,'2024-11-19 18:37:30.723207','4','Pollo9',3,'',17,23),(36,'2024-11-19 18:39:17.277460','11','Carne Ave',1,'[{\"added\": {}}]',17,23),(37,'2024-11-19 18:40:06.580735','12','Carne Ave',1,'[{\"added\": {}}]',17,23),(38,'2024-11-19 18:40:36.376848','13','Carne Vacuno',1,'[{\"added\": {}}]',17,23),(39,'2024-11-19 18:41:06.409244','12','Carne Ave',3,'',17,23),(40,'2024-11-19 18:42:07.836407','14','Alita',1,'[{\"added\": {}}]',17,23),(41,'2024-11-19 18:44:58.335530','1','Huevos',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',17,23),(42,'2024-11-19 18:45:43.441151','2','Aves Derivado',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',17,23),(43,'2024-11-19 18:46:10.271735','3','Carne Derivados',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',17,23),(44,'2024-11-19 18:46:39.128977','14','Milanesa',2,'[{\"changed\": {\"fields\": [\"Nombre\"]}}]',17,23),(45,'2024-11-19 19:30:38.764421','3','Super pollo',1,'[{\"added\": {}}]',16,23),(46,'2024-11-19 19:31:19.228272','4','Vaca Gorda',1,'[{\"added\": {}}]',16,23),(47,'2024-11-19 19:31:56.968219','5','Todo Carne',1,'[{\"added\": {}}]',16,23),(48,'2024-11-19 20:50:33.026114','5','alita - 10 unidades',2,'[{\"changed\": {\"fields\": [\"Producto\", \"Factura compra\"]}}]',14,23),(49,'2024-11-19 20:52:00.571746','6','HUEVO - 50 unidades',1,'[{\"added\": {}}]',14,23),(50,'2024-11-20 21:01:21.198955','1','Nombre del producto - 10 unidades vendidas',3,'',15,23),(51,'2024-11-20 21:01:37.942666','17','Carne',3,'',12,23),(52,'2024-11-20 21:01:37.942666','16','Huevos',3,'',12,23),(53,'2024-11-20 21:01:37.942666','15','Pollo Nº7',3,'',12,23),(54,'2024-11-20 21:01:37.942666','14','Pollo Nº5',3,'',12,23),(55,'2024-11-20 21:01:37.942666','13','Nombre del producto',3,'',12,23),(56,'2024-11-20 21:01:37.943667','12','Nombre del producto',3,'',12,23),(57,'2024-11-20 21:01:37.943667','11','Nombre del producto',3,'',12,23),(58,'2024-11-20 21:01:37.943667','10','Nombre del producto',3,'',12,23),(59,'2024-11-20 21:01:37.943667','9','Nombre del producto',3,'',12,23),(60,'2024-11-20 21:01:37.943667','8','Nombre del producto',3,'',12,23),(61,'2024-11-20 21:01:37.943667','7','Nombre del producto',3,'',12,23),(62,'2024-11-20 21:01:37.943667','6','Nombre del producto',3,'',12,23),(63,'2024-11-20 21:01:37.943667','5','Nombre del producto',3,'',12,23),(64,'2024-11-20 21:01:37.943667','4','Nombre del producto',3,'',12,23),(65,'2024-11-20 21:01:37.943667','3','Nombre del producto',3,'',12,23),(66,'2024-11-20 21:01:37.943667','2','Nombre del producto',3,'',12,23),(67,'2024-11-20 21:01:37.943667','1','Nombre del producto',3,'',12,23),(68,'2024-11-21 11:23:03.274499','20','Nombre del producto',3,'',12,23),(69,'2024-11-21 11:23:03.274499','19','Nombre del producto',3,'',12,23),(70,'2024-11-21 20:11:50.742855','14','Carne - 100 unidades',2,'[]',14,23),(71,'2024-11-21 20:12:20.235261','15','Carne - 100 unidades',1,'[{\"added\": {}}]',14,23),(72,'2024-11-28 10:36:53.411940','1','admin',3,'',4,23),(73,'2024-11-28 10:38:39.761132','4','Bebe',3,'',4,23),(74,'2024-11-28 10:38:52.061091','9','cachita',3,'',4,23),(75,'2024-11-28 10:52:06.554928','7','Dani1',3,'',4,23),(76,'2024-11-28 10:52:06.554928','16','estrella',3,'',4,23),(77,'2024-11-28 10:52:25.808682','6','Gato1',3,'',4,23),(78,'2024-11-28 10:52:25.808682','2','Gustavo',3,'',4,23),(79,'2024-11-28 10:52:25.808682','5','Itati',3,'',4,23),(80,'2024-11-28 10:52:25.808682','11','jachi',3,'',4,23),(81,'2024-11-28 10:52:25.808682','15','luna',3,'',4,23),(82,'2024-11-28 10:53:12.811383','21','luna1',3,'',4,23),(83,'2024-11-28 10:53:12.811383','17','mate',3,'',4,23),(84,'2024-11-28 10:53:12.811383','19','mesa',3,'',4,23),(85,'2024-11-28 10:53:12.811383','10','minina',3,'',4,23),(86,'2024-11-28 10:53:12.811383','3','Negry',3,'',4,23),(87,'2024-11-28 10:53:12.811383','12','Nelson',3,'',4,23),(88,'2024-11-28 10:53:12.811383','8','Perro1',3,'',4,23),(89,'2024-11-28 10:53:12.811383','14','sol',3,'',4,23),(90,'2024-11-28 10:53:12.811383','20','sol1',3,'',4,23),(91,'2024-11-28 10:53:12.812384','18','termo1',3,'',4,23),(92,'2024-11-28 20:42:29.660186','35','Factura 00035 -  ',3,'',18,23),(93,'2024-11-28 20:42:29.660186','34','Factura 00034 -  ',3,'',18,23),(94,'2024-11-28 20:42:29.660186','33','Factura 00033 -  ',3,'',18,23),(95,'2024-11-28 20:42:29.660186','32','Factura 00032 -  ',3,'',18,23),(96,'2024-11-28 20:42:29.660186','31','Factura 00031 -  ',3,'',18,23),(97,'2024-11-28 20:42:29.660186','30','Factura 00030 -  ',3,'',18,23),(98,'2024-11-28 20:42:29.660186','29','Factura 00029 -  ',3,'',18,23),(99,'2024-11-28 20:42:29.660186','28','Factura 00028 -  ',3,'',18,23),(100,'2024-11-28 20:42:29.660186','27','Factura 00027 -  ',3,'',18,23),(101,'2024-11-28 20:42:29.660186','26','Factura 00026 -  ',3,'',18,23),(102,'2024-11-28 20:42:29.660186','25','Factura 00025 -  ',3,'',18,23),(103,'2024-11-28 20:42:29.660186','24','Factura 00024 - popo popo',3,'',18,23),(104,'2024-11-28 20:42:29.660186','23','Factura 00023 - popo popo',3,'',18,23),(105,'2024-11-28 20:42:29.660186','22','Factura 00022 - popo popo',3,'',18,23),(106,'2024-11-28 20:42:29.660186','21','Factura 00021 - popo popo',3,'',18,23),(107,'2024-11-28 20:42:29.660186','20','Factura 00020 - popo popo',3,'',18,23),(108,'2024-11-28 20:42:29.660186','19','Factura 00019 - popo popo',3,'',18,23),(109,'2024-11-28 20:42:29.660186','18','Factura 00018 - popo popo',3,'',18,23),(110,'2024-11-28 20:42:29.660186','17','Factura 00017 - popo popo',3,'',18,23),(111,'2024-11-28 20:42:29.660186','16','Factura 00016 - popo popo',3,'',18,23),(112,'2024-11-28 20:42:29.660186','15','Factura 00015 - popo popo',3,'',18,23),(113,'2024-11-28 20:42:29.660186','14','Factura 00014 - popo popo',3,'',18,23),(114,'2024-11-28 20:42:29.661184','13','Factura 00013 - popo popo',3,'',18,23),(115,'2024-11-28 20:42:29.661184','12','Factura 00012 - popo popo',3,'',18,23),(116,'2024-11-28 20:42:29.661184','11','Factura 00011 - popo popo',3,'',18,23),(117,'2024-11-28 20:42:29.661184','10','Factura 00010 - popo popo',3,'',18,23),(118,'2024-11-28 20:42:29.661184','9','Factura 00009 - Juan Pérez',3,'',18,23),(119,'2024-11-28 20:42:29.661184','8','Factura 00008 - Juan Pérez',3,'',18,23),(120,'2024-11-28 20:42:29.661184','7','Factura 00007 - Juan Pérez',3,'',18,23),(121,'2024-11-28 20:42:29.661184','6','Factura 00006 - Juan Pérez',3,'',18,23),(122,'2024-11-28 20:42:29.661184','5','Factura 00005 - Juan Pérez',3,'',18,23),(123,'2024-11-28 20:42:29.661184','4','Factura 00004 - Juan Pérez',3,'',18,23),(124,'2024-11-28 20:42:29.661184','3','Factura 00003 - Juan Pérez',3,'',18,23),(125,'2024-11-28 20:42:29.661184','2','Factura 00002 - Juan Pérez',3,'',18,23),(126,'2024-11-28 20:42:29.661184','1','Factura 00001 - Juan Pérez',3,'',18,23),(127,'2024-12-04 22:59:30.300428','28','Opinion object (28)',3,'',9,23),(128,'2024-12-04 22:59:30.300428','27','Opinion object (27)',3,'',9,23),(129,'2024-12-04 22:59:30.300428','26','Opinion object (26)',3,'',9,23),(130,'2024-12-04 22:59:30.300428','25','Opinion object (25)',3,'',9,23),(131,'2024-12-04 22:59:30.300428','24','Opinion object (24)',3,'',9,23),(132,'2024-12-04 22:59:30.300428','23','Opinion object (23)',3,'',9,23),(133,'2024-12-04 22:59:30.300428','22','Opinion object (22)',3,'',9,23),(134,'2024-12-04 22:59:30.300428','21','Opinion object (21)',3,'',9,23),(135,'2024-12-04 22:59:30.300428','20','Opinion object (20)',3,'',9,23),(136,'2024-12-04 22:59:30.300428','19','Opinion object (19)',3,'',9,23),(137,'2024-12-04 22:59:30.300428','18','Opinion object (18)',3,'',9,23),(138,'2024-12-04 22:59:30.300428','17','Opinion object (17)',3,'',9,23),(139,'2024-12-04 22:59:30.300428','16','Opinion object (16)',3,'',9,23),(140,'2024-12-04 22:59:30.300428','15','Opinion object (15)',3,'',9,23),(141,'2024-12-04 22:59:30.300428','14','Opinion object (14)',3,'',9,23),(142,'2024-12-04 22:59:30.300428','13','Opinion object (13)',3,'',9,23),(143,'2024-12-04 22:59:30.300428','12','Opinion object (12)',3,'',9,23),(144,'2024-12-04 22:59:30.300428','11','Opinion object (11)',3,'',9,23),(145,'2024-12-04 22:59:30.300428','10','Opinion object (10)',3,'',9,23),(146,'2024-12-04 22:59:30.300428','9','Opinion object (9)',3,'',9,23),(147,'2024-12-04 22:59:30.300428','8','Opinion object (8)',3,'',9,23),(148,'2024-12-04 22:59:30.300428','7','Opinion object (7)',3,'',9,23),(149,'2024-12-04 22:59:30.300428','6','Opinion object (6)',3,'',9,23),(150,'2024-12-04 22:59:30.300428','5','Opinion object (5)',3,'',9,23),(151,'2024-12-04 22:59:30.300428','4','Opinion object (4)',3,'',9,23),(152,'2024-12-08 12:10:02.144100','29','Pernil',2,'[{\"changed\": {\"fields\": [\"Imagen2\", \"Imagen3\", \"Imagen4\", \"Imagen5\"]}}]',12,23),(153,'2024-12-20 14:43:17.073475','40','Compra object (40)',3,'',14,23),(154,'2024-12-20 14:43:17.073475','39','Compra object (39)',3,'',14,23),(155,'2024-12-20 14:43:17.073475','38','Compra object (38)',3,'',14,23),(156,'2024-12-20 14:43:17.073475','37','Compra object (37)',3,'',14,23),(157,'2024-12-20 14:43:17.073475','36','Compra object (36)',3,'',14,23),(158,'2024-12-20 14:43:17.074476','35','Compra object (35)',3,'',14,23),(159,'2024-12-20 14:43:17.074476','34','Compra object (34)',3,'',14,23),(160,'2024-12-20 14:43:17.074476','33','Compra object (33)',3,'',14,23),(161,'2024-12-20 14:43:17.074476','32','Compra object (32)',3,'',14,23),(162,'2024-12-20 14:43:17.074476','31','Compra object (31)',3,'',14,23),(163,'2024-12-20 14:43:17.074476','30','Compra object (30)',3,'',14,23),(164,'2024-12-20 14:43:17.074476','28','Compra object (28)',3,'',14,23),(165,'2024-12-20 14:43:17.074476','27','Compra object (27)',3,'',14,23),(166,'2024-12-20 14:43:17.074476','26','Compra object (26)',3,'',14,23),(167,'2024-12-20 14:43:17.074476','25','Compra object (25)',3,'',14,23),(168,'2024-12-20 14:43:17.074476','24','Compra object (24)',3,'',14,23),(169,'2024-12-20 14:43:17.074476','23','Compra object (23)',3,'',14,23),(170,'2024-12-20 14:43:17.074476','22','Compra object (22)',3,'',14,23),(171,'2024-12-20 14:43:17.074476','21','Compra object (21)',3,'',14,23),(172,'2024-12-20 14:43:17.074476','20','Compra object (20)',3,'',14,23),(173,'2024-12-20 14:43:17.074476','19','Compra object (19)',3,'',14,23),(174,'2024-12-20 14:43:17.074476','18','Compra object (18)',3,'',14,23),(175,'2024-12-20 14:43:17.074476','17','Compra object (17)',3,'',14,23),(176,'2024-12-20 14:43:17.074476','16','Compra object (16)',3,'',14,23),(177,'2024-12-20 14:43:17.074476','15','Compra object (15)',3,'',14,23),(178,'2024-12-20 14:43:17.074476','14','Compra object (14)',3,'',14,23),(179,'2024-12-20 14:43:17.074476','13','Compra object (13)',3,'',14,23),(180,'2024-12-20 14:43:17.074476','12','Compra object (12)',3,'',14,23),(181,'2024-12-20 14:43:17.074476','11','Compra object (11)',3,'',14,23),(182,'2024-12-20 14:43:17.074476','10','Compra object (10)',3,'',14,23),(183,'2024-12-20 14:44:03.454011','64','Factura 00064 - Osiris German Simek',3,'',18,23),(184,'2024-12-20 14:44:03.454011','63','Factura 00063 - Osiris German Simek',3,'',18,23),(185,'2024-12-20 14:44:03.454011','62','Factura 00062 - Osiris German Simek',3,'',18,23),(186,'2024-12-20 14:44:03.454011','61','Factura 00061 - Osiris German Simek',3,'',18,23),(187,'2024-12-20 14:44:03.454011','60','Factura 00060 - Carlito1 Caballero1',3,'',18,23),(188,'2024-12-20 14:44:03.454011','59','Factura 00059 - Osiris German Simek',3,'',18,23),(189,'2024-12-20 14:44:03.454011','58','Factura 00058 - Osiris German Simek',3,'',18,23),(190,'2024-12-20 14:44:03.454011','57','Factura 00057 - Osiris German Simek',3,'',18,23),(191,'2024-12-20 14:44:03.454011','56','Factura 00056 - Carlito1 Caballero1',3,'',18,23),(192,'2024-12-20 14:44:03.454011','55','Factura 00055 - Osiris German Simek',3,'',18,23),(193,'2024-12-20 14:44:03.454011','54','Factura 00054 - Osiris German Simek',3,'',18,23),(194,'2024-12-20 14:44:03.454011','53','Factura 00053 - Mario Alberto Luna',3,'',18,23),(195,'2024-12-20 14:44:03.454011','52','Factura 00052 - Carlito1 Caballero1',3,'',18,23),(196,'2024-12-20 14:44:03.454011','51','Factura 00051 - Carlito1 Caballero1',3,'',18,23),(197,'2024-12-20 14:44:03.454011','50','Factura 00050 - Pololo Pololo',3,'',18,23),(198,'2024-12-20 14:44:03.454011','49','Factura 00049 - Pololo Pololo',3,'',18,23),(199,'2024-12-20 14:44:03.454011','48','Factura 00048 - Pololo Pololo',3,'',18,23),(200,'2024-12-20 14:44:03.454011','47','Factura 00047 - Carlito1 Caballero1',3,'',18,23),(201,'2024-12-20 14:44:03.454011','46','Factura 00046 - Carlito1 Caballero1',3,'',18,23),(202,'2024-12-20 14:44:03.454011','45','Factura 00045 - Osiris German Simek',3,'',18,23),(203,'2024-12-20 14:44:03.454011','44','Factura 00044 - Osiris German Simek',3,'',18,23),(204,'2024-12-20 14:44:03.454011','43','Factura 00043 - Osiris German Simek',3,'',18,23),(205,'2024-12-20 14:44:03.454011','42','Factura 00042 - Osiris German Simek',3,'',18,23),(206,'2024-12-20 14:44:03.454011','41','Factura 00041 - Osiris German Simek',3,'',18,23),(207,'2024-12-20 14:44:03.454011','40','Factura 00040 - Osiris German Simek',3,'',18,23),(208,'2024-12-20 14:44:03.454011','39','Factura 00039 - Osiris German Simek',3,'',18,23),(209,'2024-12-20 14:44:03.454011','38','Factura 00038 - Osiris German Simek',3,'',18,23),(210,'2024-12-20 14:44:03.454011','37','Factura 00037 - Osiris German Simek',3,'',18,23),(211,'2024-12-20 14:44:03.454011','36','Factura 00036 - Pololo Pololo',3,'',18,23),(212,'2024-12-20 14:44:36.287019','35','Teclado',3,'',12,23),(213,'2024-12-20 14:44:36.287019','34','Nokia',3,'',12,23),(214,'2024-12-20 14:44:36.287019','33','dell 456484',3,'',12,23),(215,'2024-12-20 14:44:36.287019','32','pollo 11',3,'',12,23),(216,'2024-12-20 14:44:36.287019','31','Pollo Nº10',3,'',12,23),(217,'2024-12-20 14:44:36.287019','30','Pollo9',3,'',12,23),(218,'2024-12-20 14:44:36.287019','29','Pernil',3,'',12,23),(219,'2024-12-20 14:44:36.287019','28','Chorizo',3,'',12,23),(220,'2024-12-20 14:44:36.287019','26','Carne Costilla',3,'',12,23),(221,'2024-12-20 14:44:36.287019','25','Pollo Nº5',3,'',12,23),(222,'2024-12-20 14:44:36.287019','24','Pollo Nº7',3,'',12,23),(223,'2024-12-20 14:44:36.287019','22','Carne',3,'',12,23),(224,'2024-12-20 14:44:36.287019','21','Huevos',3,'',12,23);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(21,'blog_auth','blogauth'),(20,'blog_auth','perfilusuario'),(11,'blog_auth','profile'),(13,'blog_auth','profileimage'),(17,'CarritoApp','categ_producto'),(14,'CarritoApp','compra'),(18,'CarritoApp','factura'),(19,'CarritoApp','facturaproducto'),(12,'CarritoApp','producto'),(16,'CarritoApp','provedor'),(15,'CarritoApp','venta'),(5,'contenttypes','contenttype'),(7,'libros','categoria'),(8,'libros','libro'),(9,'opiniones','opinion'),(22,'opiniones','producto'),(10,'prueba1','contacto'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=77 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2024-11-03 12:49:34.221870'),(2,'auth','0001_initial','2024-11-03 12:49:35.212779'),(3,'admin','0001_initial','2024-11-03 12:49:35.418894'),(4,'admin','0002_logentry_remove_auto_add','2024-11-03 12:49:35.435370'),(5,'admin','0003_logentry_add_action_flag_choices','2024-11-03 12:49:35.444992'),(6,'contenttypes','0002_remove_content_type_name','2024-11-03 12:49:35.553373'),(7,'auth','0002_alter_permission_name_max_length','2024-11-03 12:49:35.639492'),(8,'auth','0003_alter_user_email_max_length','2024-11-03 12:49:35.673791'),(9,'auth','0004_alter_user_username_opts','2024-11-03 12:49:35.678405'),(10,'auth','0005_alter_user_last_login_null','2024-11-03 12:49:35.756795'),(11,'auth','0006_require_contenttypes_0002','2024-11-03 12:49:35.756795'),(12,'auth','0007_alter_validators_add_error_messages','2024-11-03 12:49:35.772419'),(13,'auth','0008_alter_user_username_max_length','2024-11-03 12:49:35.857837'),(14,'auth','0009_alter_user_last_name_max_length','2024-11-03 12:49:35.957777'),(15,'auth','0010_alter_group_name_max_length','2024-11-03 12:49:35.980020'),(16,'auth','0011_update_proxy_permissions','2024-11-03 12:49:35.993170'),(17,'auth','0012_alter_user_first_name_max_length','2024-11-03 12:49:36.072101'),(19,'blog_auth','0002_remove_profile_imagen_profile_image','2024-11-03 12:49:36.241184'),(20,'blog_auth','0003_delete_profile','2024-11-03 12:49:36.256807'),(21,'libros','0001_initial','2024-11-03 12:49:36.389668'),(22,'libros','0002_alter_libro_imagen','2024-11-03 12:49:36.405290'),(23,'opiniones','0001_initial','2024-11-03 12:49:36.598265'),(24,'prueba1','0001_initial','2024-11-03 12:49:36.628530'),(25,'sessions','0001_initial','2024-11-03 12:49:36.678054'),(26,'blog_auth','0004_initial','2024-11-07 22:57:10.388854'),(27,'blog_auth','0001_initial','2024-11-07 23:44:12.177654'),(28,'CarritoApp','0001_initial','2024-11-13 20:30:01.138549'),(29,'CarritoApp','0002_alter_producto_nombre','2024-11-13 20:30:01.203844'),(30,'blog_auth','0002_profileimage','2024-11-13 20:30:01.430209'),(31,'CarritoApp','0003_remove_producto_nombre_producto_descripcion_and_more','2024-11-14 20:27:13.452368'),(32,'CarritoApp','0004_remove_producto_categoria_remove_producto_precio_and_more','2024-11-15 22:11:16.694107'),(33,'CarritoApp','0005_producto_cantidad_producto_precio','2024-11-15 22:11:16.812767'),(34,'CarritoApp','0006_alter_producto_precio','2024-11-16 12:44:39.396145'),(35,'CarritoApp','0007_remove_producto_fecha_agregado_producto_fecha','2024-11-16 21:07:50.785164'),(36,'CarritoApp','0008_producto_factura_compra_producto_precio_compra','2024-11-17 11:01:39.706380'),(37,'CarritoApp','0009_compra_venta','2024-11-17 11:59:53.437225'),(38,'CarritoApp','0010_alter_compra_factura_compra','2024-11-17 19:09:51.844118'),(39,'CarritoApp','0011_remove_producto_cantidad_and_more','2024-11-17 19:42:39.565032'),(40,'CarritoApp','0012_alter_producto_autor_alter_producto_categoria_id_and_more','2024-11-18 19:07:13.648423'),(41,'CarritoApp','0002_reorganize_fields','2024-11-18 19:45:21.114025'),(42,'CarritoApp','0003_provedor_alter_venta_factura_venta_compra_provedor','2024-11-18 20:35:16.167151'),(43,'CarritoApp','0004_categ_producto','2024-11-18 22:15:57.555666'),(44,'CarritoApp','0005_remove_producto_categoria_id_producto_categoria_and_more','2024-11-19 21:12:11.327171'),(45,'CarritoApp','0006_alter_producto_categoria','2024-11-19 22:36:36.316825'),(46,'CarritoApp','0007_remove_producto_autor','2024-11-20 19:14:24.552659'),(47,'CarritoApp','0008_remove_producto_titulo_producto_nombre_producto','2024-11-20 19:47:47.590663'),(48,'CarritoApp','0009_compra_stock_alter_compra_fecha_compra_and_more','2024-11-21 20:06:46.932875'),(49,'CarritoApp','0010_producto_stock_alter_compra_cantidad_and_more','2024-11-21 21:42:14.935555'),(50,'CarritoApp','0011_remove_compra_stock_alter_compra_factura_compra','2024-11-21 21:53:50.461888'),(51,'CarritoApp','0012_rename_fecha_venta_venta_fecha_and_more','2024-11-21 22:55:12.598855'),(52,'CarritoApp','0013_venta_usuario_alter_producto_categoria_and_more','2024-11-22 19:42:49.117632'),(53,'CarritoApp','0014_alter_venta_cantidad_alter_venta_fecha_and_more','2024-11-22 22:12:22.655012'),(54,'CarritoApp','0015_producto_precio','2024-11-23 14:04:37.639125'),(55,'CarritoApp','0016_factura','2024-11-24 19:51:40.458646'),(56,'CarritoApp','0017_factura_metodo_pago_alter_factura_apellido_cliente_and_more','2024-11-25 01:23:53.716258'),(57,'CarritoApp','0018_alter_factura_apellido_cliente_alter_factura_fecha_and_more','2024-11-25 19:39:41.288461'),(58,'CarritoApp','0019_remove_factura_productos_factura_detalle_productos','2024-11-25 20:13:36.032236'),(59,'CarritoApp','0020_alter_factura_fecha','2024-11-26 19:04:12.476329'),(60,'blog_auth','0003_rename_imagen_profile_image_alter_profile_user','2024-11-27 13:31:16.912972'),(61,'blog_auth','0004_remove_profile_image_profile_imagen_and_more','2024-11-27 18:02:18.077589'),(62,'blog_auth','0002_delete_profileimage','2024-11-28 11:36:27.977575'),(63,'CarritoApp','0021_factura_imagen_factura','2024-11-28 21:16:19.849355'),(64,'auth','0013_user_dni_usuario_user_domicilio_usuario_and_more','2024-11-30 12:55:59.600483'),(65,'auth','0014_remove_user_dni_usuario_and_more','2024-11-30 22:33:04.580350'),(66,'auth','0015_user_dni_usuario_user_domicilio_usuario_and_more','2024-11-30 22:33:04.881330'),(67,'auth','0016_rename_dni_usuario_user_dni_usuario_and_more','2024-12-01 12:42:54.527552'),(68,'blog_auth','0003_blogauth','2024-12-01 12:53:23.956762'),(69,'CarritoApp','0022_alter_categ_producto_nombre_alter_producto_categoria','2024-12-01 20:30:55.843488'),(70,'blog_auth','0004_delete_blogauth','2024-12-01 20:30:55.881581'),(71,'opiniones','0002_alter_opinion_options_remove_opinion_libro_and_more','2024-12-02 21:55:39.308288'),(72,'opiniones','0003_alter_opinion_producto_alter_opinion_usuario','2024-12-03 15:29:21.003057'),(73,'opiniones','0004_producto_alter_opinion_usuario_alter_opinion_table_and_more','2024-12-04 19:50:18.238413'),(74,'opiniones','0005_alter_opinion_producto_alter_opinion_usuario_and_more','2024-12-04 21:46:17.263669'),(75,'CarritoApp','0023_producto_imagen2_producto_imagen3_producto_imagen4_and_more','2024-12-08 12:08:36.307476'),(76,'opiniones','0006_alter_opinion_options_opinion_administrador_and_more','2024-12-22 13:30:28.342102');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('7153ile20k1smpiw513qdlns0my004sn','e30:1t9li4:C9dPMM8sgEdVm19drM7DW9CVVvU2hhvBavXgWrs1s0k','2024-11-23 13:41:04.978445'),('7yo54d5kq2jc0wdzfs4ivlxn1nik6y96','.eJxVjDkOwjAUBe_iGlnY8UpJnzNYf3FwANlSnFSIu0OkFNC-mXkvkWBbS9p6XtLM4iKUOP1uCPTIdQd8h3prklpdlxnlrsiDdjk2zs_r4f4dFOjlWyMNhsHYHL1B5hAcIE8AGnLUE6AanKWgB-sCEYMNFpU_I3lNMTtlxPsDFDc4vg:1t8P89:VXRq3hPPXK2S5pmQlHAeuo3iUrtfahYJXYJ8A_zmzVc','2024-11-19 19:22:21.867777'),('ayakvjhlnqxw2rb900maknag9h8d3ww4','e30:1tGI7A:-7SzqbsQIMP9kVJxamLrOx7wtAR9Lyjm4nsZBsfQnj4','2024-12-11 13:29:56.804568'),('dorwn6xiy92kcuaeup29qnt95w038pbd','e30:1t9lhA:_-C2siX8_HEKINu95yL8OA6d2u-7uo4OUGZnUnzNqU0','2024-11-23 13:40:08.028927'),('dp0f7sesbn9hgjmca03uw2s6y100nl0v','e30:1tGMMD:zo_ZHUlpdCN5xmGaijtXnpB42i25IyLvVLkhBldK_rg','2024-12-11 18:01:45.027107'),('esjmrnxuvp8ow3n3okaag95m2zpqdatz','.eJxVjEEOwiAQRe_C2hDKgIBL9z0DmYFBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERIE6_G2F6cNtBvmO7zTLNbV0mkrsiD9rlOGd-Xg_376Bir9964OSs5WK91hDABY9UQEMJBDBYFYw22SQyih0CcS6QgJXywP7smcT7A8_qN6o:1t8n0h:idvsLq8GFbmpHQnIfORkokvKY0E7h8p1nQnvFIEIobo','2024-11-20 20:52:15.029350'),('i00wewn7njb228rp8dxk5lk945d92fv2','.eJxVjEEOgjAQRe_StWmmQ6mMS_ecoZlOB4saSCisjHdXEha6_e-9_zKRt7XEreoSx2wuBtGcfsfE8tBpJ_nO0222Mk_rMia7K_ag1fZz1uf1cP8OCtfyrUU9OGxyBy4MEFA8kQINqI4YnSgH6FJgr9wkojZ0Akmzk4EAsT2b9wf4ODfK:1t9lqu:dRfvmKq20pdZlcLf6UtyFR7L1h4fhHJRBK5LDEziWrQ','2024-11-23 13:50:12.375421'),('jee6y283vv837xmcsyxaednfoilzg5lf','.eJxVjDkOwjAUBe_iGln5dvBCSZ8zWH9xcAA5UpxUiLtDpBTQvpl5L5VwW0vaWl7SJOqijFWn35GQH7nuRO5Yb7Pmua7LRHpX9EGbHmbJz-vh_h0UbOVbWxfYUbYmRCeYPYW-69k7wwTgPYzC7EAgGrYQIjJRtOeOUYRGsE69PwceOF8:1tEoUX:EjYvh-FDQSCIxbNY4Q08yrm1FjCVC8MpPrRJdT-22QQ','2024-12-07 11:39:57.699282'),('jfelydridchmbhw6a9bd3981zsvkxjux','e30:1tGI7R:JmazIMGQYI4BlDzJqZGCWDojTnq3hya-2pxf3g4cFv0','2024-12-11 13:30:13.727769'),('jrn0n32xerc95rtssd76ya6erf0e22b8','e30:1tGJj4:aqLizF1TvlyOCvMdSG4DAoP76omgLtausm5lPlcJF1U','2024-12-11 15:13:10.010339'),('pbktd1qu3wxyr7atb17x3namiqfdsww8','.eJxVjDsOwjAQBe_iGlm2499S0nMGa-3d4ABypDipEHeHSCmgfTPzXiLhtta0dV7SROIsjBOn3zFjeXDbCd2x3WZZ5rYuU5a7Ig_a5XUmfl4O9--gYq_fWrOmEkwOCkmHzJ7saAAJOA8OHEMZrTLMEI320RoPsTBZhcgKwkDi_QEgcjh1:1tPpLV:HTqXgDtHNu__zhYDfMHfGK3ERVSUIRhvSyvZGN_H4YY','2025-01-06 20:48:09.400755'),('se1hhu1gm8sftpenr24zjs41130o42lh','.eJxVjMsOwiAQRf-FtSFQ6IAu3fsNZJiZStVA0sfK-O-2SRe6Pefc-1YJ16WkdZYpjawuyqnTL8tIT6m74AfWe9PU6jKNWe-JPuysb43ldT3av4OCc9nWAXJ2g8fQ9YYZDUVytkNBA-jONrADuyHPQEJhsNKHLMTeRhCAPqrPF_HfOC4:1t90He:DE__NLocnpYuQCPmdpTeTh8V9UlNR9XMymt0mhWW5yI','2024-11-21 11:02:38.864030'),('xdwiwj1eb7sv37ulvcsj6tjcs51yxovv','e30:1tGbrG:nAyVBaOejKbhc0es0U-IgYuUJd_aymWiNcXQ7u5-ia0','2024-12-12 10:34:50.709403'),('y9yde5ivfqeg5sed3thelmortadjqbxg','e30:1tGMJ3:9gPPF-xZqlJabuttYth_7vimbfHYLdXJo93X13yhmjg','2024-12-11 17:58:29.527489');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros_categoria`
--

DROP TABLE IF EXISTS `libros_categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros_categoria` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros_categoria`
--

LOCK TABLES `libros_categoria` WRITE;
/*!40000 ALTER TABLE `libros_categoria` DISABLE KEYS */;
INSERT INTO `libros_categoria` VALUES (1,'Pollo6'),(2,'Pollo7'),(3,'Alita'),(4,'Muslo'),(5,'Pechuga'),(6,'Patas'),(7,'Pollo20'),(8,'Pollo30');
/*!40000 ALTER TABLE `libros_categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `libros_libro`
--

DROP TABLE IF EXISTS `libros_libro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `libros_libro` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(20) NOT NULL,
  `autor` varchar(20) NOT NULL,
  `descripcion` longtext NOT NULL,
  `fecha_agregado` datetime(6) NOT NULL,
  `imagen` varchar(100) DEFAULT NULL,
  `categoria_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `libros_libro_categoria_id_2d9d7810_fk_libros_categoria_id` (`categoria_id`),
  CONSTRAINT `libros_libro_categoria_id_2d9d7810_fk_libros_categoria_id` FOREIGN KEY (`categoria_id`) REFERENCES `libros_categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `libros_libro`
--

LOCK TABLES `libros_libro` WRITE;
/*!40000 ALTER TABLE `libros_libro` DISABLE KEYS */;
INSERT INTO `libros_libro` VALUES (1,'La Caja','Seichu','es muy muy bueno','2024-11-03 20:16:29.584470','libros/pollo1.jfif',1),(2,'La Caja','Seichu','es mejor','2024-11-03 20:16:55.764921','libros/alitas1.jfif',3),(3,'La Caja','Seichu','mas mejor','2024-11-03 20:17:22.516043','libros/patamulo1.jfif',4),(4,'La Caja','Seichu','compra esta en oferta','2024-11-03 20:18:03.817361','libros/Pechuga1.jfif',5),(5,'X unidad','Seichu','Se vende en cantidad de a 10','2024-11-06 20:01:45.903565','libros/patas1.jfif',7),(6,'X unidad','Seichu','fasdfsdf','2024-11-06 20:41:16.028385','libros/patas1_ultmFcY.jfif',8),(7,'La Caja','Soychu','Oferta hoy 200%','2024-11-13 22:04:36.127499','libros/toy.jfif',1),(8,'Celulares','Popo','Celulares de Aigon','2024-11-18 13:15:39.454424','libros/Angular.png',1);
/*!40000 ALTER TABLE `libros_libro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opiniones_opinion`
--

DROP TABLE IF EXISTS `opiniones_opinion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opiniones_opinion` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `texto` longtext NOT NULL,
  `fecha` datetime(6) NOT NULL,
  `usuario_id` varchar(255) NOT NULL,
  `producto_id` bigint NOT NULL,
  `administrador_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `opiniones_opinion_producto_id_cb16a849_fk_CarritoApp_producto_id` (`producto_id`),
  KEY `opiniones_opinion_administrador_id_afc9688c_fk_auth_user_id` (`administrador_id`),
  CONSTRAINT `opiniones_opinion_administrador_id_afc9688c_fk_auth_user_id` FOREIGN KEY (`administrador_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opiniones_opinion`
--

LOCK TABLES `opiniones_opinion` WRITE;
/*!40000 ALTER TABLE `opiniones_opinion` DISABLE KEYS */;
INSERT INTO `opiniones_opinion` VALUES (87,'                                                    esta echo con el pan de rialdo...??? Si... con el mejor pan... ok...ok\r\n                        si\nRespuesta del Administrador (Osiris German Simek): gUSTAVO CABALLERO','2024-12-22 12:49:00.096406','28',36,23),(88,'                        che.... ponele carne.....ok\r\n                    ','2024-12-22 13:48:39.517852','28',36,NULL),(89,'                                                che.... ponele carne.....ok... si\r\n                    \r\n                    ','2024-12-22 19:44:57.589690','28',36,23),(90,'                                                                            esta echo con el pan de rialdo...??? Si... con el mejor pan... ok...ok... si mas te vale...\r\n                        si\r\n                    ','2024-12-22 19:45:58.622956','28',36,23),(91,'                                                                        dale... si le vamos a poner\r\n                    \r\n                    \r\n                    ','2024-12-22 19:46:27.994274','28',36,23),(92,'Usuario (Gustavo Gustavo): ok\r\n                    \r\n                    \r\n                    \nRespuesta del Administrador (Osiris German Simek): okhkfdshafkdshalkfh','2024-12-22 19:47:18.223693','28',36,23),(94,'Usuario (Pololo Pololo): es de chnacho\nRespuesta del Administrador (Osiris German Simek): es de chnacho---88888','2024-12-22 19:49:49.542302','25',37,NULL),(95,'aceme precio','2024-12-22 19:50:02.414870','25',37,NULL),(96,'capo...  dale metele carne','2024-12-22 19:50:17.996380','25',37,NULL),(97,'                        capo...  dale metele carne... Ok si le vamos a poner pero sale mas caro\r\n                    ','2024-12-22 19:51:22.204415','25',37,23),(98,'ok.si te voy hacer precio\r\n                    ','2024-12-22 19:55:33.146801','25',37,23),(99,'Usuario (Pololo Pololo): Usuario (Pololo Pololo):                         capo...  dale metele carne... ko si9999\r\n                    \nRespuesta del Administrador (Osiris German Simek): capo...  dale metele carne... ko si9999... si...999\nRespuesta del Administrador (Osiris German Simek): Usuario (Pololo Pololo):                         capo...  dale metele carne... ko si9999\r\n                    \r\nRespuesta del Administrador (Osiris German Simek): capo...  dale metele carne... ko si9999... si...999 999999999','2024-12-22 19:56:45.099987','25',37,23),(101,'Usuario (Carlito1 Caballero1): Todo Bien\nRespuesta del Administrador (Osiris German Simek): Todo Bien99999999999999999','2024-12-22 20:06:33.949655','24',38,NULL),(102,'Usuario (Carlito1 Caballero1): Estan cocinada???\n\n<strong>Respuesta del Administrador (Osiris German Simek):</strong>                         Estan cocinada???... si\r\n                    \nRespuesta del Administrador (Osiris German Simek): sdfsdfsafsfds                 Estan cocinada???\r\n\r\n<strong>Respuesta del Administrador (Osiris German Simek):</strong>                         Estan cocinada???... si','2024-12-22 20:06:44.717980','24',38,23),(103,'Usuario (Carlito1 Caballero1): Usuario (Carlito1 Caballero1): Usuario (Carlito1 Caballero1): Usuario (Carlito1 Caballero1): Usuario (Carlito1 Caballero1): Usuario (Carlito1 Caballero1): tiene hueso???\n\n<strong>Respuesta del Administrador (Osiris German Simek):</strong>                         tiene hueso??? 9999\r\n                    \nRespuesta del Administrador (Osiris German Simek): no se que pasas              tiene hueso???\r\n\r\n<strong>Respuesta del Administrador (Osiris German Simek):</strong>                         tiene hueso??? 9999\nRespuesta del Administrador (Osiris German Simek): 999999\nRespuesta del Administrador (Osiris German Simek): 00000000000000000000000000\nRespuesta del Administrador (Osiris German Simek): si...88888                        Usuario (Carlito1 Caballero1): Usuario (Carlito1 ...Caballero1): Usuario (Carlito1 Caballero1): tiene hueso???\r\n\r\n<strong>Respuesta del Administrador (Osiris German Simek):</strong>                         tiene hueso??? 9999\r\n                    \r\nRespuesta del Administrador (Osiris German Simek): no se que pasas              tiene hueso???\r\n\r\n<strong>Respuesta del Administrador (Osiris German Simek):</strong>                         tiene hueso??? 9999\r\nRespuesta del Administrador (Osiris German Simek): 999999\r\nRespuesta del Administrador (Osiris German Simek): 00000000000000000000000000\nRespuesta del Administrador (Osiris German Simek): 3333333333                      Usuario (Carlito1 Caballero1): Usuario (Carlito1 Caballero1): Usuario (Carlito1 Caballero1): Usuario (Carlito1 Caballero1): tiene hueso???\r\n\r\n<strong>Respuesta del Administrador (Osiris German Simek):</strong>                         tiene hueso??? 9999\r\n                    \r\nRespuesta del Administrador (Osiris German Simek): no se que pasas              tiene hueso???\r\n\r\n<strong>Respuesta del Administrador (Osiris German Simek):</strong>                         tiene hueso??? 9999\r\nRespuesta del Administrador (Osiris German Simek): 999999\r\nRespuesta del Administrador (Osiris German Simek): 00000000000000000000000000\r\nRespuesta del Administrador (Osiris German Simek): si...88888                        Usuario (Carlito1 Caballero1): Usuario (Carlito1 ...Caballero1): Usuario (Carlito1 Caballero1): tiene hueso???\r\n\r\n<strong>Respuesta del Administrador (Osiris German Simek):</strong>                         tiene hueso??? 9999\r\n                    \r\nRespuesta del Administrador (Osiris German Simek): no se que pasas              tiene hueso???\r\n\r\n<strong>Respuesta del Administrador (Osiris German Simek):</strong>                         tiene hueso??? 9999\r\nRespuesta del Administrador (Osiris German Simek): 999999\r\nRespuesta del Administrador (Osiris German Simek): 00000000000000000000000000\nRespuesta del Administrador (Osiris German Simek): safgjsadgfsjgf','2024-12-22 20:06:57.949845','24',38,23),(111,'Usuario (Gustavo Gustavo): fdjsflkdsjflkdsjalf\nRespuesta del Administrador (Osiris German Simek): 99999992424225','2024-12-22 21:21:45.100075','28',37,NULL),(112,'Usuario (Gustavo Gustavo): 9999999999999999999999\nRespuesta del Administrador (Osiris German Simek): 99999999999999999999998888888888888888','2024-12-22 21:21:51.666110','28',37,NULL),(113,'Usuario (Carlito1 Caballero1): hola\nRespuesta del Administrador (Osiris German Simek): hola-fspdifsapdif\nRespuesta del Administrador (Osiris German Simek): 00000000000','2024-12-23 01:55:06.131315','24',39,23),(114,'Usuario (Carlito1 Caballero1): son grande\nRespuesta del Administrador (Osiris German Simek): son grande-asdfgsdjhgfj\nRespuesta del Administrador (Osiris German Simek): 999999','2024-12-23 01:55:18.514373','24',39,23),(115,'Usuario (Gustavo Gustavo): Hola\nRespuesta del Administrador (Osiris German Simek): dlkfjsdlfkjsal','2024-12-23 01:58:11.712883','28',40,NULL),(118,'Che.... cuando vas a traer--- pacu','2024-12-23 20:16:42.872834','23',49,NULL),(119,'y a que precios','2024-12-23 20:16:53.329245','23',49,NULL);
/*!40000 ALTER TABLE `opiniones_opinion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prueba1_contacto`
--

DROP TABLE IF EXISTS `prueba1_contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prueba1_contacto` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(254) NOT NULL,
  `consulta` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prueba1_contacto`
--

LOCK TABLES `prueba1_contacto` WRITE;
/*!40000 ALTER TABLE `prueba1_contacto` DISABLE KEYS */;
/*!40000 ALTER TABLE `prueba1_contacto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-25 21:28:15
