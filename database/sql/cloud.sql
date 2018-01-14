/*
SQLyog v10.2 
MySQL - 5.7.20-0ubuntu0.16.04.1 : Database - cloud
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cloud` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `cloud`;

/*Table structure for table `cloud_admin_users` */

DROP TABLE IF EXISTS `cloud_admin_users`;

CREATE TABLE `cloud_admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_super` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否超级管理员',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否禁用',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_name_unique` (`name`),
  UNIQUE KEY `admin_users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_admin_users` */

insert  into `cloud_admin_users`(`id`,`name`,`nickname`,`email`,`password`,`ip`,`last_login_at`,`is_super`,`status`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values (1,'admin','管理员','admin@admin.com','$2y$10$dunZeG22ZPwu.lmDJy9ZWOu7qiudT5iQ5VnGJmmPVp9387y7WU5HC','127.0.0.1',NULL,1,1,'C5jQ2NmD8UgYFviG5UGGCHMwJWJC82N3AU18GSoyAMMXMjT0MB01bSLsm1Id','2016-06-02 07:33:41','2018-01-14 18:13:29',NULL);

/*Table structure for table `cloud_category` */

DROP TABLE IF EXISTS `cloud_category`;

CREATE TABLE `cloud_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类类型：1、使用年龄 2、STEM侧重 3、价格类型',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_name_type_index` (`name`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_category` */

insert  into `cloud_category`(`id`,`type`,`name`,`created_at`,`updated_at`,`deleted_at`) values (1,'1','幼儿园','2018-01-14 14:28:36','2018-01-14 14:28:36',NULL),(2,'1','小学','2018-01-14 14:29:59','2018-01-14 14:29:59',NULL),(3,'1','初中','2018-01-14 14:30:05','2018-01-14 14:30:05',NULL),(4,'1','高中','2018-01-14 14:30:12','2018-01-14 14:30:12',NULL),(5,'2','科学','2018-01-14 14:58:26','2018-01-14 14:59:24',NULL),(6,'2','技术','2018-01-14 14:58:36','2018-01-14 14:58:36',NULL),(7,'2','工程','2018-01-14 14:58:47','2018-01-14 14:58:47',NULL),(8,'2','数学','2018-01-14 14:58:53','2018-01-14 14:58:53',NULL),(9,'3','免费课程','2018-01-14 14:59:05','2018-01-14 14:59:05',NULL),(10,'3','付费课程','2018-01-14 14:59:14','2018-01-14 14:59:14',NULL);

/*Table structure for table `cloud_category_has_class` */

DROP TABLE IF EXISTS `cloud_category_has_class`;

