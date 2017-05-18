/*
Navicat MySQL Data Transfer

Source Server         : localdb
Source Server Version : 50710
Source Host           : localhost:3306
Source Database       : teacherdb

Target Server Type    : MYSQL
Target Server Version : 50710
File Encoding         : 65001

Date: 2017-03-06 14:12:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_23962d04_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_58c48ba9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_51277a81_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('10', 'Can add user', '4', 'add_user');
INSERT INTO `auth_permission` VALUES ('11', 'Can change user', '4', 'change_user');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete user', '4', 'delete_user');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add class', '7', 'add_class');
INSERT INTO `auth_permission` VALUES ('20', 'Can change class', '7', 'change_class');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete class', '7', 'delete_class');
INSERT INTO `auth_permission` VALUES ('22', 'Can add student', '8', 'add_student');
INSERT INTO `auth_permission` VALUES ('23', 'Can change student', '8', 'change_student');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete student', '8', 'delete_student');
INSERT INTO `auth_permission` VALUES ('25', 'Can add course', '9', 'add_course');
INSERT INTO `auth_permission` VALUES ('26', 'Can change course', '9', 'change_course');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete course', '9', 'delete_course');
INSERT INTO `auth_permission` VALUES ('28', 'Can add teacher', '10', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('29', 'Can change teacher', '10', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete teacher', '10', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('31', 'Can add score', '11', 'add_score');
INSERT INTO `auth_permission` VALUES ('32', 'Can change score', '11', 'change_score');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete score', '11', 'delete_score');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'pbkdf2_sha256$20000$WePlsWG6iieE$ocutcSIckuFjbCsyjfL+7Eupfzw5xDGY7vRlEYcIvLA=', '2017-01-30 02:37:11', '1', 'admin', '', '', '', '1', '1', '2016-12-27 05:35:15');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_30a071c9_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_30a071c9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_24702650_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_3d7071f0_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_7cd7acb6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for class
-- ----------------------------
DROP TABLE IF EXISTS `class`;
CREATE TABLE `class` (
  `ClassId` int(11) NOT NULL AUTO_INCREMENT,
  `ClassName` varchar(10) NOT NULL,
  PRIMARY KEY (`ClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of class
-- ----------------------------
INSERT INTO `class` VALUES ('1', '一班');
INSERT INTO `class` VALUES ('2', '二班');
INSERT INTO `class` VALUES ('3', '三班');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `CourseId` int(11) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(20) NOT NULL,
  PRIMARY KEY (`CourseId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES ('1', '语文');
INSERT INTO `course` VALUES ('2', '数学');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_5151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_1c5f563_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_5151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_1c5f563_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES ('1', '2016-12-27 05:35:43', '1', '一班', '1', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('2', '2016-12-27 05:35:58', '1', '二班', '1', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('3', '2016-12-27 05:36:23', '1', '二班', '2', 'No fields changed.', '7', '1');
INSERT INTO `django_admin_log` VALUES ('4', '2016-12-27 05:36:40', '1', '一班', '1', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('5', '2016-12-27 05:37:05', '1', '二班', '1', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('6', '2016-12-27 05:37:28', '1', '一班', '1', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('7', '2016-12-27 05:38:36', '3', '三班', '1', '', '7', '1');
INSERT INTO `django_admin_log` VALUES ('8', '2016-12-27 05:39:40', '1', '语文', '1', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('9', '2016-12-27 05:39:47', '2', '数学', '1', '', '9', '1');
INSERT INTO `django_admin_log` VALUES ('10', '2016-12-27 05:40:07', '白居易', '001', '1', '', '10', '1');
INSERT INTO `django_admin_log` VALUES ('11', '2016-12-27 05:42:00', '002', '华罗庚', '1', '', '10', '1');
INSERT INTO `django_admin_log` VALUES ('12', '2016-12-27 05:42:14', '001', '白居易', '2', 'Changed TeacherId and TeacherName.', '10', '1');
INSERT INTO `django_admin_log` VALUES ('13', '2016-12-27 05:42:24', '白居易', '001', '3', '', '10', '1');
INSERT INTO `django_admin_log` VALUES ('14', '2016-12-27 05:43:28', '001', '于志鹏', '1', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('15', '2016-12-27 05:43:38', '002', '王志文', '1', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('16', '2016-12-27 05:43:56', '003', '黄梦华', '1', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('17', '2016-12-27 05:44:19', '004', '刘吉智', '1', '', '8', '1');
INSERT INTO `django_admin_log` VALUES ('18', '2016-12-27 05:44:38', '1', '1', '1', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('19', '2016-12-27 05:44:48', '2', '2', '1', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('20', '2016-12-27 05:44:59', '3', '3', '1', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('21', '2016-12-27 05:45:13', '4', '4', '1', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('22', '2016-12-27 05:45:26', '5', '5', '1', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('23', '2016-12-27 05:45:37', '6', '6', '1', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('24', '2016-12-27 05:45:47', '7', '7', '1', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('25', '2016-12-27 05:45:55', '8', '8', '1', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('26', '2016-12-27 05:46:03', '9', '9', '1', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('27', '2016-12-27 05:46:36', '10', '10', '1', '', '11', '1');
INSERT INTO `django_admin_log` VALUES ('28', '2016-12-27 05:46:44', '11', '11', '1', '', '11', '1');

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_3ec8c61c_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('4', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('7', 'managesys', 'class');
INSERT INTO `django_content_type` VALUES ('9', 'managesys', 'course');
INSERT INTO `django_content_type` VALUES ('11', 'managesys', 'score');
INSERT INTO `django_content_type` VALUES ('8', 'managesys', 'student');
INSERT INTO `django_content_type` VALUES ('10', 'managesys', 'teacher');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2016-12-27 05:31:52');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2016-12-27 05:32:02');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2016-12-27 05:32:06');
INSERT INTO `django_migrations` VALUES ('4', 'contenttypes', '0002_remove_content_type_name', '2016-12-27 05:32:10');
INSERT INTO `django_migrations` VALUES ('5', 'auth', '0002_alter_permission_name_max_length', '2016-12-27 05:32:12');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0003_alter_user_email_max_length', '2016-12-27 05:32:19');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0004_alter_user_username_opts', '2016-12-27 05:32:19');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0005_alter_user_last_login_null', '2016-12-27 05:32:20');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0006_require_contenttypes_0002', '2016-12-27 05:32:20');
INSERT INTO `django_migrations` VALUES ('10', 'managesys', '0001_initial', '2016-12-27 05:32:30');
INSERT INTO `django_migrations` VALUES ('11', 'managesys', '0002_auto_20161227_1328', '2016-12-27 05:32:33');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2016-12-27 05:32:34');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('tfnpbkrfbs4xw0opps9r1ocy4v1gpm19', 'OGI0MTJiNmIzODNmOTlhMzM4YWQyYjc1YTFlYzI1MzRlOTcxM2EwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzYzAyOGU0OTBjZDAxYzYwYzQ4YTZjOWY0MWYyMTIzYTljNmEzZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-01-10 05:35:19');
INSERT INTO `django_session` VALUES ('tweuzosj5mf5kc46hxhmq6n4hi4mmrln', 'OGI0MTJiNmIzODNmOTlhMzM4YWQyYjc1YTFlYzI1MzRlOTcxM2EwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzYzAyOGU0OTBjZDAxYzYwYzQ4YTZjOWY0MWYyMTIzYTljNmEzZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-01-10 11:28:14');
INSERT INTO `django_session` VALUES ('uyjh96odt3whnb92wjusvhrms1x5dogy', 'OGI0MTJiNmIzODNmOTlhMzM4YWQyYjc1YTFlYzI1MzRlOTcxM2EwYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjAzYzAyOGU0OTBjZDAxYzYwYzQ4YTZjOWY0MWYyMTIzYTljNmEzZDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2017-02-13 02:37:11');

-- ----------------------------
-- Table structure for score
-- ----------------------------
DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `ScoreId` int(11) NOT NULL AUTO_INCREMENT,
  `Term` int(11) NOT NULL,
  `Score` int(11) NOT NULL,
  `CourseId` int(11) NOT NULL,
  `StuNumId` varchar(10) NOT NULL,
  PRIMARY KEY (`ScoreId`),
  KEY `Score_CourseId_518297a0_fk_Course_CourseId` (`CourseId`),
  KEY `Score_116ebda5` (`StuNumId`),
  CONSTRAINT `Score_CourseId_518297a0_fk_Course_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`),
  CONSTRAINT `Score_StuNumId_334f0acd_fk_Student_StuNumId` FOREIGN KEY (`StuNumId`) REFERENCES `student` (`StuNumId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score
-- ----------------------------
INSERT INTO `score` VALUES ('1', '1', '100', '1', '001');
INSERT INTO `score` VALUES ('2', '1', '100', '2', '001');
INSERT INTO `score` VALUES ('3', '1', '99', '1', '002');
INSERT INTO `score` VALUES ('4', '1', '98', '2', '002');
INSERT INTO `score` VALUES ('5', '1', '100', '2', '003');
INSERT INTO `score` VALUES ('6', '2', '98', '2', '003');
INSERT INTO `score` VALUES ('7', '1', '98', '1', '004');
INSERT INTO `score` VALUES ('8', '1', '98', '2', '004');
INSERT INTO `score` VALUES ('9', '2', '98', '2', '004');
INSERT INTO `score` VALUES ('10', '2', '98', '1', '001');
INSERT INTO `score` VALUES ('11', '2', '87', '1', '002');

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `StuNumId` varchar(10) NOT NULL,
  `StuName` varchar(10) NOT NULL,
  `Sex` tinyint(1) NOT NULL,
  `ClassId` int(11) NOT NULL,
  PRIMARY KEY (`StuNumId`),
  KEY `Student_1d28991b` (`ClassId`),
  CONSTRAINT `Student_ClassId_70504683_fk_Class_ClassId` FOREIGN KEY (`ClassId`) REFERENCES `class` (`ClassId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES ('001', '于志鹏', '1', '1');
INSERT INTO `student` VALUES ('002', '王志文', '1', '2');
INSERT INTO `student` VALUES ('003', '黄梦华', '1', '2');
INSERT INTO `student` VALUES ('004', '刘吉智', '1', '1');

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher` (
  `TeacherId` varchar(10) NOT NULL,
  `TeacherName` varchar(10) NOT NULL,
  `Sex` tinyint(1) NOT NULL,
  `CourseId` int(11) NOT NULL,
  PRIMARY KEY (`TeacherId`),
  KEY `Teacher_CourseId_53cd959a_fk_Course_CourseId` (`CourseId`),
  CONSTRAINT `Teacher_CourseId_53cd959a_fk_Course_CourseId` FOREIGN KEY (`CourseId`) REFERENCES `course` (`CourseId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('001', '白居易', '1', '1');
INSERT INTO `teacher` VALUES ('002', '华罗庚', '1', '2');
