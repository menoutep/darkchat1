-- MySQL dump 10.13  Distrib 8.0.27, for Linux (x86_64)
--
-- Host: localhost    Database: studyBud
-- ------------------------------------------------------
-- Server version	8.0.27

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add room',7,'add_room'),(26,'Can change room',7,'change_room'),(27,'Can delete room',7,'delete_room'),(28,'Can view room',7,'view_room'),(29,'Can add message',8,'add_message'),(30,'Can change message',8,'change_message'),(31,'Can delete message',8,'delete_message'),(32,'Can view message',8,'view_message'),(33,'Can add topic',9,'add_topic'),(34,'Can change topic',9,'change_topic'),(35,'Can delete topic',9,'delete_topic'),(36,'Can view topic',9,'view_topic'),(37,'Can add conversation',10,'add_conversation'),(38,'Can change conversation',10,'change_conversation'),(39,'Can delete conversation',10,'delete_conversation'),(40,'Can view conversation',10,'view_conversation'),(41,'Can add messsage conversation',10,'add_messsageconversation'),(42,'Can change messsage conversation',10,'change_messsageconversation'),(43,'Can delete messsage conversation',10,'delete_messsageconversation'),(44,'Can view messsage conversation',10,'view_messsageconversation'),(45,'Can add conversation',11,'add_conversation'),(46,'Can change conversation',11,'change_conversation'),(47,'Can delete conversation',11,'delete_conversation'),(48,'Can view conversation',11,'view_conversation'),(49,'Can add message conversation',10,'add_messageconversation'),(50,'Can change message conversation',10,'change_messageconversation'),(51,'Can delete message conversation',10,'delete_messageconversation'),(52,'Can view message conversation',10,'view_messageconversation');
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
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$320000$7zTlIht4ttAzF506XGV7mr$wrDbUJFXvvcBzbHdhgtfBEFOwR3c6F8yyfs00ABjm6A=','2022-03-28 12:45:07.542630',1,'admin','','','zabreseverin@gmail.com',1,1,'2022-02-07 17:35:28.056648'),(2,'pbkdf2_sha256$320000$AnKva7eVZMqdMgqzNHSokL$N04PWvMkjw7JdqCAk4MNgscCGyi/solt72psYOcIPgk=','2022-03-04 12:12:21.318672',0,'kimi','','','',0,1,'2022-02-07 19:19:04.240693'),(3,'pbkdf2_sha256$320000$6kZ14l9KLMgCl0FcGDXuIQ$ftn6ewo7VDdK+4vkuKoOsmqU4ZsD/efOgs5qQEJW6cI=','2022-03-04 09:44:08.859169',0,'karim','','','',0,1,'2022-02-07 19:19:32.665281'),(4,'pbkdf2_sha256$320000$pSpQOSXiDIs1YDMqoGLAMy$o7mSsylWPyG+alZznYNG2dYMEyrcTjIWNVgfPMscvgw=','2022-02-09 22:16:59.690178',0,'menoutep','','','',0,1,'2022-02-09 22:10:28.483925'),(5,'pbkdf2_sha256$320000$n2GtLKYLndm87Kqldqpw3I$sr+X5gwnD6tphNxSrAUO+w1xk8VqmP9r11AHnbjx09c=','2022-03-04 09:41:47.683304',0,'joza','','','josephzabre@gmail.com',0,1,'2022-02-10 05:20:43.290442'),(6,'pbkdf2_sha256$320000$BcSx4WLfKrQD4aYfDFTRCy$9qbKGGvfDn4YMk96fCzocBA+TZBuOA2v9/3GmYFW8LE=',NULL,0,'salomon','','','test@test.co',0,1,'2022-02-16 10:58:04.393767'),(7,'pbkdf2_sha256$320000$GOirJiK8PknK9hvIQk1SuE$XIzrCVrra8DgKdLoth1zTUPRbo5osIclor7VBvgJcxE=','2022-02-25 07:27:06.445849',0,'baba','','','baba@gmail.com',0,1,'2022-02-25 07:26:54.145790'),(8,'pbkdf2_sha256$320000$yjMbXuUj5DfEduTGlGkxwz$QL1Lu8DUJ4jZJja9eWKV3k701SuH8P8aDusLKK+QLp0=',NULL,0,'boloo','','','nnnn@gmail.com',0,1,'2022-02-26 09:47:20.387739'),(9,'pbkdf2_sha256$320000$0c2zeOnaCHkqtnbxe38WQ5$FwleFMptd8fHGnxU8bhNeCqZC8qB2D68I2w4kISogfs=',NULL,0,'babalao','','','babaj@jjj.vom',0,1,'2022-02-26 11:57:17.734764'),(10,'pbkdf2_sha256$320000$5N6WxMi0EGzzxEjQO3OibV$B+KzEYKCVwO/qLXJRNVpfmHkanRyqOWEg0DdkO5YJhg=',NULL,0,'kaloi','','','piop@oip.com',0,1,'2022-02-26 11:59:18.213532'),(11,'pbkdf2_sha256$320000$uqlHQy0V6m6tQwEK8CeVAO$PFgLn6SFTlLSEcQU39dQN/50nBZ12LgT4IQOT2evHJI=','2022-03-04 09:56:25.076628',0,'victoria','','','victoria@gmail.com',0,1,'2022-03-04 09:47:12.215322'),(12,'pbkdf2_sha256$320000$sXSdyNeunhAwg9duK4HOwb$QyfiBtcvmczT2IpvHrPP87eMGs1sn8lZIaztWJFHUlA=','2022-03-04 12:11:22.278197',0,'solomon','','','salomon@gmail.com',0,1,'2022-03-04 12:11:09.854141');
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
-- Table structure for table `base_conversation`
--

