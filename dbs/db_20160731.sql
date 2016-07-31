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
  `update_time` timestamp NULL DEFAULT NULL COMMENT '任务修改时间',
  `exec_time_start` timestamp NULL DEFAULT NULL COMMENT '任务执行时间-开始',
  `costtime` int(11) DEFAULT NULL COMMENT '任务耗费时间，单位：秒',
  `exec_time_end` timestamp NULL DEFAULT NULL COMMENT '任务执行时间-结束',
  `state` varchar(2) DEFAULT '0' COMMENT '任务执行状态:0-未开始，1-进行中，2-成功，9-失败',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始数据任务管理';

/*Data for the table `t_costaccount_job` */

insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (14,'测试job',1,'111','测试医院','2016-07-26 17:33:20','2016-07-31 00:00:00','2016-07-31 00:00:00',0,'2016-07-31 00:00:00','2');

/*Table structure for table `t_costaccount_job_baseinfo` */

DROP TABLE IF EXISTS `t_costaccount_job_baseinfo`;

CREATE TABLE `t_costaccount_job_baseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_work` float DEFAULT NULL COMMENT '全院工作总量',
  `total_work_disinfected` float DEFAULT NULL COMMENT '全院消毒工作总量',
  `total_work_outpatient` float DEFAULT NULL COMMENT '全院门诊总量',
  `total_inhos` int(11) DEFAULT NULL COMMENT '全院住院总人数',
  `total_people` int(11) DEFAULT NULL COMMENT '全院总人数',
  `t_costaccount_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='任务对应的基础信息';

/*Data for the table `t_costaccount_job_baseinfo` */

insert  into `t_costaccount_job_baseinfo`(`id`,`total_work`,`total_work_disinfected`,`total_work_outpatient`,`total_inhos`,`total_people`,`t_costaccount_job_id`) values (1,1715,3559,123,50,251,14);

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
) ENGINE=InnoDB AUTO_INCREMENT=365 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算-一级分摊';

/*Data for the table `t_costaccount_level1` */

insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (313,'15','临床3',0.410042,'2','行政后勤2','111','2016-07-31 16:39:11',0.0509259,0.0555556,0.0601852,0.0648148,0.0694444,0.0740741,0.0787037,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (314,'15','临床3',0.399123,'1','行政后勤1','111','2016-07-31 16:39:11',0.0462963,0.0509259,0.0555556,0.0601852,0.0648148,0.0694444,0.0740741,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (315,'8','医辅-门诊科室',1.99561,'1','行政后勤1','111','2016-07-31 16:39:11',0.231481,0.25463,0.277778,0.300926,0.324074,0.347222,0.37037,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (316,'13','临床1-门诊',9.17982,'1','行政后勤1','111','2016-07-31 16:39:11',1.06481,1.1713,1.27778,1.38426,1.49074,1.59722,1.7037,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (317,'8','医辅-门诊科室',2.05021,'2','行政后勤2','111','2016-07-31 16:39:11',0.25463,0.277778,0.300926,0.324074,0.347222,0.37037,0.393519,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (318,'13','临床1-门诊',9.43096,'2','行政后勤2','111','2016-07-31 16:39:11',1.1713,1.27778,1.38426,1.49074,1.59722,1.7037,1.81019,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (319,'5','医辅3-供应室',4.9205,'2','行政后勤2','111','2016-07-31 16:39:11',0.611111,0.666667,0.722222,0.777778,0.833333,0.888889,0.944444,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (320,'7','医辅5-病案室',13.9414,'2','行政后勤2','111','2016-07-31 16:39:11',1.73148,1.88889,2.0463,2.2037,2.36111,2.51852,2.67593,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (321,'5','医辅3-供应室',4.78947,'1','行政后勤1','111','2016-07-31 16:39:11',0.555556,0.611111,0.666667,0.722222,0.777778,0.833333,0.888889,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (322,'7','医辅5-病案室',13.5702,'1','行政后勤1','111','2016-07-31 16:39:11',1.57407,1.73148,1.88889,2.0463,2.2037,2.36111,2.51852,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (323,'4','医辅2-挂号处',4.9205,'2','行政后勤2','111','2016-07-31 16:39:11',0.611111,0.666667,0.722222,0.777778,0.833333,0.888889,0.944444,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (324,'4','医辅2-挂号处',4.78947,'1','行政后勤1','111','2016-07-31 16:39:11',0.555556,0.611111,0.666667,0.722222,0.777778,0.833333,0.888889,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (325,'9','医辅',2.39474,'1','行政后勤1','111','2016-07-31 16:39:11',0.277778,0.305556,0.333333,0.361111,0.388889,0.416667,0.444444,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (326,'3','医辅-门诊收费处',17.9605,'1','行政后勤1','111','2016-07-31 16:39:11',2.08333,2.29167,2.5,2.70833,2.91667,3.125,3.33333,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (327,'6','医辅4-住院收费处',13.1213,'2','行政后勤2','111','2016-07-31 16:39:11',1.62963,1.77778,1.92593,2.07407,2.22222,2.37037,2.51852,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (328,'9','医辅',2.46025,'2','行政后勤2','111','2016-07-31 16:39:11',0.305556,0.333333,0.361111,0.388889,0.416667,0.444444,0.472222,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (329,'3','医辅-门诊收费处',18.4519,'2','行政后勤2','111','2016-07-31 16:39:11',2.29167,2.5,2.70833,2.91667,3.125,3.33333,3.54167,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (330,'6','医辅4-住院收费处',12.7719,'1','行政后勤1','111','2016-07-31 16:39:11',1.48148,1.62963,1.77778,1.92593,2.07407,2.22222,2.37037,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (331,'12','医技3',4.78947,'1','行政后勤1','111','2016-07-31 16:39:11',0.555556,0.611111,0.666667,0.722222,0.777778,0.833333,0.888889,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (332,'12','医技3',4.9205,'2','行政后勤2','111','2016-07-31 16:39:11',0.611111,0.666667,0.722222,0.777778,0.833333,0.888889,0.944444,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (333,'11','医技2',9.17982,'1','行政后勤1','111','2016-07-31 16:39:11',1.06481,1.1713,1.27778,1.38426,1.49074,1.59722,1.7037,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (334,'14','临床2-住院',1.64017,'2','行政后勤2','111','2016-07-31 16:39:11',0.203704,0.222222,0.240741,0.259259,0.277778,0.296296,0.314815,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (335,'10','医技1',2.87029,'2','行政后勤2','111','2016-07-31 16:39:11',0.356481,0.388889,0.421296,0.453704,0.486111,0.518519,0.550926,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (336,'14','临床2-住院',1.59649,'1','行政后勤1','111','2016-07-31 16:39:11',0.185185,0.203704,0.222222,0.240741,0.259259,0.277778,0.296296,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (337,'11','医技2',9.43096,'2','行政后勤2','111','2016-07-31 16:39:11',1.1713,1.27778,1.38426,1.49074,1.59722,1.7037,1.81019,14);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (338,'10','医技1',2.79386,'1','行政后勤1','111','2016-07-31 16:39:11',0.324074,0.356481,0.388889,0.421296,0.453704,0.486111,0.518519,14);

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
) ENGINE=InnoDB AUTO_INCREMENT=841 DEFAULT CHARSET=utf8 COMMENT='成本核算-二级分摊';

/*Data for the table `t_costaccount_level2` */

insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (757,'15','临床3',2.6115,'3','医辅-门诊收费处','111','2016-07-31 16:39:11',1.79865,1.4344,1.50612,1.57784,1.36268,1.72128,1.793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (758,'15','临床3',1.85707,'6','医辅4-住院收费处','111','2016-07-31 16:39:11',1.9216,1.4344,1.50612,1.57784,1.36268,1.72128,1.793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (759,'15','临床3',1.97313,'7','医辅5-病案室','111','2016-07-31 16:39:11',1.9216,1.4344,1.50612,1.57784,1.36268,1.72128,1.793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (760,'15','临床3',0.696401,'4','医辅2-挂号处','111','2016-07-31 16:39:11',1.9216,1.4344,1.50612,1.57784,1.36268,1.72128,1.793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (761,'15','临床3',0.696401,'5','医辅3-供应室','111','2016-07-31 16:39:11',1.9216,1.4344,1.50612,1.57784,1.36268,1.72128,1.793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (762,'10','医技1',0.00707724,'8','医辅-门诊科室','111','2016-07-31 16:39:11',0.0350466,0.0262391,0.0279883,0.0297376,0.0244898,0.0332362,0.0349854,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (763,'10','医技1',0.0481252,'7','医辅5-病案室','111','2016-07-31 16:39:11',0.0350466,0.0262391,0.0279883,0.0297376,0.0244898,0.0332362,0.0349854,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (764,'10','医技1',0.0452943,'6','医辅4-住院收费处','111','2016-07-31 16:39:11',0.0350466,0.0262391,0.0279883,0.0297376,0.0244898,0.0332362,0.0349854,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (765,'10','医技1',0.0169854,'5','医辅3-供应室','111','2016-07-31 16:39:11',0.0350466,0.0262391,0.0279883,0.0297376,0.0244898,0.0332362,0.0349854,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (766,'10','医技1',0.00849269,'9','医辅','111','2016-07-31 16:39:11',0.0350466,0.0262391,0.0279883,0.0297376,0.0244898,0.0332362,0.0349854,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (767,'15','临床3',0.3482,'9','医辅','111','2016-07-31 16:39:11',1.9216,1.4344,1.50612,1.57784,1.36268,1.72128,1.793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (768,'15','临床3',0.290167,'8','医辅-门诊科室','111','2016-07-31 16:39:11',1.9216,1.4344,1.50612,1.57784,1.36268,1.72128,1.793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (769,'10','医技1',0.0169854,'4','医辅2-挂号处','111','2016-07-31 16:39:11',0.0350466,0.0262391,0.0279883,0.0297376,0.0244898,0.0332362,0.0349854,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (770,'10','医技1',0.0636952,'3','医辅-门诊收费处','111','2016-07-31 16:39:11',0.0359491,0.0262391,0.0279883,0.0297376,0.0244898,0.0332362,0.0349854,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (771,'14','临床2-住院',0.0339708,'9','医辅','111','2016-07-31 16:39:11',0.169105,0.132945,0.139942,0.146939,0.125948,0.160933,0.16793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (772,'13','临床1-门诊',8.74747,'3','医辅-门诊收费处','111','2016-07-31 16:39:11',5.96023,4.3242,4.56443,4.80466,4.08397,5.28513,5.52536,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (773,'13','临床1-门诊',2.33266,'4','医辅2-挂号处','111','2016-07-31 16:39:11',6.85274,4.3242,4.56443,4.80466,4.08397,5.28513,5.52536,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (774,'13','临床1-门诊',2.33266,'5','医辅3-供应室','111','2016-07-31 16:39:11',6.85274,4.3242,4.56443,4.80466,4.08397,5.28513,5.52536,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (775,'13','临床1-门诊',6.22042,'6','医辅4-住院收费处','111','2016-07-31 16:39:11',6.85274,4.3242,4.56443,4.80466,4.08397,5.28513,5.52536,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (776,'13','临床1-门诊',6.6092,'7','医辅5-病案室','111','2016-07-31 16:39:11',6.85274,4.3242,4.56443,4.80466,4.08397,5.28513,5.52536,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (777,'13','临床1-门诊',0.971941,'8','医辅-门诊科室','111','2016-07-31 16:39:11',6.85274,4.3242,4.56443,4.80466,4.08397,5.28513,5.52536,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (778,'13','临床1-门诊',1.16633,'9','医辅','111','2016-07-31 16:39:11',6.85274,4.3242,4.56443,4.80466,4.08397,5.28513,5.52536,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (779,'11','医技2',0.0113236,'5','医辅3-供应室','111','2016-07-31 16:39:11',0.0245184,0.0186589,0.0198251,0.0209913,0.0174927,0.0233236,0.0244898,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (780,'12','医技3',5.19753,'7','医辅5-病案室','111','2016-07-31 16:39:11',4.94148,3.21166,3.40058,3.5895,3.02274,3.96735,4.15627,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (781,'11','医技2',0.0113236,'4','医辅2-挂号处','111','2016-07-31 16:39:11',0.0245184,0.0186589,0.0198251,0.0209913,0.0174927,0.0233236,0.0244898,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (782,'12','医技3',0.764342,'8','医辅-门诊科室','111','2016-07-31 16:39:11',4.94148,3.21166,3.40058,3.5895,3.02274,3.96735,4.15627,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (783,'11','医技2',0.0320835,'7','医辅5-病案室','111','2016-07-31 16:39:11',0.0245184,0.0186589,0.0198251,0.0209913,0.0174927,0.0233236,0.0244898,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (784,'12','医技3',0.917211,'9','医辅','111','2016-07-31 16:39:11',4.94148,3.21166,3.40058,3.5895,3.02274,3.96735,4.15627,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (785,'11','医技2',0.0301962,'6','医辅4-住院收费处','111','2016-07-31 16:39:11',0.0245184,0.0186589,0.0198251,0.0209913,0.0174927,0.0233236,0.0244898,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (786,'11','医技2',0.00566179,'9','医辅','111','2016-07-31 16:39:11',0.0245184,0.0186589,0.0198251,0.0209913,0.0174927,0.0233236,0.0244898,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (787,'12','医技3',6.87908,'3','医辅-门诊收费处','111','2016-07-31 16:39:11',4.33469,3.21166,3.40058,3.5895,3.02274,3.96735,4.15627,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (788,'11','医技2',0.00471816,'8','医辅-门诊科室','111','2016-07-31 16:39:11',0.0245184,0.0186589,0.0198251,0.0209913,0.0174927,0.0233236,0.0244898,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (789,'12','医技3',1.83442,'4','医辅2-挂号处','111','2016-07-31 16:39:11',4.94148,3.21166,3.40058,3.5895,3.02274,3.96735,4.15627,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (790,'12','医技3',1.83442,'5','医辅3-供应室','111','2016-07-31 16:39:11',4.94148,3.21166,3.40058,3.5895,3.02274,3.96735,4.15627,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (791,'12','医技3',4.89179,'6','医辅4-住院收费处','111','2016-07-31 16:39:11',4.94148,3.21166,3.40058,3.5895,3.02274,3.96735,4.15627,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (792,'14','临床2-住院',0.028309,'8','医辅-门诊科室','111','2016-07-31 16:39:11',0.169105,0.132945,0.139942,0.146939,0.125948,0.160933,0.16793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (793,'14','临床2-住院',0.192501,'7','医辅5-病案室','111','2016-07-31 16:39:11',0.169105,0.132945,0.139942,0.146939,0.125948,0.160933,0.16793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (794,'14','临床2-住院',0.181177,'6','医辅4-住院收费处','111','2016-07-31 16:39:11',0.169105,0.132945,0.139942,0.146939,0.125948,0.160933,0.16793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (795,'14','临床2-住院',0.0679415,'5','医辅3-供应室','111','2016-07-31 16:39:11',0.169105,0.132945,0.139942,0.146939,0.125948,0.160933,0.16793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (796,'14','临床2-住院',0.0679415,'4','医辅2-挂号处','111','2016-07-31 16:39:11',0.169105,0.132945,0.139942,0.146939,0.125948,0.160933,0.16793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (797,'14','临床2-住院',0.254781,'3','医辅-门诊收费处','111','2016-07-31 16:39:11',0.170133,0.132945,0.139942,0.146939,0.125948,0.160933,0.16793,14);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (798,'11','医技2',0.0424635,'3','医辅-门诊收费处','111','2016-07-31 16:39:11',0.0266008,0.0186589,0.0198251,0.0209913,0.0174927,0.0233236,0.0244898,14);

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
) ENGINE=InnoDB AUTO_INCREMENT=181 DEFAULT CHARSET=utf8 COMMENT='成本核算-三级分摊';

/*Data for the table `t_costaccount_level3` */

insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (163,'15','临床3',109.588,'10','医技1','111','2016-07-31 16:39:11',500.136,373.333,392,410.667,354.667,448,466.667,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (164,'14','临床2-住院',299.977,'11','医技2','111','2016-07-31 16:39:11',386.687,304,320,336,288,368,384,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (165,'14','临床2-住院',62.6219,'10','医技1','111','2016-07-31 16:39:11',257.791,202.667,213.333,224,192,245.333,256,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (166,'14','临床2-住院',3.16334,'12','医技3','111','2016-07-31 16:39:11',2.38696,1.87654,1.97531,2.07407,1.77778,2.27161,2.37037,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (167,'13','临床1-门诊',23.4832,'10','医技1','111','2016-07-31 16:39:11',114.101,72,76,80,68,88,92,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (168,'15','临床3',5.53584,'12','医技3','111','2016-07-31 16:39:11',4.63089,3.45679,3.62963,3.80247,3.28395,4.14815,4.32099,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (169,'13','临床1-门诊',1.18625,'12','医技3','111','2016-07-31 16:39:11',1.05649,0.666667,0.703704,0.740741,0.62963,0.814815,0.851852,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (170,'15','临床3',524.96,'11','医技2','111','2016-07-31 16:39:11',750.204,560,588,616,532,672,700,14);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_device_common`,`share_item_old_device_special`,`share_item_old_house`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (171,'13','临床1-门诊',112.491,'11','医技2','111','2016-07-31 16:39:11',171.152,108,114,120,102,132,138,14);

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
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始业务数据';