CREATE TABLE `cloud_category_has_class` (
  `category_id` int(10) unsigned NOT NULL,
  `class_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`category_id`,`class_id`),
  KEY `category_has_class_class_id_foreign` (`class_id`),
  CONSTRAINT `category_has_class_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `cloud_category` (`id`) ON DELETE CASCADE,
  CONSTRAINT `category_has_class_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `cloud_class` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_category_has_class` */

insert  into `cloud_category_has_class`(`category_id`,`class_id`) values (1,1),(6,1),(10,1),(4,2),(7,2),(10,2);

/*Table structure for table `cloud_class` */

DROP TABLE IF EXISTS `cloud_class`;

CREATE TABLE `cloud_class` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '课程名称',
  `period` int(11) DEFAULT NULL COMMENT '课时数',
  `minute` int(11) DEFAULT NULL COMMENT '课程时间',
  `titlepic` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '课程图片',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '课程简介',
  `target` text COLLATE utf8mb4_unicode_ci COMMENT '课程目标',
  `syllabus` text COLLATE utf8mb4_unicode_ci COMMENT '课程大纲',
  `content` longtext COLLATE utf8mb4_unicode_ci COMMENT '课程内容',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_name_period_minute_click_updated_at_index` (`name`,`period`,`minute`,`click`,`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_class` */

insert  into `cloud_class`(`id`,`name`,`period`,`minute`,`titlepic`,`description`,`target`,`syllabus`,`content`,`click`,`created_at`,`updated_at`,`deleted_at`) values (1,'十大大师',1,2,'uploads/files/20180114/1515923978qZ3.png',NULL,NULL,NULL,NULL,0,'2018-01-14 17:59:41','2018-01-14 17:59:41',NULL),(2,'涂鸦跳跃',67,7,'uploads/files/20180114/1515924128u6L.png',NULL,NULL,NULL,NULL,0,'2018-01-14 18:02:16','2018-01-14 18:02:16',NULL);

/*Table structure for table `cloud_logs` */

DROP TABLE IF EXISTS `cloud_logs`;

CREATE TABLE `cloud_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` int(10) unsigned NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `httpuseragent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sessionid` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logs_userid_username_ip_index` (`userid`,`username`,`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_logs` */

insert  into `cloud_logs`(`id`,`userid`,`username`,`httpuseragent`,`sessionid`,`ip`,`created_at`,`updated_at`,`deleted_at`) values (1,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','gzTWsoYwGRolaSAVP8RWDniq0670s7kcm1DXcl5G','127.0.0.1','2018-01-14 18:13:29','2018-01-14 18:13:29',NULL);

/*Table structure for table `cloud_migrations` */

DROP TABLE IF EXISTS `cloud_migrations`;

CREATE TABLE `cloud_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_migrations` */

insert  into `cloud_migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_11_11_121050_create_permission_tables',1),(4,'2017_11_14_170525_create_log_tables',1),(5,'2018_01_13_132703_create_class_table',1),(6,'2018_01_14_131549_create_category_table',1);

/*Table structure for table `cloud_model_has_permissions` */

DROP TABLE IF EXISTS `cloud_model_has_permissions`;

CREATE TABLE `cloud_model_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `cloud_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_model_has_permissions` */

/*Table structure for table `cloud_model_has_roles` */

DROP TABLE IF EXISTS `cloud_model_has_roles`;

CREATE TABLE `cloud_model_has_roles` (
  `role_id` int(10) unsigned NOT NULL,
  `model_id` int(10) unsigned NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`),
  CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `cloud_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_model_has_roles` */

insert  into `cloud_model_has_roles`(`role_id`,`model_id`,`model_type`) values (1,2,'AppModelsAdminUser');

/*Table structure for table `cloud_operation_logs` */

DROP TABLE IF EXISTS `cloud_operation_logs`;

CREATE TABLE `cloud_operation_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `controller` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `querystring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_logs_controller_action_userid_username_ip_index` (`controller`,`action`,`userid`,`username`,`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_operation_logs` */

insert  into `cloud_operation_logs`(`id`,`controller`,`action`,`querystring`,`method`,`userid`,`username`,`ip`,`created_at`,`updated_at`,`deleted_at`) values (1,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:28:36','2018-01-14 14:28:36',NULL),(2,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:29:59','2018-01-14 14:29:59',NULL),(3,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:30:05','2018-01-14 14:30:05',NULL),(4,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:30:12','2018-01-14 14:30:12',NULL),(5,'App\\Http\\Controllers\\Admin\\CategoryController','update','{\"category\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 14:56:34','2018-01-14 14:56:34',NULL),(6,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:58:26','2018-01-14 14:58:26',NULL),(7,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:58:36','2018-01-14 14:58:36',NULL),(8,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:58:47','2018-01-14 14:58:47',NULL),(9,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:58:53','2018-01-14 14:58:53',NULL),(10,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:59:05','2018-01-14 14:59:05',NULL),(11,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:59:14','2018-01-14 14:59:14',NULL),(12,'App\\Http\\Controllers\\Admin\\CategoryController','update','{\"category\":\"5\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 14:59:24','2018-01-14 14:59:24',NULL),(13,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-14 15:00:22','2018-01-14 15:00:22',NULL),(14,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"31\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 15:00:51','2018-01-14 15:00:51',NULL),(15,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:09:12','2018-01-14 16:09:12',NULL),(16,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:09:35','2018-01-14 16:09:35',NULL),(17,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"33\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 16:09:54','2018-01-14 16:09:54',NULL),(18,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:18:58','2018-01-14 16:18:58',NULL),(19,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:19:36','2018-01-14 16:19:36',NULL),(20,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-14 16:35:50','2018-01-14 16:35:50',NULL),(21,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:53:26','2018-01-14 16:53:26',NULL),(22,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-14 16:53:33','2018-01-14 16:53:33',NULL),(23,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:54:09','2018-01-14 16:54:09',NULL),(24,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-14 16:55:32','2018-01-14 16:55:32',NULL),(25,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:55:40','2018-01-14 16:55:40',NULL),(26,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:39:44','2018-01-14 17:39:44',NULL),(27,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:40:09','2018-01-14 17:40:09',NULL),(28,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:42:12','2018-01-14 17:42:12',NULL),(29,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:51:55','2018-01-14 17:51:55',NULL),(30,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:52:05','2018-01-14 17:52:05',NULL),(31,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:52:36','2018-01-14 17:52:36',NULL),(32,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:54:39','2018-01-14 17:54:39',NULL),(33,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:54:50','2018-01-14 17:54:50',NULL),(34,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:55:05','2018-01-14 17:55:05',NULL),(35,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:58:56','2018-01-14 17:58:56',NULL),(36,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:58:59','2018-01-14 17:58:59',NULL),(37,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:59:13','2018-01-14 17:59:13',NULL),(38,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-14 17:59:38','2018-01-14 17:59:38',NULL),(39,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:59:41','2018-01-14 17:59:41',NULL),(40,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 18:00:24','2018-01-14 18:00:24',NULL),(41,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 18:00:42','2018-01-14 18:00:42',NULL),(42,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 18:01:55','2018-01-14 18:01:55',NULL),(43,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-14 18:02:08','2018-01-14 18:02:08',NULL),(44,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 18:02:16','2018-01-14 18:02:16',NULL);

/*Table structure for table `cloud_password_resets` */

DROP TABLE IF EXISTS `cloud_password_resets`;

CREATE TABLE `cloud_password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_password_resets` */

/*Table structure for table `cloud_permissions` */

DROP TABLE IF EXISTS `cloud_permissions`;

CREATE TABLE `cloud_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '菜单父ID',
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '图标class',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_menu` tinyint(4) NOT NULL DEFAULT '0' COMMENT '是否作为菜单显示,[1|0]',
  `sort` tinyint(4) NOT NULL DEFAULT '0' COMMENT '排序',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_permissions` */

insert  into `cloud_permissions`(`id`,`fid`,`icon`,`name`,`display_name`,`guard_name`,`is_menu`,`sort`,`created_at`,`updated_at`) values (1,0,NULL,'#-1510651486','权限管理','admin',1,10,'2017-11-14 11:23:21','2017-11-14 17:24:46'),(4,1,NULL,'admin.users.index','用户管理','admin',1,5,'2017-11-14 15:07:44','2017-11-14 17:09:02'),(5,1,NULL,'admin.role.index','角色管理','admin',1,5,'2017-11-14 17:09:54','2017-11-14 17:09:54'),(6,1,NULL,'admin.permission.index','权限管理','admin',1,8,'2017-11-14 17:10:23','2017-11-14 17:10:33'),(7,0,NULL,'#-1510650668','系统设置','admin',1,100,'2017-11-14 17:11:08','2017-11-14 17:11:08'),(8,7,NULL,'admin.operationlog.index','操作日志','admin',1,20,'2017-11-14 17:11:50','2017-11-14 17:12:25'),(9,7,NULL,'admin.logs.index','登录日志','admin',1,10,'2017-11-14 17:12:18','2017-11-14 17:12:18'),(10,1,NULL,'admin.users.create','新建用户页面','admin',0,11,'2017-11-14 17:26:34','2017-11-14 17:26:34'),(11,1,NULL,'admin.users.store','保存用户数据','admin',0,12,'2017-11-14 17:27:07','2017-11-14 17:27:07'),(12,1,NULL,'admin.users.edit','编辑用户页面','admin',0,13,'2017-11-14 17:27:28','2017-11-14 17:27:28'),(13,1,NULL,'admin.users.update','更新用户数据','admin',0,14,'2017-11-14 17:27:50','2017-11-14 17:27:50'),(14,1,NULL,'admin.users.destroy','删除用户','admin',0,15,'2017-11-14 17:28:44','2017-11-14 17:28:44'),(15,1,NULL,'admin.users.destroy.all','批量删除用户','admin',0,16,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(16,1,NULL,'admin.role.create','新建角色','admin',0,17,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(17,1,NULL,'admin.role.store','保存角色数据','admin',0,18,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(18,1,NULL,'admin.role.edit','编辑角色页面','admin',0,19,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(19,1,NULL,'admin.role.edit','更新角色数据','admin',0,20,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(20,1,NULL,'admin.role.destroy','删除角色','admin',0,21,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(21,1,NULL,'admin.role.destroy.all','批量删除角色','admin',0,22,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(22,1,NULL,'admin.permission.create','新建权限页面','admin',0,23,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(23,1,NULL,'admin.permission.store','保存权限数据','admin',0,24,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(24,1,NULL,'admin.permission.edit','编辑权限页面','admin',0,25,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(25,1,NULL,'admin.permission.update','更新权限数据','admin',0,26,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(26,1,NULL,'admin.permission.destroy','删除权限','admin',0,27,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(27,1,NULL,'admin.permission.destroy.all','批量删除权限','admin',0,28,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(30,0,NULL,'admin.home','控制台','admin',1,0,'2017-11-19 15:45:20','2017-11-19 15:45:20'),(31,0,NULL,'admin.category.index','类别管理','admin',1,5,'2018-01-14 15:00:22','2018-01-14 15:00:51'),(32,0,NULL,'#-1515917352','课程管理','admin',1,1,'2018-01-14 16:09:12','2018-01-14 16:09:12'),(33,32,NULL,'admin.course.index','课程列表','admin',1,1,'2018-01-14 16:09:35','2018-01-14 16:09:54');

/*Table structure for table `cloud_role_has_permissions` */

DROP TABLE IF EXISTS `cloud_role_has_permissions`;

CREATE TABLE `cloud_role_has_permissions` (
  `permission_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `role_has_permissions_role_id_foreign` (`role_id`),
  CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `cloud_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `cloud_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_role_has_permissions` */

/*Table structure for table `cloud_roles` */

DROP TABLE IF EXISTS `cloud_roles`;

CREATE TABLE `cloud_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_roles` */

insert  into `cloud_roles`(`id`,`name`,`display_name`,`guard_name`,`created_at`,`updated_at`) values (1,'admin','高级管理员','admin','2017-11-19 15:34:59','2017-11-19 15:34:59');

/*Table structure for table `cloud_users` */

DROP TABLE IF EXISTS `cloud_users`;

CREATE TABLE `cloud_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '品类',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `belong_to` int(11) NOT NULL COMMENT '该用户提交的项目提交的审核人',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_users` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;