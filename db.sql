/*
SQLyog Community v13.0.1 (64 bit)
MySQL - 8.0.34 : Database - hr_management
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`hr_management` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `hr_management`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

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

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values 
(1,'Can add log entry',1,'add_logentry'),
(2,'Can change log entry',1,'change_logentry'),
(3,'Can delete log entry',1,'delete_logentry'),
(4,'Can view log entry',1,'view_logentry'),
(5,'Can add permission',2,'add_permission'),
(6,'Can change permission',2,'change_permission'),
(7,'Can delete permission',2,'delete_permission'),
(8,'Can view permission',2,'view_permission'),
(9,'Can add group',3,'add_group'),
(10,'Can change group',3,'change_group'),
(11,'Can delete group',3,'delete_group'),
(12,'Can view group',3,'view_group'),
(13,'Can add user',4,'add_user'),
(14,'Can change user',4,'change_user'),
(15,'Can delete user',4,'delete_user'),
(16,'Can view user',4,'view_user'),
(17,'Can add content type',5,'add_contenttype'),
(18,'Can change content type',5,'change_contenttype'),
(19,'Can delete content type',5,'delete_contenttype'),
(20,'Can view content type',5,'view_contenttype'),
(21,'Can add session',6,'add_session'),
(22,'Can change session',6,'change_session'),
(23,'Can delete session',6,'delete_session'),
(24,'Can view session',6,'view_session'),
(25,'Can add attend exam',7,'add_attendexam'),
(26,'Can change attend exam',7,'change_attendexam'),
(27,'Can delete attend exam',7,'delete_attendexam'),
(28,'Can view attend exam',7,'view_attendexam'),
(29,'Can add login',8,'add_login'),
(30,'Can change login',8,'change_login'),
(31,'Can delete login',8,'delete_login'),
(32,'Can view login',8,'view_login'),
(33,'Can add vacancy',9,'add_vacancy'),
(34,'Can change vacancy',9,'change_vacancy'),
(35,'Can delete vacancy',9,'delete_vacancy'),
(36,'Can view vacancy',9,'view_vacancy'),
(37,'Can add question',10,'add_question'),
(38,'Can change question',10,'change_question'),
(39,'Can delete question',10,'delete_question'),
(40,'Can view question',10,'view_question'),
(41,'Can add interview',11,'add_interview'),
(42,'Can change interview',11,'change_interview'),
(43,'Can delete interview',11,'delete_interview'),
(44,'Can view interview',11,'view_interview'),
(45,'Can add hr',12,'add_hr'),
(46,'Can change hr',12,'change_hr'),
(47,'Can delete hr',12,'delete_hr'),
(48,'Can view hr',12,'view_hr'),
(49,'Can add candidate',13,'add_candidate'),
(50,'Can change candidate',13,'change_candidate'),
(51,'Can delete candidate',13,'delete_candidate'),
(52,'Can view candidate',13,'view_candidate'),
(53,'Can add application',14,'add_application'),
(54,'Can change application',14,'change_application'),
(55,'Can delete application',14,'delete_application'),
(56,'Can view application',14,'view_application');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `auth_user` */

