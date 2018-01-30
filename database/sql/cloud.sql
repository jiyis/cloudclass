/*
SQLyog v10.2 
MySQL - 5.7.21-0ubuntu0.16.04.1 : Database - cloud
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

insert  into `cloud_admin_users`(`id`,`name`,`nickname`,`email`,`password`,`ip`,`last_login_at`,`is_super`,`status`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values (1,'admin','管理员','admin@admin.com','$2y$10$dunZeG22ZPwu.lmDJy9ZWOu7qiudT5iQ5VnGJmmPVp9387y7WU5HC','127.0.0.1',NULL,1,1,'85vu3DMfCLAdA4omAU530lbYALNk9GJUuN3SfV7HOuVoKtr1OFip0Nuw5Lo4','2016-06-02 07:33:41','2018-01-14 18:13:29',NULL);

/*Table structure for table `cloud_banner` */

DROP TABLE IF EXISTS `cloud_banner`;

CREATE TABLE `cloud_banner` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '标题',
  `titlepic` text COLLATE utf8mb4_unicode_ci COMMENT '缩略图片',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT 'banner简介',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_banner` */

insert  into `cloud_banner`(`id`,`title`,`titlepic`,`description`,`created_at`,`updated_at`,`deleted_at`) values (1,'banner1','uploads/files/20180121/1516519131Oz2.jpg','<p>sadsda&nbsp;</p>','2018-01-17 16:25:54','2018-01-21 15:18:54',NULL),(2,'banner2','uploads/files/20180121/1516519145I1f.jpg','<p>22</p>','2018-01-21 15:19:09','2018-01-21 15:19:09',NULL),(3,'banner3','uploads/files/20180121/1516519156z9b.png','<p>333</p>','2018-01-21 15:19:19','2018-01-21 15:19:19',NULL),(4,'banner4','uploads/files/20180129/1517209336Ei2.jpg','<p>111</p>','2018-01-29 14:51:51','2018-01-29 15:02:18',NULL);

/*Table structure for table `cloud_category` */

DROP TABLE IF EXISTS `cloud_category`;

CREATE TABLE `cloud_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '分类类型：1、使用年龄 2、STEM侧重 3、价格类型',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '名称',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'url',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_name_type_index` (`name`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_category` */

insert  into `cloud_category`(`id`,`type`,`name`,`url`,`created_at`,`updated_at`,`deleted_at`) values (1,'1','幼儿园','','2018-01-14 14:28:36','2018-01-14 14:28:36',NULL),(2,'1','小学','','2018-01-14 14:29:59','2018-01-14 14:29:59',NULL),(3,'1','初中','','2018-01-14 14:30:05','2018-01-14 14:30:05',NULL),(4,'1','高中','','2018-01-14 14:30:12','2018-01-14 14:30:12',NULL),(5,'2','科学','','2018-01-14 14:58:26','2018-01-14 14:59:24',NULL),(6,'2','技术','','2018-01-14 14:58:36','2018-01-14 14:58:36',NULL),(7,'2','工程','','2018-01-14 14:58:47','2018-01-14 14:58:47',NULL),(8,'2','数学','','2018-01-14 14:58:53','2018-01-14 14:58:53',NULL),(9,'3','免费课程','','2018-01-14 14:59:05','2018-01-14 14:59:05',NULL),(10,'3','付费课程','','2018-01-14 14:59:14','2018-01-14 14:59:14',NULL),(11,'4','新闻资讯','news','2018-01-16 16:49:04','2018-01-18 15:01:23',NULL),(12,'4','行业新闻','industry','2018-01-26 10:42:54','2018-01-26 10:42:54',NULL),(13,'4','专题报道','seminar','2018-01-26 10:44:09','2018-01-26 10:44:09',NULL);

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