DROP TABLE IF EXISTS `base_conversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_conversation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `updated` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `expediteur_id` int NOT NULL,
  `receiver_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_conversation_expediteur_id_183af79f_fk_auth_user_id` (`expediteur_id`),
  KEY `base_conversation_receiver_id_b3dc6abb_fk_auth_user_id` (`receiver_id`),
  CONSTRAINT `base_conversation_expediteur_id_183af79f_fk_auth_user_id` FOREIGN KEY (`expediteur_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `base_conversation_receiver_id_b3dc6abb_fk_auth_user_id` FOREIGN KEY (`receiver_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_conversation`
--

LOCK TABLES `base_conversation` WRITE;
/*!40000 ALTER TABLE `base_conversation` DISABLE KEYS */;
INSERT INTO `base_conversation` VALUES (3,'2022-02-28 14:44:20.633717','2022-02-28 14:44:20.633736',1,4),(7,'2022-03-01 09:50:18.214635','2022-03-01 09:50:18.214663',1,7),(10,'2022-03-01 16:40:10.115031','2022-03-01 16:40:10.115082',2,5),(33,'2022-03-01 21:56:52.964166','2022-03-01 21:56:52.964208',1,5),(35,'2022-03-02 12:41:07.382577','2022-03-02 12:41:07.382601',5,3),(36,'2022-03-04 09:36:50.767506','2022-03-04 09:36:50.767528',1,3),(37,'2022-03-04 09:49:53.679751','2022-03-04 09:49:53.679786',11,2),(38,'2022-03-04 12:11:48.662892','2022-03-04 12:11:48.662912',12,2);
/*!40000 ALTER TABLE `base_conversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_message`
--

DROP TABLE IF EXISTS `base_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_message` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `updated` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `room_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_message_room_id_6b04a640_fk_base_room_id` (`room_id`),
  KEY `base_message_user_id_46a57e37_fk_auth_user_id` (`user_id`),
  CONSTRAINT `base_message_room_id_6b04a640_fk_base_room_id` FOREIGN KEY (`room_id`) REFERENCES `base_room` (`id`),
  CONSTRAINT `base_message_user_id_46a57e37_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_message`
--

LOCK TABLES `base_message` WRITE;
/*!40000 ALTER TABLE `base_message` DISABLE KEYS */;
INSERT INTO `base_message` VALUES (1,'hello','2022-02-07 19:22:30.965446','2022-02-07 19:22:30.965474',2,2),(2,'hi','2022-02-10 08:34:37.131149','2022-02-10 08:34:37.131170',7,1),(3,'hi','2022-02-10 08:34:59.389047','2022-02-10 08:34:59.389095',7,1),(10,'hi i\'m kimi','2022-02-12 13:34:33.505912','2022-02-12 13:34:33.505936',7,2),(16,'hhhhhhhhh','2022-02-24 10:56:00.034477','2022-02-24 10:56:00.034499',9,1),(18,'hi','2022-02-28 16:08:52.013505','2022-02-28 16:08:52.013553',18,5),(19,'fils','2022-02-28 16:09:09.451440','2022-02-28 16:09:09.451492',18,5),(20,'hi','2022-03-04 12:14:13.338428','2022-03-04 12:14:13.338456',21,2),(21,'hi','2022-03-08 13:19:08.410606','2022-03-08 13:19:08.410632',21,1);
/*!40000 ALTER TABLE `base_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_messageconversation`
--

DROP TABLE IF EXISTS `base_messageconversation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_messageconversation` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `body` longtext NOT NULL,
  `created` datetime(6) NOT NULL,
  `conversation_id` bigint NOT NULL,
  `sender_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `base_messsageconvers_conversation_id_3f761498_fk_base_conv` (`conversation_id`),
  KEY `base_messageconversation_sender_id_639ae178_fk_auth_user_id` (`sender_id`),
  CONSTRAINT `base_messageconversation_sender_id_639ae178_fk_auth_user_id` FOREIGN KEY (`sender_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `base_messsageconvers_conversation_id_3f761498_fk_base_conv` FOREIGN KEY (`conversation_id`) REFERENCES `base_conversation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_messageconversation`
--

LOCK TABLES `base_messageconversation` WRITE;
/*!40000 ALTER TABLE `base_messageconversation` DISABLE KEYS */;
INSERT INTO `base_messageconversation` VALUES (4,'hi ','2022-03-04 09:41:34.218452',35,3),(5,'hi','2022-03-04 09:41:55.405667',33,5),(6,'hi','2022-03-04 09:44:18.955002',35,3),(7,'hi','2022-03-04 09:49:59.392648',37,11),(8,'hi','2022-03-04 09:55:16.001366',37,2),(9,'bonjour victoria comment vas tu?','2022-03-04 09:55:39.830119',37,2),(10,'bien et toi','2022-03-04 09:56:56.300962',37,11),(11,'hi kimi i\'m Solomon how are you','2022-03-04 12:12:04.353485',38,12);
/*!40000 ALTER TABLE `base_messageconversation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_room`
--

DROP TABLE IF EXISTS `base_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_room` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `description` longtext,
  `updated` datetime(6) NOT NULL,
  `created` datetime(6) NOT NULL,
  `host_id` int DEFAULT NULL,
  `topic_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `base_room_host_id_6c009082_fk_auth_user_id` (`host_id`),
  KEY `base_room_topic_id_42a6b2b8_fk_base_topic_id` (`topic_id`),
  CONSTRAINT `base_room_host_id_6c009082_fk_auth_user_id` FOREIGN KEY (`host_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `base_room_topic_id_42a6b2b8_fk_base_topic_id` FOREIGN KEY (`topic_id`) REFERENCES `base_topic` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_room`
--

LOCK TABLES `base_room` WRITE;
/*!40000 ALTER TABLE `base_room` DISABLE KEYS */;
INSERT INTO `base_room` VALUES (2,'only web developer','welcome in the chat of web develloper. here you can tchat with another web develloper for learn more new skills','2022-02-07 19:22:06.941204','2022-02-07 19:22:06.941224',3,1),(4,'test','test','2022-02-09 11:13:50.435649','2022-02-09 11:13:50.435681',1,1),(5,'ror','tootot','2022-02-09 11:16:41.409987','2022-02-09 11:16:41.410010',2,2),(6,'nouveau salon','tuer pour tuer bogo money from la to abidjan','2022-02-10 07:33:43.915659','2022-02-10 07:33:43.915705',1,1),(7,'nouveau salon','tuer pour tuer bogo money from la to abidjan','2022-02-10 10:08:11.869186','2022-02-10 07:36:01.586022',1,1),(9,'more kishta','sa rentre','2022-02-13 07:42:35.700040','2022-02-13 07:42:35.700061',1,1),(11,'essai','jjjjjjjjjjjj','2022-02-25 14:40:02.839869','2022-02-25 14:40:02.839888',7,1),(12,'vieuxx','nnnnnnnnnnn','2022-02-25 19:13:15.131337','2022-02-25 19:13:15.131364',7,1),(13,'voulu','bravo','2022-02-25 19:53:36.022907','2022-02-25 19:53:36.022954',7,1),(14,'bloblo','paris','2022-02-25 20:05:12.171573','2022-02-25 20:05:12.171594',7,3),(15,'bbbbbbbbbb','bbbbbbbbbbbbb','2022-02-25 20:26:04.090066','2022-02-25 20:26:04.090087',7,3),(16,'bbbbjjjjjjjjj','uuuuuuuu','2022-02-25 20:26:28.723869','2022-02-25 20:26:28.723910',7,2),(17,'baba','nnnnnnnnnn','2022-02-26 08:33:47.041629','2022-02-26 08:33:47.041673',7,1),(18,'nnn','nnnnnnnnnn','2022-02-26 08:52:14.279000','2022-02-26 08:52:14.279035',7,4),(20,'salon &','ce salon va nous ouvrir sur le monde de la réalité augmentée','2022-03-04 10:33:05.077484','2022-03-04 10:33:05.077509',1,11),(21,'groupe flutter','ce groupe est top rejoins nous','2022-03-04 12:13:57.490261','2022-03-04 12:13:57.490279',2,3),(22,'IsraelReadLearn','come and learn all about c++ and c# with us.','2022-03-04 12:35:43.312784','2022-03-04 12:35:17.542109',1,6),(23,'hhh','hhhhhh','2022-03-28 13:11:24.473538','2022-03-28 13:11:24.473564',1,2);
/*!40000 ALTER TABLE `base_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_room_participants`
--

DROP TABLE IF EXISTS `base_room_participants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_room_participants` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `room_id` bigint NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `base_room_participants_room_id_user_id_2e298648_uniq` (`room_id`,`user_id`),
  KEY `base_room_participants_user_id_2a86ea9a_fk_auth_user_id` (`user_id`),
  CONSTRAINT `base_room_participants_room_id_8701ee11_fk_base_room_id` FOREIGN KEY (`room_id`) REFERENCES `base_room` (`id`),
  CONSTRAINT `base_room_participants_user_id_2a86ea9a_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_room_participants`
--

LOCK TABLES `base_room_participants` WRITE;
/*!40000 ALTER TABLE `base_room_participants` DISABLE KEYS */;
INSERT INTO `base_room_participants` VALUES (2,2,1),(6,4,1),(3,5,1),(4,5,5),(1,7,1),(5,7,2),(7,9,1),(13,18,5),(16,21,1),(15,21,2);
/*!40000 ALTER TABLE `base_room_participants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `base_topic`
--

DROP TABLE IF EXISTS `base_topic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `base_topic` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `base_topic`
--

LOCK TABLES `base_topic` WRITE;
/*!40000 ALTER TABLE `base_topic` DISABLE KEYS */;
INSERT INTO `base_topic` VALUES (1,'best web framework'),(2,'POO paradigme'),(3,'Flutter'),(4,'club informatique'),(5,'c#'),(6,'c++'),(7,'Django web framework'),(8,'data transmission'),(9,'leadership'),(10,'Comptabilité'),(11,'Réalité augmentée');
/*!40000 ALTER TABLE `base_topic` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-02-07 17:56:59.311703','1','test',1,'[{\"added\": {}}]',7,1),(2,'2022-02-07 19:17:49.602138','1','best web framework',1,'[{\"added\": {}}]',9,1),(3,'2022-02-07 19:18:13.889476','2','POO paradigme',1,'[{\"added\": {}}]',9,1),(4,'2022-02-07 19:19:04.335522','2','kimi',1,'[{\"added\": {}}]',4,1),(5,'2022-02-07 19:19:32.758483','3','karim',1,'[{\"added\": {}}]',4,1),(6,'2022-02-07 19:22:06.941762','2','only web developer',1,'[{\"added\": {}}]',7,1),(7,'2022-02-07 19:22:30.966089','1','hello',1,'[{\"added\": {}}]',8,1),(8,'2022-02-10 10:08:11.871322','7','nouveau salon',2,'[]',7,1),(9,'2022-02-13 07:29:24.421989','8','hhh',3,'',7,1),(10,'2022-02-24 12:03:29.122310','3','Flutter',1,'[{\"added\": {}}]',9,1),(11,'2022-02-24 12:04:16.717878','4','club informatique',1,'[{\"added\": {}}]',9,1),(12,'2022-02-24 12:05:00.623456','5','c#',1,'[{\"added\": {}}]',9,1),(13,'2022-02-24 12:05:10.304565','6','c++',1,'[{\"added\": {}}]',9,1),(14,'2022-02-24 12:05:26.856446','7','Django web framework',1,'[{\"added\": {}}]',9,1),(15,'2022-02-28 09:27:06.318405','8','data transmission',1,'[{\"added\": {}}]',9,1),(16,'2022-03-04 10:30:32.301307','9','leadership',1,'[{\"added\": {}}]',9,1),(17,'2022-03-04 10:30:52.683592','10','Comptabilité',1,'[{\"added\": {}}]',9,1),(18,'2022-03-04 10:31:24.270907','11','Réalité augmentée',1,'[{\"added\": {}}]',9,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(11,'base','conversation'),(8,'base','message'),(10,'base','messageconversation'),(7,'base','room'),(9,'base','topic'),(5,'contenttypes','contenttype'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-02-07 17:34:22.233768'),(2,'auth','0001_initial','2022-02-07 17:34:24.648554'),(3,'admin','0001_initial','2022-02-07 17:34:25.178373'),(4,'admin','0002_logentry_remove_auto_add','2022-02-07 17:34:25.201534'),(5,'admin','0003_logentry_add_action_flag_choices','2022-02-07 17:34:25.227348'),(6,'contenttypes','0002_remove_content_type_name','2022-02-07 17:34:25.566774'),(7,'auth','0002_alter_permission_name_max_length','2022-02-07 17:34:25.870361'),(8,'auth','0003_alter_user_email_max_length','2022-02-07 17:34:25.940739'),(9,'auth','0004_alter_user_username_opts','2022-02-07 17:34:25.963330'),(10,'auth','0005_alter_user_last_login_null','2022-02-07 17:34:26.144747'),(11,'auth','0006_require_contenttypes_0002','2022-02-07 17:34:26.159490'),(12,'auth','0007_alter_validators_add_error_messages','2022-02-07 17:34:26.184513'),(13,'auth','0008_alter_user_username_max_length','2022-02-07 17:34:26.402248'),(14,'auth','0009_alter_user_last_name_max_length','2022-02-07 17:34:26.595835'),(15,'auth','0010_alter_group_name_max_length','2022-02-07 17:34:26.642491'),(16,'auth','0011_update_proxy_permissions','2022-02-07 17:34:26.658297'),(17,'auth','0012_alter_user_first_name_max_length','2022-02-07 17:34:26.863754'),(18,'base','0001_initial','2022-02-07 17:34:26.940750'),(19,'sessions','0001_initial','2022-02-07 17:34:27.072746'),(20,'base','0002_topic_room_host_message_room_topic','2022-02-07 18:37:35.372489'),(21,'base','0003_alter_room_options_room_participants','2022-02-10 09:10:10.763012'),(22,'base','0004_alter_message_options_conversation','2022-02-28 12:34:36.498948'),(23,'base','0005_rename_conversation_messsageconversation','2022-02-28 13:09:48.671403'),(24,'base','0006_remove_messsageconversation_expediteur_and_more','2022-02-28 14:19:42.077748'),(25,'base','0007_rename_messsageconversation_messageconversation','2022-03-01 16:20:02.505779'),(26,'base','0008_messageconversation_sender','2022-03-01 16:34:00.979849');
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
INSERT INTO `django_session` VALUES ('378h5067xpjj0vxc2bi3ex48u2b4bivb','.eJxVjEEOwiAQRe_C2hChlAGX7j0DYZhBqgaS0q6MdzckXej2v_f-W4S4byXsndewkLgIJU6_G8b05DoAPWK9N5la3dYF5VDkQbu8NeLX9XD_DkrsZdQAmvQ0KVLGMJAm8Jxndmh9SnMCZSIbzxY8AuQzIjh0kZkdWJWy-HwB6dc4iQ:1nRZjW:KhrsXLPkgvBTCF5OSpTkTjSyXf9gBDYnIIiRgUBbnWw','2022-03-22 13:18:34.786025'),('48kv0yddf92olddufy57d3l9hmyl4u53','.eJxVjDsOwjAQBe_iGlle_9ampOcM1voTHEC2FCcV4u4QKQW0b2beiwXa1hq2UZYwZ3ZmAOz0O0ZKj9J2ku_Ubp2n3tZljnxX-EEHv_ZcnpfD_TuoNOq3VoRSOG3QSwEJJaGy6LJT2kRQIsopAVmHYHUSiNoWg0XJ7D04D35i7w--OjY2:1nQ4fh:Gk9KSPN8LOHwJIQ1BsTL25egsx4vVIH5wi-jh7SclTI','2022-03-18 09:56:25.094764'),('6roefs0bzyk34nbd8xqb7znctm0jixm2','.eJxVjMsOwiAQRf-FtSF0eIgu3fcbyMAMUjWQlHZl_HfbpAvd3nPOfYuA61LC2nkOE4mr0OL0u0VMT647oAfWe5Op1WWeotwVedAux0b8uh3u30HBXrY6ok0DOnX2WWdrEisXs4lgmR0nih4U40bxogEIGY1HTzBoSOStBvH5Agc9OH8:1nPO3V:_BbCZY6S39NOrRKQHphE49wLWxeC6pj43vRVk0z1omY','2022-03-16 12:26:09.838297'),('9ylbxhzfof0vknc5pzl655rx8jcae2ae','.eJxVjM0OwiAQhN-FsyH8u_Xo3WcgCyxSNZCU9mR8d2nSg95m5puZN_O4rcVvnRY_J3Zhip1-s4DxSXUH6YH13nhsdV3mwPcKP2jnt5bodT26fwcFexlraSFEccbssgDIILUd3ppAlIzErBzaKaOB6CblknJCaUStCSDSEOzzBelfOCs:1nQ6nF:p923qHcP8yT15GTLGx_vEz6g7aN6rNQ_MlMmkFsEJeA','2022-03-18 12:12:21.333168'),('k8avf3uhk29uq5s8j5u5wc9hl8ca9oyi','.eJxVjEEOwiAQRe_C2hChlAGX7j0DYZhBqgaS0q6MdzckXej2v_f-W4S4byXsndewkLgIJU6_G8b05DoAPWK9N5la3dYF5VDkQbu8NeLX9XD_DkrsZdQAmvQ0KVLGMJAm8Jxndmh9SnMCZSIbzxY8AuQzIjh0kZkdWJWy-HwB6dc4iQ:1nQ5C3:S5_-7PfsLSyCip-ShOUMdZvXS3TiauEx8JnQAD3Q7OA','2022-03-18 10:29:51.856908'),('m2sm2bsfl35egj6h13zc39ok1lh10uk5','.eJxVjEEOwiAQRe_C2hChlAGX7j0DYZhBqgaS0q6MdzckXej2v_f-W4S4byXsndewkLgIJU6_G8b05DoAPWK9N5la3dYF5VDkQbu8NeLX9XD_DkrsZdQAmvQ0KVLGMJAm8Jxndmh9SnMCZSIbzxY8AuQzIjh0kZkdWJWy-HwB6dc4iQ:1nJ9Jh:AxGSo0yyo-KAZM-CnYV5iQ_ybEuZIZZJ33EVqBUAmfo','2022-02-27 07:29:05.659513'),('oqhgazxait8h2t4uvinexrp7pfc17uhr','.eJxVjEEOwiAQRe_C2hChlAGX7j0DYZhBqgaS0q6MdzckXej2v_f-W4S4byXsndewkLgIJU6_G8b05DoAPWK9N5la3dYF5VDkQbu8NeLX9XD_DkrsZdQAmvQ0KVLGMJAm8Jxndmh9SnMCZSIbzxY8AuQzIjh0kZkdWJWy-HwB6dc4iQ:1nKJMa:iYrMNDofDVBBsBTd9SFE2P0pGzv9A1Xc-AxuJFVPgRo','2022-03-02 12:24:52.619570'),('rl4sdcq8cstc28pmqa7w2yaoer8xogbk','.eJxVjEEOwiAQRe_C2hChlAGX7j0DYZhBqgaS0q6MdzckXej2v_f-W4S4byXsndewkLgIJU6_G8b05DoAPWK9N5la3dYF5VDkQbu8NeLX9XD_DkrsZdQAmvQ0KVLGMJAm8Jxndmh9SnMCZSIbzxY8AuQzIjh0kZkdWJWy-HwB6dc4iQ:1nYok7:7Rpw75iByHpNuiF2NKC7jBJ_8DqmYSW5VBt89AF7_oE','2022-04-11 12:45:07.556118');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-03-28 13:31:55