/*Data for the table `t_costaccount_src` */

insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (46,'1','行政后勤1',NULL,10,11,12,13,14,15,16,'2016-07-26 23:32:16',14,23,123,123,123,NULL,NULL,91,91,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (47,'2','行政后勤2',NULL,11,12,13,14,15,16,17,'2016-07-26 23:32:17',14,12,123,124,21,NULL,NULL,98,98,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (48,'3','医辅-门诊收费处',NULL,12,13,14,15,16,17,18,'2016-07-26 23:32:17',14,45,412,1,23,NULL,NULL,105,36.4124,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (49,'4','医辅2-挂号处',NULL,13,14,15,16,17,18,19,'2016-07-26 23:32:17',14,12,23,5,3214,NULL,NULL,112,9.70998,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (50,'5','医辅3-供应室',NULL,25,7,75,23,55,42,23,'2016-07-26 23:32:17',14,12,5,23,23,NULL,NULL,250,9.70998,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (51,'6','医辅4-住院收费处',NULL,42,8,77,123,22,23,42,'2016-07-26 23:32:17',14,32,51,233,41,NULL,NULL,337,25.8933,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (52,'7','医辅5-病案室',NULL,12,8,78,22,33,51,32,'2016-07-26 23:32:17',14,34,4,3,23,NULL,NULL,236,27.5116,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (53,'8','医辅-门诊科室',NULL,78,87,85,44,44,51,12,'2016-07-26 23:32:17',14,5,42,4,3,NULL,NULL,401,4.04582,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (54,'9','医辅',NULL,123,412,23,124,123,12,321,'2016-07-26 23:32:17',14,6,56,4,4,NULL,NULL,1138,4.85499,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (55,'10','医技1',NULL,14,15,16,17,18,19,20,'2016-07-26 23:32:17',14,7,3,56,32,NULL,NULL,119,5.87081,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (56,'11','医技2',NULL,15,16,17,18,19,20,21,'2016-07-26 23:32:17',14,23,2,23,5,NULL,NULL,126,18.7486,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (57,'12','医技3',NULL,16,17,18,19,20,21,22,'2016-07-26 23:32:17',14,12,324,4,12,NULL,NULL,133,32.0288,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (58,'13','临床1-门诊',NULL,17,18,19,20,21,22,23,'2016-07-26 23:32:17',14,23,412,12,1,NULL,123,140,184.152,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (59,'14','临床2-住院',NULL,18,19,20,21,22,23,24,'2016-07-26 23:32:17',14,4,12,32,2,50,NULL,147,369.826,'2016-07-31 00:00:00');
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_people`,`cost_old_device_common`,`cost_old_device_special`,`cost_old_house`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`people_count`,`work_count`,`work_count_kd`,`work_count_xd`,`work_count_inhos`,`work_count_mz`,`count_direct`,`count_all`,`update_time`) values (60,'15','临床3',NULL,19,20,21,22,23,24,25,'2016-07-26 23:32:17',14,1,123,56,32,NULL,NULL,154,649.366,'2016-07-31 00:00:00');

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
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
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
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='医院表';

/*Data for the table `t_hospital` */

insert  into `t_hospital`(`id`,`hos_code`,`hos_name`,`create_time`,`update_time`) values (1,'111','测试医院','2016-07-26 17:40:27',NULL);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
