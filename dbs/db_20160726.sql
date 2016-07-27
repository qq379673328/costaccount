/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.5.50-log : Database - costaccount
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `t_costaccount_job` */

DROP TABLE IF EXISTS `t_costaccount_job`;

CREATE TABLE `t_costaccount_job` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_desc` varchar(200) NOT NULL COMMENT '任务描述',
  `t_hos_id` int(11) DEFAULT NULL COMMENT '医院id',
  `hos_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `hos_name` varchar(100) DEFAULT NULL COMMENT '医院名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '任务创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '任务修改时间',
  `exec_time_start` datetime DEFAULT NULL COMMENT '任务执行时间-开始',
  `costtime` int(11) DEFAULT NULL COMMENT '任务耗费时间，单位：秒',
  `exec_time_end` datetime DEFAULT NULL COMMENT '任务执行时间-结束',
  `state` varchar(2) DEFAULT '0' COMMENT '任务执行状态:0-未开始，1-进行中，2-成功，9-失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始数据任务管理';

/*Data for the table `t_costaccount_job` */

insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (1,'测试job',1,'111','测试医院','2016-07-26 17:33:20',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (2,'213123',1,NULL,NULL,'2016-07-26 23:03:21',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (3,'qeqwe',1,NULL,NULL,'2016-07-26 23:07:53',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (4,'12312',1,NULL,NULL,'2016-07-26 23:08:54',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (5,'123123',1,NULL,NULL,'2016-07-26 23:10:52',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (6,'123123',1,NULL,NULL,'2016-07-26 23:17:01',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (7,'12312',1,NULL,NULL,'2016-07-26 23:18:01',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (8,'12312',1,NULL,NULL,'2016-07-26 23:18:17',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (9,'12312',1,NULL,NULL,'2016-07-26 23:19:08',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (10,'12312',1,NULL,NULL,'2016-07-26 23:22:24',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (11,'12312',1,NULL,NULL,'2016-07-26 23:23:34',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (12,'12312',1,NULL,NULL,'2016-07-26 23:25:54',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (13,'123123',1,NULL,NULL,'2016-07-26 23:27:47',NULL,NULL,NULL,NULL,'0');
insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (14,'12312',1,NULL,NULL,'2016-07-26 23:32:16','2016-07-27 00:00:00','2016-07-27 00:00:00',5,'2016-07-27 00:00:00','2');

/*Table structure for table `t_costaccount_job_baseinfo` */

DROP TABLE IF EXISTS `t_costaccount_job_baseinfo`;

CREATE TABLE `t_costaccount_job_baseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_work` float DEFAULT NULL COMMENT '全院工作总量',
  `totalWorkDisinfected` float DEFAULT NULL COMMENT '全院消毒工作总量',
  `totalWorkOutpatient` float DEFAULT NULL COMMENT '全院门诊总量',
  `totalInhos` int(11) DEFAULT NULL COMMENT '全院住院总人数',
  `totalPeople` int(11) DEFAULT NULL COMMENT '全院总人数',
  `t_costaccount_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='任务对应的基础信息';

/*Data for the table `t_costaccount_job_baseinfo` */

insert  into `t_costaccount_job_baseinfo`(`id`,`total_work`,`totalWorkDisinfected`,`totalWorkOutpatient`,`totalInhos`,`totalPeople`,`t_costaccount_job_id`) values (1,1715,3559,123,50,251,14);

/*Table structure for table `t_costaccount_level1` */

DROP TABLE IF EXISTS `t_costaccount_level1`;

CREATE TABLE `t_costaccount_level1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '科室名称',
  `share_level1` float NOT NULL COMMENT '一级分摊',
  `dept_code_share` varchar(50) DEFAULT NULL COMMENT '科室编码-被分摊',
  `dept_name_share` varchar(100) DEFAULT NULL COMMENT '科室名称-被分摊',
  `t_hospital_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `share_item_people` float DEFAULT NULL COMMENT '分项成本-人员经费',
  `share_item_old_device_common` float DEFAULT NULL COMMENT '分项成本-通用设备折旧费',
  `share_item_old_device_special` float DEFAULT NULL COMMENT '分项成本-专用设备折旧费',
  `share_item_old_house` float DEFAULT NULL COMMENT '分项成本-房屋折旧费',
  `share_item_asset_amortize` float DEFAULT NULL COMMENT '分项成本-无形资产摊销费',
  `share_item_vc_funds` float DEFAULT NULL COMMENT '分项成本-计提医疗风险基金',
  `share_item_other` float DEFAULT NULL COMMENT '分项成本-其它',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算-一级分摊';

/*Data for the table `t_costaccount_level1` */

insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1,'15',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (2,'15',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (3,'8',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (4,'13',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (5,'8',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (6,'13',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (7,'5',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (8,'7',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (9,'5',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (10,'7',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (11,'4',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (12,'4',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (13,'9',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (14,'3',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (15,'6',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:47',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (16,'9',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:48',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (17,'3',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:48',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (18,'6',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:48',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (19,'12',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:48',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (20,'12',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:48',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (21,'11',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:48',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (22,'14',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:48',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (23,'10',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:48',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (24,'14',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:48',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (25,'11',NULL,0,'2',NULL,NULL,'2016-07-27 01:04:48',0,0,0,0,0,0,0,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (26,'10',NULL,0,'1',NULL,NULL,'2016-07-27 01:04:48',0,0,0,0,0,0,0,14);

/*Table structure for table `t_costaccount_level2` */

DROP TABLE IF EXISTS `t_costaccount_level2`;

CREATE TABLE `t_costaccount_level2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '科室名称',
  `share_level2` float NOT NULL COMMENT '二级分摊',
  `dept_code_share` varchar(50) DEFAULT NULL COMMENT '科室编码-被分摊',
  `dept_name_share` varchar(100) DEFAULT NULL COMMENT '科室名称-被分摊',
  `t_hospital_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `share_item_people` float DEFAULT NULL COMMENT '分项成本-人员经费',
  `share_item_old_device_common` float DEFAULT NULL COMMENT '分项成本-通用设备折旧费',
  `share_item_old_device_special` float DEFAULT NULL COMMENT '分项成本-专用设备折旧费',
  `share_item_old_house` float DEFAULT NULL COMMENT '分项成本-房屋折旧费',
  `share_item_asset_amortize` float DEFAULT NULL COMMENT '分项成本-无形资产摊销费',
  `share_item_vc_funds` float DEFAULT NULL COMMENT '分项成本-计提医疗风险基金',
  `share_item_other` float DEFAULT NULL COMMENT '分项成本-其它',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=295 DEFAULT CHARSET=utf8 COMMENT='成本核算-二级分摊';

/*Data for the table `t_costaccount_level2` */

insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (253,'15',NULL,0,'3',NULL,NULL,'2016-07-27 01:04:48',0.860641,0.932361,1.00408,1.0758,1.14752,0,1.29096,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (254,'15',NULL,0,'6',NULL,NULL,'2016-07-27 01:04:48',3.01224,0.573761,5.52245,8.82157,1.57784,0,3.01224,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (255,'15',NULL,0,'7',NULL,NULL,'2016-07-27 01:04:48',0.860641,0.573761,5.59417,1.57784,2.36676,0,2.29504,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (256,'15',NULL,0,'4',NULL,NULL,'2016-07-27 01:04:48',0.932361,1.00408,1.0758,1.14752,1.21924,0,1.36268,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (257,'15',NULL,0,'5',NULL,NULL,'2016-07-27 01:04:49',1.793,0.502041,5.37901,1.64956,3.94461,0,1.64956,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (258,'10',NULL,0,'8',NULL,NULL,'2016-07-27 01:04:49',0.136443,0.152187,0.148688,0.0769679,0.0769679,0,0.0209913,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (259,'10',NULL,0,'7',NULL,NULL,'2016-07-27 01:04:49',0.0209913,0.0139942,0.136443,0.038484,0.0577259,0,0.0559767,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (260,'10',NULL,0,'6',NULL,NULL,'2016-07-27 01:04:49',0.0734694,0.0139942,0.134694,0.21516,0.038484,0,0.0734694,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (261,'10',NULL,0,'5',NULL,NULL,'2016-07-27 01:04:49',0.0437318,0.0122449,0.131195,0.0402332,0.0962099,0,0.0402332,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (262,'10',NULL,0,'9',NULL,NULL,'2016-07-27 01:04:49',0.21516,0.7207,0.0402332,0.21691,0.21516,0,0.561516,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (263,'15',NULL,0,'9',NULL,NULL,'2016-07-27 01:04:49',8.82157,29.5487,1.64956,8.89329,8.82157,0,23.0222,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (264,'15',NULL,0,'8',NULL,NULL,'2016-07-27 01:04:49',5.59417,6.23965,6.09621,3.15569,3.15569,0,0.860641,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (265,'10',NULL,0,'4',NULL,NULL,'2016-07-27 01:04:49',0.0227405,0.0244898,0.0262391,0.0279883,0.0297376,0,0.0332362,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (266,'10',NULL,0,'3',NULL,NULL,'2016-07-27 01:04:49',0.0209913,0.0227405,0.0244898,0.0262391,0.0279883,0,0.0314869,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (267,'14',NULL,0,'9',NULL,NULL,'2016-07-27 01:04:49',0.860641,2.8828,0.160933,0.867639,0.860641,0,2.24606,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (268,'13',NULL,0,'3',NULL,NULL,'2016-07-27 01:04:49',2.8828,3.12303,3.36327,3.6035,3.84373,0,4.3242,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (269,'13',NULL,0,'4',NULL,NULL,'2016-07-27 01:04:49',3.12303,3.36327,3.6035,3.84373,4.08397,0,4.56443,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (270,'13',NULL,0,'5',NULL,NULL,'2016-07-27 01:04:49',6.00583,1.68163,18.0175,5.52536,13.2128,0,5.52536,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (271,'13',NULL,0,'6',NULL,NULL,'2016-07-27 01:04:49',10.0898,1.92187,18.498,29.5487,5.28513,0,10.0898,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (272,'13',NULL,0,'7',NULL,NULL,'2016-07-27 01:04:49',2.8828,1.92187,18.7382,5.28513,7.9277,0,7.68746,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (273,'13',NULL,0,'8',NULL,NULL,'2016-07-27 01:04:49',18.7382,20.9003,20.4198,10.5703,10.5703,0,2.8828,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (274,'13',NULL,0,'9',NULL,NULL,'2016-07-27 01:04:49',29.5487,98.9761,5.52536,29.7889,29.5487,0,77.1149,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (275,'11',NULL,0,'5',NULL,NULL,'2016-07-27 01:04:50',0.0291545,0.00816326,0.0874636,0.0268222,0.0641399,0,0.0268222,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (276,'12',NULL,0,'7',NULL,NULL,'2016-07-27 01:04:50',2.26706,1.51137,14.7359,4.15627,6.2344,0,6.04548,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (277,'11',NULL,0,'4',NULL,NULL,'2016-07-27 01:04:50',0.0151603,0.0163265,0.0174927,0.0186589,0.0198251,0,0.0221574,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (278,'12',NULL,0,'8',NULL,NULL,'2016-07-27 01:04:50',14.7359,16.4362,16.0583,8.31254,8.31254,0,2.26706,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (279,'11',NULL,0,'7',NULL,NULL,'2016-07-27 01:04:50',0.0139942,0.00932945,0.0909621,0.025656,0.038484,0,0.0373178,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (280,'12',NULL,0,'9',NULL,NULL,'2016-07-27 01:04:50',23.2373,77.8356,4.34519,23.4262,23.2373,0,60.6437,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (281,'11',NULL,0,'6',NULL,NULL,'2016-07-27 01:04:50',0.0489796,0.00932945,0.0897959,0.14344,0.025656,0,0.0489796,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (282,'11',NULL,0,'9',NULL,NULL,'2016-07-27 01:04:50',0.14344,0.480466,0.0268222,0.144606,0.14344,0,0.374344,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (283,'12',NULL,0,'3',NULL,NULL,'2016-07-27 01:04:50',2.26706,2.45598,2.6449,2.83382,3.02274,0,3.40058,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (284,'11',NULL,0,'8',NULL,NULL,'2016-07-27 01:04:50',0.0909621,0.101458,0.0991254,0.051312,0.051312,0,0.0139942,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (285,'12',NULL,0,'4',NULL,NULL,'2016-07-27 01:04:50',2.45598,2.6449,2.83382,3.02274,3.21166,0,3.5895,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (286,'12',NULL,0,'5',NULL,NULL,'2016-07-27 01:04:50',4.72303,1.32245,14.1691,4.34519,10.3907,0,4.34519,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (287,'12',NULL,0,'6',NULL,NULL,'2016-07-27 01:04:50',7.93469,1.51137,14.5469,23.2373,4.15627,0,7.93469,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (288,'14',NULL,0,'8',NULL,NULL,'2016-07-27 01:04:50',0.545773,0.608746,0.594752,0.307872,0.307872,0,0.083965,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (289,'14',NULL,0,'7',NULL,NULL,'2016-07-27 01:04:50',0.083965,0.0559767,0.545773,0.153936,0.230904,0,0.223907,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (290,'14',NULL,0,'6',NULL,NULL,'2016-07-27 01:04:50',0.293878,0.0559767,0.538776,0.860641,0.153936,0,0.293878,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (291,'14',NULL,0,'5',NULL,NULL,'2016-07-27 01:04:50',0.174927,0.0489796,0.524781,0.160933,0.38484,0,0.160933,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (292,'14',NULL,0,'4',NULL,NULL,'2016-07-27 01:04:50',0.0909621,0.0979592,0.104956,0.111953,0.11895,0,0.132945,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (293,'14',NULL,0,'3',NULL,NULL,'2016-07-27 01:04:51',0.083965,0.0909621,0.0979592,0.104956,0.111953,0,0.125948,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (294,'11',NULL,0,'3',NULL,NULL,'2016-07-27 01:04:51',0.0139942,0.0151603,0.0163265,0.0174927,0.0186589,0,0.0209913,14);

/*Table structure for table `t_costaccount_level3` */

DROP TABLE IF EXISTS `t_costaccount_level3`;

CREATE TABLE `t_costaccount_level3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) DEFAULT NULL COMMENT '科室名称',
  `share_level3` float NOT NULL COMMENT '三级分摊',
  `dept_code_share` varchar(50) DEFAULT NULL COMMENT '科室编码-被分摊',
  `dept_name_share` varchar(100) DEFAULT NULL COMMENT '科室名称-被分摊',
  `t_hospital_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `creat_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `share_item_people` float DEFAULT NULL COMMENT '分项成本-人员经费',
  `share_item_old_device_common` float DEFAULT NULL COMMENT '分项成本-通用设备折旧费',
  `share_item_old_device_special` float DEFAULT NULL COMMENT '分项成本-专用设备折旧费',
  `share_item_old_house` float DEFAULT NULL COMMENT '分项成本-房屋折旧费',
  `share_item_asset_amortize` float DEFAULT NULL COMMENT '分项成本-无形资产摊销费',
  `share_item_vc_funds` float DEFAULT NULL COMMENT '分项成本-计提医疗风险基金',
  `share_item_other` float DEFAULT NULL COMMENT '分项成本-其它',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8 COMMENT='成本核算-三级分摊';

/*Data for the table `t_costaccount_level3` */

insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (55,'15',NULL,0,'10',NULL,NULL,'2016-07-27 01:04:51',261.333,280,298.667,317.333,336,0,373.333,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (56,'14',NULL,0,'11',NULL,NULL,'2016-07-27 01:04:51',240,256,272,288,304,0,336,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (57,'14',NULL,0,'10',NULL,NULL,'2016-07-27 01:04:51',149.333,160,170.667,181.333,192,0,213.333,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (58,'14',NULL,0,'12',NULL,NULL,'2016-07-27 01:04:51',1.58025,1.67901,1.77778,1.87654,1.97531,0,2.17284,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (59,'13',NULL,0,'10',NULL,NULL,'2016-07-27 01:04:51',56,60,64,68,72,0,80,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (60,'15',NULL,0,'12',NULL,NULL,'2016-07-27 01:04:51',2.76543,2.93827,3.11111,3.28395,3.45679,0,3.80247,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (61,'13',NULL,0,'12',NULL,NULL,'2016-07-27 01:04:51',0.592593,0.62963,0.666667,0.703704,0.740741,0,0.814815,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (62,'15',NULL,0,'11',NULL,NULL,'2016-07-27 01:04:51',420,448,476,504,532,0,588,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (63,'13',NULL,0,'11',NULL,NULL,'2016-07-27 01:04:51',90,96,102,108,114,0,126,14);

/*Table structure for table `t_costaccount_src` */

DROP TABLE IF EXISTS `t_costaccount_src`;

CREATE TABLE `t_costaccount_src` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) NOT NULL COMMENT '科室名称',
  `dept_id` int(11) DEFAULT NULL COMMENT '科室id',
  `cost_people` float DEFAULT NULL COMMENT '费用-人员经费',
  `cost_old_device_common` float DEFAULT NULL COMMENT '费用-通用设备折旧费',
  `cost_old_device_special` float DEFAULT NULL COMMENT '费用-专用设备折旧费',
  `cost_old_house` float DEFAULT NULL COMMENT '费用-房屋折旧费',
  `cost_asset_amortize` float DEFAULT NULL COMMENT '费用-无形资产摊销费',
  `cost_vc_funds` float DEFAULT NULL COMMENT '费用-计提医疗风险基金',
  `cost_other` float DEFAULT NULL COMMENT '费用-其它',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `people_count` int(11) DEFAULT NULL COMMENT '科室人员数',
  `work_count` float DEFAULT NULL COMMENT '科室工作量',
  `work_count_kd` float DEFAULT NULL COMMENT '科室开单工作量',
  `work_count_xd` float DEFAULT NULL COMMENT '科室消毒工作量',
  `work_count_inhos` int(11) DEFAULT NULL COMMENT '科室住院人数',
  `work_count_mz` float DEFAULT NULL COMMENT '科室门诊量',
  `count_direct` float DEFAULT NULL COMMENT '直接成本',
  `count_all` float DEFAULT NULL COMMENT '全成本',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始业务数据';

/*Data for the table `t_costaccount_src` */

insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (46,'1','行政后勤1',NULL,10,11,12,13,14,15,16,'2016-07-26 23:32:16',14,23,123,123,123,NULL,NULL,76,76,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (47,'2','行政后勤2',NULL,11,12,13,14,15,16,17,'2016-07-26 23:32:17',14,12,123,124,21,NULL,NULL,82,82,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (48,'3','医辅-门诊收费处',NULL,12,13,14,15,16,17,18,'2016-07-26 23:32:17',14,45,412,1,23,NULL,NULL,88,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (49,'4','医辅2-挂号处',NULL,13,14,15,16,17,18,19,'2016-07-26 23:32:17',14,12,23,5,3214,NULL,NULL,94,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (50,'5','医辅3-供应室',NULL,25,7,75,23,55,42,23,'2016-07-26 23:32:17',14,12,5,23,23,NULL,NULL,208,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (51,'6','医辅4-住院收费处',NULL,42,8,77,123,22,23,42,'2016-07-26 23:32:17',14,32,51,233,41,NULL,NULL,314,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (52,'7','医辅5-病案室',NULL,12,8,78,22,33,51,32,'2016-07-26 23:32:17',14,34,4,3,23,NULL,NULL,185,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (53,'8','医辅-门诊科室',NULL,78,87,85,44,44,51,12,'2016-07-26 23:32:17',14,5,42,4,3,NULL,NULL,350,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (54,'9','医辅',NULL,123,412,23,124,123,12,321,'2016-07-26 23:32:17',14,6,56,4,4,NULL,NULL,1126,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (55,'10','医技1',NULL,14,15,16,17,18,19,20,'2016-07-26 23:32:17',14,7,3,56,32,NULL,NULL,100,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (56,'11','医技2',NULL,15,16,17,18,19,20,21,'2016-07-26 23:32:17',14,23,2,23,5,NULL,NULL,106,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (57,'12','医技3',NULL,16,17,18,19,20,21,22,'2016-07-26 23:32:17',14,12,324,4,12,NULL,NULL,112,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (58,'13','临床1-门诊',NULL,17,18,19,20,21,22,23,'2016-07-26 23:32:17',14,23,412,12,1,NULL,123,118,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (59,'14','临床2-住院',NULL,18,19,20,21,22,23,24,'2016-07-26 23:32:17',14,4,12,32,2,50,NULL,124,0,'2016-07-27 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (60,'15','临床3',NULL,19,20,21,22,23,24,25,'2016-07-26 23:32:17',14,1,123,56,32,NULL,NULL,130,0,'2016-07-27 00:00:00');

/*Table structure for table `t_dept` */

DROP TABLE IF EXISTS `t_dept`;

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
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='科室表';

/*Data for the table `t_dept` */

insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (1,'1','行政后勤1\r\n','XZHQ','',NULL,NULL,1,'2016-07-26 23:56:02',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (2,'2','行政后勤2\r\n','XZHQ','',NULL,NULL,1,'2016-07-26 23:56:25',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (3,'3','医辅-门诊收费处\r\n','YF','','OUT',NULL,1,'2016-07-26 23:56:26',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (4,'4','医辅2-挂号处\r\n','YF','','REG',NULL,1,'2016-07-26 23:56:26',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (5,'5','医辅3-供应室\r\n','YF','','SUP',NULL,1,'2016-07-26 23:56:27',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (6,'6','医辅4-住院收费处\r\n','YF','','CAS',NULL,1,'2016-07-26 23:56:28',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (7,'7','医辅5-病案室\r\n','YF','','MED',NULL,1,'2016-07-26 23:56:29',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (8,'8','医辅-门诊科室\r\n','YF','','OUT',NULL,1,'2016-07-26 23:56:32',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (9,'9','医辅\r\n','YF','',NULL,NULL,1,'2016-07-26 23:56:33',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (10,'10','医技1\r\n','YJ','',NULL,NULL,1,'2016-07-26 23:56:35',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (11,'11','医技2\r\n','YJ','',NULL,NULL,1,'2016-07-26 23:56:35',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (12,'12','医技3\r\n','YJ','',NULL,NULL,1,'2016-07-26 23:56:36',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (13,'13','临床1-门诊\r\n','LC','','OUT',NULL,1,'2016-07-26 23:56:37',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (14,'14','临床2-住院\r\n','LC','','INH',NULL,1,'2016-07-26 23:56:38',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (15,'15','临床3\r\n','LC','',NULL,NULL,1,'2016-07-26 23:56:38',NULL);

/*Table structure for table `t_hospital` */

DROP TABLE IF EXISTS `t_hospital`;

CREATE TABLE `t_hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hos_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `hos_name` varchar(100) DEFAULT NULL COMMENT '医院名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='医院表';

/*Data for the table `t_hospital` */

insert  into `t_hospital`(`id`,`hos_code`,`hos_name`,`create_time`,`update_time`) values (1,'111','测试医院','2016-07-26 17:40:27',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