insert  into `auth_user`(`id`,`password`,`last_login`,`is_superuser`,`username`,`first_name`,`last_name`,`email`,`is_staff`,`is_active`,`date_joined`) values 
(1,'pbkdf2_sha256$260000$u4sTnFbOmr6wtfTFbEMxJD$WK2TMIZO/mW1jbYWKmTpdPvdVH1kyxs+X8nilLlxaaQ=','2023-11-19 10:56:31.479584',1,'admin','','','admin@gmail.com',1,1,'2023-11-08 16:09:53.971447');

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

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

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

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

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values 
(1,'admin','logentry'),
(3,'auth','group'),
(2,'auth','permission'),
(4,'auth','user'),
(5,'contenttypes','contenttype'),
(14,'hr_app','application'),
(7,'hr_app','attendexam'),
(13,'hr_app','candidate'),
(12,'hr_app','hr'),
(11,'hr_app','interview'),
(8,'hr_app','login'),
(10,'hr_app','question'),
(9,'hr_app','vacancy'),
(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values 
(1,'contenttypes','0001_initial','2023-11-08 12:06:28.206347'),
(2,'auth','0001_initial','2023-11-08 12:07:09.785366'),
(3,'admin','0001_initial','2023-11-08 12:07:27.297514'),
(4,'admin','0002_logentry_remove_auto_add','2023-11-08 12:07:27.448760'),
(5,'admin','0003_logentry_add_action_flag_choices','2023-11-08 12:07:27.638625'),
(6,'contenttypes','0002_remove_content_type_name','2023-11-08 12:07:33.779858'),
(7,'auth','0002_alter_permission_name_max_length','2023-11-08 12:07:37.891345'),
(8,'auth','0003_alter_user_email_max_length','2023-11-08 12:07:39.485920'),
(9,'auth','0004_alter_user_username_opts','2023-11-08 12:07:40.158590'),
(10,'auth','0005_alter_user_last_login_null','2023-11-08 12:07:46.277297'),
(11,'auth','0006_require_contenttypes_0002','2023-11-08 12:07:46.545589'),
(12,'auth','0007_alter_validators_add_error_messages','2023-11-08 12:07:46.843949'),
(13,'auth','0008_alter_user_username_max_length','2023-11-08 12:07:51.704680'),
(14,'auth','0009_alter_user_last_name_max_length','2023-11-08 12:07:56.930221'),
(15,'auth','0010_alter_group_name_max_length','2023-11-08 12:07:57.977678'),
(16,'auth','0011_update_proxy_permissions','2023-11-08 12:07:58.171879'),
(17,'auth','0012_alter_user_first_name_max_length','2023-11-08 12:08:03.680628'),
(18,'hr_app','0001_initial','2023-11-08 12:09:07.747716'),
(19,'hr_app','0002_question_answers','2023-11-08 12:09:10.396055'),
(20,'hr_app','0003_rename_company_name_vacancy_vacancy_name','2023-11-08 12:09:11.527380'),
(21,'hr_app','0004_vacancy_company_name','2023-11-08 12:09:13.531888'),
(22,'hr_app','0005_vacancy_hr','2023-11-08 12:09:19.199431'),
(23,'hr_app','0006_auto_20231107_1104','2023-11-08 12:09:21.657781'),
(24,'hr_app','0007_remove_vacancy_company_name','2023-11-08 12:09:25.464824'),
(25,'hr_app','0008_remove_attendexam_status','2023-11-08 12:09:36.609968'),
(26,'hr_app','0009_auto_20231108_1732','2023-11-08 12:09:47.676003'),
(27,'sessions','0001_initial','2023-11-08 12:09:51.550593'),
(28,'hr_app','0010_alter_question_questions','2023-11-08 17:09:46.308224'),
(29,'hr_app','0011_alter_interview_score','2023-11-19 05:37:07.329297'),
(30,'hr_app','0012_auto_20231119_1109','2023-11-19 05:39:19.402290'),
(31,'hr_app','0013_hr_deparment','2023-11-19 08:51:31.151562');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('5oozjm2avqqkw0ba5b5vafb38jngu5w9','.eJxVjsEOgjAQRP-lZ9N0KaVbj979BrJ0t4KakkA5Gf_dYjho5jbzZjIv1dNWxn5bZeknVmcF6vTrDRQfkveA75Rvs45zLss06B3RR7rq68zyvBzs38BI61jb6AU9NC7Y0CFJa4hQIlQ5j-SCsVaS4yEAWEfJJ4xC3BoGbFIHUkcjZZ6YinyPumrkos7m_QGtzz-m:1r0wyW:BgMqAD6hanrpo5q3czrI7sFG9C-zpmFVEs3fQ3skcjU','2023-11-23 04:49:04.177939'),
('b0hm32k4m8sw18qle2fnrq8shel0mpyw','.eJxVTksOwiAQvQvrhnRKKYNL956BTGGQqilJaVfGu0u1C81bvW_eUzja1uS2woubgjgJEM2vNpK_87wb4UbzNUuf53WZRrlH5OEWecmBH-cj-zeQqKTaRsNooNNW2QGJ-5YI2UOFNkjatkpx1GG0AEpTNBE9U-jbANjFAbiOpu_DrhHF54U_RL3eJ0c-5g:1r4Hvd:hyDaT31AxEREH2VGbrUFO_T698comYh0agw3wNL8j4k','2023-12-02 09:47:53.120940'),
('c7l7insqvhksh0rlq68a0wr61nbgypb4','.eJxVjsEOgjAQRP-lZ9N0KaVbj979BrJ0t4KakkA5Gf_dYjho5jbzZjIv1dNWxn5bZeknVmcF6vTrDRQfkveA75Rvs45zLss06B3RR7rq68zyvBzs38BI61jb6AU9NC7Y0CFJa4hQIlQ5j-SCsVaS4yEAWEfJJ4xC3BoGbFIHUkcjZZ6YinyP-mrkos7m_QGt4z-o:1r4bH0:1nMGjpQ9esr8WSYj2TAH72nA7O1sHLSWaCDPzM2BQ2k','2023-12-03 06:27:14.204290'),
('i2dt5vi5afb9v8wymokzi50ndgh0fqa5','.eJxVjsEOgjAQRP-lZ9N0KaVbj979BrJ0t4KakkA5Gf_dYjho5jbzZjIv1dNWxn5bZeknVmcF6vTrDRQfkveA75Rvs45zLss06B3RR7rq68zyvBzs38BI61jb6AU9NC7Y0CFJa4hQIlQ5j-SCsVaS4yEAWEfJJ4xC3BoGbFIHUkcjZZ6YinyP-mrkos7m_QGt4z-o:1r4fTb:NAa_LRKeyHQwgew3_P8caPVsHc4_0Hlx1T1MaVBj-is','2023-12-03 10:56:31.485790'),
('if54ub1c9yc9rwfjtn98z2d826aoeiku','.eJxVjsEOgjAQRP-lZ9N0KaVbj979BrJ0t4KakkA5Gf_dYjho5jbzZjIv1dNWxn5bZeknVmcF6vTrDRQfkveA75Rvs45zLss06B3RR7rq68zyvBzs38BI61jb6AU9NC7Y0CFJa4hQIlQ5j-SCsVaS4yEAWEfJJ4xC3BoGbFIHUkcjZZ6YinyP-mrkos7m_QGt4z-o:1r4e3C:Uq6XHpVt9td5ErQXVz_DspRA3F5Yur61v9hGZW42HKg','2023-12-03 09:25:10.179952'),
('jz0w8ct1qnscxposo44g1t2y6vd2kdfw','.eJxVjMEOwiAQRP-FsyFsKWXx6L3fQBZYpGpoUtqT8d9tkx40c5v3Zt7C07YWvzVe_JTEVYC4_HaB4pPrAdKD6n2Wca7rMgV5KPKkTY5z4tftdP8OCrWyr9EyWuiM025A4l4RIUfYYyyScUprziYFB6ANZZsxMqVeJcAuD8Di8wXSsjff:1r4HOs:ECEjzGfhIKa0m-rZtnFVZ3Hcoe14GaU4Bx7TrfrIlFA','2023-12-02 09:14:02.469445'),
('w0qyouxu4k8zhe98cx0ll1lky0rr7wn5','.eJxVjsEOgjAQRP-lZ9OwlNKtR-9-Q7N0txY1kFA4Gf_dEjlo5jbzZjIvFWhbc9iKLGFkdVagTr_eQPEh0x7wnabbrOM8rcs46B3RR1r0dWZ5Xg72byBTybWNTtBBa73xPZJ0DRFKhCrrkKxvjJFkefAAxlJyCaMQdw0DtqkHqaP5-7B9fwAPwDrB:1r4aZk:mO_3uvTY-R11e8KKm53C5hQstagahMYpJ8rXk4gItDU','2023-12-03 05:42:32.510238');

/*Table structure for table `hr_app_application` */

DROP TABLE IF EXISTS `hr_app_application`;

CREATE TABLE `hr_app_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `CANDIDATE_id` bigint NOT NULL,
  `VACANCY_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_app_application_CANDIDATE_id_e5247059_fk_hr_app_candidate_id` (`CANDIDATE_id`),
  KEY `hr_app_application_VACANCY_id_4ee7df4c_fk_hr_app_vacancy_id` (`VACANCY_id`),
  CONSTRAINT `hr_app_application_CANDIDATE_id_e5247059_fk_hr_app_candidate_id` FOREIGN KEY (`CANDIDATE_id`) REFERENCES `hr_app_candidate` (`id`),
  CONSTRAINT `hr_app_application_VACANCY_id_4ee7df4c_fk_hr_app_vacancy_id` FOREIGN KEY (`VACANCY_id`) REFERENCES `hr_app_vacancy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hr_app_application` */

insert  into `hr_app_application`(`id`,`date`,`status`,`CANDIDATE_id`,`VACANCY_id`) values 
(2,'2023-11-18','selected',2,4),
(3,'2023-11-18','selected',2,2),
(5,'2023-11-18','selected',3,4),
(6,'2023-11-18','pending',3,2),
(8,'2023-11-19','accepted',3,5),
(9,'2023-11-19','pending',2,5);

/*Table structure for table `hr_app_attendexam` */

DROP TABLE IF EXISTS `hr_app_attendexam`;

CREATE TABLE `hr_app_attendexam` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `Mark` varchar(30) NOT NULL,
  `CANDIDATE_id` bigint NOT NULL,
  `QUESTION_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_app_attendexam_CANDIDATE_id_b0f0a815_fk_hr_app_candidate_id` (`CANDIDATE_id`),
  KEY `hr_app_attendexam_QUESTION_id_6ea71887_fk_hr_app_question_id` (`QUESTION_id`),
  CONSTRAINT `hr_app_attendexam_CANDIDATE_id_b0f0a815_fk_hr_app_candidate_id` FOREIGN KEY (`CANDIDATE_id`) REFERENCES `hr_app_candidate` (`id`),
  CONSTRAINT `hr_app_attendexam_QUESTION_id_6ea71887_fk_hr_app_question_id` FOREIGN KEY (`QUESTION_id`) REFERENCES `hr_app_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hr_app_attendexam` */

insert  into `hr_app_attendexam`(`id`,`date`,`Mark`,`CANDIDATE_id`,`QUESTION_id`) values 
(5,'2023-11-18','1',2,10),
(6,'2023-11-18','1',2,11),
(7,'2023-11-18','1',2,13),
(8,'2023-11-18','1',2,5),
(9,'2023-11-18','0',2,6),
(10,'2023-11-18','0',2,7),
(11,'2023-11-18','1',2,9),
(12,'2023-11-18','1',3,10),
(13,'2023-11-18','1',3,11),
(14,'2023-11-18','1',3,13),
(20,'2023-11-19','1',3,14);

/*Table structure for table `hr_app_candidate` */

DROP TABLE IF EXISTS `hr_app_candidate`;

CREATE TABLE `hr_app_candidate` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `place` varchar(30) NOT NULL,
  `post` varchar(30) NOT NULL,
  `pin` bigint NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(254) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `qualification` varchar(30) NOT NULL,
  `proof` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_app_candidate_LOGIN_id_5ee059f0_fk_hr_app_login_id` (`LOGIN_id`),
  CONSTRAINT `hr_app_candidate_LOGIN_id_5ee059f0_fk_hr_app_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `hr_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hr_app_candidate` */

insert  into `hr_app_candidate`(`id`,`name`,`place`,`post`,`pin`,`phone`,`email`,`photo`,`qualification`,`proof`,`LOGIN_id`) values 
(1,'srindhuna','Thalassery','Kadavthoor',673611,8129068160,'sree@gmail.com','staff.jpg','PG','clg_FN5EBfI.jpg',5),
(2,'pavithra','shornur','kavalappara',675234,7356161482,'pavithrapavicr@gmail.com','Screenshot_20230103_091819.png','PG','Anaswara.pdf',6),
(3,'aishwarya','zxcvbnm','kavalappara',679523,9961781482,'pavithrapavicr@gmail.com','IMG_20221026_073407_989.jpg','B-tech','IMG_20221014_132904_906.jpg',7);

/*Table structure for table `hr_app_hr` */

DROP TABLE IF EXISTS `hr_app_hr`;

CREATE TABLE `hr_app_hr` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `place` varchar(30) NOT NULL,
  `post` varchar(30) NOT NULL,
  `pin` bigint NOT NULL,
  `phone` bigint NOT NULL,
  `email` varchar(254) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `LOGIN_id` bigint NOT NULL,
  `deparment` varchar(900) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_app_hr_LOGIN_id_be7a2168_fk_hr_app_login_id` (`LOGIN_id`),
  CONSTRAINT `hr_app_hr_LOGIN_id_be7a2168_fk_hr_app_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `hr_app_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hr_app_hr` */

insert  into `hr_app_hr`(`id`,`name`,`place`,`post`,`pin`,`phone`,`email`,`photo`,`LOGIN_id`,`deparment`) values 
(1,'Mrudul','kakkodi','kizhakkummury',673611,8129068160,'mrudul@gmail.com','gym.jpg',2,'ok'),
(2,'Ribin','kuruvattoor','kizhakkummury',673611,8129068160,'ri@gamil.com','img2_XFNAVlB_bmcBRaJ.jpeg',3,'ooooo'),
(4,'Hazna','kkd','kkkd',670644,9876543210,'jkkj@gmail.com','img2_XFNAVlB.jpeg',8,'cd99');

/*Table structure for table `hr_app_interview` */

DROP TABLE IF EXISTS `hr_app_interview`;

CREATE TABLE `hr_app_interview` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `venue` varchar(80) NOT NULL,
  `date` date NOT NULL,
  `time` time(6) NOT NULL,
  `status` varchar(30) NOT NULL,
  `score` varchar(30) NOT NULL,
  `APPLICATION_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_app_interview_APPLICATION_id_76c3fce9_fk_hr_app_ap` (`APPLICATION_id`),
  CONSTRAINT `hr_app_interview_APPLICATION_id_76c3fce9_fk_hr_app_ap` FOREIGN KEY (`APPLICATION_id`) REFERENCES `hr_app_application` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hr_app_interview` */

insert  into `hr_app_interview`(`id`,`venue`,`date`,`time`,`status`,`score`,`APPLICATION_id`) values 
(1,'kozh','2023-11-21','07:07:00.000000','Selected','89',2),
(2,'kochi','2023-11-30','05:00:00.000000','Rejected','10',3),
(3,'banglore','2023-11-29','09:00:00.000000','Selected','90',5);

/*Table structure for table `hr_app_login` */

DROP TABLE IF EXISTS `hr_app_login`;

CREATE TABLE `hr_app_login` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL,
  `type` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hr_app_login` */

insert  into `hr_app_login`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'mrudu','mrudu','hr'),
(3,'ribi','ribi','hr'),
(5,'sree','sree','candidate'),
(6,'pavithra','Pavithra@358','candidate'),
(7,'aishu','Aishu123','candidate'),
(8,'asdQWE','123','hr');

/*Table structure for table `hr_app_question` */

DROP TABLE IF EXISTS `hr_app_question`;

CREATE TABLE `hr_app_question` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `questions` varchar(300) NOT NULL,
  `op1` varchar(30) NOT NULL,
  `op2` varchar(30) NOT NULL,
  `op3` varchar(30) NOT NULL,
  `op4` varchar(30) NOT NULL,
  `VACANCY_id` bigint NOT NULL,
  `Answers` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_app_question_VACANCY_id_47234efd_fk_hr_app_vacancy_id` (`VACANCY_id`),
  CONSTRAINT `hr_app_question_VACANCY_id_47234efd_fk_hr_app_vacancy_id` FOREIGN KEY (`VACANCY_id`) REFERENCES `hr_app_vacancy` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hr_app_question` */

insert  into `hr_app_question`(`id`,`questions`,`op1`,`op2`,`op3`,`op4`,`VACANCY_id`,`Answers`) values 
(5,'unit of resistor','ohm','kg','L','pascal',2,'ohm'),
(6,'what is the color of phase line','green','black','white','red',2,'red'),
(7,'unit current price','3.3','4','1','7.3',2,'3.3'),
(9,'color code for earth line','black','red','green','yellow',2,'green'),
(10,'abcd','a','b','c','d',4,'a'),
(11,'efgh','e','f','g','h',4,'g'),
(13,'poiu','p','o','i','u',4,'p'),
(14,'what is the 1st step in sdlc','system coding','system design','coding','requirmnet analaysis',5,'requirmnet analaysis'),
(15,'RAD stands for?','Rapid application document','Rapid Application Development','relative app development','None of the above',5,'RapidAppDevelopment');

/*Table structure for table `hr_app_vacancy` */

DROP TABLE IF EXISTS `hr_app_vacancy`;

CREATE TABLE `hr_app_vacancy` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `vacancy_name` varchar(30) NOT NULL,
  `no_of_vacancy` int NOT NULL,
  `Vacancy_details` varchar(80) NOT NULL,
  `Qualification` varchar(30) NOT NULL,
  `date` date NOT NULL,
  `HR_id` bigint NOT NULL,
  `tdate` date NOT NULL,
  `ttime` time(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hr_app_vacancy_HR_id_b7418f1e_fk_hr_app_hr_id` (`HR_id`),
  CONSTRAINT `hr_app_vacancy_HR_id_b7418f1e_fk_hr_app_hr_id` FOREIGN KEY (`HR_id`) REFERENCES `hr_app_hr` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `hr_app_vacancy` */

insert  into `hr_app_vacancy`(`id`,`vacancy_name`,`no_of_vacancy`,`Vacancy_details`,`Qualification`,`date`,`HR_id`,`tdate`,`ttime`) values 
(2,'electrical engg',5,'electrical engineer 3yr exp','B.E','2023-11-08',1,'2023-11-19','10:00:00.000000'),
(4,'software engineer',10,'3 yr experience','mca','2023-11-18',1,'2023-11-19','10:00:00.000000'),
(5,'Software engg',10,'qwertyu','MCA','2023-11-19',1,'2023-11-19','12:05:00.000000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
