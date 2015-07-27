CREATE DATABASE  IF NOT EXISTS `groupify` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `groupify`;
-- MySQL dump 10.13  Distrib 5.6.11, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: groupify
-- ------------------------------------------------------
-- Server version	5.5.32

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
-- Table structure for table `discussion`
--

DROP TABLE IF EXISTS `discussion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discussion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `post_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `post_on` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `post_id_idx` (`post_id`),
  KEY `u_id_idx` (`u_id`),
  CONSTRAINT `post_id` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `u_id` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discussion`
--

LOCK TABLES `discussion` WRITE;
/*!40000 ALTER TABLE `discussion` DISABLE KEYS */;
/*!40000 ALTER TABLE `discussion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `description` text,
  `created_on` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `u_id_idx` (`created_by`),
  CONSTRAINT `user__Id` FOREIGN KEY (`created_by`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'test',7,NULL,'0000-00-00'),(2,'test',7,NULL,'0000-00-00'),(3,'test',7,NULL,'1437893661'),(4,'update7',7,NULL,'1437893686'),(5,'testing_update',4,'this desc for testin for group 4','1437893815'),(6,'groupname update',7,'sample descRiption','1437894465');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `members`
--

DROP TABLE IF EXISTS `members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) DEFAULT NULL,
  `u_id` int(11) DEFAULT NULL,
  `join_on` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_Id_idx` (`u_id`),
  KEY `group_id_idx` (`g_id`),
  CONSTRAINT `group_id` FOREIGN KEY (`g_id`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `user_Id` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `members`
--

LOCK TABLES `members` WRITE;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` VALUES (1,6,8,'0000-00-00'),(2,5,5,'1437902903'),(3,5,7,'1437902973'),(4,4,8,'1437916141');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `g_id` int(11) DEFAULT NULL,
  `post_by` varchar(150) DEFAULT NULL,
  `created_on` varchar(150) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`id`),
  KEY `group_iId_idx` (`g_id`),
  CONSTRAINT `group_iId` FOREIGN KEY (`g_id`) REFERENCES `group` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (2,5,'0000-00-00',NULL,'first'),(3,5,'0000-00-00',NULL,'conent'),(4,5,'0000-00-00',NULL,'three'),(5,5,'0000-00-00',NULL,'four'),(6,5,'4','1437906882','some more content');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(105) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `mobile` varchar(45) DEFAULT NULL,
  `join_on` varchar(155) DEFAULT NULL,
  `device_id` varchar(155) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_id_UNIQUE` (`device_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','test@gmail.com','123465798',NULL,NULL),(3,NULL,'test@gma.com',NULL,'0000-00-00 00:00:00',NULL),(4,NULL,'1test@gma.com',NULL,'1437850722',NULL),(5,NULL,'praveen@gma.com',NULL,'1437852303','12345'),(7,NULL,'praveen@addresspager.com',NULL,'1437892266','55b47eaa5eefc'),(8,NULL,'kumarpraveen@addresspager.com',NULL,'1437892337','55b47ef11cc91'),(14,NULL,'test@android.com',NULL,'1437929227','55b50f0b1c7f5');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'groupify'
--

--
-- Dumping routines for database 'groupify'
--
/*!50003 DROP PROCEDURE IF EXISTS `create_account` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `create_account`(IN _mail varchar(150),in _device_id varchar(150))
BEGIN
DECLARE total_row int DEFAULT 0;
select count(id) into total_row from user where mail = _mail;
if(total_row = 0) then
insert into user(mail,join_on,device_id)values(_mail,UNIX_TIMESTAMP(),_device_id);
select mail,join_on,id,device_id from user where id = last_insert_id();
else 
select 'mail_exist' as 'error';
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `group_fn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `group_fn`(in _type varchar(150),in _g_id varchar(150),in _id varchar(150))
BEGIN
DECLARE total_row int DEFAULT 0;
if _type = 'join' then
select count(id) into total_row from members where g_id= _g_id and u_id = _id;
if(total_row = 0) then
insert into members(g_id,u_id,join_on)values(_g_id,_id,unix_timestamp());
select id,g_id,u_id from members where id = last_insert_id();
else
select 'exist' as 'error';
end if;
elseif _type = 'delete' then
delete from  members where id = _g_id;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `posts` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `posts`(in _type varchar(150),in _g_id varchar(150),in u_id varchar(150),in _content text)
BEGIN
if _type = 'create' then
insert into posts(g_id,post_by,content,created_on)values(_g_id,u_id,_content,unix_timestamp());
select id,g_id,content,created_on from posts where id = last_insert_id();
elseif _type = 'select' then
select p.id as id ,p.g_id,p.content from posts as p join members as m on m.g_id = p.g_id where m.u_id = u_id order by p.created_on DESC ;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_group` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_group`(in _type varchar(55), in _data text,in _id varchar(15))
BEGIN
if _type = 'create' then
insert into `group`(`name`,created_by,created_on)values(_data,_id,UNIX_TIMESTAMP());
select id,`name`,created_by,created_on,description from `group` where id = last_insert_id();
elseif _type = 'update_desc' then
update 	`group` set description = _data where id = _id;
select id,description,`name`,created_by,created_on from `group` where id = _id;
elseif _type = 'update_name' then
update 	`group` set `name` = _data where id = _id;
select id,`name`,created_by,created_on,description from `group` where id = _id;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-07-27 10:04:18
