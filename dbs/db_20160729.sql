/*
SQLyog 企业版 - MySQL GUI v8.14 
MySQL - 5.5.50 : Database - costaccount
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始数据任务管理';

/*Data for the table `t_costaccount_job` */

insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (14,'测试job',1,'111','测试医院','2016-07-26 17:33:20','2016-07-29 00:00:00','2016-07-29 00:00:00',9,'2016-07-29 00:00:00','2');

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
) ENGINE=InnoDB AUTO_INCREMENT=131 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算-一级分摊';

/*Data for the table `t_costaccount_level1` */

insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (105,'15',NULL,0.410042,'2',NULL,'111','2016-07-29 18:17:30',0.0460251,0.0502092,0.0543933,0.0585774,0.0627615,0.0669456,0.0711297,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (106,'15',NULL,0.399123,'1',NULL,'111','2016-07-29 18:17:30',0.0438596,0.0482456,0.0526316,0.0570175,0.0614035,0.0657895,0.0701754,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (107,'6',NULL,13.1213,'2',NULL,'111','2016-07-29 18:17:30',1.4728,1.60669,1.74059,1.87448,2.00837,2.14226,2.27615,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (108,'6',NULL,12.7719,'1',NULL,'111','2016-07-29 18:17:30',1.40351,1.54386,1.68421,1.82456,1.96491,2.10526,2.24561,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (109,'10',NULL,2.87029,'2',NULL,'111','2016-07-29 18:17:30',0.322176,0.351464,0.380753,0.410042,0.439331,0.468619,0.497908,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (110,'10',NULL,2.79386,'1',NULL,'111','2016-07-29 18:17:30',0.307018,0.337719,0.368421,0.399123,0.429825,0.460526,0.491228,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (111,'8',NULL,1.99561,'1',NULL,'111','2016-07-29 18:17:30',0.219298,0.241228,0.263158,0.285088,0.307018,0.328947,0.350877,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (112,'8',NULL,2.05021,'2',NULL,'111','2016-07-29 18:17:30',0.230126,0.251046,0.271967,0.292887,0.313808,0.334728,0.355649,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (113,'13',NULL,9.17982,'1',NULL,'111','2016-07-29 18:17:31',1.00877,1.10965,1.21053,1.3114,1.41228,1.51316,1.61404,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (114,'7',NULL,13.9414,'2',NULL,'111','2016-07-29 18:17:31',1.56485,1.70711,1.84937,1.99163,2.13389,2.27615,2.41841,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (115,'5',NULL,4.9205,'2',NULL,'111','2016-07-29 18:17:31',0.552301,0.60251,0.65272,0.702929,0.753138,0.803347,0.853557,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (116,'13',NULL,9.43096,'2',NULL,'111','2016-07-29 18:17:31',1.05858,1.15481,1.25105,1.34728,1.44351,1.53975,1.63598,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (117,'7',NULL,13.5702,'1',NULL,'111','2016-07-29 18:17:31',1.49123,1.64035,1.78947,1.9386,2.08772,2.23684,2.38596,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (118,'5',NULL,4.78947,'1',NULL,'111','2016-07-29 18:17:31',0.526316,0.578947,0.631579,0.684211,0.736842,0.789474,0.842105,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (119,'4',NULL,4.9205,'2',NULL,'111','2016-07-29 18:17:31',0.552301,0.60251,0.65272,0.702929,0.753138,0.803347,0.853557,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (120,'4',NULL,4.78947,'1',NULL,'111','2016-07-29 18:17:31',0.526316,0.578947,0.631579,0.684211,0.736842,0.789474,0.842105,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (121,'9',NULL,2.39474,'1',NULL,'111','2016-07-29 18:17:31',0.263158,0.289474,0.315789,0.342105,0.368421,0.394737,0.421053,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (122,'3',NULL,17.9605,'1',NULL,'111','2016-07-29 18:17:31',1.97368,2.17105,2.36842,2.56579,2.76316,2.96053,3.15789,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (123,'3',NULL,18.4519,'2',NULL,'111','2016-07-29 18:17:31',2.07113,2.25941,2.4477,2.63598,2.82427,3.01255,3.20084,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (124,'9',NULL,2.46025,'2',NULL,'111','2016-07-29 18:17:31',0.276151,0.301255,0.32636,0.351464,0.376569,0.401674,0.426778,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (125,'12',NULL,4.78947,'1',NULL,'111','2016-07-29 18:17:31',0.526316,0.578947,0.631579,0.684211,0.736842,0.789474,0.842105,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (126,'12',NULL,4.9205,'2',NULL,'111','2016-07-29 18:17:31',0.552301,0.60251,0.65272,0.702929,0.753138,0.803347,0.853557,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (127,'11',NULL,9.17982,'1',NULL,'111','2016-07-29 18:17:31',1.00877,1.10965,1.21053,1.3114,1.41228,1.51316,1.61404,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (128,'14',NULL,1.64017,'2',NULL,'111','2016-07-29 18:17:31',0.1841,0.200837,0.217573,0.23431,0.251046,0.267782,0.284519,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (129,'11',NULL,9.43096,'2',NULL,'111','2016-07-29 18:17:31',1.05858,1.15481,1.25105,1.34728,1.44351,1.53975,1.63598,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (130,'14',NULL,1.59649,'1',NULL,'111','2016-07-29 18:17:31',0.175439,0.192982,0.210526,0.22807,0.245614,0.263158,0.280702,14);

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
) ENGINE=InnoDB AUTO_INCREMENT=463 DEFAULT CHARSET=utf8 COMMENT='成本核算-二级分摊';

/*Data for the table `t_costaccount_level2` */

insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (421,'15',NULL,2.6115,'3',NULL,'111','2016-07-29 18:17:31',0.860641,0.932361,1.00408,1.0758,1.14752,1.21924,1.29096,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (422,'15',NULL,1.85707,'6',NULL,'111','2016-07-29 18:17:31',3.01224,0.573761,5.52245,8.82157,1.57784,1.64956,3.01224,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (423,'15',NULL,1.97313,'7',NULL,'111','2016-07-29 18:17:31',0.860641,0.573761,5.59417,1.57784,2.36676,3.65773,2.29504,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (424,'15',NULL,0.696401,'4',NULL,'111','2016-07-29 18:17:31',0.932361,1.00408,1.0758,1.14752,1.21924,1.29096,1.36268,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (425,'15',NULL,0.696401,'5',NULL,'111','2016-07-29 18:17:31',1.793,0.502041,5.37901,1.64956,3.94461,3.01224,1.64956,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (426,'10',NULL,0.00707724,'8',NULL,'111','2016-07-29 18:17:32',0.136443,0.152187,0.148688,0.0769679,0.0769679,0.0892128,0.0209913,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (427,'10',NULL,0.0481252,'7',NULL,'111','2016-07-29 18:17:32',0.0209913,0.0139942,0.136443,0.038484,0.0577259,0.0892128,0.0559767,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (428,'10',NULL,0.0452943,'6',NULL,'111','2016-07-29 18:17:32',0.0734694,0.0139942,0.134694,0.21516,0.038484,0.0402332,0.0734694,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (429,'10',NULL,0.0169854,'5',NULL,'111','2016-07-29 18:17:32',0.0437318,0.0122449,0.131195,0.0402332,0.0962099,0.0734694,0.0402332,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (430,'10',NULL,0.00849269,'9',NULL,'111','2016-07-29 18:17:32',0.21516,0.7207,0.0402332,0.21691,0.21516,0.0209913,0.561516,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (431,'15',NULL,0.3482,'9',NULL,'111','2016-07-29 18:17:32',8.82157,29.5487,1.64956,8.89329,8.82157,0.860641,23.0222,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (432,'15',NULL,0.290167,'8',NULL,'111','2016-07-29 18:17:32',5.59417,6.23965,6.09621,3.15569,3.15569,3.65773,0.860641,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (433,'10',NULL,0.0169854,'4',NULL,'111','2016-07-29 18:17:32',0.0227405,0.0244898,0.0262391,0.0279883,0.0297376,0.0314869,0.0332362,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (434,'10',NULL,0.0636952,'3',NULL,'111','2016-07-29 18:17:32',0.0209913,0.0227405,0.0244898,0.0262391,0.0279883,0.0297376,0.0314869,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (435,'14',NULL,0.0339708,'9',NULL,'111','2016-07-29 18:17:32',0.860641,2.8828,0.160933,0.867639,0.860641,0.083965,2.24606,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (436,'13',NULL,8.74747,'3',NULL,'111','2016-07-29 18:17:32',2.8828,3.12303,3.36327,3.6035,3.84373,4.08397,4.3242,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (437,'13',NULL,2.33266,'4',NULL,'111','2016-07-29 18:17:32',3.12303,3.36327,3.6035,3.84373,4.08397,4.3242,4.56443,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (438,'13',NULL,2.33266,'5',NULL,'111','2016-07-29 18:17:32',6.00583,1.68163,18.0175,5.52536,13.2128,10.0898,5.52536,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (439,'13',NULL,6.22042,'6',NULL,'111','2016-07-29 18:17:32',10.0898,1.92187,18.498,29.5487,5.28513,5.52536,10.0898,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (440,'13',NULL,6.6092,'7',NULL,'111','2016-07-29 18:17:32',2.8828,1.92187,18.7382,5.28513,7.9277,12.2519,7.68746,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (441,'13',NULL,0.971941,'8',NULL,'111','2016-07-29 18:17:32',18.7382,20.9003,20.4198,10.5703,10.5703,12.2519,2.8828,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (442,'13',NULL,1.16633,'9',NULL,'111','2016-07-29 18:17:32',29.5487,98.9761,5.52536,29.7889,29.5487,2.8828,77.1149,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (443,'11',NULL,0.0113236,'5',NULL,'111','2016-07-29 18:17:32',0.0291545,0.00816326,0.0874636,0.0268222,0.0641399,0.0489796,0.0268222,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (444,'12',NULL,5.19753,'7',NULL,'111','2016-07-29 18:17:32',2.26706,1.51137,14.7359,4.15627,6.2344,9.63499,6.04548,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (445,'11',NULL,0.0113236,'4',NULL,'111','2016-07-29 18:17:32',0.0151603,0.0163265,0.0174927,0.0186589,0.0198251,0.0209913,0.0221574,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (446,'12',NULL,0.764342,'8',NULL,'111','2016-07-29 18:17:32',14.7359,16.4362,16.0583,8.31254,8.31254,9.63499,2.26706,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (447,'11',NULL,0.0320835,'7',NULL,'111','2016-07-29 18:17:32',0.0139942,0.00932945,0.0909621,0.025656,0.038484,0.0594752,0.0373178,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (448,'12',NULL,0.917211,'9',NULL,'111','2016-07-29 18:17:32',23.2373,77.8356,4.34519,23.4262,23.2373,2.26706,60.6437,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (449,'11',NULL,0.0301962,'6',NULL,'111','2016-07-29 18:17:32',0.0489796,0.00932945,0.0897959,0.14344,0.025656,0.0268222,0.0489796,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (450,'11',NULL,0.00566179,'9',NULL,'111','2016-07-29 18:17:32',0.14344,0.480466,0.0268222,0.144606,0.14344,0.0139942,0.374344,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (451,'12',NULL,6.87908,'3',NULL,'111','2016-07-29 18:17:32',2.26706,2.45598,2.6449,2.83382,3.02274,3.21166,3.40058,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (452,'11',NULL,0.00471816,'8',NULL,'111','2016-07-29 18:17:32',0.0909621,0.101458,0.0991254,0.051312,0.051312,0.0594752,0.0139942,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (453,'12',NULL,1.83442,'4',NULL,'111','2016-07-29 18:17:32',2.45598,2.6449,2.83382,3.02274,3.21166,3.40058,3.5895,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (454,'12',NULL,1.83442,'5',NULL,'111','2016-07-29 18:17:32',4.72303,1.32245,14.1691,4.34519,10.3907,7.93469,4.34519,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (455,'12',NULL,4.89179,'6',NULL,'111','2016-07-29 18:17:32',7.93469,1.51137,14.5469,23.2373,4.15627,4.34519,7.93469,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (456,'14',NULL,0.028309,'8',NULL,'111','2016-07-29 18:17:32',0.545773,0.608746,0.594752,0.307872,0.307872,0.356851,0.083965,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (457,'14',NULL,0.192501,'7',NULL,'111','2016-07-29 18:17:32',0.083965,0.0559767,0.545773,0.153936,0.230904,0.356851,0.223907,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (458,'14',NULL,0.181177,'6',NULL,'111','2016-07-29 18:17:32',0.293878,0.0559767,0.538776,0.860641,0.153936,0.160933,0.293878,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (459,'14',NULL,0.0679415,'5',NULL,'111','2016-07-29 18:17:32',0.174927,0.0489796,0.524781,0.160933,0.38484,0.293878,0.160933,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (460,'14',NULL,0.0679415,'4',NULL,'111','2016-07-29 18:17:32',0.0909621,0.0979592,0.104956,0.111953,0.11895,0.125948,0.132945,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (461,'14',NULL,0.254781,'3',NULL,'111','2016-07-29 18:17:32',0.083965,0.0909621,0.0979592,0.104956,0.111953,0.11895,0.125948,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (462,'11',NULL,0.0424635,'3',NULL,'111','2016-07-29 18:17:32',0.0139942,0.0151603,0.0163265,0.0174927,0.0186589,0.0198251,0.0209913,14);

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
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='成本核算-三级分摊';

/*Data for the table `t_costaccount_level3` */

insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (91,'15',NULL,109.588,'10',NULL,'111','2016-07-29 18:17:32',261.333,280,298.667,317.333,336,354.667,373.333,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (92,'14',NULL,299.977,'11',NULL,'111','2016-07-29 18:17:32',240,256,272,288,304,320,336,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (93,'14',NULL,62.6219,'10',NULL,'111','2016-07-29 18:17:32',149.333,160,170.667,181.333,192,202.667,213.333,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (94,'14',NULL,3.16334,'12',NULL,'111','2016-07-29 18:17:32',1.58025,1.67901,1.77778,1.87654,1.97531,2.07407,2.17284,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (95,'13',NULL,23.4832,'10',NULL,'111','2016-07-29 18:17:32',56,60,64,68,72,76,80,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (96,'15',NULL,5.53584,'12',NULL,'111','2016-07-29 18:17:32',2.76543,2.93827,3.11111,3.28395,3.45679,3.62963,3.80247,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (97,'13',NULL,1.18625,'12',NULL,'111','2016-07-29 18:17:32',0.592593,0.62963,0.666667,0.703704,0.740741,0.777778,0.814815,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (98,'15',NULL,524.96,'11',NULL,'111','2016-07-29 18:17:33',420,448,476,504,532,560,588,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (99,'13',NULL,112.491,'11',NULL,'111','2016-07-29 18:17:33',90,96,102,108,114,120,126,14);

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
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始业务数据';

/*Data for the table `t_costaccount_src` */

insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (46,'1','行政后勤1',NULL,10,11,12,13,14,15,16,'2016-07-26 23:32:16',14,23,123,123,123,NULL,NULL,91,91,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (47,'2','行政后勤2',NULL,11,12,13,14,15,16,17,'2016-07-26 23:32:17',14,12,123,124,21,NULL,NULL,98,98,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (48,'3','医辅-门诊收费处',NULL,12,13,14,15,16,17,18,'2016-07-26 23:32:17',14,45,412,1,23,NULL,NULL,105,36.4124,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (49,'4','医辅2-挂号处',NULL,13,14,15,16,17,18,19,'2016-07-26 23:32:17',14,12,23,5,3214,NULL,NULL,112,9.70998,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (50,'5','医辅3-供应室',NULL,25,7,75,23,55,42,23,'2016-07-26 23:32:17',14,12,5,23,23,NULL,NULL,250,9.70998,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (51,'6','医辅4-住院收费处',NULL,42,8,77,123,22,23,42,'2016-07-26 23:32:17',14,32,51,233,41,NULL,NULL,337,25.8933,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (52,'7','医辅5-病案室',NULL,12,8,78,22,33,51,32,'2016-07-26 23:32:17',14,34,4,3,23,NULL,NULL,236,27.5116,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (53,'8','医辅-门诊科室',NULL,78,87,85,44,44,51,12,'2016-07-26 23:32:17',14,5,42,4,3,NULL,NULL,401,4.04582,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (54,'9','医辅',NULL,123,412,23,124,123,12,321,'2016-07-26 23:32:17',14,6,56,4,4,NULL,NULL,1138,4.85499,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (55,'10','医技1',NULL,14,15,16,17,18,19,20,'2016-07-26 23:32:17',14,7,3,56,32,NULL,NULL,119,5.87081,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (56,'11','医技2',NULL,15,16,17,18,19,20,21,'2016-07-26 23:32:17',14,23,2,23,5,NULL,NULL,126,18.7486,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (57,'12','医技3',NULL,16,17,18,19,20,21,22,'2016-07-26 23:32:17',14,12,324,4,12,NULL,NULL,133,32.0288,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (58,'13','临床1-门诊',NULL,17,18,19,20,21,22,23,'2016-07-26 23:32:17',14,23,412,12,1,NULL,123,140,184.152,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (59,'14','临床2-住院',NULL,18,19,20,21,22,23,24,'2016-07-26 23:32:17',14,4,12,32,2,50,NULL,147,369.826,'2016-07-29 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (60,'15','临床3',NULL,19,20,21,22,23,24,25,'2016-07-26 23:32:17',14,1,123,56,32,NULL,NULL,154,649.366,'2016-07-29 00:00:00');

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
