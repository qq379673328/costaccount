-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: localhost    Database: costaccount
-- ------------------------------------------------------
-- Server version	5.7.21

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
-- Table structure for table `t_auth_menufun`
--

DROP TABLE IF EXISTS `t_auth_menufun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_auth_menufun` (
  `ID` varchar(40) NOT NULL COMMENT '主键',
  `CREATE_USER` varchar(40) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_USER` varchar(40) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `APP_ID` varchar(40) NOT NULL COMMENT '所属应用id',
  `MF_ID` varchar(40) NOT NULL COMMENT '资源id',
  `PMF_ID` varchar(40) DEFAULT NULL COMMENT '父资源id',
  `MF_NAME` varchar(200) NOT NULL COMMENT '资源名',
  `MF_LINK` varchar(200) DEFAULT NULL COMMENT '资源地址',
  `MF_TYPE` char(1) NOT NULL COMMENT '资源类型:0-菜单、1-功能点',
  `MF_DESC` varchar(200) DEFAULT NULL COMMENT '资源描述',
  `MF_RANK` char(3) DEFAULT NULL COMMENT '顺序',
  `MF_LEVEL` char(3) DEFAULT NULL COMMENT '级别',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `MF_ID` (`MF_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='菜单功能点表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_auth_menufun`
--

LOCK TABLES `t_auth_menufun` WRITE;
/*!40000 ALTER TABLE `t_auth_menufun` DISABLE KEYS */;
INSERT INTO `t_auth_menufun` (`ID`, `CREATE_USER`, `CREATE_TIME`, `UPDATE_USER`, `UPDATE_TIME`, `APP_ID`, `MF_ID`, `PMF_ID`, `MF_NAME`, `MF_LINK`, `MF_TYPE`, `MF_DESC`, `MF_RANK`, `MF_LEVEL`) VALUES ('cbhsqy_regl',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','cbhsqy_regl','root','区域级成本核算-任务管理',NULL,'1',NULL,'2','1'),('cbhsqy_regl_add',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','cbhsqy_regl_add','cbhsqy_regl','创建新任务',NULL,'1',NULL,'1','2'),('cbhsqy_regl_del',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','cbhsqy_regl_del','cbhsqy_regl','删除',NULL,'1',NULL,'3','2'),('cbhsqy_regl_view',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','cbhsqy_regl_view','cbhsqy_regl','查看',NULL,'1',NULL,'2','2'),('cbhs_jgck',NULL,'2018-06-13 10:29:05',NULL,'2018-06-13 09:43:40',' ','cbhs_jgck','root','成本核算-结果查看',NULL,'0',NULL,'2','1'),('cbhs_jgck_ck',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','cbhs_jgck_ck','cbhs_jgck','查看结果',NULL,'1',NULL,'1','2'),('cbhs_jgck_qxjs',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','cbhs_jgck_qxjs','cbhs_jgck','重新计算',NULL,'1',NULL,'2','2'),('cbhs_rwcj',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','cbhs_rwcj','root','成本核算-任务创建',NULL,'0',NULL,'1','1'),('cbhs_rwcj_add',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','cbhs_rwcj_add','cbhs_rwcj','创建新任务',NULL,'1',NULL,'3','2'),('cbhs_rwcj_del',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','cbhs_rwcj_del','cbhs_rwcj','删除',NULL,'1',NULL,'2','2'),('cbhs_rwcj_js',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','cbhs_rwcj_js','cbhs_rwcj','计算',NULL,'1',NULL,'1','2'),('jcsj_org',NULL,'2018-09-28 13:52:57',NULL,'2018-09-28 13:43:10',' ','jcsj_org','root','基础数据维护-机构维护',NULL,'1',NULL,'3','1'),('jcsj_org_add',NULL,'2018-09-28 13:52:57',NULL,'2018-09-28 13:43:10',' ','jcsj_org_add','jcsj_org','新增',NULL,'1',NULL,'1','2'),('jcsj_org_del',NULL,'2018-09-28 13:52:57',NULL,'2018-09-28 13:43:10',' ','jcsj_org_del','jcsj_org','删除',NULL,'1',NULL,'2','2'),('jcsj_org_edit',NULL,'2018-09-28 13:52:57',NULL,'2018-09-28 13:43:10',' ','jcsj_org_edit','jcsj_org','编辑',NULL,'1',NULL,'2','2'),('jcsj_xm',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','jcsj_xm','root','基础数据维护-项目维护',NULL,'1',NULL,'2','1'),('jcsj_xm_add',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','jcsj_xm_add','jcsj_xm','新增',NULL,'1',NULL,'1','2'),('jcsj_xm_del',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','jcsj_xm_del','jcsj_xm','删除',NULL,'1',NULL,'3','2'),('jcsj_xm_edit',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','jcsj_xm_edit','jcsj_xm','编辑',NULL,'1',NULL,'2','2'),('jcsj_xm_import',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','jcsj_xm_import','jcsj_xm','导入项目字典',NULL,'1',NULL,'4','2'),('jcsj_yy',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','jcsj_yy','root','基础数据维护-医院维护',NULL,'1',NULL,'1','1'),('jcsj_yy_add',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','jcsj_yy_add','jcsj_yy','新增医院',NULL,'1',NULL,'1','2'),('jcsj_yy_del',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','jcsj_yy_del','jcsj_yy','删除',NULL,'1',NULL,'3','2'),('jcsj_yy_dep',NULL,'2018-09-02 06:53:39',NULL,'2018-06-13 09:43:40',' ','jcsj_yy_dep','root','基础数据维护-科室维护',NULL,'1',NULL,'4','1'),('jcsj_yy_dep_add',NULL,'2018-06-30 05:08:20',NULL,'2018-06-13 09:43:40',' ','jcsj_yy_dep_add','jcsj_yy_dep','新增',NULL,'1',NULL,'1','2'),('jcsj_yy_dep_del',NULL,'2018-06-30 05:08:20',NULL,'2018-06-13 09:43:40',' ','jcsj_yy_dep_del','jcsj_yy_dep','删除',NULL,'1',NULL,'3','2'),('jcsj_yy_dep_edit',NULL,'2018-06-13 10:21:32',NULL,'2018-06-13 09:43:40',' ','jcsj_yy_dep_edit','jcsj_yy_dep','编辑',NULL,'1',NULL,'2','3'),('jcsj_yy_edit',NULL,'2018-06-13 10:26:51',NULL,'2018-06-13 09:43:40',' ','jcsj_yy_edit','jcsj_yy','编辑',NULL,'1',NULL,'2','2'),('root',NULL,'2018-06-13 10:30:33',NULL,'2018-06-13 09:43:40','','root',NULL,'应用',NULL,'0',NULL,'1','0'),('system_role',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','system_role','root','系统维护-角色管理',NULL,'1',NULL,'7','1'),('system_role_add',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','system_role_add','system_role','创建新角色',NULL,'1',NULL,'1','2'),('system_role_del',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','system_role_del','system_role','删除',NULL,'1',NULL,'3','2'),('system_role_edit',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','system_role_edit','system_role','编辑',NULL,'1',NULL,'2','2'),('system_role_mf',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','system_role_mf','system_role','权限分配',NULL,'1',NULL,'4','2'),('system_user',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','system_user','root','系统维护-用户管理',NULL,'1',NULL,'6','1'),('system_user_add',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','system_user_add','system_user','创建新用户',NULL,'1',NULL,'1','2'),('system_user_disable',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','system_user_disable','system_user','禁用',NULL,'1',NULL,'3','2'),('system_user_edit',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','system_user_edit','system_user','编辑',NULL,'1',NULL,'2','2'),('system_user_enable',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','system_user_enable','system_user','启用',NULL,'1',NULL,'4','2'),('system_user_pwd',NULL,'2018-06-30 04:52:51',NULL,'2018-06-30 04:52:14',' ','system_user_pwd','system_user','重置密码',NULL,'1',NULL,'5','2'),('system_user_rolw',NULL,'2018-07-01 14:39:04',NULL,'2018-06-30 04:52:14',' ','system_user_rolw','system_user','角色分配',NULL,'1',NULL,'6','2');
/*!40000 ALTER TABLE `t_auth_menufun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_auth_rm`
--

DROP TABLE IF EXISTS `t_auth_rm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_auth_rm` (
  `ID` varchar(40) NOT NULL COMMENT '主键',
  `CREATE_USER` varchar(40) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `ROLE_ID` varchar(40) NOT NULL COMMENT '角色id',
  `MF_ID` varchar(40) NOT NULL COMMENT '菜单功能点id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色菜单功能点关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_auth_rm`
--

LOCK TABLES `t_auth_rm` WRITE;
/*!40000 ALTER TABLE `t_auth_rm` DISABLE KEYS */;
INSERT INTO `t_auth_rm` (`ID`, `CREATE_USER`, `CREATE_TIME`, `ROLE_ID`, `MF_ID`) VALUES ('1',NULL,'2018-09-28 13:44:46','1','jcsj_org'),('12d11b14-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','cbhsqy_regl'),('12d11cfe-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','cbhsqy_regl_add'),('12d11d58-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','cbhsqy_regl_del'),('12d11e20-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','cbhsqy_regl_view'),('12d11ea2-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','cbhs_jgck'),('12d11efc-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','cbhs_jgck_ck'),('12d13b1c-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','cbhs_jgck_qxjs'),('12d13bc6-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','cbhs_rwcj'),('12d13c2a-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','cbhs_rwcj_add'),('12d13c8e-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','cbhs_rwcj_del'),('12d13cf2-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','cbhs_rwcj_js'),('12d13d4c-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_xm'),('12d13da6-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_xm_add'),('12d13e0a-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_xm_del'),('12d13e64-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_xm_edit'),('12d13eb4-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_xm_import'),('12d14422-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_yy'),('12d144fe-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_yy_add'),('12d14562-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_yy_del'),('12d145bc-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_yy_dep'),('12d1460c-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_yy_dep_add'),('12d14666-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_yy_dep_del'),('12d146ca-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_yy_dep_edit'),('12d14724-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','jcsj_yy_edit'),('12d14788-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','root'),('12d147e2-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_role'),('12d1483c-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_role_add'),('12d14896-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_role_del'),('12d148fa-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_role_edit'),('12d1494a-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_role_mf'),('12d149ae-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_user'),('12d14a08-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_user_add'),('12d14ac6-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_user_disable'),('12d14b2a-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_user_edit'),('12d14b8e-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_user_enable'),('12d14bf2-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_user_pwd'),('12d14c4c-7c22-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:57:22','1','system_user_rolw'),('2',NULL,'2018-09-28 13:44:46','1','jcsj_org_add'),('3',NULL,'2018-09-28 13:44:46','1','jcsj_org_edit'),('4',NULL,'2018-09-28 13:44:46','1','jcsj_org_del'),('f6317b38-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:49','0f9bc27b-6380-4a2c-b56c-27dc317cbb08','cbhs_rwcj'),('f6317e08-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:49','0f9bc27b-6380-4a2c-b56c-27dc317cbb08','cbhs_rwcj_js'),('f6317ea8-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:49','0f9bc27b-6380-4a2c-b56c-27dc317cbb08','cbhs_rwcj_del'),('f6317f16-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:49','0f9bc27b-6380-4a2c-b56c-27dc317cbb08','cbhs_rwcj_add'),('f6317f7a-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:49','0f9bc27b-6380-4a2c-b56c-27dc317cbb08','cbhs_jgck'),('f6317fd4-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:49','0f9bc27b-6380-4a2c-b56c-27dc317cbb08','cbhs_jgck_ck'),('f6318024-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:49','0f9bc27b-6380-4a2c-b56c-27dc317cbb08','cbhs_jgck_qxjs'),('f6318060-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:49','0f9bc27b-6380-4a2c-b56c-27dc317cbb08','cbhsqy_regl'),('f6318092-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:49','0f9bc27b-6380-4a2c-b56c-27dc317cbb08','cbhsqy_regl_add'),('f63180c4-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:49','0f9bc27b-6380-4a2c-b56c-27dc317cbb08','cbhsqy_regl_view'),('f631810a-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:49','0f9bc27b-6380-4a2c-b56c-27dc317cbb08','cbhsqy_regl_del');
/*!40000 ALTER TABLE `t_auth_rm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_auth_role`
--

DROP TABLE IF EXISTS `t_auth_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_auth_role` (
  `ID` varchar(40) NOT NULL COMMENT '主键',
  `CREATE_USER` varchar(40) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_USER` varchar(40) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `ROLE_NAME` varchar(40) NOT NULL COMMENT '角色名',
  `ROLE_DESC` varchar(100) DEFAULT NULL COMMENT '角色描述',
  `APP_ID` varchar(40) DEFAULT NULL COMMENT '应用id',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ROLE_NAME` (`ROLE_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_auth_role`
--

LOCK TABLES `t_auth_role` WRITE;
/*!40000 ALTER TABLE `t_auth_role` DISABLE KEYS */;
INSERT INTO `t_auth_role` (`ID`, `CREATE_USER`, `CREATE_TIME`, `UPDATE_USER`, `UPDATE_TIME`, `ROLE_NAME`, `ROLE_DESC`, `APP_ID`) VALUES ('0f9bc27b-6380-4a2c-b56c-27dc317cbb08','1','2018-05-29 07:45:48','1','2018-09-28 15:12:11','测试角色','测试角色描述',''),('1','01','2018-06-13 08:11:12','','2018-05-29 07:45:49','超级管理员','最高权限管理员','');
/*!40000 ALTER TABLE `t_auth_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_auth_ur`
--

DROP TABLE IF EXISTS `t_auth_ur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_auth_ur` (
  `ID` varchar(40) NOT NULL COMMENT '主键',
  `CREATE_USER` varchar(40) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `USER_ID` varchar(40) DEFAULT NULL COMMENT '用户id',
  `ROLE_ID` varchar(40) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_auth_ur`
--

LOCK TABLES `t_auth_ur` WRITE;
/*!40000 ALTER TABLE `t_auth_ur` DISABLE KEYS */;
INSERT INTO `t_auth_ur` (`ID`, `CREATE_USER`, `CREATE_TIME`, `USER_ID`, `ROLE_ID`) VALUES ('1','','2018-03-07 07:59:45','1','1'),('611a451a-7c1e-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:30:55','9fe99da3-b795-4669-a83a-75c241f8428a','1'),('611a472c-7c1e-11e8-bb3b-f9d439a0756c',NULL,'2018-06-30 04:30:55','9fe99da3-b795-4669-a83a-75c241f8428a','0f9bc27b-6380-4a2c-b56c-27dc317cbb08'),('fa5ed5e8-c330-11e8-89ca-1d2e8e3f8f0f',NULL,'2018-09-28 15:12:56','cda81ba7-4ca5-40e4-b5f4-90f63101612c','0f9bc27b-6380-4a2c-b56c-27dc317cbb08');
/*!40000 ALTER TABLE `t_auth_ur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_auth_user`
--

DROP TABLE IF EXISTS `t_auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_auth_user` (
  `ID` varchar(40) NOT NULL COMMENT '主键',
  `CREATE_USER` varchar(40) DEFAULT NULL COMMENT '创建人',
  `CREATE_TIME` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `UPDATE_USER` varchar(40) DEFAULT NULL COMMENT '更新人',
  `UPDATE_TIME` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `LOGIN_NAME` varchar(40) NOT NULL COMMENT '登录名',
  `NAME` varchar(40) NOT NULL COMMENT '姓名',
  `PASS_WORD` varchar(80) NOT NULL COMMENT '密码',
  `USER_TYPE` char(2) DEFAULT NULL COMMENT '用户类型',
  `USER_LEVEL` char(2) DEFAULT NULL COMMENT '用户级别',
  `ORG_CODE` varchar(40) DEFAULT NULL COMMENT '所属机构',
  `ZONE_CODE` varchar(40) DEFAULT NULL COMMENT '所属区域',
  `IS_USED` char(2) DEFAULT '1' COMMENT '0:无效，1：有效',
  `EMAIL` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `SEX` char(2) DEFAULT NULL COMMENT '性别',
  `PHONE` varchar(100) DEFAULT NULL COMMENT '联系方式',
  `ORG_ID` int(11) DEFAULT NULL COMMENT '机构id',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `LOGIN_NAME` (`LOGIN_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_auth_user`
--

LOCK TABLES `t_auth_user` WRITE;
/*!40000 ALTER TABLE `t_auth_user` DISABLE KEYS */;
INSERT INTO `t_auth_user` (`ID`, `CREATE_USER`, `CREATE_TIME`, `UPDATE_USER`, `UPDATE_TIME`, `LOGIN_NAME`, `NAME`, `PASS_WORD`, `USER_TYPE`, `USER_LEVEL`, `ORG_CODE`, `ZONE_CODE`, `IS_USED`, `EMAIL`, `SEX`, `PHONE`, `ORG_ID`) VALUES ('1','系统默认','2018-09-28 15:33:23','1','2018-06-13 07:23:02','admin','超级管理员','DD4B21E9EF71E1291183A46B913AE6F2','','','1','','1','','男','',7),('cda81ba7-4ca5-40e4-b5f4-90f63101612c','1','2018-06-30 05:35:10','1','2018-09-28 14:42:30','test','测试用户','8DDCFF3A80F4189CA1C9D4D902C3C909','','','','','1','','男','',3);
/*!40000 ALTER TABLE `t_auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_costaccount_fentan`
--

DROP TABLE IF EXISTS `t_costaccount_fentan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_costaccount_fentan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `count_direct` double DEFAULT NULL COMMENT '直接成本',
  `count_all` double DEFAULT NULL COMMENT '全成本',
  `fx_l1_people` double DEFAULT NULL COMMENT '分项-一级-人员',
  `fx_l1_device_common` double DEFAULT NULL COMMENT '分项-一级-房屋、通用设备',
  `fx_l1_wscl` double DEFAULT NULL COMMENT '分项-一级-卫生材料',
  `fx_l1_device_spe` double DEFAULT NULL COMMENT '分项-一级-专用设备',
  `fx_l1_asset` double DEFAULT NULL COMMENT '分项-一级-无形资产',
  `fx_l1_vc` double DEFAULT NULL COMMENT '分项-一级-风险基金',
  `fx_l1_other` double DEFAULT NULL COMMENT '分项-一级-其它',
  `fx_l1` double DEFAULT NULL COMMENT '分项-一级',
  `fx_l2_people` double DEFAULT NULL COMMENT '分项-二级-人员',
  `fx_l2_device_common` double DEFAULT NULL COMMENT '分项-二级-房屋、通用设备',
  `fx_l2_wscl` double DEFAULT NULL COMMENT '分项-二级-卫生材料',
  `fx_l2_device_spe` double DEFAULT NULL COMMENT '分项-二级-专用设备',
  `fx_l2_asset` double DEFAULT NULL COMMENT '分项-二级-无形资产',
  `fx_l2_vc` double DEFAULT NULL COMMENT '分项-二级-风险基金',
  `fx_l2_other` double DEFAULT NULL COMMENT '分项-二级-其它',
  `fx_l2` double DEFAULT NULL COMMENT '分项-二级',
  `fx_l3_people` double DEFAULT NULL COMMENT '分项-三级-人员',
  `fx_l3_device_common` double DEFAULT NULL COMMENT '分项-三级-房屋、通用设备',
  `fx_l3_wscl` double DEFAULT NULL COMMENT '分项-三级-卫生材料',
  `fx_l3_device_spe` double DEFAULT NULL COMMENT '分项-三级-专用设备',
  `fx_l3_asset` double DEFAULT NULL COMMENT '分项-三级-无形资产',
  `fx_l3_vc` double DEFAULT NULL COMMENT '分项-三级-风险基金',
  `fx_l3_other` double DEFAULT NULL COMMENT '分项-三级-其它',
  `fx_l3` double DEFAULT NULL COMMENT '分项-三级',
  `t_job_id` int(11) NOT NULL COMMENT '任务id',
  `fx_l3_people_zzys` double DEFAULT NULL COMMENT '分项-三级-人员经费-主治医师',
  `fx_l3_people_fzrys` double DEFAULT NULL COMMENT '分项-三级-人员经费-副主任医师',
  `fx_l3_people_zrys` double DEFAULT NULL COMMENT '分项-三级-人员经费-主任医师',
  `fx_l3_people_js` double DEFAULT NULL COMMENT '分项-三级-人员经费-技师',
  `fx_l3_people_hs` double DEFAULT NULL COMMENT '分项-三级-人员经费-护士',
  `fx_l3_people_qt` double DEFAULT NULL COMMENT '分项-三级-人员经费-其他',
  `fx_l2_people_zzys` double DEFAULT NULL COMMENT '分项-二级-人员经费-主治医师',
  `fx_l2_people_fzrys` double DEFAULT NULL COMMENT '分项-二级-人员经费-副主任医师',
  `fx_l2_people_zrys` double DEFAULT NULL COMMENT '分项-二级-人员经费-主任医师',
  `fx_l2_people_js` double DEFAULT NULL COMMENT '分项-二级-人员经费-技师',
  `fx_l2_people_hs` double DEFAULT NULL COMMENT '分项-二级-人员经费-护士',
  `fx_l2_people_qt` double DEFAULT NULL COMMENT '分项-二级-人员经费-其他',
  `fx_l1_people_zzys` double DEFAULT NULL COMMENT '分项-一级-人员经费-主治医师',
  `fx_l1_people_fzrys` double DEFAULT NULL COMMENT '分项-一级-人员经费-副主任医师',
  `fx_l1_people_zrys` double DEFAULT NULL COMMENT '分项-一级-人员经费-主任医师',
  `fx_l1_people_js` double DEFAULT NULL COMMENT '分项-一级-人员经费-技师',
  `fx_l1_people_hs` double DEFAULT NULL COMMENT '分项-一级-人员经费-护士',
  `fx_l1_people_qt` double DEFAULT NULL COMMENT '分项-一级-人员经费-其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2182 DEFAULT CHARSET=utf8 COMMENT='分摊算法计算结果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_costaccount_fentan`
--

LOCK TABLES `t_costaccount_fentan` WRITE;
/*!40000 ALTER TABLE `t_costaccount_fentan` DISABLE KEYS */;
INSERT INTO `t_costaccount_fentan` (`id`, `dept_code`, `dept_name`, `dept_id`, `count_direct`, `count_all`, `fx_l1_people`, `fx_l1_device_common`, `fx_l1_wscl`, `fx_l1_device_spe`, `fx_l1_asset`, `fx_l1_vc`, `fx_l1_other`, `fx_l1`, `fx_l2_people`, `fx_l2_device_common`, `fx_l2_wscl`, `fx_l2_device_spe`, `fx_l2_asset`, `fx_l2_vc`, `fx_l2_other`, `fx_l2`, `fx_l3_people`, `fx_l3_device_common`, `fx_l3_wscl`, `fx_l3_device_spe`, `fx_l3_asset`, `fx_l3_vc`, `fx_l3_other`, `fx_l3`, `t_job_id`, `fx_l3_people_zzys`, `fx_l3_people_fzrys`, `fx_l3_people_zrys`, `fx_l3_people_js`, `fx_l3_people_hs`, `fx_l3_people_qt`, `fx_l2_people_zzys`, `fx_l2_people_fzrys`, `fx_l2_people_zrys`, `fx_l2_people_js`, `fx_l2_people_hs`, `fx_l2_people_qt`, `fx_l1_people_zzys`, `fx_l1_people_fzrys`, `fx_l1_people_zrys`, `fx_l1_people_js`, `fx_l1_people_hs`, `fx_l1_people_qt`) VALUES (2122,'101','门诊-消化内科',NULL,1329107.42,1329107.42,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2123,'102','门诊-呼吸内科',NULL,1332910.65,1332910.65,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2124,'201','住院-消化内科',NULL,1330149.84,1330149.84,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2125,'103','门诊-神经外科',NULL,1330579.6,1330579.6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2126,'202','住院-呼吸内科',NULL,1332193,1332193,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2127,'301','医技-放射科',NULL,886708.31,886708.31,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2128,'203','住院-神经外科',NULL,1329627.9,1329627.9,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2129,'302','医技-超声科',NULL,729957.17,729957.17,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2130,'401','医辅-挂号收费处',NULL,289066.01,289066.01,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2131,'303','医技-病理科',NULL,730510.86,730510.86,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2132,'402','医辅-供应室',NULL,377193.54,377193.54,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2133,'501','行政后勤-行政',NULL,289297.88,289297.88,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2134,'403','医辅-住院收费处',NULL,289248.34,289248.34,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2135,'502','行政后勤-后勤',NULL,289398.01,289398.01,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2136,'404','医辅-病案室',NULL,289120.47,289120.47,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2167,'101','门诊-消化内科',NULL,1329107.42,1329107.42,4227.2969324919,19522.6712196246,0,0,19516.7639083059,0,19516.31258755134,62783.044647973744,3650.49721463103,17078.97043981797,5664.909621489622,0,17081.984857974614,0,17080.014123421468,60556.376257334705,149935.47791466222,75583.26432389129,59493.75360299346,55213.00159814418,75600.29589362445,55214.447149545755,75585.80303707405,546626.0435199353,64,0,6435.675518882944,11303.984111768317,121998.26545177866,10197.552832232288,0,1269.738161610793,952.3036212080947,158.71727020134912,317.43454040269825,952.3036212080947,0,1470.3641504319653,1102.773112823974,183.79551880399566,367.5910376079913,1102.773112823974,0),(2168,'102','门诊-呼吸内科',NULL,1332910.65,1332910.65,4043.501414873785,18673.85943294369,0,0,18668.208961245884,0,18667.7772631327,60053.34707219606,4566.089487041865,21358.924885411074,7672.72568986569,0,21362.420283017447,0,21360.063181773985,76320.22352711007,160549.52494451206,77467.04868122799,60749.589887649694,56454.81782303454,77484.92262820176,56456.575080712835,77473.1460312327,566635.6250765716,64,0,8253.826001796062,14497.486349622146,124719.73676341478,13078.475829679077,0,1452.846654967866,1037.747610691333,415.09904427653316,622.6485664147998,1037.747610691333,0,1286.5686320052953,918.9775942894966,367.5910377157987,551.3865565736979,918.9775942894966,0),(2169,'201','住院-消化内科',NULL,1330149.84,1330149.84,5697.661085126215,26313.165567056312,0,0,26305.203538754115,0,26304.5952368673,84620.62542780394,14893.940394095542,69470.89432010504,12763.973577533576,0,69451.111669511,0,69454.87259869855,236034.7925599437,105215.422593676,50434.04708298597,39532.37705477189,36741.26937809502,50445.36086435541,36742.545536445,50438.106824167044,369549.12933449633,64,0,5541.03004316379,9732.578248697386,81161.85850007224,8779.955801742599,0,3363.1478309247996,2882.698140792685,2402.248450660571,960.8993802642285,5284.946591453257,0,1286.5686321252742,1102.7731132502352,918.977594375196,367.5910377500784,2021.7507076254312,0),(2170,'103','门诊-神经外科',NULL,1330579.6,1330579.6,4043.501414873785,18673.85943294369,0,0,18668.208961245884,0,18667.7772631327,60053.34707219606,5790.965772301506,27105.93369134869,6955.648522588523,0,27111.66733797185,0,27108.16767783533,94072.3830020459,145528.15386793358,71128.12207706617,55865.47374076355,51874.584429809845,71142.56554169612,51876.65268092852,71131.43553608026,518546.987874278,64,0,7128.304274278417,12520.55639285549,114584.24589334958,11295.047307450113,0,1579.3543015367743,1052.902867691183,789.6771507683872,526.4514338455915,1842.58001845957,0,1102.7731131473959,735.1820754315974,551.3865565736979,367.5910377157987,1286.5686320052953,0),(2171,'202','住院-呼吸内科',NULL,1332193,1332193,5513.8655675081,25464.3537803754,0,0,25456.6485916941,0,25456.059912448658,81890.92785202626,16476.40293707095,76851.9618307179,14269.835628815626,0,76830.11550610396,0,76834.26334237373,261262.5792450821,93532.7648683897,46496.89264660836,36554.25628564933,33940.112552741004,46507.59917354508,33941.01075753315,46499.22093999861,337471.85722446523,64,0,4271.210658272088,7502.195733370901,74991.47587957012,6767.8825971765855,0,4393.707449885586,2746.067156178491,1647.6402937070952,1098.4268624713966,6590.561174828381,0,1470.3641513354933,918.9775945846833,551.38655675081,367.5910378338733,2205.54622700324,0),(2172,'301','医技-放射科',NULL,886708.31,886708.31,1654.15967025243,7639.30613411262,0,0,7636.99457750823,0,7636.817973734597,24567.27835560788,6040.636170475354,28271.28841321873,7780.287264957264,0,28277.023345001995,0,28273.469279567005,98642.70447322036,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,671.1817967194838,671.1817967194838,3355.908983597419,1342.3635934389677,0,0,183.79551891693666,183.79551891693666,918.9775945846834,367.5910378338733,0),(2173,'203','住院-神经外科',NULL,1329627.9,1329627.9,6616.63868100972,30557.22453645048,0,0,30547.97831003292,0,30547.27189493839,98269.11342243152,19004.759107323265,88646.4604997682,14915.205079365078,0,88620.86763085927,0,88625.7828456354,299813.0751629512,99838.87580637523,48832.25556965197,38360.76130851395,35615.81421817538,48841.82635984963,35617.32879483473,48834.24972162672,355941.1117790276,64,0,4877.260819243127,8566.696479322178,78666.72824481774,7728.190262992182,0,4751.189776830816,3695.3698264239683,2111.639900813696,1583.729925610272,6862.829677644512,0,1654.15967025243,1286.5686324185567,735.1820756677466,551.38655675081,2389.341745920177,0),(2174,'302','医技-超声科',NULL,729957.17,729957.17,1286.568631119735,5941.68254275599,0,0,5939.884665398835,0,5939.747306908371,19107.883146182932,5575.137764584973,26079.043691148043,9357.857032967033,0,26083.31642214139,0,26080.436510956773,93175.79142179823,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,5575.137764584973,0,0,0,0,0,1286.568631119735,0,0),(2175,'401','医辅-挂号收费处',NULL,289066.01,289066.01,1470.3641526343151,6790.494347431711,0,0,6788.439630448215,0,6788.282649315958,21837.5807798302,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1470.3641526343151),(2176,'303','医技-病理科',NULL,730510.86,730510.86,1102.77311350162,5092.87075607508,0,0,5091.3297183388195,0,5091.211982489732,16378.185570405252,5786.164645614685,27072.428844121292,8712.487582417582,0,27077.331732883176,0,27074.159036522906,95722.57184155966,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,5786.164645614685,0,0,0,0,0,1102.77311350162,0,0),(2177,'402','医辅-供应室',NULL,377193.54,377193.54,1286.568631119735,5941.68254275599,0,0,5939.884665398835,0,5939.747306908371,19107.883146182932,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1286.568631119735),(2178,'501','行政后勤-行政',NULL,289297.88,289297.88,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2179,'403','医辅-住院收费处',NULL,289248.34,289248.34,1102.77311350162,5092.87075607508,0,0,5091.3297183388195,0,5091.211982489732,16378.185570405252,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1102.77311350162),(2180,'502','行政后勤-后勤',NULL,289398.01,289398.01,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),(2181,'404','医辅-病案室',NULL,289120.47,289120.47,918.977595883505,4244.05896939417,0,0,4242.774771278805,0,4242.676658071093,13648.487994627574,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,64,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,918.977595883505);
/*!40000 ALTER TABLE `t_costaccount_fentan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_costaccount_job`
--

DROP TABLE IF EXISTS `t_costaccount_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_costaccount_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_desc` varchar(200) NOT NULL COMMENT '任务描述',
  `t_hos_id` int(11) DEFAULT NULL COMMENT '医院id',
  `hos_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `hos_name` varchar(100) DEFAULT NULL COMMENT '医院名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '任务修改时间',
  `exec_time_start` timestamp NULL DEFAULT NULL COMMENT '任务执行时间-开始',
  `costtime` int(11) DEFAULT NULL COMMENT '任务耗费时间，单位：秒',
  `exec_time_end` timestamp NULL DEFAULT NULL COMMENT '任务执行时间-结束',
  `state` varchar(2) DEFAULT '0' COMMENT '任务执行状态:0-未开始，1-进行中，2-成功，9-失败',
  `year` varchar(10) DEFAULT NULL COMMENT '年份',
  `type` varchar(10) DEFAULT NULL COMMENT '类型：年、半年',
  `half_type` varchar(10) DEFAULT NULL COMMENT '半年类型：上半年、下半年',
  `create_user` varchar(45) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始数据任务管理';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_costaccount_job`
--

LOCK TABLES `t_costaccount_job` WRITE;
/*!40000 ALTER TABLE `t_costaccount_job` DISABLE KEYS */;
INSERT INTO `t_costaccount_job` (`id`, `job_desc`, `t_hos_id`, `hos_code`, `hos_name`, `create_time`, `update_time`, `exec_time_start`, `costtime`, `exec_time_end`, `state`, `year`, `type`, `half_type`, `create_user`) VALUES (62,'医院A2017年成本核算',3,NULL,'医院A','2018-09-28 15:13:54','2018-09-27 16:00:00','2018-09-27 16:00:00',0,'2018-09-27 16:00:00','2','2017','年',NULL,'test'),(64,'医院12018年成本核算',2,NULL,'医院1','2018-09-28 15:39:30','2018-09-27 16:00:00','2018-09-27 16:00:00',0,'2018-09-27 16:00:00','2','2018','年',NULL,'admin');
/*!40000 ALTER TABLE `t_costaccount_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_costaccount_job_baseinfo`
--

DROP TABLE IF EXISTS `t_costaccount_job_baseinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_costaccount_job_baseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_cost_kdsr` double DEFAULT NULL COMMENT '总工作量-开单收入',
  `total_cost_mzzxsr` double DEFAULT NULL COMMENT '总工作量-门诊执行收入',
  `total_cost_xdgzl` double DEFAULT NULL COMMENT '工作量-消毒工作量',
  `total_cost_zyzxsr` double DEFAULT NULL COMMENT '总工作量-住院执行收入',
  `total_cost_inhos` double DEFAULT NULL COMMENT '总工作量-住院人数',
  `total_Cost_mz` double DEFAULT NULL COMMENT '总工作量-门诊人次',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `total_people` int(11) DEFAULT NULL COMMENT '总人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='任务对应的基础信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_costaccount_job_baseinfo`
--

LOCK TABLES `t_costaccount_job_baseinfo` WRITE;
/*!40000 ALTER TABLE `t_costaccount_job_baseinfo` DISABLE KEYS */;
INSERT INTO `t_costaccount_job_baseinfo` (`id`, `total_cost_kdsr`, `total_cost_mzzxsr`, `total_cost_xdgzl`, `total_cost_zyzxsr`, `total_cost_inhos`, `total_Cost_mz`, `t_job_id`, `total_people`) VALUES (160,0,16258,2457,0,9660,0,62,0),(163,0,16258,2457,0,9660,0,64,229);
/*!40000 ALTER TABLE `t_costaccount_job_baseinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_costaccount_level1`
--

DROP TABLE IF EXISTS `t_costaccount_level1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_costaccount_level1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '科室名称',
  `share_level1` double NOT NULL COMMENT '一级分摊',
  `dept_code_share` varchar(50) DEFAULT NULL COMMENT '科室编码-被分摊',
  `dept_name_share` varchar(100) DEFAULT NULL COMMENT '科室名称-被分摊',
  `t_hospital_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `share_item_people` double DEFAULT NULL COMMENT '分项成本-人员经费',
  `share_item_old_house_device_common` double DEFAULT NULL COMMENT '分项成本-通用设备折旧费',
  `share_item_old_device_special` double DEFAULT NULL COMMENT '分项成本-专用设备折旧费',
  `share_item_asset_amortize` double DEFAULT NULL COMMENT '分项成本-无形资产摊销费',
  `share_item_vc_funds` double DEFAULT NULL COMMENT '分项成本-计提医疗风险基金',
  `share_item_other` double DEFAULT NULL COMMENT '分项成本-其它',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `share_item_wscl` double DEFAULT NULL COMMENT '分项成本-卫生材料费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算-一级分摊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_costaccount_level1`
--

LOCK TABLES `t_costaccount_level1` WRITE;
/*!40000 ALTER TABLE `t_costaccount_level1` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_costaccount_level1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_costaccount_level2`
--

DROP TABLE IF EXISTS `t_costaccount_level2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_costaccount_level2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '科室名称',
  `share_level2` double NOT NULL COMMENT '二级分摊',
  `dept_code_share` varchar(50) DEFAULT NULL COMMENT '科室编码-被分摊',
  `dept_name_share` varchar(100) DEFAULT NULL COMMENT '科室名称-被分摊',
  `t_hospital_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `share_item_people` double DEFAULT NULL COMMENT '分项成本-人员经费',
  `share_item_old_house_device_common` double DEFAULT NULL COMMENT '分项成本-通用设备折旧费',
  `share_item_old_device_special` double DEFAULT NULL COMMENT '分项成本-专用设备折旧费',
  `share_item_asset_amortize` double DEFAULT NULL COMMENT '分项成本-无形资产摊销费',
  `share_item_vc_funds` double DEFAULT NULL COMMENT '分项成本-计提医疗风险基金',
  `share_item_other` double DEFAULT NULL COMMENT '分项成本-其它',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `share_item_wscl` double DEFAULT NULL COMMENT '分项成本-卫生材料费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成本核算-二级分摊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_costaccount_level2`
--

LOCK TABLES `t_costaccount_level2` WRITE;
/*!40000 ALTER TABLE `t_costaccount_level2` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_costaccount_level2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_costaccount_level3`
--

DROP TABLE IF EXISTS `t_costaccount_level3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_costaccount_level3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '科室名称',
  `share_level3` double NOT NULL COMMENT '三级分摊',
  `dept_code_share` varchar(50) DEFAULT NULL COMMENT '科室编码-被分摊',
  `dept_name_share` varchar(100) DEFAULT NULL COMMENT '科室名称-被分摊',
  `t_hospital_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `share_item_people` double DEFAULT NULL COMMENT '分项成本-人员经费',
  `share_item_old_house_device_common` double DEFAULT NULL COMMENT '分项成本-通用设备折旧费',
  `share_item_old_device_special` double DEFAULT NULL COMMENT '分项成本-专用设备折旧费',
  `share_item_asset_amortize` double DEFAULT NULL COMMENT '分项成本-无形资产摊销费',
  `share_item_vc_funds` double DEFAULT NULL COMMENT '分项成本-计提医疗风险基金',
  `share_item_other` double DEFAULT NULL COMMENT '分项成本-其它',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `share_item_wscl` double DEFAULT NULL COMMENT '分项成本-卫生材料费',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成本核算-三级分摊';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_costaccount_level3`
--

LOCK TABLES `t_costaccount_level3` WRITE;
/*!40000 ALTER TABLE `t_costaccount_level3` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_costaccount_level3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_costaccount_src`
--

DROP TABLE IF EXISTS `t_costaccount_src`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_costaccount_src` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) NOT NULL COMMENT '科室名称',
  `dept_id` int(11) DEFAULT NULL COMMENT '科室id',
  `cost_old_house_device_common` double DEFAULT NULL COMMENT '费用-房屋、通用设备折旧费',
  `cost_wscl` double DEFAULT NULL COMMENT '费用-卫生材料费',
  `cost_old_device_special` double DEFAULT NULL COMMENT '费用-专用设备折旧费',
  `cost_asset_amortize` double DEFAULT NULL COMMENT '费用-无形资产摊销费',
  `cost_vc_funds` double DEFAULT NULL COMMENT '费用-计提医疗风险基金',
  `cost_other` double DEFAULT NULL COMMENT '费用-其它',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `work_count_mzzxsr` double DEFAULT NULL COMMENT '科室工作量-门诊执行收入',
  `work_count_xdgzl` double DEFAULT NULL COMMENT '科室工作量-消毒工作量',
  `work_count_inhos` double DEFAULT NULL COMMENT '科室工作量-住院人数',
  `work_count_mz` double DEFAULT NULL COMMENT '科室工作量-门诊人次',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `cost_people_zzys` double DEFAULT NULL COMMENT '费用-人员经费-主治医师',
  `cost_people_fzzys` double DEFAULT NULL COMMENT '费用-人员经费-副主任医师',
  `cost_people_zrys` double DEFAULT NULL COMMENT '费用-人员经费-主任医师',
  `cost_people_js` double DEFAULT NULL COMMENT '费用-人员经费-技师',
  `cost_people_hs` double DEFAULT NULL COMMENT '费用-人员经费-护士',
  `cost_people_qt` double DEFAULT NULL COMMENT '费用-人员经费-其它',
  `people_count_zzys` int(11) DEFAULT NULL COMMENT '科室人员数-主治医师',
  `people_count_fzrys` int(11) DEFAULT NULL COMMENT '科室人员数-副主任医生',
  `people_count_zrys` int(11) DEFAULT NULL COMMENT '科室人员数-主任医师',
  `people_count_js` int(11) DEFAULT NULL COMMENT '科室人员数-技师',
  `people_count_hs` int(11) DEFAULT NULL COMMENT '科室人员数-护士',
  `people_count_qt` int(11) DEFAULT NULL COMMENT '科室人员数-其他',
  `work_count_kdsr` double DEFAULT NULL COMMENT '科室工作量-开单收入',
  `work_count_zyzxsr` double DEFAULT NULL COMMENT '科室工作量-住院执行收入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=796 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始业务数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_costaccount_src`
--

LOCK TABLES `t_costaccount_src` WRITE;
/*!40000 ALTER TABLE `t_costaccount_src` DISABLE KEYS */;
INSERT INTO `t_costaccount_src` (`id`, `dept_code`, `dept_name`, `dept_id`, `cost_old_house_device_common`, `cost_wscl`, `cost_old_device_special`, `cost_asset_amortize`, `cost_vc_funds`, `cost_other`, `create_time`, `t_job_id`, `work_count_mzzxsr`, `work_count_xdgzl`, `work_count_inhos`, `work_count_mz`, `update_time`, `cost_people_zzys`, `cost_people_fzzys`, `cost_people_zrys`, `cost_people_js`, `cost_people_hs`, `cost_people_qt`, `people_count_zzys`, `people_count_fzrys`, `people_count_zrys`, `people_count_js`, `people_count_hs`, `people_count_qt`, `work_count_kdsr`, `work_count_zyzxsr`) VALUES (721,'101','门诊-消化内科',NULL,89968.32,88934.56,89936.75,89968.32,89950.11,89961.89,'2018-09-28 15:09:45',60,1834,158,NULL,NULL,NULL,191101.12,192101.23,193101.34,19982.33,194101.45,NULL,8,6,1,2,6,NULL,NULL,NULL),(722,'102','门诊-呼吸内科',NULL,89925.65,88827.31,89945.11,89925.65,89944.29,89926.16,'2018-09-28 15:09:45',60,2186,214,NULL,NULL,NULL,192601.56,193643.67,193987.78,19659.58,194523.89,NULL,7,5,2,3,5,NULL,NULL,NULL),(723,'103','门诊-神经外科',NULL,89936.75,88729.61,89967.34,89963.84,89973.57,89950.11,'2018-09-28 15:09:45',60,3283,194,NULL,NULL,NULL,191984.29,192267.36,193359.15,19486.23,194961.35,NULL,6,4,3,2,7,NULL,NULL,NULL),(724,'201','住院-消化内科',NULL,89945.11,88610.62,89936.11,89961.89,89998.83,89944.29,'2018-09-28 15:09:45',60,NULL,356,2836,NULL,NULL,194561.65,191379.11,193489.28,19853.69,192469.26,NULL,7,6,5,2,11,NULL,NULL,NULL),(725,'202','住院-呼吸内科',NULL,89967.34,88572.14,89957.54,89926.16,89984.26,89973.57,'2018-09-28 15:09:45',60,NULL,398,3129,NULL,NULL,191874.38,195782.98,192846.91,19524.78,193782.94,NULL,8,5,3,2,12,NULL,NULL,NULL),(726,'203','住院-神经外科',NULL,89936.11,88491.25,89968.32,89950.11,89936.75,89998.83,'2018-09-28 15:09:45',60,NULL,416,3695,NULL,NULL,191638.76,193375.62,192845.73,19673.98,193812.44,NULL,9,7,4,3,13,NULL,NULL,NULL),(727,'301','医技-放射科',NULL,89957.54,88371.81,89925.65,89944.29,89945.11,89984.26,'2018-09-28 15:09:45',60,3328,217,NULL,NULL,NULL,NULL,35652.33,63268.52,193521.65,56137.15,NULL,NULL,1,1,5,2,NULL,NULL,NULL),(728,'302','医技-超声科',NULL,89961.31,88217.52,89963.84,89973.57,89967.34,89936.75,'2018-09-28 15:09:45',60,2671,261,NULL,NULL,NULL,NULL,NULL,NULL,191936.84,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL),(729,'303','医技-病理科',NULL,89926.16,88116.25,89950.11,89998.83,89936.11,89945.11,'2018-09-28 15:09:45',60,2956,243,NULL,NULL,NULL,NULL,NULL,NULL,192638.29,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL),(730,'401','医辅-挂号收费处',NULL,89950.11,NULL,NULL,89984.21,NULL,89967.34,'2018-09-28 15:09:45',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19164.35,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(731,'402','医辅-供应室',NULL,89944.29,88092.93,NULL,89936.75,NULL,89936.11,'2018-09-28 15:09:45',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19283.46,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL),(732,'403','医辅-住院收费处',NULL,89973.57,NULL,NULL,89945.11,NULL,89957.54,'2018-09-28 15:09:45',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19372.12,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),(733,'404','医辅-病案室',NULL,89998.83,NULL,NULL,89967.34,NULL,89968.32,'2018-09-28 15:09:45',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19185.98,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),(734,'501','行政后勤-行政',NULL,89984.26,NULL,NULL,89936.11,NULL,89925.65,'2018-09-28 15:09:45',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19451.86,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(735,'502','行政后勤-后勤',NULL,89963.84,NULL,NULL,89957.54,NULL,89963.84,'2018-09-28 15:09:45',60,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19512.79,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL),(751,'101','门诊-消化内科',NULL,89968.32,88934.56,89936.75,89968.32,89950.11,89961.89,'2018-09-28 15:13:54',62,1834,158,NULL,NULL,NULL,191101.12,192101.23,193101.34,19982.33,194101.45,NULL,8,6,1,2,6,NULL,NULL,NULL),(752,'102','门诊-呼吸内科',NULL,89925.65,88827.31,89945.11,89925.65,89944.29,89926.16,'2018-09-28 15:13:54',62,2186,214,NULL,NULL,NULL,192601.56,193643.67,193987.78,19659.58,194523.89,NULL,7,5,2,3,5,NULL,NULL,NULL),(753,'103','门诊-神经外科',NULL,89936.75,88729.61,89967.34,89963.84,89973.57,89950.11,'2018-09-28 15:13:54',62,3283,194,NULL,NULL,NULL,191984.29,192267.36,193359.15,19486.23,194961.35,NULL,6,4,3,2,7,NULL,NULL,NULL),(754,'201','住院-消化内科',NULL,89945.11,88610.62,89936.11,89961.89,89998.83,89944.29,'2018-09-28 15:13:54',62,NULL,356,2836,NULL,NULL,194561.65,191379.11,193489.28,19853.69,192469.26,NULL,7,6,5,2,11,NULL,NULL,NULL),(755,'202','住院-呼吸内科',NULL,89967.34,88572.14,89957.54,89926.16,89984.26,89973.57,'2018-09-28 15:13:54',62,NULL,398,3129,NULL,NULL,191874.38,195782.98,192846.91,19524.78,193782.94,NULL,8,5,3,2,12,NULL,NULL,NULL),(756,'203','住院-神经外科',NULL,89936.11,88491.25,89968.32,89950.11,89936.75,89998.83,'2018-09-28 15:13:54',62,NULL,416,3695,NULL,NULL,191638.76,193375.62,192845.73,19673.98,193812.44,NULL,9,7,4,3,13,NULL,NULL,NULL),(757,'301','医技-放射科',NULL,89957.54,88371.81,89925.65,89944.29,89945.11,89984.26,'2018-09-28 15:13:54',62,3328,217,NULL,NULL,NULL,NULL,35652.33,63268.52,193521.65,56137.15,NULL,NULL,1,1,5,2,NULL,NULL,NULL),(758,'302','医技-超声科',NULL,89961.31,88217.52,89963.84,89973.57,89967.34,89936.75,'2018-09-28 15:13:54',62,2671,261,NULL,NULL,NULL,NULL,NULL,NULL,191936.84,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL),(759,'303','医技-病理科',NULL,89926.16,88116.25,89950.11,89998.83,89936.11,89945.11,'2018-09-28 15:13:54',62,2956,243,NULL,NULL,NULL,NULL,NULL,NULL,192638.29,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL),(760,'401','医辅-挂号收费处',NULL,89950.11,NULL,NULL,89984.21,NULL,89967.34,'2018-09-28 15:13:54',62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19164.35,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(761,'402','医辅-供应室',NULL,89944.29,88092.93,NULL,89936.75,NULL,89936.11,'2018-09-28 15:13:54',62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19283.46,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL),(762,'403','医辅-住院收费处',NULL,89973.57,NULL,NULL,89945.11,NULL,89957.54,'2018-09-28 15:13:54',62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19372.12,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),(763,'404','医辅-病案室',NULL,89998.83,NULL,NULL,89967.34,NULL,89968.32,'2018-09-28 15:13:54',62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19185.98,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),(764,'501','行政后勤-行政',NULL,89984.26,NULL,NULL,89936.11,NULL,89925.65,'2018-09-28 15:13:54',62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19451.86,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(765,'502','行政后勤-后勤',NULL,89963.84,NULL,NULL,89957.54,NULL,89963.84,'2018-09-28 15:13:54',62,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19512.79,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL),(781,'101','门诊-消化内科',NULL,89968.32,88934.56,89936.75,89968.32,89950.11,89961.89,'2018-09-28 15:39:30',64,1834,158,NULL,NULL,NULL,191101.12,192101.23,193101.34,19982.33,194101.45,NULL,8,6,1,2,6,NULL,NULL,NULL),(782,'102','门诊-呼吸内科',NULL,89925.65,88827.31,89945.11,89925.65,89944.29,89926.16,'2018-09-28 15:39:30',64,2186,214,NULL,NULL,NULL,192601.56,193643.67,193987.78,19659.58,194523.89,NULL,7,5,2,3,5,NULL,NULL,NULL),(783,'103','门诊-神经外科',NULL,89936.75,88729.61,89967.34,89963.84,89973.57,89950.11,'2018-09-28 15:39:30',64,3283,194,NULL,NULL,NULL,191984.29,192267.36,193359.15,19486.23,194961.35,NULL,6,4,3,2,7,NULL,NULL,NULL),(784,'201','住院-消化内科',NULL,89945.11,88610.62,89936.11,89961.89,89998.83,89944.29,'2018-09-28 15:39:30',64,NULL,356,2836,NULL,NULL,194561.65,191379.11,193489.28,19853.69,192469.26,NULL,7,6,5,2,11,NULL,NULL,NULL),(785,'202','住院-呼吸内科',NULL,89967.34,88572.14,89957.54,89926.16,89984.26,89973.57,'2018-09-28 15:39:30',64,NULL,398,3129,NULL,NULL,191874.38,195782.98,192846.91,19524.78,193782.94,NULL,8,5,3,2,12,NULL,NULL,NULL),(786,'203','住院-神经外科',NULL,89936.11,88491.25,89968.32,89950.11,89936.75,89998.83,'2018-09-28 15:39:30',64,NULL,416,3695,NULL,NULL,191638.76,193375.62,192845.73,19673.98,193812.44,NULL,9,7,4,3,13,NULL,NULL,NULL),(787,'301','医技-放射科',NULL,89957.54,88371.81,89925.65,89944.29,89945.11,89984.26,'2018-09-28 15:39:30',64,3328,217,NULL,NULL,NULL,NULL,35652.33,63268.52,193521.65,56137.15,NULL,NULL,1,1,5,2,NULL,NULL,NULL),(788,'302','医技-超声科',NULL,89961.31,88217.52,89963.84,89973.57,89967.34,89936.75,'2018-09-28 15:39:30',64,2671,261,NULL,NULL,NULL,NULL,NULL,NULL,191936.84,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL),(789,'303','医技-病理科',NULL,89926.16,88116.25,89950.11,89998.83,89936.11,89945.11,'2018-09-28 15:39:30',64,2956,243,NULL,NULL,NULL,NULL,NULL,NULL,192638.29,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL),(790,'401','医辅-挂号收费处',NULL,89950.11,NULL,NULL,89984.21,NULL,89967.34,'2018-09-28 15:39:30',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19164.35,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(791,'402','医辅-供应室',NULL,89944.29,88092.93,NULL,89936.75,NULL,89936.11,'2018-09-28 15:39:30',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19283.46,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL),(792,'403','医辅-住院收费处',NULL,89973.57,NULL,NULL,89945.11,NULL,89957.54,'2018-09-28 15:39:30',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19372.12,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),(793,'404','医辅-病案室',NULL,89998.83,NULL,NULL,89967.34,NULL,89968.32,'2018-09-28 15:39:30',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19185.98,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),(794,'501','行政后勤-行政',NULL,89984.26,NULL,NULL,89936.11,NULL,89925.65,'2018-09-28 15:39:30',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19451.86,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),(795,'502','行政后勤-后勤',NULL,89963.84,NULL,NULL,89957.54,NULL,89963.84,'2018-09-28 15:39:30',64,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19512.79,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL);
/*!40000 ALTER TABLE `t_costaccount_src` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_costaccount_src_dept`
--

DROP TABLE IF EXISTS `t_costaccount_src_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_costaccount_src_dept` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `bz_dept_code` varchar(50) DEFAULT NULL COMMENT '标准科室编码',
  `bz_dept_name` varchar(100) DEFAULT NULL COMMENT '标准科室名',
  `dept_code` varchar(50) DEFAULT NULL COMMENT '科室编码',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '科室名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=379 DEFAULT CHARSET=utf8 COMMENT='原始数据-科室对照';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_costaccount_src_dept`
--

LOCK TABLES `t_costaccount_src_dept` WRITE;
/*!40000 ALTER TABLE `t_costaccount_src_dept` DISABLE KEYS */;
INSERT INTO `t_costaccount_src_dept` (`id`, `t_job_id`, `bz_dept_code`, `bz_dept_name`, `dept_code`, `dept_name`) VALUES (344,60,'BZ101','标准门诊-消化内科','101','门诊-消化内科'),(345,60,'BZ102','标准门诊-呼吸内科','102','门诊-呼吸内科'),(346,60,'BZ103','标准门诊-神经外科','103','门诊-神经外科'),(347,60,'BZ201','标准住院-消化内科','201','住院-消化内科'),(348,60,'BZ202','标准住院-呼吸内科','202','住院-呼吸内科'),(349,60,'BZ203','标准住院-神经外科','203','住院-神经外科'),(350,60,'BZ301','标准医技-放射科','301','医技-放射科'),(358,62,'BZ101','标准门诊-消化内科','101','门诊-消化内科'),(359,62,'BZ102','标准门诊-呼吸内科','102','门诊-呼吸内科'),(360,62,'BZ103','标准门诊-神经外科','103','门诊-神经外科'),(361,62,'BZ201','标准住院-消化内科','201','住院-消化内科'),(362,62,'BZ202','标准住院-呼吸内科','202','住院-呼吸内科'),(363,62,'BZ203','标准住院-神经外科','203','住院-神经外科'),(364,62,'BZ301','标准医技-放射科','301','医技-放射科'),(372,64,'BZ101','标准门诊-消化内科','101','门诊-消化内科'),(373,64,'BZ102','标准门诊-呼吸内科','102','门诊-呼吸内科'),(374,64,'BZ103','标准门诊-神经外科','103','门诊-神经外科'),(375,64,'BZ201','标准住院-消化内科','201','住院-消化内科'),(376,64,'BZ202','标准住院-呼吸内科','202','住院-呼吸内科'),(377,64,'BZ203','标准住院-神经外科','203','住院-神经外科'),(378,64,'BZ301','标准医技-放射科','301','医技-放射科');
/*!40000 ALTER TABLE `t_costaccount_src_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_costaccount_src_kdgzl`
--

DROP TABLE IF EXISTS `t_costaccount_src_kdgzl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_costaccount_src_kdgzl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `dept_code_base` varchar(50) DEFAULT NULL COMMENT '科室编码-主科室',
  `dept_name_base` varchar(100) DEFAULT NULL COMMENT '科室名-主科室',
  `dept_code_yj` varchar(50) DEFAULT NULL COMMENT '科室编码-医技',
  `dept_name_yj` varchar(100) DEFAULT NULL COMMENT '科室名-医技',
  `kdgzl` double DEFAULT NULL COMMENT '开单工作量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=757 DEFAULT CHARSET=utf8 COMMENT='原始数据-开单工作量';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_costaccount_src_kdgzl`
--

LOCK TABLES `t_costaccount_src_kdgzl` WRITE;
/*!40000 ALTER TABLE `t_costaccount_src_kdgzl` DISABLE KEYS */;
INSERT INTO `t_costaccount_src_kdgzl` (`id`, `t_job_id`, `dept_code_base`, `dept_name_base`, `dept_code_yj`, `dept_name_yj`, `kdgzl`) VALUES (667,60,'101','门诊-消化内科','301','医技-放射科',223),(668,60,'102','门诊-呼吸内科','301','医技-放射科',286),(669,60,'103','门诊-神经外科','301','医技-放射科',247),(670,60,'201','住院-消化内科','301','医技-放射科',192),(671,60,'202','住院-呼吸内科','301','医技-放射科',148),(672,60,'203','住院-神经外科','301','医技-放射科',169),(673,60,'101','门诊-消化内科','302','医技-超声科',296),(674,60,'102','门诊-呼吸内科','302','医技-超声科',213),(675,60,'103','门诊-神经外科','302','医技-超声科',258),(676,60,'201','住院-消化内科','302','医技-超声科',137),(677,60,'202','住院-呼吸内科','302','医技-超声科',162),(678,60,'203','住院-神经外科','302','医技-超声科',185),(679,60,'101','门诊-消化内科','303','医技-病理科',86),(680,60,'102','门诊-呼吸内科','303','医技-病理科',99),(681,60,'103','门诊-神经外科','303','医技-病理科',75),(682,60,'201','住院-消化内科','303','医技-病理科',63),(683,60,'202','住院-呼吸内科','303','医技-病理科',56),(684,60,'203','住院-神经外科','303','医技-病理科',49),(703,62,'101','门诊-消化内科','301','医技-放射科',223),(704,62,'102','门诊-呼吸内科','301','医技-放射科',286),(705,62,'103','门诊-神经外科','301','医技-放射科',247),(706,62,'201','住院-消化内科','301','医技-放射科',192),(707,62,'202','住院-呼吸内科','301','医技-放射科',148),(708,62,'203','住院-神经外科','301','医技-放射科',169),(709,62,'101','门诊-消化内科','302','医技-超声科',296),(710,62,'102','门诊-呼吸内科','302','医技-超声科',213),(711,62,'103','门诊-神经外科','302','医技-超声科',258),(712,62,'201','住院-消化内科','302','医技-超声科',137),(713,62,'202','住院-呼吸内科','302','医技-超声科',162),(714,62,'203','住院-神经外科','302','医技-超声科',185),(715,62,'101','门诊-消化内科','303','医技-病理科',86),(716,62,'102','门诊-呼吸内科','303','医技-病理科',99),(717,62,'103','门诊-神经外科','303','医技-病理科',75),(718,62,'201','住院-消化内科','303','医技-病理科',63),(719,62,'202','住院-呼吸内科','303','医技-病理科',56),(720,62,'203','住院-神经外科','303','医技-病理科',49),(739,64,'101','门诊-消化内科','301','医技-放射科',223),(740,64,'102','门诊-呼吸内科','301','医技-放射科',286),(741,64,'103','门诊-神经外科','301','医技-放射科',247),(742,64,'201','住院-消化内科','301','医技-放射科',192),(743,64,'202','住院-呼吸内科','301','医技-放射科',148),(744,64,'203','住院-神经外科','301','医技-放射科',169),(745,64,'101','门诊-消化内科','302','医技-超声科',296),(746,64,'102','门诊-呼吸内科','302','医技-超声科',213),(747,64,'103','门诊-神经外科','302','医技-超声科',258),(748,64,'201','住院-消化内科','302','医技-超声科',137),(749,64,'202','住院-呼吸内科','302','医技-超声科',162),(750,64,'203','住院-神经外科','302','医技-超声科',185),(751,64,'101','门诊-消化内科','303','医技-病理科',86),(752,64,'102','门诊-呼吸内科','303','医技-病理科',99),(753,64,'103','门诊-神经外科','303','医技-病理科',75),(754,64,'201','住院-消化内科','303','医技-病理科',63),(755,64,'202','住院-呼吸内科','303','医技-病理科',56),(756,64,'203','住院-神经外科','303','医技-病理科',49);
/*!40000 ALTER TABLE `t_costaccount_src_kdgzl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_costaccount_src_nls`
--

DROP TABLE IF EXISTS `t_costaccount_src_nls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_costaccount_src_nls` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `dept_code` varchar(50) DEFAULT NULL COMMENT '科室编码',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '科室名',
  `pro_code` varchar(50) DEFAULT NULL COMMENT '项目编码',
  `pro_name` varchar(100) DEFAULT NULL COMMENT '项目名',
  `nls` int(11) DEFAULT NULL COMMENT '年例数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=449 DEFAULT CHARSET=utf8 COMMENT='原始数据-科室项目年例数';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_costaccount_src_nls`
--

LOCK TABLES `t_costaccount_src_nls` WRITE;
/*!40000 ALTER TABLE `t_costaccount_src_nls` DISABLE KEYS */;
INSERT INTO `t_costaccount_src_nls` (`id`, `t_job_id`, `dept_code`, `dept_name`, `pro_code`, `pro_name`, `nls`) VALUES (379,60,'101','门诊-消化内科','ABEA0001','清创(缝合)术(小)',2700),(380,60,'101','门诊-消化内科','EBBBP001','头部X线计算机体层(CT)增强扫描',500),(381,60,'102','门诊-呼吸内科','ABEA0001','清创(缝合)术(小)',1800),(382,60,'102','门诊-呼吸内科','EBBBP001','头部X线计算机体层(CT)增强扫描',1000),(383,60,'103','门诊-神经外科','ABEA0001','清创(缝合)术(小)',900),(384,60,'103','门诊-神经外科','EBBBP001','头部X线计算机体层(CT)增强扫描',1500),(385,60,'201','住院-消化内科','EBBBP001','头部X线计算机体层(CT)增强扫描',2000),(386,60,'201','住院-消化内科','HCQ50301','脊髓后根入髓区切开术',3000),(387,60,'202','住院-呼吸内科','EBBBP001','头部X线计算机体层(CT)增强扫描',2500),(388,60,'202','住院-呼吸内科','HCQ50301','脊髓后根入髓区切开术',2000),(389,60,'203','住院-神经外科','EBBBP001','头部X线计算机体层(CT)增强扫描',3000),(390,60,'203','住院-神经外科','HCQ50301','脊髓后根入髓区切开术',1000),(391,60,'301','医技-放射科','test','测试项目',1000),(392,60,'301','医技-放射科','EBBBP001','头部X线计算机体层(CT)增强扫描',1000),(407,62,'101','门诊-消化内科','ABEA0001','清创(缝合)术(小)',2700),(408,62,'101','门诊-消化内科','EBBBP001','头部X线计算机体层(CT)增强扫描',500),(409,62,'102','门诊-呼吸内科','ABEA0001','清创(缝合)术(小)',1800),(410,62,'102','门诊-呼吸内科','EBBBP001','头部X线计算机体层(CT)增强扫描',1000),(411,62,'103','门诊-神经外科','ABEA0001','清创(缝合)术(小)',900),(412,62,'103','门诊-神经外科','EBBBP001','头部X线计算机体层(CT)增强扫描',1500),(413,62,'201','住院-消化内科','EBBBP001','头部X线计算机体层(CT)增强扫描',2000),(414,62,'201','住院-消化内科','HCQ50301','脊髓后根入髓区切开术',3000),(415,62,'202','住院-呼吸内科','EBBBP001','头部X线计算机体层(CT)增强扫描',2500),(416,62,'202','住院-呼吸内科','HCQ50301','脊髓后根入髓区切开术',2000),(417,62,'203','住院-神经外科','EBBBP001','头部X线计算机体层(CT)增强扫描',3000),(418,62,'203','住院-神经外科','HCQ50301','脊髓后根入髓区切开术',1000),(419,62,'301','医技-放射科','test','测试项目',1000),(420,62,'301','医技-放射科','EBBBP001','头部X线计算机体层(CT)增强扫描',1000),(435,64,'101','门诊-消化内科','ABEA0001','清创(缝合)术(小)',2700),(436,64,'101','门诊-消化内科','EBBBP001','头部X线计算机体层(CT)增强扫描',500),(437,64,'102','门诊-呼吸内科','ABEA0001','清创(缝合)术(小)',1800),(438,64,'102','门诊-呼吸内科','EBBBP001','头部X线计算机体层(CT)增强扫描',1000),(439,64,'103','门诊-神经外科','ABEA0001','清创(缝合)术(小)',900),(440,64,'103','门诊-神经外科','EBBBP001','头部X线计算机体层(CT)增强扫描',1500),(441,64,'201','住院-消化内科','EBBBP001','头部X线计算机体层(CT)增强扫描',2000),(442,64,'201','住院-消化内科','HCQ50301','脊髓后根入髓区切开术',3000),(443,64,'202','住院-呼吸内科','EBBBP001','头部X线计算机体层(CT)增强扫描',2500),(444,64,'202','住院-呼吸内科','HCQ50301','脊髓后根入髓区切开术',2000),(445,64,'203','住院-神经外科','EBBBP001','头部X线计算机体层(CT)增强扫描',3000),(446,64,'203','住院-神经外科','HCQ50301','脊髓后根入髓区切开术',1000),(447,64,'301','医技-放射科','test','测试项目',1000),(448,64,'301','医技-放射科','EBBBP001','头部X线计算机体层(CT)增强扫描',1000);
/*!40000 ALTER TABLE `t_costaccount_src_nls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_dept`
--

DROP TABLE IF EXISTS `t_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) NOT NULL COMMENT '科室名称',
  `dept_type_code` varchar(50) NOT NULL COMMENT '科室类型编码',
  `dept_type_name` varchar(100) NOT NULL COMMENT '科室类型名称',
  `dept_special_code` varchar(50) DEFAULT NULL COMMENT '特殊科室类型编码',
  `dept_special_name` varchar(100) DEFAULT NULL COMMENT '特殊科室类型名称',
  `t_hospital_id` int(11) DEFAULT NULL COMMENT '科室对应医院id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='科室表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_dept`
--

LOCK TABLES `t_dept` WRITE;
/*!40000 ALTER TABLE `t_dept` DISABLE KEYS */;
INSERT INTO `t_dept` (`id`, `dept_code`, `dept_name`, `dept_type_code`, `dept_type_name`, `dept_special_code`, `dept_special_name`, `t_hospital_id`, `create_time`, `update_time`) VALUES (16,'101','门诊-消化内科','LC','临床','OUTPATIENT','门诊科室',2,'2017-02-11 07:57:57',NULL),(17,'102','门诊-呼吸内科','LC','临床','OUTPATIENT','门诊科室',2,'2017-02-11 07:58:17',NULL),(18,'103','门诊-神经外科','LC','临床','OUTPATIENT','门诊科室',2,'2017-02-11 07:58:32',NULL),(19,'201','住院-消化内科','LC','临床','INHOS','住院科室',2,'2017-02-11 07:58:54',NULL),(20,'202','住院-呼吸内科','LC','临床','INHOS','住院科室',2,'2017-02-11 07:59:14',NULL),(21,'203','住院-神经外科','LC','临床','INHOS','住院科室',2,'2017-02-11 07:59:33',NULL),(22,'301','医技-放射科','YJ','医技','','',2,'2017-02-11 07:59:55',NULL),(23,'302','医技-超声科','YJ','医技','','',2,'2017-02-11 08:00:16',NULL),(24,'303','医技-病理科','YJ','医技','','',2,'2017-02-11 08:00:30',NULL),(25,'401','医辅-挂号收费处','YF','医辅','REGISTER','挂号处科室',2,'2017-02-11 08:00:55',NULL),(26,'402','医辅-供应室','YF','医辅','SUPPLY','供应室科室',2,'2017-02-11 08:01:10',NULL),(27,'403','医辅-住院收费处','YF','医辅','CASHIER','住院收费处科室',2,'2017-02-11 08:01:31',NULL),(28,'404','医辅-病案室','YF','医辅','MEDICALRECORD','病案室科室',2,'2017-02-11 08:01:50',NULL),(29,'501','行政后勤-行政','XZHQ','行政后勤',NULL,'',2,'2017-02-11 08:02:11',NULL),(30,'502','行政后勤-后勤','XZHQ','行政后勤','','',2,'2017-02-11 08:02:26',NULL),(31,'3101','门诊-消化内科','LC','临床','OUTPATIENT','门诊科室',3,'2017-02-11 07:57:57',NULL),(32,'3102','门诊-呼吸内科','LC','临床','OUTPATIENT','门诊科室',3,'2017-02-11 07:58:17',NULL),(33,'3103','门诊-神经外科','LC','临床','OUTPATIENT','门诊科室',3,'2017-02-11 07:58:32',NULL),(34,'3201','住院-消化内科','LC','临床','INHOS','住院科室',3,'2017-02-11 07:58:54',NULL),(35,'3202','住院-呼吸内科','LC','临床','INHOS','住院科室',3,'2017-02-11 07:59:14',NULL),(36,'3203','住院-神经外科','LC','临床','INHOS','住院科室',3,'2017-02-11 07:59:33',NULL),(37,'3301','医技-放射科','YJ','医技','','',3,'2017-02-11 07:59:55',NULL),(38,'3302','医技-超声科','YJ','医技','','',3,'2017-02-11 08:00:16',NULL),(39,'3303','医技-病理科','YJ','医技','','',3,'2017-02-11 08:00:30',NULL),(40,'3401','医辅-挂号收费处','YF','医辅','REGISTER','挂号处科室',3,'2017-02-11 08:00:55',NULL),(41,'3402','医辅-供应室','YF','医辅','SUPPLY','供应室科室',3,'2017-02-11 08:01:10',NULL),(42,'3403','医辅-住院收费处','YF','医辅','CASHIER','住院收费处科室',3,'2017-02-11 08:01:31',NULL),(43,'3404','医辅-病案室','YF','医辅','MEDICALRECORD','病案室科室',3,'2017-02-11 08:01:50',NULL),(44,'3501','行政后勤-行政','XZHQ','行政后勤',NULL,'',3,'2017-02-11 08:02:11',NULL),(45,'3502','行政后勤-后勤','XZHQ','行政后勤','','',3,'2017-02-11 08:02:26',NULL);
/*!40000 ALTER TABLE `t_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_hospital`
--

DROP TABLE IF EXISTS `t_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hos_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `hos_name` varchar(100) DEFAULT NULL COMMENT '医院名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='医院表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_hospital`
--

LOCK TABLES `t_hospital` WRITE;
/*!40000 ALTER TABLE `t_hospital` DISABLE KEYS */;
INSERT INTO `t_hospital` (`id`, `hos_code`, `hos_name`, `create_time`, `update_time`) VALUES (2,'10001','医院1','2017-02-11 07:55:27',NULL),(3,'99999','医院2','2018-05-27 04:19:13',NULL);
/*!40000 ALTER TABLE `t_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_job_zone`
--

DROP TABLE IF EXISTS `t_job_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_job_zone` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `desc` varchar(200) NOT NULL COMMENT '描述',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` timestamp NULL DEFAULT NULL,
  `create_user` varchar(45) DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_job_zone`
--

LOCK TABLES `t_job_zone` WRITE;
/*!40000 ALTER TABLE `t_job_zone` DISABLE KEYS */;
INSERT INTO `t_job_zone` (`id`, `desc`, `create_time`, `update_time`, `create_user`) VALUES (7,'中文描述1','2018-09-28 15:30:42',NULL,'test'),(8,'中文描述','2018-09-28 15:54:10',NULL,'admin');
/*!40000 ALTER TABLE `t_job_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_job_zone_reljob`
--

DROP TABLE IF EXISTS `t_job_zone_reljob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_job_zone_reljob` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobzone_id` int(11) NOT NULL COMMENT '区域级任务id',
  `ccjob_id` int(11) NOT NULL COMMENT '成本核算任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_job_zone_reljob`
--

LOCK TABLES `t_job_zone_reljob` WRITE;
/*!40000 ALTER TABLE `t_job_zone_reljob` DISABLE KEYS */;
INSERT INTO `t_job_zone_reljob` (`id`, `jobzone_id`, `ccjob_id`) VALUES (10,7,62),(11,8,64);
/*!40000 ALTER TABLE `t_job_zone_reljob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_org`
--

DROP TABLE IF EXISTS `t_org`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_org` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `ORG_NAME` varchar(200) DEFAULT NULL COMMENT '机构名',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ORG_NAME` (`ORG_NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='机构表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_org`
--

LOCK TABLES `t_org` WRITE;
/*!40000 ALTER TABLE `t_org` DISABLE KEYS */;
INSERT INTO `t_org` (`ID`, `ORG_NAME`) VALUES (3,'测试机构4'),(7,'超级管理机构');
/*!40000 ALTER TABLE `t_org` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pro_dic`
--

DROP TABLE IF EXISTS `t_pro_dic`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pro_dic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_code` varchar(100) DEFAULT NULL COMMENT '项目代码',
  `pro_name` varchar(200) NOT NULL COMMENT '项目名称',
  `cost_time` int(11) DEFAULT NULL COMMENT '项目耗时',
  `pc_ys` int(11) DEFAULT NULL COMMENT '基本人力消耗-医生',
  `pc_hs` int(11) DEFAULT NULL COMMENT '基本人力消耗-护士',
  `pc_js` int(11) DEFAULT NULL COMMENT '基本人力消耗-技师',
  `pc_o` int(11) DEFAULT NULL COMMENT '基本人力消耗-其它（药师）',
  `t_hospital_id` int(11) DEFAULT NULL COMMENT '医院id',
  `wsclf` double DEFAULT NULL COMMENT '卫生材料费',
  `ylfxjj` double DEFAULT NULL COMMENT '医疗风险基金',
  `nd` double DEFAULT NULL COMMENT '技术难度指数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='项目字典表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pro_dic`
--

LOCK TABLES `t_pro_dic` WRITE;
/*!40000 ALTER TABLE `t_pro_dic` DISABLE KEYS */;
INSERT INTO `t_pro_dic` (`id`, `pro_code`, `pro_name`, `cost_time`, `pc_ys`, `pc_hs`, `pc_js`, `pc_o`, `t_hospital_id`, `wsclf`, `ylfxjj`, `nd`) VALUES (49,'HCQ50301','脊髓后根入髓区切开术',360,2,3,0,0,NULL,55,4,5),(50,'test','测试项目',60,0,0,0,1,NULL,33,2,4),(51,'EBBBP001','头部X线计算机体层(CT)增强扫描',120,0,0,1,0,NULL,62.5,3,2),(52,'ABEA0001','清创(缝合)术(小)',60,0,1,0,0,NULL,30,5,3);
/*!40000 ALTER TABLE `t_pro_dic` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pro_dic_dept`
--

DROP TABLE IF EXISTS `t_pro_dic_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pro_dic_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_code` varchar(100) DEFAULT NULL COMMENT '项目编码',
  `pro_name` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `dept_code` varchar(100) DEFAULT NULL COMMENT '科室编码',
  `dept_name` varchar(200) DEFAULT NULL COMMENT '科室名称',
  `t_dept_id` int(11) DEFAULT NULL COMMENT '科室id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目与科室关系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pro_dic_dept`
--

LOCK TABLES `t_pro_dic_dept` WRITE;
/*!40000 ALTER TABLE `t_pro_dic_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `t_pro_dic_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pro_result`
--

DROP TABLE IF EXISTS `t_pro_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pro_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_code` varchar(100) DEFAULT NULL COMMENT '项目编码',
  `pro_name` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `dept_code` varchar(100) DEFAULT NULL COMMENT '科室编码',
  `dept_name` varchar(200) DEFAULT NULL COMMENT '科室名称',
  `t_job_id` int(11) NOT NULL COMMENT '任务id',
  `cost_people_direct` double DEFAULT NULL COMMENT '人员费用-直接',
  `cost_people_mid_yw` double DEFAULT NULL COMMENT '人员费用-间接-业务成本',
  `cost_people_mid_all` double DEFAULT NULL COMMENT '人员费用-间接-全成本',
  `cost_house_direct` double DEFAULT NULL COMMENT '房屋、通用设备费用-直接',
  `cost_house_mid_yw` double DEFAULT NULL COMMENT '房屋、通用设备费用-间接-业务成本',
  `cost_house_mid_all` double DEFAULT NULL COMMENT '房屋、通用设备费用-间接-全成本',
  `cost_spe_direct` double DEFAULT NULL COMMENT '专用设备折旧费-直接',
  `cost_spe_mid_yw` double DEFAULT NULL COMMENT '专用设备折旧费-间接-业务',
  `cost_spe_mid_all` double DEFAULT NULL COMMENT '专用设备折旧费-间接-全成本',
  `cost_asset_direct` double DEFAULT NULL COMMENT '无形资产摊销费-直接',
  `cost_asset_mid_yw` double DEFAULT NULL COMMENT '无形资产摊销费-间接-业务',
  `cost_asset_mid_all` double DEFAULT NULL COMMENT '无形资产摊销费-间接-全成本',
  `cost_other_direct` double DEFAULT NULL COMMENT '其他费用-直接',
  `cost_other_mid_yw` double DEFAULT NULL COMMENT '其他费用-间接-业务',
  `cost_other_mid_all` double DEFAULT NULL COMMENT '其他费用-间接-全成本',
  `cost_wsclf` double DEFAULT NULL COMMENT '卫生材料费',
  `cost_ylfxjj` double DEFAULT NULL COMMENT '医疗风险基金',
  `level` int(11) DEFAULT NULL COMMENT '结果级别：1-科室、2-医院',
  `type` int(11) DEFAULT '1' COMMENT '类型：1-理论，2-实际，3-价值点数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5878 DEFAULT CHARSET=utf8 COMMENT='理论成本算法计算结果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pro_result`
--

LOCK TABLES `t_pro_result` WRITE;
/*!40000 ALTER TABLE `t_pro_result` DISABLE KEYS */;
INSERT INTO `t_pro_result` (`id`, `pro_code`, `pro_name`, `dept_code`, `dept_name`, `t_job_id`, `cost_people_direct`, `cost_people_mid_yw`, `cost_people_mid_all`, `cost_house_direct`, `cost_house_mid_yw`, `cost_house_mid_all`, `cost_spe_direct`, `cost_spe_mid_yw`, `cost_spe_mid_all`, `cost_asset_direct`, `cost_asset_mid_yw`, `cost_asset_mid_all`, `cost_other_direct`, `cost_other_mid_yw`, `cost_other_mid_all`, `cost_wsclf`, `cost_ylfxjj`, `level`, `type`) VALUES (5744,'HCQ50301','脊髓后根入髓区切开术',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,4,2,1),(5745,'test','测试项目',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,33,2,2,1),(5746,'EBBBP001','头部X线计算机体层(CT)增强扫描',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62.5,3,2,1),(5747,'ABEA0001','清创(缝合)术(小)',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,5,2,1),(5748,'HCQ50301','脊髓后根入髓区切开术',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,4,2,2),(5749,'test','测试项目',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,33,2,2,2),(5750,'EBBBP001','头部X线计算机体层(CT)增强扫描',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62.5,3,2,2),(5751,'ABEA0001','清创(缝合)术(小)',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,5,2,2),(5752,'HCQ50301','脊髓后根入髓区切开术',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,55,4,2,3),(5753,'test','测试项目',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,33,2,2,3),(5754,'EBBBP001','头部X线计算机体层(CT)增强扫描',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,62.5,3,2,3),(5755,'ABEA0001','清创(缝合)术(小)',NULL,NULL,62,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,30,5,2,3),(5780,'HCQ50301','脊髓后根入髓区切开术','101','门诊-消化内科',64,1459.5479397590361,8.605153203687603,18.569970488241584,70.692760607648,13.41983009938552,28.75980224681187,1625.362951807229,0,0,70.692760607648,13.422198683584034,28.757529151084743,70.68770822420116,13.4206501755538,28.755626017003255,55,4,1,1),(5781,'test','测试项目','101','门诊-消化内科',64,48.65159799196787,0.2868384401229201,0.6189990162747195,2.3564253535882664,0.44732766997951734,0.958660074893729,54.17876506024096,0,0,2.3564253535882664,0.44740662278613447,0.9585843050361581,2.356256940806705,0.4473550058517933,0.9585208672334418,33,2,1,1),(5782,'EBBBP001','头部X线计算机体层(CT)增强扫描','101','门诊-消化内科',64,97.30319598393574,0.5736768802458402,1.237998032549439,4.712850707176533,0.8946553399590347,1.917320149787458,108.35753012048193,0,0,4.712850707176533,0.8948132455722689,1.9171686100723162,4.71251388161341,0.8947100117035865,1.9170417344668835,62.5,3,1,1),(5783,'ABEA0001','清创(缝合)术(小)','101','门诊-消化内科',64,48.65159799196787,0.2868384401229201,0.6189990162747195,2.3564253535882664,0.44732766997951734,0.958660074893729,54.17876506024096,0,0,2.3564253535882664,0.44740662278613447,0.9585843050361581,2.356256940806705,0.4473550058517933,0.9585208672334418,30,5,1,1),(5784,'HCQ50301','脊髓后根入髓区切开术','102','门诊-呼吸内科',64,1570.539512048193,11.252684935207224,21.217502222683695,73.87101588170864,17.545666663809754,32.88563881573502,1625.5140361445783,0,0,73.87101588170864,17.54853802000338,32.88386849200164,73.87143483023002,17.54660173749232,32.881577583439224,55,4,1,1),(5785,'test','测试项目','102','门诊-呼吸内科',64,52.3513170682731,0.3750894978402408,0.7072500740894565,2.4623671960569546,0.5848555554603252,1.0961879605245006,54.183801204819275,0,0,2.4623671960569546,0.5849512673334459,1.0961289497333881,2.4623811610076674,0.5848867245830773,1.0960525861146406,33,2,1,1),(5786,'EBBBP001','头部X线计算机体层(CT)增强扫描','102','门诊-呼吸内科',64,104.7026341365462,0.7501789956804816,1.414500148178913,4.924734392113909,1.1697111109206504,2.1923759210490013,108.36760240963855,0,0,4.924734392113909,1.1699025346668919,2.1922578994667763,4.924762322015335,1.1697734491661547,2.1921051722292813,62.5,3,1,1),(5787,'ABEA0001','清创(缝合)术(小)','102','门诊-呼吸内科',64,52.3513170682731,0.3750894978402408,0.7072500740894565,2.4623671960569546,0.5848555554603252,1.0961879605245006,54.183801204819275,0,0,2.4623671960569546,0.5849512673334459,1.0961289497333881,2.4623811610076674,0.5848867245830773,1.0960525861146406,30,5,1,1),(5788,'HCQ50301','脊髓后根入髓区切开术','103','门诊-神经外科',64,1482.4036703958693,14.271273809067237,24.236091096543706,73.88013417305585,22.26664870592718,37.60662085785245,1625.9157831325301,0,0,73.90238773274918,22.271358711367892,37.60668918336616,73.89110898138007,22.268483853643477,37.60345969959039,55,4,1,1),(5789,'test','测试项目','103','门诊-神经外科',64,49.41345567986231,0.4757091269689079,0.8078697032181236,2.462671139101862,0.7422216235309061,1.2535540285950815,54.19719277108433,0,0,2.4634129244249725,0.7423786237122632,1.2535563061122053,2.4630369660460025,0.7422827951214492,1.253448656653013,33,2,1,1),(5790,'EBBBP001','头部X线计算机体层(CT)增强扫描','103','门诊-神经外科',64,98.82691135972462,0.9514182539378158,1.6157394064362471,4.925342278203724,1.4844432470618123,2.507108057190163,108.39438554216866,0,0,4.926825848849945,1.4847572474245263,2.5071126122244105,4.926073932092005,1.4845655902428985,2.506897313306026,62.5,3,1,1),(5791,'ABEA0001','清创(缝合)术(小)','103','门诊-神经外科',64,49.41345567986231,0.4757091269689079,0.8078697032181236,2.462671139101862,0.7422216235309061,1.2535540285950815,54.19719277108433,0,0,2.4634129244249725,0.7423786237122632,1.2535563061122053,2.4630369660460025,0.7422827951214492,1.253448656653013,30,5,1,1),(5792,'HCQ50301','脊髓后根入髓区切开术','201','住院-消化内科',64,1077.3724379335524,26.04847717583752,36.01329446424326,52.43593664982511,40.49993839104452,55.83991054440032,1625.3513855421688,0,0,52.44571900505247,40.48840555937291,55.82373603280127,52.43545860862805,40.490598094849524,55.8255739422265,55,4,1,1),(5793,'test','测试项目','201','住院-消化内科',64,35.91241459778508,0.8682825725279173,1.2004431488081084,1.7478645549941703,1.3499979463681508,1.8613303514800108,54.17837951807229,0,0,1.748190633501749,1.3496135186457636,1.8607912010933756,1.7478486202876018,1.3496866031616508,1.8608524647408833,33,2,1,1),(5794,'EBBBP001','头部X线计算机体层(CT)增强扫描','201','住院-消化内科',64,71.82482919557016,1.7365651450558346,2.400886297616217,3.4957291099883405,2.6999958927363017,3.7226607029600216,108.35675903614458,0,0,3.496381267003498,2.6992270372915272,3.721582402186751,3.4956972405752036,2.6993732063233016,3.7217049294817666,62.5,3,1,1),(5795,'ABEA0001','清创(缝合)术(小)','201','住院-消化内科',64,35.91241459778508,0.8682825725279173,1.2004431488081084,1.7478645549941703,1.3499979463681508,1.8613303514800108,54.17837951807229,0,0,1.748190633501749,1.3496135186457636,1.8607912010933756,1.7478486202876018,1.3496866031616508,1.8608524647408833,30,5,1,1),(5796,'HCQ50301','脊髓后根入髓区切开术','202','住院-呼吸内科',64,1123.9605760542167,29.776631813983645,39.74144910466092,54.19719277108433,46.29636254862525,61.6363347054779,1625.7386746987952,0,0,54.172385542168676,46.28320211211082,61.61853258903497,54.20094578313253,46.285700808658866,61.620676659531554,55,4,1,1),(5797,'test','测试项目','202','住院-呼吸内科',64,37.46535253514055,0.9925543937994548,1.3247149701553642,1.8065730923694778,1.5432120849541748,2.0545444901825967,54.1912891566265,0,0,1.805746184738956,1.5427734037370273,2.053951086301166,1.8066981927710843,1.5428566936219623,2.0540225553177183,33,2,1,1),(5798,'EBBBP001','头部X线计算机体层(CT)增强扫描','202','住院-呼吸内科',64,74.9307050702811,1.9851087875989095,2.6494299403107284,3.6131461847389557,3.0864241699083497,4.109088980365193,108.382578313253,0,0,3.611492369477912,3.0855468074740546,4.107902172602332,3.6133963855421687,3.0857133872439246,4.1080451106354365,62.5,3,1,1),(5799,'ABEA0001','清创(缝合)术(小)','202','住院-呼吸内科',64,37.46535253514055,0.9925543937994548,1.3247149701553642,1.8065730923694778,1.5432120849541748,2.0545444901825967,54.1912891566265,0,0,1.805746184738956,1.5427734037370273,2.053951086301166,1.8066981927710843,1.5428566936219623,2.0540225553177183,30,5,1,1),(5800,'HCQ50301','脊髓后根入髓区切开术','203','住院-神经外科',64,910.1141216404078,28.621625161631428,38.58644245230871,45.148649598393575,44.50123519064669,59.84120734749934,1625.9334939759037,0,0,45.15567771084338,44.48838736488919,59.82371784181334,45.18013554216868,44.490854842186444,59.82583069305913,55,4,1,1),(5801,'test','测试项目','203','住院-神经外科',64,30.337137388013595,0.9540541720543809,1.2862147484102904,1.504954986613119,1.4833745063548895,1.9947069115833114,54.19778313253013,0,0,1.5051892570281125,1.4829462454963065,1.9941239280604448,1.5060045180722892,1.4830284947395482,1.9941943564353042,33,2,1,1),(5802,'EBBBP001','头部X线计算机体层(CT)增强扫描','203','住院-神经外科',64,60.67427477602719,1.9081083441087618,2.5724294968205808,3.009909973226238,2.966749012709779,3.9894138231666227,108.39556626506025,0,0,3.010378514056225,2.965892490992613,3.9882478561208896,3.0120090361445784,2.9660569894790965,3.9883887128706084,62.5,3,1,1),(5803,'ABEA0001','清创(缝合)术(小)','203','住院-神经外科',64,30.337137388013595,0.9540541720543809,1.2862147484102904,1.504954986613119,1.4833745063548895,1.9947069115833114,54.19778313253013,0,0,1.5051892570281125,1.4829462454963065,1.9941239280604448,1.5060045180722892,1.4830284947395482,1.9941943564353042,30,5,1,1),(5804,'HCQ50301','脊髓后根入髓区切开术','301','医技-放射科',64,2100.6023493975904,36.389374520935874,46.354191811613155,180.63763052208836,56.76965544823038,72.10962760508303,1625.1623493975903,0,0,180.61102409638553,56.78117137550602,72.11650185243018,180.69128514056223,56.77403469792572,72.1090105487984,55,4,1,1),(5805,'test','测试项目','301','医技-放射科',64,70.02007831325302,1.2129791506978624,1.545139727053772,6.021254350736278,1.892321848274346,2.4036542535027676,54.17207831325301,0,0,6.020367469879518,1.8927057125168671,2.4038833950810057,6.023042838018741,1.8924678232641905,2.4036336849599467,33,2,1,1),(5806,'EBBBP001','头部X线计算机体层(CT)增强扫描','301','医技-放射科',64,140.04015662650605,2.425958301395725,3.090279454107544,12.042508701472556,3.784643696548692,4.807308507005535,108.34415662650602,0,0,12.040734939759036,3.7854114250337343,4.807766790162011,12.046085676037482,3.784935646528381,4.807267369919893,62.5,3,1,1),(5807,'ABEA0001','清创(缝合)术(小)','301','医技-放射科',64,70.02007831325302,1.2129791506978624,1.545139727053772,6.021254350736278,1.892321848274346,2.4036542535027676,54.17207831325301,0,0,6.020367469879518,1.8927057125168671,2.4038833950810057,6.023042838018741,1.8924678232641905,2.4036336849599467,30,5,1,1),(5808,'HCQ50301','脊髓后根入髓区切开术','302','医技-超声科',64,495.5340103270224,14.393643109943994,17.71524887014985,232.25811531841651,67.32971693067482,82.6696890720414,1625.852530120482,0,0,232.28976764199655,67.34074807781771,82.67607853926049,232.19470740103273,67.33331285100716,82.66828868639884,55,4,1,1),(5809,'test','测试项目','302','医技-超声科',64,16.51780034423408,0.4797881036647998,0.5905082956716617,7.74193717728055,2.2443238976891604,2.7556563024013796,54.1950843373494,0,0,7.742992254733219,2.2446916025939236,2.755869284642016,7.7398235800344235,2.244443761700239,2.755609622879961,33,2,1,1),(5810,'EBBBP001','头部X线计算机体层(CT)增强扫描','302','医技-超声科',64,33.03560068846816,0.9595762073295996,1.1810165913433235,15.4838743545611,4.488647795378321,5.511312604802759,108.3901686746988,0,0,15.485984509466437,4.489383205187847,5.511738569284032,15.479647160068847,4.488887523400478,5.511219245759922,62.5,3,1,1),(5811,'ABEA0001','清创(缝合)术(小)','302','医技-超声科',64,16.51780034423408,0.4797881036647998,0.5905082956716617,7.74193717728055,2.2443238976891604,2.7556563024013796,54.1950843373494,0,0,7.742992254733219,2.2446916025939236,2.755869284642016,7.7398235800344235,2.244443761700239,2.755609622879961,30,5,1,1),(5812,'HCQ50301','脊髓后根入髓区切开术','303','医技-病理科',64,580.2358132530121,17.428206763899652,20.749812527458747,270.86192771084336,81.54346037385932,96.88343253071197,1625.6043975903615,0,0,271.0808132530121,81.55822811109391,96.89355858801807,270.9190060240964,81.54867179675574,96.88364764762842,55,4,1,1),(5813,'test','测试项目','303','医技-病理科',64,19.341193775100404,0.5809402254633217,0.6916604175819583,9.028730923694779,2.7181153457953107,3.229447751023732,54.18681325301205,0,0,9.036027108433736,2.71860760370313,3.2297852862672687,9.030633534136546,2.718289059891858,3.2294549215876143,33,2,1,1),(5814,'EBBBP001','头部X线计算机体层(CT)增强扫描','303','医技-病理科',64,38.68238755020081,1.1618804509266434,1.3833208351639166,18.057461847389558,5.436230691590621,6.458895502047464,108.3736265060241,0,0,18.07205421686747,5.43721520740626,6.459570572534537,18.061267068273093,5.436578119783716,6.4589098431752285,62.5,3,1,1),(5815,'ABEA0001','清创(缝合)术(小)','303','医技-病理科',64,19.341193775100404,0.5809402254633217,0.6916604175819583,9.028730923694779,2.7181153457953107,3.229447751023732,54.18681325301205,0,0,9.036027108433736,2.71860760370313,3.2297852862672687,9.030633534136546,2.718289059891858,3.2294549215876143,30,5,1,1),(5816,'HCQ50301','脊髓后根入髓区切开术',NULL,NULL,64,1456.404093727283,24.033806152695664,33.99862344104316,117.10926258145153,43.35250159468927,58.69247374729036,1625.6039558232935,0,0,117.13572794128494,43.35358200174954,58.68891247442342,117.11908783727021,43.350989873119225,58.68596571974174,55,4,2,1),(5817,'test','测试项目',NULL,NULL,64,48.546803124242764,0.8011268717565221,1.1332874480347719,3.903642086048384,1.4450833864896424,1.9564157915763452,54.186798527443116,0,0,3.904524264709498,1.4451194000583178,1.9562970824807806,3.903969594575674,1.445032995770641,1.9561988573247246,33,2,2,1),(5818,'EBBBP001','头部X线计算机体层(CT)增强扫描',NULL,NULL,64,97.09360624848553,1.6022537435130442,2.2665748960695438,7.807284172096768,2.890166772979285,3.9128315831526903,108.37359705488623,0,0,7.809048529418996,2.8902388001166357,3.912594164961561,7.807939189151348,2.890065991541282,3.9123977146494493,62.5,3,2,1),(5819,'ABEA0001','清创(缝合)术(小)',NULL,NULL,64,48.546803124242764,0.8011268717565221,1.1332874480347719,3.903642086048384,1.4450833864896424,1.9564157915763452,54.186798527443116,0,0,3.904524264709498,1.4451194000583178,1.9562970824807806,3.903969594575674,1.445032995770641,1.9561988573247246,30,5,2,1),(5820,'EBBBP001','头部X线计算机体层(CT)增强扫描','101','门诊-消化内科',64,39.96466,0.6348690808053965,1.370051156021379,48.63152432432433,9.23187591341512,19.784671167266257,48.61445945945946,0,0,48.63152432432433,9.233505328634926,19.783107441232712,48.62804864864865,9.232440066714307,19.781798222147465,62.5,3,1,2),(5821,'ABEA0001','清创(缝合)术(小)','101','门诊-消化内科',64,71.88942592592593,0.3527050448918869,0.7611395311229885,24.315762162162162,4.61593795670756,9.892335583633127,24.307229729729727,0,0,24.315762162162162,4.616752664317463,9.891553720616354,24.314024324324322,4.616220033357153,9.89089911107373,30,5,1,2),(5822,'EBBBP001','头部X线计算机体层(CT)增强扫描','102','门诊-呼吸内科',64,19.659580000000002,0.6226485664147998,1.1740351229884978,47.329289473684206,11.241539413374248,21.069886483344614,47.339531578947366,0,0,47.329289473684206,11.243379096324972,21.068752233822803,47.329557894736844,11.242138516723148,21.06728444468773,62.5,3,1,2),(5823,'ABEA0001','清创(缝合)术(小)','102','门诊-呼吸内科',64,108.06882777777778,0.5765264503840739,1.087069558322683,23.664644736842103,5.620769706687124,10.534943241672305,23.669765789473686,0,0,23.664644736842103,5.621689548162486,10.534376116911403,23.66477894736842,5.621069258361574,10.533642222343863,30,5,1,2),(5824,'EBBBP001','头部X线计算机体层(CT)增强扫描','103','门诊-神经外科',64,12.99082,0.35096762256372765,0.5960283143742601,46.12141025641026,13.900478816076252,23.476816986816605,46.13709743589744,0,0,46.13530256410257,13.903419147677873,23.476859640624482,46.12826153846154,13.901624450171964,23.474843559470784,62.5,3,1,2),(5825,'ABEA0001','清创(缝合)术(小)','103','门诊-神经外科',64,216.62372222222223,2.0473111316217447,3.4768318338498507,23.06070512820513,6.950239408038127,11.738408493408302,23.068548717948715,0,0,23.06765128205128,6.9517095738389365,11.73842982031224,23.064130769230772,6.950812225085983,11.737421779735394,30,5,1,2),(5826,'HCQ50301','脊髓后根入髓区切开术','201','住院-消化内科',64,257.2997666666667,4.644347004610437,6.4210370204024825,28.705886170212768,22.1715620170548,30.569380815051495,28.70301382978724,0,0,28.711241489361704,22.165248405163084,30.560526130297376,28.705624468085105,22.1664487017123,30.561532287946548,55,4,1,2),(5827,'EBBBP001','头部X线计算机体层(CT)增强扫描','201','住院-消化内科',64,9.926845,0.48044969013211425,0.6642452090071534,1.913725744680851,1.47810413447032,2.037958721003433,1.913534255319149,0,0,1.9140827659574469,1.4776832270108724,2.037368408686492,1.91370829787234,1.4777632467808204,2.037435485863103,62.5,3,1,2),(5828,'HCQ50301','脊髓后根入髓区切开术','202','住院-呼吸内科',64,387.143605,7.688988037299777,10.26212530213689,41.523387692307686,35.470136229562115,47.222914897427685,41.518864615384615,0,0,41.504381538461544,35.46005331050952,47.20927573744526,41.52626307692308,35.46196769648019,47.21091842530264,55,4,1,2),(5829,'EBBBP001','头部X线计算机体层(CT)增强扫描','202','住院-呼吸内科',64,7.809912,0.43937074498855866,0.5864071601221079,2.7682258461538463,2.364675748637474,3.1481943264951786,2.767924307692308,0,0,2.7669587692307696,2.3640035540339683,3.1472850491630173,2.768417538461539,2.3641311797653457,3.1473945616868426,62.5,3,1,2),(5830,'HCQ50301','脊髓后根入髓区切开术','203','住院-神经外科',64,771.67255,17.421029181712996,23.486281305971904,74.94675833333334,73.8720504164735,99.3364041968489,74.9736,0,0,74.958425,73.85072302571605,99.30737161741015,74.999025,73.85481903802952,99.31087895047817,55,4,1,2),(5831,'EBBBP001','头部X线计算机体层(CT)增强扫描','203','住院-神经外科',64,6.557993333333333,0.527909975203424,0.7117054941203607,4.996450555555556,4.924803361098234,6.622426946456594,4.99824,0,0,4.997228333333333,4.923381535047737,6.620491441160677,4.999935,4.9236546025353,6.62072526336521,62.5,3,1,2),(5832,'test','测试项目','301','医技-放射科',64,64.50721666666666,1.1186363278658065,1.4249621927273675,29.985846666666664,9.423762804406243,11.970198182443783,29.975216666666665,0,0,29.981429999999996,9.425674448333996,11.971339307503408,29.994753333333332,9.424489759855668,11.970095751100533,33,2,1,2),(5833,'EBBBP001','头部X线计算机体层(CT)增强扫描','301','医技-放射科',64,129.01443333333333,2.237272655731613,2.849924385454735,59.97169333333333,18.847525608812486,23.940396364887565,59.95043333333333,0,0,59.96285999999999,18.851348896667993,23.942678615006816,59.989506666666664,18.848979519711335,23.940191502201067,62.5,3,1,2),(5834,'HCQ50301','脊髓后根入髓区切开术',NULL,NULL,64,386.30984333333333,7.788674378357311,10.545607161908855,40.6851987047645,35.22116815446035,47.58172940614312,40.68672845335516,0,0,40.683485424168026,35.21109581037073,47.56791691386547,40.69473742635025,35.21301675602113,47.56955211082052,55,4,2,2),(5835,'test','测试项目',NULL,NULL,64,64.50721666666666,1.1186363278658065,1.4249621927273675,29.985846666666664,9.423762804406243,11.970198182443783,29.975216666666665,0,0,29.981429999999996,9.425674448333996,11.971339307503408,29.994753333333332,9.424489759855668,11.970095751100533,33,2,2,2),(5836,'EBBBP001','头部X线计算机体层(CT)增强扫描',NULL,NULL,64,21.495219420289853,0.6388576838904868,0.9158828137996495,19.698802445670268,6.886785124072843,10.602741566061288,19.69951652832397,0,0,19.699835907564523,6.887141680267574,10.60197372123002,19.702064924810315,6.886660260489608,10.601406396800668,62.5,3,2,2),(5837,'ABEA0001','清创(缝合)术(小)',NULL,NULL,64,108.07160925925928,0.7097465278442588,1.322398257310697,23.88954684806264,5.339932115255842,10.414216954608717,23.888294914347547,0,0,23.89070454037033,5.340891110519383,10.413640535997352,23.889293606156762,5.340268473646765,10.412900592940717,30,5,2,2),(5838,'HCQ50301','脊髓后根入髓区切开术','101','门诊-消化内科',64,1230.288402133986,0,0,99.45256285445987,0,0,1625.362951807229,0,0,99.45028975873274,0,0,99.44333424120441,0,0,55,4,1,3),(5839,'test','测试项目','101','门诊-消化内科',64,24.900428407241797,0,0,3.3150854284819955,0,0,54.17876506024096,0,0,3.3150096586244246,0,0,3.314777808040147,0,0,33,2,1,3),(5840,'EBBBP001','头部X线计算机体层(CT)增强扫描','101','门诊-消化内科',64,24.900428407241797,0,0,6.630170856963991,0,0,108.35753012048193,0,0,6.630019317248849,0,0,6.629555616080294,0,0,62.5,3,1,3),(5841,'ABEA0001','清创(缝合)术(小)','101','门诊-消化内科',64,59.08329118494942,0,0,3.3150854284819955,0,0,54.17876506024096,0,0,3.3150096586244246,0,0,3.314777808040147,0,0,30,5,1,3),(5842,'HCQ50301','脊髓后根入髓区切开术','102','门诊-呼吸内科',64,1434.7478502912138,0,0,106.75665469744366,0,0,1625.5140361445783,0,0,106.75488437371028,0,0,106.75301241366924,0,0,55,4,1,3),(5843,'test','测试项目','102','门诊-呼吸内科',64,16.733827408022893,0,0,3.5585551565814555,0,0,54.183801204819275,0,0,3.558496145790343,0,0,3.558433747122308,0,0,33,2,1,3),(5844,'EBBBP001','头部X线计算机体层(CT)增强扫描','102','门诊-呼吸内科',64,16.733827408022893,0,0,7.117110313162911,0,0,108.36760240963855,0,0,7.116992291580686,0,0,7.116867494244616,0,0,62.5,3,1,3),(5845,'ABEA0001','清创(缝合)术(小)','102','门诊-呼吸内科',64,71.0170898331256,0,0,3.5585551565814555,0,0,54.183801204819275,0,0,3.558496145790343,0,0,3.558433747122308,0,0,30,5,1,3),(5846,'HCQ50301','脊髓后根入髓区切开术','103','门诊-神经外科',64,1479.5420133163736,0,0,111.48675503090831,0,0,1625.9157831325301,0,0,111.50907691611533,0,0,111.49456868097045,0,0,55,4,1,3),(5847,'test','测试项目','103','门诊-神经外科',64,24.554545146459503,0,0,3.7162251676969436,0,0,54.19719277108433,0,0,3.7169692305371775,0,0,3.7164856226990146,0,0,33,2,1,3),(5848,'EBBBP001','头部X线计算机体层(CT)增强扫描','103','门诊-神经外科',64,24.554545146459503,0,0,7.432450335393887,0,0,108.39438554216866,0,0,7.433938461074355,0,0,7.432971245398029,0,0,62.5,3,1,3),(5849,'ABEA0001','清创(缝合)术(小)','103','门诊-神经外科',64,51.142125297021906,0,0,3.7162251676969436,0,0,54.19719277108433,0,0,3.7169692305371775,0,0,3.7164856226990146,0,0,30,5,1,3),(5850,'HCQ50301','脊髓后根入髓区切开术','201','住院-消化内科',64,1225.5615121678686,0,0,108.27584719422543,0,0,1625.3513855421688,0,0,108.26945503785373,0,0,108.26103255085454,0,0,55,4,1,3),(5851,'test','测试项目','201','住院-消化内科',64,25.520699298812417,0,0,3.609194906474181,0,0,54.17837951807229,0,0,3.6089818345951246,0,0,3.6087010850284846,0,0,33,2,1,3),(5852,'EBBBP001','头部X线计算机体层(CT)增强扫描','201','住院-消化内科',64,25.520699298812417,0,0,7.218389812948362,0,0,108.35675903614458,0,0,7.217963669190249,0,0,7.217402170056969,0,0,62.5,3,1,3),(5853,'ABEA0001','清创(缝合)术(小)','201','住院-消化内科',64,32.821898789552904,0,0,3.609194906474181,0,0,54.17837951807229,0,0,3.6089818345951246,0,0,3.6087010850284846,0,0,30,5,1,3),(5854,'HCQ50301','脊髓后根入髓区切开术','202','住院-呼吸内科',64,1076.4499747662082,0,0,115.83352747656222,0,0,1625.7386746987952,0,0,115.79091813120364,0,0,115.82162244266408,0,0,55,4,1,3),(5855,'test','测试项目','202','住院-呼吸内科',64,25.29011795217502,0,0,3.8611175825520743,0,0,54.1912891566265,0,0,3.859697271040121,0,0,3.860720748088803,0,0,33,2,1,3),(5856,'EBBBP001','头部X线计算机体层(CT)增强扫描','202','住院-呼吸内科',64,25.29011795217502,0,0,7.7222351651041485,0,0,108.382578313253,0,0,7.719394542080242,0,0,7.721441496177606,0,0,62.5,3,1,3),(5857,'ABEA0001','清创(缝合)术(小)','202','住院-呼吸内科',64,30.50889268099874,0,0,3.8611175825520743,0,0,54.1912891566265,0,0,3.859697271040121,0,0,3.860720748088803,0,0,30,5,1,3),(5858,'HCQ50301','脊髓后根入髓区切开术','203','住院-神经外科',64,964.7352096557637,0,0,104.98985694589291,0,0,1625.9334939759037,0,0,104.97939555265673,0,0,105.0059662352278,0,0,55,4,1,3),(5859,'test','测试项目','203','住院-神经外科',64,17.517346572177573,0,0,3.4996618981964303,0,0,54.19778313253013,0,0,3.4993131850885577,0,0,3.500198874507593,0,0,33,2,1,3),(5860,'EBBBP001','头部X线计算机体层(CT)增强扫描','203','住院-神经外科',64,17.517346572177573,0,0,6.9993237963928605,0,0,108.39556626506025,0,0,6.998626370177115,0,0,7.000397749015186,0,0,62.5,3,1,3),(5861,'ABEA0001','清创(缝合)术(小)','203','住院-神经外科',64,28.22955673172818,0,0,3.4996618981964303,0,0,54.19778313253013,0,0,3.4993131850885577,0,0,3.500198874507593,0,0,30,5,1,3),(5862,'HCQ50301','脊髓后根入髓区切开术','301','医技-放射科',64,313.62888053099726,0,0,252.74725812717136,0,0,1625.1623493975903,0,0,252.7275259488157,0,0,252.8002956893606,0,0,55,4,1,3),(5863,'test','测试项目','301','医技-放射科',64,95.32363208587088,0,0,8.424908604239045,0,0,54.17207831325301,0,0,8.424250864960523,0,0,8.426676522978687,0,0,33,2,1,3),(5864,'EBBBP001','头部X线计算机体层(CT)增强扫描','301','医技-放射科',64,95.32363208587088,0,0,16.84981720847809,0,0,108.34415662650602,0,0,16.848501729921047,0,0,16.853353045957373,0,0,62.5,3,1,3),(5865,'ABEA0001','清创(缝合)术(小)','301','医技-放射科',64,52.271480088499544,0,0,8.424908604239045,0,0,54.17207831325301,0,0,8.424250864960523,0,0,8.426676522978687,0,0,30,5,1,3),(5866,'HCQ50301','脊髓后根入髓区切开术','302','医技-超声科',64,0,0,0,314.9278043904579,0,0,1625.852530120482,0,0,314.965846181257,0,0,314.86299608743155,0,0,55,4,1,3),(5867,'test','测试项目','302','医技-超声科',64,68.43323455962296,0,0,10.49759347968193,0,0,54.1950843373494,0,0,10.498861539375234,0,0,10.495433202914386,0,0,33,2,1,3),(5868,'EBBBP001','头部X线计算机体层(CT)增强扫描','302','医技-超声科',64,68.43323455962296,0,0,20.99518695936386,0,0,108.3901686746988,0,0,20.997723078750468,0,0,20.990866405828772,0,0,62.5,3,1,3),(5869,'ABEA0001','清创(缝合)术(小)','302','医技-超声科',64,0,0,0,10.49759347968193,0,0,54.1950843373494,0,0,10.498861539375234,0,0,10.495433202914386,0,0,30,5,1,3),(5870,'HCQ50301','脊髓后根入髓区切开术','303','医技-病理科',64,0,0,0,367.7453602415553,0,0,1625.6043975903615,0,0,367.9743718410301,0,0,367.80265367172484,0,0,55,4,1,3),(5871,'test','测试项目','303','医技-病理科',64,80.13141677072944,0,0,12.258178674718511,0,0,54.18681325301205,0,0,12.265812394701005,0,0,12.26008845572416,0,0,33,2,1,3),(5872,'EBBBP001','头部X线计算机体层(CT)增强扫描','303','医技-病理科',64,80.13141677072944,0,0,24.516357349437023,0,0,108.3736265060241,0,0,24.53162478940201,0,0,24.52017691144832,0,0,62.5,3,1,3),(5873,'ABEA0001','清创(缝合)术(小)','303','医技-病理科',64,0,0,0,12.258178674718511,0,0,54.18681325301205,0,0,12.265812394701005,0,0,12.26008845572416,0,0,30,5,1,3),(5874,'HCQ50301','脊髓后根入髓区切开术',NULL,NULL,64,1241.053116485753,0,0,175.8017363287419,0,0,1625.6039558232935,0,0,175.82464041570836,0,0,175.80505355701195,0,0,55,4,2,3),(5875,'test','测试项目',NULL,NULL,64,42.04502757790139,0,0,5.86005787762473,0,0,54.186798527443116,0,0,5.860821347190279,0,0,5.860168451900399,0,0,33,2,2,3),(5876,'EBBBP001','头部X线计算机体层(CT)增强扫描',NULL,NULL,64,42.04502757790139,0,0,11.72011575524946,0,0,108.37359705488623,0,0,11.721642694380558,0,0,11.720336903800797,0,0,62.5,3,2,3),(5877,'ABEA0001','清创(缝合)术(小)',NULL,NULL,64,46.43919065798234,0,0,5.86005787762473,0,0,54.186798527443116,0,0,5.860821347190279,0,0,5.860168451900399,0,0,30,5,2,3);
/*!40000 ALTER TABLE `t_pro_result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pro_result_cncbl`
--

DROP TABLE IF EXISTS `t_pro_result_cncbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pro_result_cncbl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_job_id` int(11) DEFAULT NULL,
  `dept_code` varchar(100) DEFAULT NULL,
  `dept_name` varchar(200) DEFAULT NULL,
  `ys_cncbl` double DEFAULT NULL COMMENT '产能成本率-医生',
  `hs_cncbl` double DEFAULT NULL COMMENT '产能成本率-护士',
  `js_cncbl` double DEFAULT NULL COMMENT '产能成本率-技师',
  `op_cncbl` double DEFAULT NULL COMMENT '产能成本率-其他人员',
  `house_cncbl` double DEFAULT NULL COMMENT '产能成本率-房屋、通用设备',
  `spe_cncbl` double DEFAULT NULL COMMENT '产能成本率-专用设备',
  `asset_cncbl` double DEFAULT NULL COMMENT '产能成本率-无形资产',
  `oc_cncbl` double DEFAULT NULL COMMENT '产能成本率-其他费用',
  `type` int(11) DEFAULT NULL COMMENT '类型：1-直接，2-业务，3-全成本',
  `level` int(11) DEFAULT NULL COMMENT '级别：1-科室，2-医院',
  `zzys_cncbl` double DEFAULT NULL COMMENT '主治医师-产能成本率',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2512 DEFAULT CHARSET=utf8 COMMENT='理论成本算法计算结果表-产能成本率';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pro_result_cncbl`
--

LOCK TABLES `t_pro_result_cncbl` WRITE;
/*!40000 ALTER TABLE `t_pro_result_cncbl` DISABLE KEYS */;
INSERT INTO `t_pro_result_cncbl` (`id`, `t_job_id`, `dept_code`, `dept_name`, `ys_cncbl`, `hs_cncbl`, `js_cncbl`, `op_cncbl`, `house_cncbl`, `spe_cncbl`, `asset_cncbl`, `oc_cncbl`, `type`, `level`, `zzys_cncbl`) VALUES (2473,62,NULL,NULL,0,0,0,0,0,0,0,0,1,2,0),(2474,62,NULL,NULL,0,0,0,0,0,0,0,0,2,2,0),(2475,62,NULL,NULL,0,0,0,0,0,0,0,0,3,2,0),(2482,64,'101','门诊-消化内科',0.3857454417670682,0.3248016231593039,0.10031290160642571,0,0.03927375589313777,0.9029794176706827,0.03927375589313777,0.039270949013445085,1,1,0.23983574297188753),(2483,64,'102','门诊-呼吸内科',0.41611661646586345,0.39061022088353414,0.06579511378848729,0,0.04103945326761591,0.9030633534136546,0.04103945326761591,0.041039686016794454,1,1,0.2762500860585198),(2484,64,'201','住院-消化内科',0.32319837126282913,0.17567475355969334,0.09966711847389557,0,0.029131075916569504,0.9029729919678715,0.029136510558362482,0.029130810338126697,1,1,0.27906146012621913),(2485,64,'103','门诊-神经外科',0.4461004016064257,0.2796347532989099,0.09782243975903614,0,0.04104451898503103,0.9032865461847389,0.041056882073749544,0.041050616100766706,1,1,0.32125885207496657),(2486,64,'202','住院-呼吸内科',0.3642722577811245,0.16213432061579652,0.09801596385542168,0,0.030109551539491297,0.9031881526104417,0.030095769745649266,0.03011163654618474,1,1,0.2408061997991968),(2487,64,'301','医技-放射科',0.49659061244979924,0.2818130020080321,0.3885976907630522,0,0.10035423917893797,0.9028679718875502,0.1003394578313253,0.10038404730031235,1,1,0),(2488,64,'203','住院-神经外科',0.2900904166666667,0.14968523324065494,0.06584330655957162,0,0.025082583110218652,0.9032963855421687,0.02508648761713521,0.02510007530120482,1,1,0.21378710397144132),(2489,64,'302','医技-超声科',0,0,0.2752966724039013,0,0.12903228628800917,0.90325140562249,0.1290498709122203,0.1289970596672404,1,1,0),(2490,64,'303','医技-病理科',0,0,0.32235322958500673,0,0.15047884872824632,0.9031135542168675,0.15060045180722892,0.15051055890227577,1,1,0),(2491,64,'101','门诊-消化内科',0.38733898865663996,0.32639517004887564,0.10190644849599749,0,0.04672921705946306,0.9029794176706827,0.04673053293957335,0.04672686577764164,2,1,0.2414292898614593),(2492,64,'102','门诊-呼吸内科',0.41820044700942033,0.392694051427091,0.06787894433204418,0,0.05078704585862133,0.9030633534136546,0.05078864105650668,0.05078779809317908,2,1,0.2783339166020767),(2493,64,'201','住院-消化内科',0.3280221633324287,0.18049854562929288,0.10449091054349512,0,0.05163104168937202,0.9029729919678715,0.051630069202458544,0.05162558705748754,2,1,0.28388525219581867),(2494,64,'103','门诊-神经外科',0.44874323008958633,0.2822775817820705,0.10046526824219673,0,0.0534148793772128,0.9032865461847389,0.053429859135620594,0.053421996019457525,2,1,0.3239016805581272),(2495,64,'202','住院-呼吸内科',0.3697864488577881,0.16764851169246017,0.10353015493208531,0,0.05582975295539421,0.9031881526104417,0.05580865980793305,0.055825914773217446,2,1,0.24632039087586044),(2496,64,'301','医技-放射科',0.5033293855092318,0.28855177506746466,0.3953364638224847,0,0.13189293665017707,0.9028679718875502,0.13188455303993973,0.13192517768804884,2,1,0),(2497,64,'203','住院-神经外科',0.29539071762252433,0.15498553419651262,0.07114360751542928,0,0.04980549154946681,0.9032963855421687,0.049802258375406985,0.04981721688019729,2,1,0.219087404927299),(2498,64,'302','医技-超声科',0,0,0.28329314079831464,0,0.1664376845828285,0.90325140562249,0.16646139762211903,0.1664044556955777,2,1,0),(2499,64,'303','医技-病理科',0,0,0.3320355666760621,0,0.19578077115816817,0.9031135542168675,0.19591057853561442,0.19581537656714007,2,1,0),(2500,64,'101','门诊-消化内科',0.38918432519081664,0.3282405065830523,0.10375178503017415,0,0.05525142380803326,0.9029794176706827,0.05525016097707374,0.055246296800669115,3,1,0.24327462639563596),(2501,64,'102','门诊-呼吸内科',0.4200457835441382,0.3945393879618089,0.06972428086676205,0,0.05930925260969092,0.9030633534136546,0.05930826909650571,0.05930722911870513,3,1,0.28017925313679454),(2502,64,'201','住院-消化内科',0.3298674998673186,0.18234388216418282,0.10633624707838507,0,0.06015324844123635,0.9029729919678715,0.06014969724325207,0.06014501808380808,3,1,0.2857305887307086),(2503,64,'103','门诊-神经外科',0.4505885666243042,0.2841229183167884,0.1023106047769146,0,0.061937086128282394,0.9032865461847389,0.06194948717561963,0.06194142704498358,3,1,0.32574701709284504),(2504,64,'202','住院-呼吸内科',0.3716317853930987,0.16949384822777078,0.10537549146739592,0,0.06435195970920124,0.9031881526104417,0.06432828785066869,0.06434534580148005,3,1,0.24816572741117104),(2505,64,'301','医技-放射科',0.5051747220445424,0.29039711160277526,0.3971818003577953,0,0.1404151434039841,0.9028679718875502,0.14040418108267538,0.14044460871631145,3,1,0),(2506,64,'203','住院-神经外科',0.29723605415783494,0.15683087073182322,0.07298894405073988,0,0.05832769830327384,0.9032963855421687,0.05832188641814263,0.05833664790845989,3,1,0.2209327414626096),(2507,64,'302','医技-超声科',0,0,0.28513847733176234,0,0.17495989132803216,0.90325140562249,0.1749810256562539,0.17492388671523976,3,1,0),(2508,64,'303','医技-病理科',0,0,0.3338809032113727,0,0.2043029779119752,0.9031135542168675,0.20443020657835007,0.20433480759540268,3,1,0),(2509,64,NULL,NULL,0.3888734454285396,0.25205055810941784,0.1681893818660887,0,0.06506070143413974,0.9031133087907186,0.06507540441182497,0.06506615990959456,1,2,0.26183324083370524),(2510,64,NULL,NULL,0.39297305443965996,0.25615016712053823,0.1733422783731233,0,0.08914542454230044,0.9031133087907186,0.08916072774613026,0.08915004317243858,2,2,0.26549298917010694),(2511,64,NULL,NULL,0.39481839097457916,0.2579955036554574,0.17518761490792245,0,0.09766763129374549,0.9031133087907186,0.09768035578650465,0.09766947419833998,3,2,0.26733832570496086);
/*!40000 ALTER TABLE `t_pro_result_cncbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_pro_src`
--

DROP TABLE IF EXISTS `t_pro_src`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_pro_src` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_code` varchar(100) DEFAULT NULL COMMENT '项目编码',
  `pro_name` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `dept_code` varchar(100) DEFAULT NULL COMMENT '科室编码',
  `dept_name` varchar(200) DEFAULT NULL COMMENT '科室名称',
  `t_dept_id` int(11) DEFAULT NULL COMMENT '科室id',
  `t_job_id` int(11) NOT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_pro_src`
--

LOCK TABLES `t_pro_src` WRITE;
/*!40000 ALTER TABLE `t_pro_src` DISABLE KEYS */;
INSERT INTO `t_pro_src` (`id`, `pro_code`, `pro_name`, `dept_code`, `dept_name`, `t_dept_id`, `t_job_id`) VALUES (31,'1','项目1','1','行政后勤1',NULL,17),(32,'2','项目2','2','行政后勤2',NULL,17),(33,'3','项目3','3','医辅-门诊收费处',NULL,17),(34,'4','项目4','4','医辅2-挂号处',NULL,17),(35,'5','项目5','5','医辅3-供应室',NULL,17),(36,'6','项目6','6','医辅4-住院收费处',NULL,17),(37,'7','项目7','7','医辅5-病案室',NULL,17),(38,'8','项目8','8','医辅-门诊科室',NULL,17),(39,'9','项目9','9','医辅',NULL,17),(40,'10','项目10','10','医技1',NULL,17),(41,'11','项目11','11','医技2',NULL,17),(42,'12','项目12','12','医技3',NULL,17),(43,'13','项目13','13','临床1-门诊',NULL,17),(44,'14','项目14','14','临床2-住院',NULL,17),(45,'15','项目15','15','临床3',NULL,17);
/*!40000 ALTER TABLE `t_pro_src` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-28 23:57:05