insert  into `cloud_category_has_class`(`category_id`,`class_id`) values (1,1),(2,1),(6,1),(7,1),(9,1),(4,2),(7,2),(10,2),(3,3),(5,3),(9,3),(2,4),(6,4),(10,4),(1,5),(3,5),(6,5),(8,5),(10,5);

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
  `teacher_id` int(11) NOT NULL COMMENT '主讲老师',
  `click` int(11) NOT NULL DEFAULT '0' COMMENT '点击数',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `class_name_period_minute_click_updated_at_index` (`name`,`period`,`minute`,`click`,`updated_at`,`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_class` */

insert  into `cloud_class`(`id`,`name`,`period`,`minute`,`titlepic`,`description`,`target`,`syllabus`,`content`,`teacher_id`,`click`,`created_at`,`updated_at`,`deleted_at`) values (1,'十大大师',1,2,'uploads/files/20180114/1515923978qZ3.png','<p style=\"white-space: normal;\">IoC（Inversion of Control）译为 「控制反转」，也被叫做「依赖注入」(DI)。什么是「控制反转」？对象 A 功能依赖于对象 B，但是控制权由对象 A 来控制，控制权被颠倒，所以叫做「控制反转」，而「依赖注入」是实现 IoC 的方法，就是由 IoC 容器在运行期间，动态地将某种依赖关系注入到对象之中。</p><p style=\"white-space: normal;\">其作用简单来讲就是利用依赖关系注入的方式，把复杂的应用程序分解为互相合作的对象，从而降低解决问题的复杂度，实现应用程序代码的低耦合、高扩展。</p><p style=\"white-space: normal;\">Laravel 中的服务容器是用于管理类的依赖和执行依赖注入的工具。</p><p><br/></p>','<p style=\"white-space: normal;\">IoC（Inversion of Control）译为 「控制反转」，也被叫做「依赖注入」(DI)。什么是「控制反转」？对象 A 功能依赖于对象 B，但是控制权由对象 A 来控制，控制权被颠倒，所以叫做「控制反转」，而「依赖注入」是实现 IoC 的方法，就是由 IoC 容器在运行期间，动态地将某种依赖关系注入到对象之中。</p><p style=\"white-space: normal;\">其作用简单来讲就是利用依赖关系注入的方式，把复杂的应用程序分解为互相合作的对象，从而降低解决问题的复杂度，实现应用程序代码的低耦合、高扩展。</p><p style=\"white-space: normal;\">Laravel 中的服务容器是用于管理类的依赖和执行依赖注入的工具。</p><p><br/></p>','<p style=\"white-space: normal;\">IoC（Inversion of Control）译为 「控制反转」，也被叫做「依赖注入」(DI)。什么是「控制反转」？对象 A 功能依赖于对象 B，但是控制权由对象 A 来控制，控制权被颠倒，所以叫做「控制反转」，而「依赖注入」是实现 IoC 的方法，就是由 IoC 容器在运行期间，动态地将某种依赖关系注入到对象之中。</p><p style=\"white-space: normal;\">其作用简单来讲就是利用依赖关系注入的方式，把复杂的应用程序分解为互相合作的对象，从而降低解决问题的复杂度，实现应用程序代码的低耦合、高扩展。</p><p style=\"white-space: normal;\">Laravel 中的服务容器是用于管理类的依赖和执行依赖注入的工具。</p><p><br/></p>','<p>Laravel 作为现在最流行的 PHP 框架，其中的知识较多，所以单独拿出来写一篇。</p><ul class=\" list-paddingleft-2\"><li><p>简述 Laravel 的生命周期</p></li></ul><blockquote><p>Laravel 采用了单一入口模式，应用的所有请求入口都是 public/index.php 文件。</p><ol class=\" list-paddingleft-2\"><li><p>注册类文件自动加载器 : Laravel通过 composer 进行依赖管理，无需开发者手动导入各种类文件，而由自动加载器自行导入。</p></li><li><p>创建服务容器：从 bootstrap/app.php 文件中取得 Laravel 应用实例 $app (服务容器)</p></li><li><p>创建 HTTP / Console 内核：传入的请求会被发送给 HTTP 内核或者 console 内核进行处理</p></li><li><p>载入服务提供者至容器：<br/>在内核引导启动的过程中最重要的动作之一就是载入服务提供者到你的应用，服务提供者负责引导启动框架的全部各种组件，例如数据库、队列、验证器以及路由组件。</p></li><li><p>分发请求：一旦应用完成引导和所有服务提供者都注册完成，Request 将会移交给路由进行分发。路由将分发请求给一个路由或控制器，同时运行路由指定的中间件</p></li></ol></blockquote><ul class=\" list-paddingleft-2\"><li><p>服务提供者是什么？</p></li></ul><blockquote><p>服务提供者是所有 Laravel 应用程序引导启动的中心, Laravel 的核心服务器、注册服务容器绑定、事件监听、中间件、路由注册以及我们的应用程序都是由服务提供者引导启动的。</p></blockquote><ul class=\" list-paddingleft-2\"><li><p>IoC 容器是什么？</p></li></ul><blockquote><p>IoC（Inversion of Control）译为 「控制反转」，也被叫做「依赖注入」(DI)。什么是「控制反转」？对象 A \r\n功能依赖于对象 B，但是控制权由对象 A 来控制，控制权被颠倒，所以叫做「控制反转」，而「依赖注入」是实现 IoC 的方法，就是由 IoC \r\n容器在运行期间，动态地将某种依赖关系注入到对象之中。</p><p>其作用简单来讲就是利用依赖关系注入的方式，把复杂的应用程序分解为互相合作的对象，从而降低解决问题的复杂度，实现应用程序代码的低耦合、高扩展。</p><p>Laravel 中的服务容器是用于管理类的依赖和执行依赖注入的工具。</p></blockquote><ul class=\" list-paddingleft-2\"><li><p>Facades 是什么？</p></li></ul><blockquote><p>Facades（一种设计模式，通常翻译为外观模式）提供了一个&quot;static&quot;（静态）接口去访问注册到 IoC 容器中的类。提供了简单、易记的语法，而无需记住必须手动注入或配置的长长的类名。此外，由于对 PHP 动态方法的独特用法，也使测试起来非常容易。</p></blockquote><p><br/></p>',1,6,'2018-01-14 17:59:41','2018-01-29 14:37:57',NULL),(2,'涂鸦跳跃',67,7,'uploads/files/20180114/1515924128u6L.png','<p>return</p>','<p>儿童</p>','<p>特</p>','<p>return</p>',1,5,'2018-01-14 18:02:16','2018-01-17 17:56:49',NULL),(3,'432324',324324,342342,'uploads/files/20180115/1516000070AeH.png','<p>342</p>','<p>342</p>','<p>342</p>','<p>324</p>',0,4,'2018-01-15 13:20:47','2018-01-15 15:08:08',NULL),(4,'21',1,2,'uploads/files/20180115/15159936583C9.png','<p>1</p>','<p>1</p>','<p>1</p>','<p>1</p>',1,3,'2018-01-15 13:21:04','2018-01-29 18:15:41',NULL),(5,'风格的广泛的发的',34,32,'uploads/files/20180115/1515993673U1L.png',NULL,NULL,NULL,NULL,0,2,'2018-01-15 13:21:22','2018-01-15 13:21:22',NULL);

/*Table structure for table `cloud_lists` */

DROP TABLE IF EXISTS `cloud_lists`;

CREATE TABLE `cloud_lists` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章标题',
  `category` int(11) NOT NULL COMMENT '文章所属栏目',
  `titlepic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章标题图片',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章简介',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章内容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_lists` */

insert  into `cloud_lists`(`id`,`title`,`category`,`titlepic`,`description`,`content`,`created_at`,`updated_at`,`deleted_at`) values (1,'撒旦',11,'uploads/files/20180116/15161020569gu.png','<p>大师</p>','<p>大师</p>','2018-01-16 19:27:38','2018-01-16 19:27:38',NULL),(2,'453345',11,'uploads/files/20180118/1516259153yWK.png','<p>35434534534</p>','<p>345</p>','2018-01-18 15:05:59','2018-01-18 15:05:59',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_logs` */

insert  into `cloud_logs`(`id`,`userid`,`username`,`httpuseragent`,`sessionid`,`ip`,`created_at`,`updated_at`,`deleted_at`) values (1,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','gzTWsoYwGRolaSAVP8RWDniq0670s7kcm1DXcl5G','127.0.0.1','2018-01-14 18:13:29','2018-01-14 18:13:29',NULL),(2,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','oluDYCfai7pDTPhMnmWhFMXBCjx0f5sRECpUOD6C','127.0.0.1','2018-01-15 11:16:15','2018-01-15 11:16:15',NULL),(3,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','hvKT9HPJoyW5XdbqSsQ8upD4j6wEW151eX3rLGYL','127.0.0.1','2018-01-16 14:21:02','2018-01-16 14:21:02',NULL),(4,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','h1Ka0fRV6GxgGdAmvYhZyZLxF1kJq1vJb0hhWOjr','127.0.0.1','2018-01-16 14:25:44','2018-01-16 14:25:44',NULL),(5,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','p5fGdCR30AT5nd8BMOZh4VA86iAlrUOeSSJVc9og','127.0.0.1','2018-01-16 16:28:52','2018-01-16 16:28:52',NULL),(6,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','tQpc5l1oqCunmoswMDnvSQeMRRzBg2CH9YfYpY1r','127.0.0.1','2018-01-16 16:29:22','2018-01-16 16:29:22',NULL),(7,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','CM2Z0YJW42vr5WYjjxEtpVn4NVbpAb2oEpwuWQLD','127.0.0.1','2018-01-16 19:02:41','2018-01-16 19:02:41',NULL),(8,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','V5lfqn3YvApAU1iPNU7KQesSaFCinjO3oWoDaMo6','127.0.0.1','2018-01-17 10:47:49','2018-01-17 10:47:49',NULL),(9,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','UPvvIyETqu40KQGlJmr4uZKig1LcuZsVCrt6Ccqg','127.0.0.1','2018-01-18 10:27:59','2018-01-18 10:27:59',NULL),(10,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','XSctMEuo1WUrSEL7ZCyFAKLVfrtU88fftSBGs72L','127.0.0.1','2018-01-18 15:01:01','2018-01-18 15:01:01',NULL),(11,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','uO67vg5ObP5h63OqQIIZpZxWy1mRETfEkAWuwmS3','127.0.0.1','2018-01-21 15:18:31','2018-01-21 15:18:31',NULL),(12,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','7FTTmwJQ8KKxO88pYGAf9Sq96NwlgxR2sL9sOqvd','127.0.0.1','2018-01-21 17:39:11','2018-01-21 17:39:11',NULL),(13,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','SI2dtIDkPfmEjSJJOO6KC8XtPc41HSUo8FX8uNss','127.0.0.1','2018-01-25 15:57:08','2018-01-25 15:57:08',NULL),(14,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','hr8dGyKOgweHdSEkF1Sw5IIxJLmuRAKHdeV0YrAN','127.0.0.1','2018-01-26 10:41:16','2018-01-26 10:41:16',NULL),(15,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','REVI4hJ2kb35b3j2szekOaJ7BlAlgS5TOvQbhFa1','127.0.0.1','2018-01-26 13:33:53','2018-01-26 13:33:53',NULL),(16,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','tK4VnbKkGwP0qrgrD0StKEIWnqf0DHyvWcG9J2nq','127.0.0.1','2018-01-29 14:37:23','2018-01-29 14:37:23',NULL),(17,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','HhbaFcMGeWRrxpVcbHuyR6gMLVxD9ty5kmXM4sie','127.0.0.1','2018-01-29 18:15:24','2018-01-29 18:15:24',NULL),(18,1,'admin','Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.108 Safari/537.36','e1GHciKYT4stXwt3dlpIbbfbkIJ03I2jC2TUCGcB','127.0.0.1','2018-01-30 14:00:19','2018-01-30 14:00:19',NULL);

/*Table structure for table `cloud_member_has_courses` */

DROP TABLE IF EXISTS `cloud_member_has_courses`;

CREATE TABLE `cloud_member_has_courses` (
  `user_id` int(10) unsigned NOT NULL,
  `class_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`class_id`),
  KEY `member_has_courses_class_id_foreign` (`class_id`),
  CONSTRAINT `member_has_courses_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `cloud_class` (`id`) ON DELETE CASCADE,
  CONSTRAINT `member_has_courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `cloud_users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_member_has_courses` */

insert  into `cloud_member_has_courses`(`user_id`,`class_id`) values (1,2),(1,4);

/*Table structure for table `cloud_migrations` */

DROP TABLE IF EXISTS `cloud_migrations`;

CREATE TABLE `cloud_migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_migrations` */

insert  into `cloud_migrations`(`id`,`migration`,`batch`) values (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2017_11_11_121050_create_permission_tables',1),(4,'2017_11_14_170525_create_log_tables',1),(5,'2018_01_13_132703_create_class_table',1),(6,'2018_01_14_131549_create_category_table',1),(7,'2018_01_15_132503_create_member_has_courses_table',2),(8,'2018_01_16_162957_create_pages_table',3),(9,'2018_01_16_163242_create_lists_table',3),(10,'2018_01_17_114336_create_teacher_table',4),(12,'2018_01_17_153934_create_banner_table',5);

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
) ENGINE=InnoDB AUTO_INCREMENT=234 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_operation_logs` */

insert  into `cloud_operation_logs`(`id`,`controller`,`action`,`querystring`,`method`,`userid`,`username`,`ip`,`created_at`,`updated_at`,`deleted_at`) values (1,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:28:36','2018-01-14 14:28:36',NULL),(2,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:29:59','2018-01-14 14:29:59',NULL),(3,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:30:05','2018-01-14 14:30:05',NULL),(4,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:30:12','2018-01-14 14:30:12',NULL),(5,'App\\Http\\Controllers\\Admin\\CategoryController','update','{\"category\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 14:56:34','2018-01-14 14:56:34',NULL),(6,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:58:26','2018-01-14 14:58:26',NULL),(7,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:58:36','2018-01-14 14:58:36',NULL),(8,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:58:47','2018-01-14 14:58:47',NULL),(9,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:58:53','2018-01-14 14:58:53',NULL),(10,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:59:05','2018-01-14 14:59:05',NULL),(11,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-14 14:59:14','2018-01-14 14:59:14',NULL),(12,'App\\Http\\Controllers\\Admin\\CategoryController','update','{\"category\":\"5\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 14:59:24','2018-01-14 14:59:24',NULL),(13,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-14 15:00:22','2018-01-14 15:00:22',NULL),(14,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"31\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 15:00:51','2018-01-14 15:00:51',NULL),(15,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:09:12','2018-01-14 16:09:12',NULL),(16,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:09:35','2018-01-14 16:09:35',NULL),(17,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"33\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 16:09:54','2018-01-14 16:09:54',NULL),(18,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:18:58','2018-01-14 16:18:58',NULL),(19,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:19:36','2018-01-14 16:19:36',NULL),(20,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-14 16:35:50','2018-01-14 16:35:50',NULL),(21,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:53:26','2018-01-14 16:53:26',NULL),(22,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-14 16:53:33','2018-01-14 16:53:33',NULL),(23,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:54:09','2018-01-14 16:54:09',NULL),(24,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-14 16:55:32','2018-01-14 16:55:32',NULL),(25,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 16:55:40','2018-01-14 16:55:40',NULL),(26,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:39:44','2018-01-14 17:39:44',NULL),(27,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:40:09','2018-01-14 17:40:09',NULL),(28,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:42:12','2018-01-14 17:42:12',NULL),(29,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:51:55','2018-01-14 17:51:55',NULL),(30,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:52:05','2018-01-14 17:52:05',NULL),(31,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:52:36','2018-01-14 17:52:36',NULL),(32,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:54:39','2018-01-14 17:54:39',NULL),(33,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:54:50','2018-01-14 17:54:50',NULL),(34,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:55:05','2018-01-14 17:55:05',NULL),(35,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:58:56','2018-01-14 17:58:56',NULL),(36,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:58:59','2018-01-14 17:58:59',NULL),(37,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:59:13','2018-01-14 17:59:13',NULL),(38,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-14 17:59:38','2018-01-14 17:59:38',NULL),(39,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 17:59:41','2018-01-14 17:59:41',NULL),(40,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 18:00:24','2018-01-14 18:00:24',NULL),(41,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 18:00:42','2018-01-14 18:00:42',NULL),(42,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-14 18:01:55','2018-01-14 18:01:55',NULL),(43,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-14 18:02:08','2018-01-14 18:02:08',NULL),(44,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-14 18:02:16','2018-01-14 18:02:16',NULL),(45,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-15 11:21:12','2018-01-15 11:21:12',NULL),(46,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-15 11:21:32','2018-01-15 11:21:32',NULL),(47,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-15 13:20:33','2018-01-15 13:20:33',NULL),(48,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-15 13:20:47','2018-01-15 13:20:47',NULL),(49,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-15 13:20:58','2018-01-15 13:20:58',NULL),(50,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-15 13:21:04','2018-01-15 13:21:04',NULL),(51,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-15 13:21:13','2018-01-15 13:21:13',NULL),(52,'App\\Http\\Controllers\\Admin\\CourseController','store','','POST',1,'admin','127.0.0.1','2018-01-15 13:21:22','2018-01-15 13:21:22',NULL),(53,'App\\Http\\Controllers\\Admin\\MemberController','store','','POST',1,'admin','127.0.0.1','2018-01-15 13:21:55','2018-01-15 13:21:55',NULL),(54,'App\\Http\\Controllers\\Admin\\MemberController','store','','POST',1,'admin','127.0.0.1','2018-01-15 13:24:12','2018-01-15 13:24:12',NULL),(55,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:30:12','2018-01-15 13:30:12',NULL),(56,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:30:51','2018-01-15 13:30:51',NULL),(57,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:31:39','2018-01-15 13:31:39',NULL),(58,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:31:55','2018-01-15 13:31:55',NULL),(59,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:32:01','2018-01-15 13:32:01',NULL),(60,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:32:13','2018-01-15 13:32:13',NULL),(61,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:32:19','2018-01-15 13:32:19',NULL),(62,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:32:23','2018-01-15 13:32:23',NULL),(63,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:32:41','2018-01-15 13:32:41',NULL),(64,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:32:49','2018-01-15 13:32:49',NULL),(65,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:33:09','2018-01-15 13:33:09',NULL),(66,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:33:16','2018-01-15 13:33:16',NULL),(67,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:34:07','2018-01-15 13:34:07',NULL),(68,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 13:37:04','2018-01-15 13:37:04',NULL),(69,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-15 15:04:48','2018-01-15 15:04:48',NULL),(70,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"3\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 15:04:52','2018-01-15 15:04:52',NULL),(71,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"3\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 15:05:35','2018-01-15 15:05:35',NULL),(72,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-15 15:05:44','2018-01-15 15:05:44',NULL),(73,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"3\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 15:05:47','2018-01-15 15:05:47',NULL),(74,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-15 15:06:30','2018-01-15 15:06:30',NULL),(75,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-15 15:07:50','2018-01-15 15:07:50',NULL),(76,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"3\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 15:08:08','2018-01-15 15:08:08',NULL),(77,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-15 15:09:36','2018-01-15 15:09:36',NULL),(78,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-16 16:49:04','2018-01-16 16:49:04',NULL),(79,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-16 19:03:18','2018-01-16 19:03:18',NULL),(80,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-16 19:03:41','2018-01-16 19:03:41',NULL),(81,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-16 19:04:01','2018-01-16 19:04:01',NULL),(82,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-16 19:04:11','2018-01-16 19:04:11',NULL),(83,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-16 19:11:58','2018-01-16 19:11:58',NULL),(84,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-16 19:12:20','2018-01-16 19:12:20',NULL),(85,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-16 19:13:17','2018-01-16 19:13:17',NULL),(86,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-16 19:14:53','2018-01-16 19:14:53',NULL),(87,'App\\Http\\Controllers\\Admin\\PageController','update','{\"page\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-16 19:16:49','2018-01-16 19:16:49',NULL),(88,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-16 19:24:21','2018-01-16 19:24:21',NULL),(89,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-16 19:25:00','2018-01-16 19:25:00',NULL),(90,'App\\Http\\Controllers\\Admin\\ListController','store','','POST',1,'admin','127.0.0.1','2018-01-16 19:26:16','2018-01-16 19:26:16',NULL),(91,'App\\Http\\Controllers\\Admin\\ListController','store','','POST',1,'admin','127.0.0.1','2018-01-16 19:26:35','2018-01-16 19:26:35',NULL),(92,'App\\Http\\Controllers\\Admin\\ListController','store','','POST',1,'admin','127.0.0.1','2018-01-16 19:27:07','2018-01-16 19:27:07',NULL),(93,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-16 19:27:36','2018-01-16 19:27:36',NULL),(94,'App\\Http\\Controllers\\Admin\\ListController','store','','POST',1,'admin','127.0.0.1','2018-01-16 19:27:38','2018-01-16 19:27:38',NULL),(95,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 11:41:35','2018-01-17 11:41:35',NULL),(96,'App\\Http\\Controllers\\Admin\\PageController','update','{\"page\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 11:41:37','2018-01-17 11:41:37',NULL),(97,'App\\Http\\Controllers\\Admin\\PageController','update','{\"page\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 11:42:02','2018-01-17 11:42:02',NULL),(98,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 11:43:06','2018-01-17 11:43:06',NULL),(99,'App\\Http\\Controllers\\Admin\\PageController','update','{\"page\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 11:43:08','2018-01-17 11:43:08',NULL),(100,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-17 13:31:14','2018-01-17 13:31:14',NULL),(101,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"39\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 13:31:25','2018-01-17 13:31:25',NULL),(102,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 13:46:25','2018-01-17 13:46:25',NULL),(103,'App\\Http\\Controllers\\Admin\\TeacherController','store','','POST',1,'admin','127.0.0.1','2018-01-17 13:46:28','2018-01-17 13:46:28',NULL),(104,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 14:00:24','2018-01-17 14:00:24',NULL),(105,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 15:24:07','2018-01-17 15:24:07',NULL),(106,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 15:26:26','2018-01-17 15:26:26',NULL),(107,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 15:26:26','2018-01-17 15:26:26',NULL),(108,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 15:27:26','2018-01-17 15:27:26',NULL),(109,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 15:27:26','2018-01-17 15:27:26',NULL),(110,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 15:27:26','2018-01-17 15:27:26',NULL),(111,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 15:27:26','2018-01-17 15:27:26',NULL),(112,'App\\Http\\Controllers\\Admin\\PermissionController','store','','POST',1,'admin','127.0.0.1','2018-01-17 15:51:35','2018-01-17 15:51:35',NULL),(113,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"40\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 15:51:55','2018-01-17 15:51:55',NULL),(114,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"40\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 15:52:31','2018-01-17 15:52:31',NULL),(115,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"40\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 15:55:41','2018-01-17 15:55:41',NULL),(116,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"40\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 16:01:02','2018-01-17 16:01:02',NULL),(117,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"40\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 16:03:21','2018-01-17 16:03:21',NULL),(118,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:21:32','2018-01-17 16:21:32',NULL),(119,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:21:32','2018-01-17 16:21:32',NULL),(120,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:21:32','2018-01-17 16:21:32',NULL),(121,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:21:32','2018-01-17 16:21:32',NULL),(122,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:21:32','2018-01-17 16:21:32',NULL),(123,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:21:33','2018-01-17 16:21:33',NULL),(124,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:22:25','2018-01-17 16:22:25',NULL),(125,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:22:25','2018-01-17 16:22:25',NULL),(126,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:22:25','2018-01-17 16:22:25',NULL),(127,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:22:25','2018-01-17 16:22:25',NULL),(128,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:22:25','2018-01-17 16:22:25',NULL),(129,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:22:25','2018-01-17 16:22:25',NULL),(130,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:22:25','2018-01-17 16:22:25',NULL),(131,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:22:26','2018-01-17 16:22:26',NULL),(132,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:22:26','2018-01-17 16:22:26',NULL),(133,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:22:26','2018-01-17 16:22:26',NULL),(134,'App\\Http\\Controllers\\Admin\\BannerController','store','','POST',1,'admin','127.0.0.1','2018-01-17 16:22:34','2018-01-17 16:22:34',NULL),(135,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:23:29','2018-01-17 16:23:29',NULL),(136,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:23:29','2018-01-17 16:23:29',NULL),(137,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:23:29','2018-01-17 16:23:29',NULL),(138,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:23:29','2018-01-17 16:23:29',NULL),(139,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:23:29','2018-01-17 16:23:29',NULL),(140,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:23:29','2018-01-17 16:23:29',NULL),(141,'App\\Http\\Controllers\\Admin\\BannerController','store','','POST',1,'admin','127.0.0.1','2018-01-17 16:23:34','2018-01-17 16:23:34',NULL),(142,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:26','2018-01-17 16:24:26',NULL),(143,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:26','2018-01-17 16:24:26',NULL),(144,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:27','2018-01-17 16:24:27',NULL),(145,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:27','2018-01-17 16:24:27',NULL),(146,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:27','2018-01-17 16:24:27',NULL),(147,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:27','2018-01-17 16:24:27',NULL),(148,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:27','2018-01-17 16:24:27',NULL),(149,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:27','2018-01-17 16:24:27',NULL),(150,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:27','2018-01-17 16:24:27',NULL),(151,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:27','2018-01-17 16:24:27',NULL),(152,'App\\Http\\Controllers\\Admin\\BannerController','store','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:31','2018-01-17 16:24:31',NULL),(153,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:46','2018-01-17 16:24:46',NULL),(154,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:46','2018-01-17 16:24:46',NULL),(155,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:47','2018-01-17 16:24:47',NULL),(156,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:47','2018-01-17 16:24:47',NULL),(157,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:47','2018-01-17 16:24:47',NULL),(158,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:47','2018-01-17 16:24:47',NULL),(159,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:47','2018-01-17 16:24:47',NULL),(160,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:47','2018-01-17 16:24:47',NULL),(161,'App\\Http\\Controllers\\Admin\\BannerController','store','','POST',1,'admin','127.0.0.1','2018-01-17 16:24:49','2018-01-17 16:24:49',NULL),(162,'App\\Http\\Controllers\\Admin\\BannerController','store','','POST',1,'admin','127.0.0.1','2018-01-17 16:25:05','2018-01-17 16:25:05',NULL),(163,'App\\Http\\Controllers\\Admin\\BannerController','store','','POST',1,'admin','127.0.0.1','2018-01-17 16:25:54','2018-01-17 16:25:54',NULL),(164,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:40:00','2018-01-17 16:40:00',NULL),(165,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:40:28','2018-01-17 16:40:28',NULL),(166,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:40:28','2018-01-17 16:40:28',NULL),(167,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:40:28','2018-01-17 16:40:28',NULL),(168,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:40:28','2018-01-17 16:40:28',NULL),(169,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:40:29','2018-01-17 16:40:29',NULL),(170,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:40:29','2018-01-17 16:40:29',NULL),(171,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:40:29','2018-01-17 16:40:29',NULL),(172,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:40:29','2018-01-17 16:40:29',NULL),(173,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:40:29','2018-01-17 16:40:29',NULL),(174,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:40:29','2018-01-17 16:40:29',NULL),(175,'App\\Http\\Controllers\\Admin\\BannerController','update','{\"banner\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 16:40:34','2018-01-17 16:40:34',NULL),(176,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:46:52','2018-01-17 16:46:52',NULL),(177,'App\\Http\\Controllers\\Admin\\BannerController','update','{\"banner\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 16:47:02','2018-01-17 16:47:02',NULL),(178,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-17 16:52:35','2018-01-17 16:52:35',NULL),(179,'App\\Http\\Controllers\\Admin\\BannerController','update','{\"banner\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 16:52:37','2018-01-17 16:52:37',NULL),(180,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"2\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 17:56:40','2018-01-17 17:56:40',NULL),(181,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"2\"}','PATCH',1,'admin','127.0.0.1','2018-01-17 17:56:49','2018-01-17 17:56:49',NULL),(182,'App\\Http\\Controllers\\Admin\\PermissionController','update','{\"permission\":\"40\"}','PATCH',1,'admin','127.0.0.1','2018-01-18 10:29:34','2018-01-18 10:29:34',NULL),(183,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-18 10:31:18','2018-01-18 10:31:18',NULL),(184,'App\\Http\\Controllers\\Admin\\BannerController','update','{\"banner\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-18 10:31:24','2018-01-18 10:31:24',NULL),(185,'App\\Http\\Controllers\\Admin\\BannerController','update','{\"banner\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-18 10:31:43','2018-01-18 10:31:43',NULL),(186,'App\\Http\\Controllers\\Admin\\CategoryController','update','{\"category\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-18 15:01:08','2018-01-18 15:01:08',NULL),(187,'App\\Http\\Controllers\\Admin\\CategoryController','update','{\"category\":\"11\"}','PATCH',1,'admin','127.0.0.1','2018-01-18 15:01:23','2018-01-18 15:01:23',NULL),(188,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-18 15:05:53','2018-01-18 15:05:53',NULL),(189,'App\\Http\\Controllers\\Admin\\ListController','store','','POST',1,'admin','127.0.0.1','2018-01-18 15:05:59','2018-01-18 15:05:59',NULL),(190,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-18 15:21:47','2018-01-18 15:21:47',NULL),(191,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-18 15:25:02','2018-01-18 15:25:02',NULL),(192,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-21 15:18:51','2018-01-21 15:18:51',NULL),(193,'App\\Http\\Controllers\\Admin\\BannerController','update','{\"banner\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-21 15:18:54','2018-01-21 15:18:54',NULL),(194,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-21 15:19:05','2018-01-21 15:19:05',NULL),(195,'App\\Http\\Controllers\\Admin\\BannerController','store','','POST',1,'admin','127.0.0.1','2018-01-21 15:19:08','2018-01-21 15:19:08',NULL),(196,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-21 15:19:16','2018-01-21 15:19:16',NULL),(197,'App\\Http\\Controllers\\Admin\\BannerController','store','','POST',1,'admin','127.0.0.1','2018-01-21 15:19:19','2018-01-21 15:19:19',NULL),(198,'App\\Http\\Controllers\\Admin\\PageController','update','{\"page\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-25 16:01:15','2018-01-25 16:01:15',NULL),(199,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-25 16:02:04','2018-01-25 16:02:04',NULL),(200,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-25 16:02:31','2018-01-25 16:02:31',NULL),(201,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-25 16:03:05','2018-01-25 16:03:05',NULL),(202,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-25 16:03:07','2018-01-25 16:03:07',NULL),(203,'App\\Http\\Controllers\\Admin\\PageController','update','{\"page\":\"2\"}','PATCH',1,'admin','127.0.0.1','2018-01-25 16:03:17','2018-01-25 16:03:17',NULL),(204,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-25 16:03:31','2018-01-25 16:03:31',NULL),(205,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-25 16:03:48','2018-01-25 16:03:48',NULL),(206,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-25 16:04:24','2018-01-25 16:04:24',NULL),(207,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-25 16:04:36','2018-01-25 16:04:36',NULL),(208,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-25 16:04:52','2018-01-25 16:04:52',NULL),(209,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-25 16:05:09','2018-01-25 16:05:09',NULL),(210,'App\\Http\\Controllers\\Admin\\PageController','update','{\"page\":\"2\"}','PATCH',1,'admin','127.0.0.1','2018-01-25 16:23:09','2018-01-25 16:23:09',NULL),(211,'App\\Http\\Controllers\\Admin\\PageController','update','{\"page\":\"3\"}','PATCH',1,'admin','127.0.0.1','2018-01-25 16:23:26','2018-01-25 16:23:26',NULL),(212,'App\\Http\\Controllers\\Admin\\PageController','update','{\"page\":\"4\"}','PATCH',1,'admin','127.0.0.1','2018-01-25 16:23:40','2018-01-25 16:23:40',NULL),(213,'App\\Http\\Controllers\\Admin\\PageController','update','{\"page\":\"5\"}','PATCH',1,'admin','127.0.0.1','2018-01-25 16:23:49','2018-01-25 16:23:49',NULL),(214,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-25 17:04:36','2018-01-25 17:04:36',NULL),(215,'App\\Http\\Controllers\\Admin\\PageController','update','{\"page\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-25 17:04:42','2018-01-25 17:04:42',NULL),(216,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-26 10:42:54','2018-01-26 10:42:54',NULL),(217,'App\\Http\\Controllers\\Admin\\CategoryController','store','','POST',1,'admin','127.0.0.1','2018-01-26 10:44:09','2018-01-26 10:44:09',NULL),(218,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-26 11:10:27','2018-01-26 11:10:27',NULL),(219,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-26 11:10:33','2018-01-26 11:10:33',NULL),(220,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-26 11:10:51','2018-01-26 11:10:51',NULL),(221,'App\\Http\\Controllers\\Admin\\PageController','store','','POST',1,'admin','127.0.0.1','2018-01-26 11:10:57','2018-01-26 11:10:57',NULL),(222,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-26 13:34:57','2018-01-26 13:34:57',NULL),(223,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-29 14:37:57','2018-01-29 14:37:57',NULL),(224,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-29 14:51:48','2018-01-29 14:51:48',NULL),(225,'App\\Http\\Controllers\\Admin\\BannerController','store','','POST',1,'admin','127.0.0.1','2018-01-29 14:51:51','2018-01-29 14:51:51',NULL),(226,'App\\Http\\Controllers\\Admin\\UploadController','uploadFile','','POST',1,'admin','127.0.0.1','2018-01-29 15:02:16','2018-01-29 15:02:16',NULL),(227,'App\\Http\\Controllers\\Admin\\BannerController','update','{\"banner\":\"4\"}','PATCH',1,'admin','127.0.0.1','2018-01-29 15:02:18','2018-01-29 15:02:18',NULL),(228,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"4\"}','PATCH',1,'admin','127.0.0.1','2018-01-29 18:15:34','2018-01-29 18:15:34',NULL),(229,'App\\Http\\Controllers\\Admin\\CourseController','update','{\"course\":\"4\"}','PATCH',1,'admin','127.0.0.1','2018-01-29 18:15:41','2018-01-29 18:15:41',NULL),(230,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-30 14:01:11','2018-01-30 14:01:11',NULL),(231,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-30 14:22:15','2018-01-30 14:22:15',NULL),(232,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-30 14:27:12','2018-01-30 14:27:12',NULL),(233,'App\\Http\\Controllers\\Admin\\MemberController','update','{\"member\":\"1\"}','PATCH',1,'admin','127.0.0.1','2018-01-30 15:04:03','2018-01-30 15:04:03',NULL);

/*Table structure for table `cloud_pages` */

DROP TABLE IF EXISTS `cloud_pages`;

CREATE TABLE `cloud_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单页名称，用于路由',
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单页名称别名，用于展示',
  `titlepic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单页图片',
  `description` text COLLATE utf8mb4_unicode_ci COMMENT '简介',
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '单页内容',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_pages` */

insert  into `cloud_pages`(`id`,`name`,`url`,`titlepic`,`description`,`content`,`created_at`,`updated_at`,`deleted_at`) values (1,'联系我们','contact','uploads/files/20180125/1516871076721.png','<p>面对科技人才的缺失问题，开始反思科技人才培养的制度和模式，提出基于科学(Science)、技术(Technology)、工程(Engineering)和数学(Mathematics)教育的跨学科的STEM教育</p>','<p><img src=\"http://cloud.jiyi.com/storage/uploads/image/2018/01/16/aaea076d801bbddf60adb43ca49b8d9e.png\" title=\"/uploads/image/2018/01/16/aaea076d801bbddf60adb43ca49b8d9e.png\" alt=\"选区_001.png\"/>萨达所的方式当噶啥地方发生的发生的发生的阿斯蒂芬</p>','2018-01-16 19:14:53','2018-01-25 17:04:42',NULL),(2,'Stemsky授课','teaching','uploads/files/20180125/15168673853qa.png','<p>面对科技人才的缺失问题，开始反思科技人才培养的制度和模式，提出基于科学(Science)、技术(Technology)、工程(Engineering)和数学(Mathematics)教育的跨学科的STEM教育</p>','<p>面对科技人才的缺失问题，开始反思科技人才培养的制度和模式，提出基于科学(Science)、技术(Technology)、工程(Engineering)和数学(Mathematics)教育的跨学科的STEM教育</p>','2018-01-25 16:03:07','2018-01-25 16:23:09',NULL),(3,'学校合作','cooperation','uploads/files/20180125/1516867411Gcx.png','<p>无论是理论层面还是实践层面，STEM教育对于科学教育工作者都有一定的吸引力，而且也是潜力巨大的市场。如何设计课程、开发案例，以推动科学教育改革?我们需要思考并解决以下四个问题。</p>','<p><span style=\"font-family: \" microsoft=\"\" font-size:=\"\" background-color:=\"\">无论是理论层面还是实践层面，STEM教育对于科学教育工作者都有一定的吸引力，而且也是潜力巨大的市场。如何设计课程、开发案例，以推动科学教育改革?我们需要思考并解决以下四个问题。</span></p>','2018-01-25 16:03:48','2018-01-25 16:23:26',NULL),(4,'课程研发','research','uploads/files/20180125/15168674647Yp.png','<p>美国的STEM教育具有明显的功利性，其研究动力是培养以制造产品并为市场服务的人，其最终目的是提高国家竞争力；教育以“为社会发展服务”为目的，一定</p>','<p>美国的STEM教育具有明显的功利性，其研究动力是培养以制造产品并为市场服务的人，其最终目的是提高国家竞争力；教育以“为社会发展服务”为目的，一定有其功利性的一面，但不应忽略人的发展的一面，甚至应将人的发展置于核心位置。笔者认为，STEM教育在育人方面的内涵是将学习放在一定的情境中，让学生在制作产品(作品)的过程中，体会科学、技术、工程、数学之间，相互依赖、相互支撑、相互补充的意义，实现深层次学习和理解性学习；其外延是在活动中带给孩子自信，帮助孩子获得应对未来挑战的技能和信心，学会尊重他人并赢得他人的尊重，实现全面成长。这也是STEM教育与分科课程的本质区别。</p>','2018-01-25 16:04:36','2018-01-25 16:23:40',NULL),(5,'知识天地','knowledge','uploads/files/20180125/15168674927Mv.png','<p>目前，我国在基础教育尤其是中等教育阶段，仍以分科教学为主。STEM教育提倡整合各领域的知识、技能，强调实践探究与工程设计。可以肯定，分科课程在</p>','<p><span style=\"color: rgb(108, 108, 108); font-family: \" microsoft=\"\" font-size:=\"\" background-color:=\"\">目前，我国在基础教育尤其是中等教育阶段，仍以分科教学为主。STEM教育提倡整合各领域的知识、技能，强调实践探究与工程设计。可以肯定，分科课程在系统、高效学习学科的基础知识</span></p>','2018-01-25 16:05:09','2018-01-25 16:23:49',NULL),(6,'合作伙伴','teams','uploads/files/20180126/1516936227INw.png','<p>合作伙伴合作伙伴合作伙伴合作伙伴</p>','<p>合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴合作伙伴</p>','2018-01-26 11:10:33','2018-01-26 11:10:33',NULL),(7,'人才招聘','jobs','uploads/files/20180126/1516936251VyD.png','<p>人才招聘人才招聘人才招聘</p>','<p>人才招聘人才招聘人才招聘</p>','2018-01-26 11:10:57','2018-01-26 11:10:57',NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_permissions` */

insert  into `cloud_permissions`(`id`,`fid`,`icon`,`name`,`display_name`,`guard_name`,`is_menu`,`sort`,`created_at`,`updated_at`) values (1,0,NULL,'#-1516100651','权限管理','admin',1,50,'2017-11-14 11:23:21','2018-01-16 19:04:11'),(4,1,NULL,'admin.users.index','用户管理','admin',1,5,'2017-11-14 15:07:44','2017-11-14 17:09:02'),(5,1,NULL,'admin.role.index','角色管理','admin',1,5,'2017-11-14 17:09:54','2017-11-14 17:09:54'),(6,1,NULL,'admin.permission.index','权限管理','admin',1,8,'2017-11-14 17:10:23','2017-11-14 17:10:33'),(7,0,NULL,'#-1510650668','系统设置','admin',1,100,'2017-11-14 17:11:08','2017-11-14 17:11:08'),(8,7,NULL,'admin.operationlog.index','操作日志','admin',1,20,'2017-11-14 17:11:50','2017-11-14 17:12:25'),(9,7,NULL,'admin.logs.index','登录日志','admin',1,10,'2017-11-14 17:12:18','2017-11-14 17:12:18'),(10,1,NULL,'admin.users.create','新建用户页面','admin',0,11,'2017-11-14 17:26:34','2017-11-14 17:26:34'),(11,1,NULL,'admin.users.store','保存用户数据','admin',0,12,'2017-11-14 17:27:07','2017-11-14 17:27:07'),(12,1,NULL,'admin.users.edit','编辑用户页面','admin',0,13,'2017-11-14 17:27:28','2017-11-14 17:27:28'),(13,1,NULL,'admin.users.update','更新用户数据','admin',0,14,'2017-11-14 17:27:50','2017-11-14 17:27:50'),(14,1,NULL,'admin.users.destroy','删除用户','admin',0,15,'2017-11-14 17:28:44','2017-11-14 17:28:44'),(15,1,NULL,'admin.users.destroy.all','批量删除用户','admin',0,16,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(16,1,NULL,'admin.role.create','新建角色','admin',0,17,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(17,1,NULL,'admin.role.store','保存角色数据','admin',0,18,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(18,1,NULL,'admin.role.edit','编辑角色页面','admin',0,19,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(19,1,NULL,'admin.role.edit','更新角色数据','admin',0,20,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(20,1,NULL,'admin.role.destroy','删除角色','admin',0,21,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(21,1,NULL,'admin.role.destroy.all','批量删除角色','admin',0,22,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(22,1,NULL,'admin.permission.create','新建权限页面','admin',0,23,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(23,1,NULL,'admin.permission.store','保存权限数据','admin',0,24,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(24,1,NULL,'admin.permission.edit','编辑权限页面','admin',0,25,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(25,1,NULL,'admin.permission.update','更新权限数据','admin',0,26,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(26,1,NULL,'admin.permission.destroy','删除权限','admin',0,27,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(27,1,NULL,'admin.permission.destroy.all','批量删除权限','admin',0,28,'2017-11-14 17:29:06','2017-11-14 17:29:06'),(30,0,NULL,'admin.home','控制台','admin',1,0,'2017-11-19 15:45:20','2017-11-19 15:45:20'),(31,0,NULL,'admin.category.index','类别管理','admin',1,5,'2018-01-14 15:00:22','2018-01-14 15:00:51'),(32,0,NULL,'#-1515917352','课程管理','admin',1,1,'2018-01-14 16:09:12','2018-01-14 16:09:12'),(33,32,NULL,'admin.course.index','课程列表','admin',1,1,'2018-01-14 16:09:35','2018-01-14 16:09:54'),(34,0,NULL,'#-1515986472','会员管理','admin',1,4,'2018-01-15 11:21:12','2018-01-15 11:21:12'),(35,34,NULL,'admin.member.index','会员列表','admin',1,1,'2018-01-15 11:21:32','2018-01-15 11:21:32'),(36,0,NULL,'#-1516100598','页面管理','admin',1,20,'2018-01-16 19:03:18','2018-01-16 19:03:18'),(37,36,NULL,'admin.page.index','单页管理','admin',1,5,'2018-01-16 19:03:41','2018-01-16 19:03:41'),(38,36,NULL,'admin.list.index','列表管理','admin',1,20,'2018-01-16 19:04:01','2018-01-16 19:04:01'),(39,0,NULL,'admin.teacher.index','教师列表','admin',1,25,'2018-01-17 13:31:14','2018-01-17 13:31:25'),(40,0,NULL,'admin.banner.index','banner管理','admin',1,45,'2018-01-17 15:51:35','2018-01-18 10:29:34');

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

/*Table structure for table `cloud_teacher_has_courses` */

DROP TABLE IF EXISTS `cloud_teacher_has_courses`;

CREATE TABLE `cloud_teacher_has_courses` (
  `teacher_id` int(10) unsigned NOT NULL,
  `class_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`teacher_id`,`class_id`),
  KEY `teacher_has_courses_class_id_foreign` (`class_id`),
  CONSTRAINT `teacher_has_courses_class_id_foreign` FOREIGN KEY (`class_id`) REFERENCES `cloud_class` (`id`) ON DELETE CASCADE,
  CONSTRAINT `teacher_has_courses_teacher_id_foreign` FOREIGN KEY (`teacher_id`) REFERENCES `cloud_teachers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_teacher_has_courses` */

/*Table structure for table `cloud_teachers` */

DROP TABLE IF EXISTS `cloud_teachers`;

CREATE TABLE `cloud_teachers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '教师名称',
  `titlepic` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '教师头像',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '教师简介',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_teachers` */

insert  into `cloud_teachers`(`id`,`name`,`titlepic`,`description`,`created_at`,`updated_at`,`deleted_at`) values (1,'王老师','uploads/files/20180117/1516167986LVQ.png','<p>阿萨德大所</p>','2018-01-17 13:46:28','2018-01-17 13:46:28',NULL);

/*Table structure for table `cloud_users` */

DROP TABLE IF EXISTS `cloud_users`;

CREATE TABLE `cloud_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nickname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_login_at` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `cloud_users` */

insert  into `cloud_users`(`id`,`name`,`nickname`,`email`,`password`,`ip`,`last_login_at`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values (1,'test','下菜','acl@zhihuiya.com','$2y$10$VHjm0e6K9fvdAJReHPmwmeLAxSqHoXQHzUjVhGndapS6h8747TXfG',NULL,NULL,NULL,'2018-01-15 13:24:12','2018-01-30 15:04:03',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
