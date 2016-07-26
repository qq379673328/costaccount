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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始数据任务管理';

/*Data for the table `t_costaccount_job` */

insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (1,'测试job',1,'111','测试医院','2016-07-26 17:33:20',NULL,NULL,NULL,NULL,'0');

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

insert  into `t_costaccount_job_baseinfo`(`id`,`total_work`,`totalWorkDisinfected`,`totalWorkOutpatient`,`totalInhos`,`totalPeople`,`t_costaccount_job_id`) values (1,1715,3559,123,50,251,1);

/*Table structure for table `t_costaccount_level1` */

DROP TABLE IF EXISTS `t_costaccount_level1`;

CREATE TABLE `t_costaccount_level1` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) NOT NULL COMMENT '科室名称',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算-一级分摊';

/*Data for the table `t_costaccount_level1` */

/*Table structure for table `t_costaccount_level2` */

DROP TABLE IF EXISTS `t_costaccount_level2`;

CREATE TABLE `t_costaccount_level2` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) NOT NULL COMMENT '科室名称',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成本核算-二级分摊';

/*Data for the table `t_costaccount_level2` */

/*Table structure for table `t_costaccount_level3` */

DROP TABLE IF EXISTS `t_costaccount_level3`;

CREATE TABLE `t_costaccount_level3` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) NOT NULL COMMENT '科室名称',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='成本核算-三级分摊';

/*Data for the table `t_costaccount_level3` */

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始业务数据';

/*Data for the table `t_costaccount_src` */

/*Table structure for table `t_dept` */

DROP TABLE IF EXISTS `t_dept`;

CREATE TABLE `t_dept` (
  `id` int(11) NOT NULL,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) NOT NULL COMMENT '科室名称',
  `dept_type_code` varchar(2) NOT NULL COMMENT '科室类型编码',
  `dept_type_name` varchar(100) NOT NULL COMMENT '科室类型名称',
  `dept_special_code` varchar(3) DEFAULT NULL COMMENT '特殊科室类型编码',
  `dept_special_name` varchar(100) DEFAULT NULL COMMENT '特殊科室类型名称',
  `t_hospital_id` int(11) DEFAULT NULL COMMENT '科室对应医院id',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='科室表';

/*Data for the table `t_dept` */

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
