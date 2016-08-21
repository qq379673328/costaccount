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
/*Table structure for table `t_costaccount_fentan` */

DROP TABLE IF EXISTS `t_costaccount_fentan`;

CREATE TABLE `t_costaccount_fentan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL,
  `dept_name` varchar(100) NOT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `count_direct` float DEFAULT NULL COMMENT '直接成本',
  `count_all` float DEFAULT NULL COMMENT '全成本',
  `fx_l1_people` float DEFAULT NULL COMMENT '分项-一级-人员',
  `fx_l1_device_common` float DEFAULT NULL COMMENT '分项-一级-房屋、通用设备',
  `fx_l1_device_spe` float DEFAULT NULL COMMENT '分项-一级-专用设备',
  `fx_l1_asset` float DEFAULT NULL COMMENT '分项-一级-无形资产',
  `fx_l1_vc` float DEFAULT NULL COMMENT '分项-一级-风险基金',
  `fx_l1_other` float DEFAULT NULL COMMENT '分项-一级-其它',
  `fx_l1` float DEFAULT NULL COMMENT '分项-一级',
  `fx_l2_people` float DEFAULT NULL COMMENT '分项-二级-人员',
  `fx_l2_device_common` float DEFAULT NULL COMMENT '分项-二级-房屋、通用设备',
  `fx_l2_device_spe` float DEFAULT NULL COMMENT '分项-二级-专用设备',
  `fx_l2_asset` float DEFAULT NULL COMMENT '分项-二级-无形资产',
  `fx_l2_vc` float DEFAULT NULL COMMENT '分项-二级-风险基金',
  `fx_l2_other` float DEFAULT NULL COMMENT '分项-二级-其它',
  `fx_l2` float DEFAULT NULL COMMENT '分项-二级',
  `fx_l3_people` float DEFAULT NULL COMMENT '分项-三级-人员',
  `fx_l3_device_common` float DEFAULT NULL COMMENT '分项-三级-房屋、通用设备',
  `fx_l3_device_spe` float DEFAULT NULL COMMENT '分项-三级-专用设备',
  `fx_l3_asset` float DEFAULT NULL COMMENT '分项-三级-无形资产',
  `fx_l3_vc` float DEFAULT NULL COMMENT '分项-三级-风险基金',
  `fx_l3_other` float DEFAULT NULL COMMENT '分项-三级-其它',
  `fx_l3` float DEFAULT NULL COMMENT '分项-三级',
  `t_job_id` int(11) NOT NULL COMMENT '任务id',
  `fx_l3_people_zzys` float DEFAULT NULL COMMENT '分项-三级-人员经费-主治医师',
  `fx_l3_people_fzrys` float DEFAULT NULL COMMENT '分项-三级-人员经费-副主任医师',
  `fx_l3_people_zrys` float DEFAULT NULL COMMENT '分项-三级-人员经费-主任医师',
  `fx_l3_people_js` float DEFAULT NULL COMMENT '分项-三级-人员经费-技师',
  `fx_l3_people_hs` float DEFAULT NULL COMMENT '分项-三级-人员经费-护士',
  `fx_l3_people_qt` float DEFAULT NULL COMMENT '分项-三级-人员经费-其他',
  `fx_l2_people_zzys` float DEFAULT NULL COMMENT '分项-二级-人员经费-主治医师',
  `fx_l2_people_fzrys` float DEFAULT NULL COMMENT '分项-二级-人员经费-副主任医师',
  `fx_l2_people_zrys` float DEFAULT NULL COMMENT '分项-二级-人员经费-主任医师',
  `fx_l2_people_js` float DEFAULT NULL COMMENT '分项-二级-人员经费-技师',
  `fx_l2_people_hs` float DEFAULT NULL COMMENT '分项-二级-人员经费-护士',
  `fx_l2_people_qt` float DEFAULT NULL COMMENT '分项-二级-人员经费-其他',
  `fx_l1_people_zzys` float DEFAULT NULL COMMENT '分项-一级-人员经费-主治医师',
  `fx_l1_people_fzrys` float DEFAULT NULL COMMENT '分项-一级-人员经费-副主任医师',
  `fx_l1_people_zrys` float DEFAULT NULL COMMENT '分项-一级-人员经费-主任医师',
  `fx_l1_people_js` float DEFAULT NULL COMMENT '分项-一级-人员经费-技师',
  `fx_l1_people_hs` float DEFAULT NULL COMMENT '分项-一级-人员经费-护士',
  `fx_l1_people_qt` float DEFAULT NULL COMMENT '分项-一级-人员经费-其他',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

/*Data for the table `t_costaccount_fentan` */

insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (76,'15','临床3',NULL,162,7091.7,5.81332,0.627729,0.682314,0.791485,0.84607,0.900655,9.66157,0.982544,0.369758,0.388661,0.892526,0.445373,0.464276,6.98136,2158.95,812.472,854.009,1961.15,978.621,1020.16,6913.06,17,735.181,116.081,38.6937,503.019,38.6937,464.325,0.337992,0.0533672,0.0177891,0.231258,0.0177891,0.213469,0.573144,0.655022,0.0818777,0.409389,3.6845,0.409389);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (77,'13','临床1-门诊',NULL,162,692164,12.0917,1.30568,1.41921,1.64629,1.75983,1.87336,20.0961,0.271441,0.0737125,0.0779642,0.231558,0.0907192,0.0949709,1.49601,276400,75059.3,79388.6,235789,92376.7,96706.1,691980,17,65843.5,11619.4,15492.6,11619.4,3873.15,120068,0.064803,0.0114358,0.0152478,0.0114358,0.00381194,0.11817,1.19214,1.36245,0.170306,0.851528,7.66376,0.851528);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (78,'14','临床2-住院',NULL,198,7152.53,22.5557,2.43559,2.64738,3.07096,3.28275,3.49454,37.4869,1.14915,0.218848,0.23122,0.950215,0.268336,0.280708,3.98935,4399.67,837.891,885.259,3638.03,1027.36,1074.73,6913.06,17,696.488,464.325,77.3875,464.325,889.956,889.956,0.182973,0.121982,0.0203304,0.121982,0.233799,0.233799,2.2238,2.54148,0.317686,1.58843,14.2959,1.58843);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (79,'11','医技2',NULL,122,151.222,17.2074,1.85808,2.01965,2.34279,2.50437,2.66594,28.5983,0.0734417,0.0283835,0.0302297,0.049816,0.0357683,0.0376144,0.623335,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,0.0238247,0.00476493,0.00635324,0.00476493,0.00158831,0.00476493,1.69651,1.93886,0.242358,1.21179,10.9061,1.21179);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (80,'12','医技3',NULL,185,242.533,33.7172,3.64083,3.95742,4.59061,4.90721,5.2238,56.0371,0.46092,0.0788103,0.0838373,0.349709,0.0989183,0.103945,1.49601,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,0.0609911,0.0457433,0.0457433,0.0457433,0.0876747,0.0457433,3.32424,3.79913,0.474891,2.37445,21.3701,2.37445);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (81,'3','医辅-门诊收费处',NULL,142,186.443,26.7413,2.88755,3.13865,3.64083,3.89192,4.14301,44.4432,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2.63646,3.0131,0.376638,1.88319,16.9487,1.88319);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (82,'2','行政后勤2',NULL,126,126,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (83,'1','行政后勤1',NULL,228,228,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (84,'10','医技1',NULL,173,183.946,4.18559,0.451965,0.491266,0.569869,0.60917,0.648472,6.95633,0.910547,0.157758,0.168369,0.873632,0.200201,0.210812,3.98935,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,0.142313,0.121982,0.121982,0.121982,0.233799,0.121982,0.412664,0.471616,0.058952,0.29476,2.65284,0.29476);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (85,'7','医辅5-病案室',NULL,224,261.1,22.3231,2.41048,2.62009,3.0393,3.24891,3.45852,37.1004,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2.20087,2.51528,0.31441,1.57205,14.1485,1.57205);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (86,'6','医辅4-住院收费处',NULL,376,408.463,19.5328,2.10917,2.29258,2.65939,2.84279,3.0262,32.4629,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.92576,2.20087,0.275109,1.37555,12.3799,1.37555);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (87,'5','医辅3-供应室',NULL,267,287.483,12.3242,1.33079,1.44651,1.67795,1.79367,1.90939,20.4825,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.21507,1.38865,0.173581,0.867904,7.81114,0.867904);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (88,'4','医辅2-挂号处',NULL,138,166.212,16.9749,1.83297,1.99236,2.31114,2.47052,2.62991,28.2118,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.67358,1.91266,0.239083,1.19541,10.7587,1.19541);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (89,'9','医辅',NULL,1028,1050.03,13.2544,1.43122,1.55568,1.80459,1.92904,2.05349,22.0284,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1.30677,1.49345,0.186681,0.933406,8.40065,0.933406);
insert  into `t_costaccount_fentan`(`id`,`dept_code`,`dept_name`,`dept_id`,`count_direct`,`count_all`,`fx_l1_people`,`fx_l1_device_common`,`fx_l1_device_spe`,`fx_l1_asset`,`fx_l1_vc`,`fx_l1_other`,`fx_l1`,`fx_l2_people`,`fx_l2_device_common`,`fx_l2_device_spe`,`fx_l2_asset`,`fx_l2_vc`,`fx_l2_other`,`fx_l2`,`fx_l3_people`,`fx_l3_device_common`,`fx_l3_device_spe`,`fx_l3_asset`,`fx_l3_vc`,`fx_l3_other`,`fx_l3`,`t_job_id`,`fx_l3_people_zzys`,`fx_l3_people_fzrys`,`fx_l3_people_zrys`,`fx_l3_people_js`,`fx_l3_people_hs`,`fx_l3_people_qt`,`fx_l2_people_zzys`,`fx_l2_people_fzrys`,`fx_l2_people_zrys`,`fx_l2_people_js`,`fx_l2_people_hs`,`fx_l2_people_qt`,`fx_l1_people_zzys`,`fx_l1_people_fzrys`,`fx_l1_people_zrys`,`fx_l1_people_js`,`fx_l1_people_hs`,`fx_l1_people_qt`) values (90,'8','医辅-门诊科室',NULL,377,387.435,6.27838,0.677948,0.7369,0.854804,0.913755,0.972707,10.4345,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,17,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0.618996,0.707424,0.0884279,0.44214,3.97926,0.44214);

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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始数据任务管理';

/*Data for the table `t_costaccount_job` */

insert  into `t_costaccount_job`(`id`,`job_desc`,`t_hos_id`,`hos_code`,`hos_name`,`create_time`,`update_time`,`exec_time_start`,`costtime`,`exec_time_end`,`state`) values (17,'测试',1,NULL,'测试医院','2016-08-13 17:22:53','2016-08-21 00:00:00','2016-08-21 00:00:00',0,'2016-08-21 00:00:00','2');

/*Table structure for table `t_costaccount_job_baseinfo` */

DROP TABLE IF EXISTS `t_costaccount_job_baseinfo`;

CREATE TABLE `t_costaccount_job_baseinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `total_cost_kdsr` float DEFAULT NULL COMMENT '总工作量-开单收入',
  `total_cost_zxsr` float DEFAULT NULL COMMENT '总工作量-执行收入',
  `total_cost_xdgzl` float DEFAULT NULL COMMENT '工作量-消毒工作量',
  `total_cost_kdgzl` float DEFAULT NULL COMMENT '总工作量-开单工作量',
  `total_cost_zyrs` float DEFAULT NULL COMMENT '总工作量-住院人数',
  `total_Cost_mzl` float DEFAULT NULL COMMENT '总工作量-门诊量',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `total_people` int(11) DEFAULT NULL COMMENT '总人数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='任务对应的基础信息';

/*Data for the table `t_costaccount_job_baseinfo` */

insert  into `t_costaccount_job_baseinfo`(`id`,`total_cost_kdsr`,`total_cost_zxsr`,`total_cost_xdgzl`,`total_cost_kdgzl`,`total_cost_zyrs`,`total_Cost_mzl`,`t_job_id`,`total_people`) values (16,1804,703,3559,13115,841,864,17,1150);

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
  `share_item_old_house_device_common` float DEFAULT NULL COMMENT '分项成本-通用设备折旧费',
  `share_item_old_device_special` float DEFAULT NULL COMMENT '分项成本-专用设备折旧费',
  `share_item_asset_amortize` float DEFAULT NULL COMMENT '分项成本-无形资产摊销费',
  `share_item_vc_funds` float DEFAULT NULL COMMENT '分项成本-计提医疗风险基金',
  `share_item_other` float DEFAULT NULL COMMENT '分项成本-其它',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算-一级分摊';

/*Data for the table `t_costaccount_level1` */

insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (625,'15','临床3',3.43886,'2','行政后勤2',NULL,'2016-08-21 16:57:54',1.44651,0.327511,0.354803,0.409389,0.436681,0.463974,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (626,'15','临床3',6.22271,'1','行政后勤1',NULL,'2016-08-21 16:57:54',4.36681,0.300218,0.327511,0.382096,0.409389,0.436681,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (627,'8','医辅-门诊科室',6.72052,'1','行政后勤1',NULL,'2016-08-21 16:57:54',4.71616,0.324236,0.353712,0.412664,0.44214,0.471616,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (628,'13','临床1-门诊',12.9432,'1','行政后勤1',NULL,'2016-08-21 16:57:54',9.08297,0.624454,0.681223,0.79476,0.851528,0.908297,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (629,'8','医辅-门诊科室',3.71397,'2','行政后勤2',NULL,'2016-08-21 16:57:54',1.56223,0.353712,0.383188,0.44214,0.471616,0.501092,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (630,'13','临床1-门诊',7.15284,'2','行政后勤2',NULL,'2016-08-21 16:57:54',3.00873,0.681223,0.737991,0.851528,0.908297,0.965065,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (631,'5','医辅3-供应室',7.29039,'2','行政后勤2',NULL,'2016-08-21 16:57:54',3.06659,0.694323,0.752183,0.867904,0.925764,0.983624,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (632,'7','医辅5-病案室',13.2052,'2','行政后勤2',NULL,'2016-08-21 16:57:54',5.55459,1.25764,1.36245,1.57205,1.67686,1.78166,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (633,'5','医辅3-供应室',13.1921,'1','行政后勤1',NULL,'2016-08-21 16:57:54',9.25764,0.636463,0.694323,0.810044,0.867904,0.925764,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (634,'7','医辅5-病案室',23.8952,'1','行政后勤1',NULL,'2016-08-21 16:57:54',16.7686,1.15284,1.25764,1.46725,1.57205,1.67686,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (635,'4','医辅2-挂号处',10.0415,'2','行政后勤2',NULL,'2016-08-21 16:57:54',4.2238,0.956332,1.03603,1.19541,1.27511,1.3548,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (636,'4','医辅2-挂号处',18.1703,'1','行政后勤1',NULL,'2016-08-21 16:57:54',12.7511,0.876638,0.956332,1.11572,1.19541,1.27511,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (637,'9','医辅',14.1878,'1','行政后勤1',NULL,'2016-08-21 16:57:54',9.95633,0.684498,0.746725,0.871179,0.933406,0.995633,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (638,'3','医辅-门诊收费处',28.6245,'1','行政后勤1',NULL,'2016-08-21 16:57:54',20.0873,1.381,1.50655,1.75764,1.88319,2.00873,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (639,'6','医辅4-住院收费处',11.5546,'2','行政后勤2',NULL,'2016-08-21 16:57:54',4.86026,1.10044,1.19214,1.37555,1.46725,1.55895,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (640,'9','医辅',7.84061,'2','行政后勤2',NULL,'2016-08-21 16:57:54',3.29803,0.746725,0.808952,0.933406,0.995633,1.05786,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (641,'3','医辅-门诊收费处',15.8188,'2','行政后勤2',NULL,'2016-08-21 16:57:54',6.65393,1.50655,1.6321,1.88319,2.00873,2.13428,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (642,'6','医辅4-住院收费处',20.9083,'1','行政后勤1',NULL,'2016-08-21 16:57:54',14.6725,1.00873,1.10044,1.28384,1.37555,1.46725,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (643,'12','医技3',36.0917,'1','行政后勤1',NULL,'2016-08-21 16:57:54',25.3275,1.74127,1.89956,2.21616,2.37445,2.53275,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (644,'12','医技3',19.9454,'2','行政后勤2',NULL,'2016-08-21 16:57:54',8.38974,1.89956,2.05786,2.37445,2.53275,2.69105,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (645,'11','医技2',18.4192,'1','行政后勤1',NULL,'2016-08-21 16:57:54',12.9258,0.888646,0.969432,1.131,1.21179,1.29258,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (646,'14','临床2-住院',13.3428,'2','行政后勤2',NULL,'2016-08-21 16:57:54',5.61245,1.27074,1.37664,1.58843,1.69432,1.80022,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (647,'10','医技1',2.47598,'2','行政后勤2',NULL,'2016-08-21 16:57:54',1.04148,0.235808,0.255459,0.29476,0.31441,0.334061,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (648,'14','临床2-住院',24.1441,'1','行政后勤1',NULL,'2016-08-21 16:57:54',16.9432,1.16485,1.27074,1.48253,1.58843,1.69432,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (649,'11','医技2',10.179,'2','行政后勤2',NULL,'2016-08-21 16:57:54',4.28166,0.969432,1.05022,1.21179,1.29258,1.37336,17);
insert  into `t_costaccount_level1`(`id`,`dept_code`,`dept_name`,`share_level1`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (650,'10','医技1',4.48035,'1','行政后勤1',NULL,'2016-08-21 16:57:54',3.1441,0.216157,0.235808,0.275109,0.29476,0.31441,17);

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
  `share_item_old_house_device_common` float DEFAULT NULL COMMENT '分项成本-通用设备折旧费',
  `share_item_old_device_special` float DEFAULT NULL COMMENT '分项成本-专用设备折旧费',
  `share_item_asset_amortize` float DEFAULT NULL COMMENT '分项成本-无形资产摊销费',
  `share_item_vc_funds` float DEFAULT NULL COMMENT '分项成本-计提医疗风险基金',
  `share_item_other` float DEFAULT NULL COMMENT '分项成本-其它',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1303 DEFAULT CHARSET=utf8 COMMENT='成本核算-二级分摊';

/*Data for the table `t_costaccount_level2` */

insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1261,'15','临床3',0.473807,'3','医辅-门诊收费处',NULL,'2016-08-21 16:57:55',0.139297,0.0524212,0.0551012,0.126535,0.0631412,0.0658212,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1262,'15','临床3',1.03803,'6','医辅4-住院收费处',NULL,'2016-08-21 16:57:55',0.140362,0.0528218,0.0555223,0.127502,0.0636238,0.0663243,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1263,'15','临床3',0.663533,'7','医辅5-病案室',NULL,'2016-08-21 16:57:55',0.140718,0.0529561,0.0556634,0.127826,0.0637855,0.0664929,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1264,'15','临床3',0.422393,'4','医辅2-挂号处',NULL,'2016-08-21 16:57:55',0.139651,0.0525544,0.0552412,0.126856,0.0633017,0.0659885,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1265,'15','临床3',0.730578,'5','医辅3-供应室',NULL,'2016-08-21 16:57:55',0.140006,0.0526879,0.0553816,0.127179,0.0634625,0.0661562,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1266,'10','医技1',0.56262,'8','医辅-门诊科室',NULL,'2016-08-21 16:57:55',0.130456,0.0226023,0.0241225,0.125167,0.0286832,0.0302034,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1267,'10','医技1',0.379162,'7','医辅5-病案室',NULL,'2016-08-21 16:57:55',0.130266,0.0225695,0.0240875,0.124985,0.0286416,0.0301596,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1268,'10','医技1',0.593157,'6','医辅4-住院收费处',NULL,'2016-08-21 16:57:55',0.130078,0.0225368,0.0240526,0.124804,0.0286001,0.0301159,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1269,'10','医技1',0.417473,'5','医辅3-供应室',NULL,'2016-08-21 16:57:55',0.129889,0.0225041,0.0240177,0.124623,0.0285586,0.0300722,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1270,'10','医技1',1.52482,'9','医辅',NULL,'2016-08-21 16:57:55',0.130645,0.0226351,0.0241575,0.125349,0.0287248,0.0302473,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1271,'15','临床3',2.66843,'9','医辅',NULL,'2016-08-21 16:57:55',0.141434,0.0532256,0.0559467,0.128477,0.0641101,0.0668313,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1272,'15','临床3',0.984586,'8','医辅-门诊科室',NULL,'2016-08-21 16:57:55',0.141076,0.0530907,0.0558049,0.128151,0.0639476,0.0666618,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1273,'10','医技1',0.241368,'4','医辅2-挂号处',NULL,'2016-08-21 16:57:55',0.129701,0.0224715,0.0239829,0.124442,0.0285172,0.0300286,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1274,'10','医技1',0.270747,'3','医辅-门诊收费处',NULL,'2016-08-21 16:57:55',0.129513,0.0224389,0.0239481,0.124262,0.0284758,0.0299851,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1275,'14','临床2-住院',1.52482,'9','医辅',NULL,'2016-08-21 16:57:55',0.164879,0.0314003,0.0331754,0.136337,0.0385008,0.0402759,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1276,'13','临床1-门诊',0.10153,'3','医辅-门诊收费处',NULL,'2016-08-21 16:57:55',0.0387139,0.0105132,0.0111196,0.0330258,0.0129387,0.0135451,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1277,'13','临床1-门诊',0.0905129,'4','医辅2-挂号处',NULL,'2016-08-21 16:57:55',0.038735,0.0105189,0.0111256,0.0330437,0.0129458,0.0135525,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1278,'13','临床1-门诊',0.156552,'5','医辅3-供应室',NULL,'2016-08-21 16:57:55',0.0387561,0.0105246,0.0111317,0.0330617,0.0129528,0.0135599,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1279,'13','临床1-门诊',0.222434,'6','医辅4-住院收费处',NULL,'2016-08-21 16:57:55',0.0387772,0.0105304,0.0111377,0.0330797,0.0129599,0.0135673,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1280,'13','临床1-门诊',0.142186,'7','医辅5-病案室',NULL,'2016-08-21 16:57:55',0.0387983,0.0105361,0.0111438,0.0330978,0.0129669,0.0135747,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1281,'13','临床1-门诊',0.210983,'8','医辅-门诊科室',NULL,'2016-08-21 16:57:55',0.0388195,0.0105418,0.0111499,0.0331158,0.012974,0.013582,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1282,'13','临床1-门诊',0.571807,'9','医辅',NULL,'2016-08-21 16:57:55',0.0388406,0.0105476,0.0111559,0.0331338,0.0129811,0.0135894,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1283,'11','医技2',0.0652302,'5','医辅3-供应室',NULL,'2016-08-21 16:57:55',0.0104893,0.00405386,0.00431754,0.00711495,0.00510859,0.00537227,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1284,'12','医技3',0.142186,'7','医辅5-病案室',NULL,'2016-08-21 16:57:55',0.0658815,0.0112647,0.0119833,0.0499856,0.0141389,0.0148574,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1285,'11','医技2',0.0377137,'4','医辅2-挂号处',NULL,'2016-08-21 16:57:55',0.0104869,0.00405294,0.00431657,0.00711334,0.00510743,0.00537105,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1286,'12','医技3',0.210983,'8','医辅-门诊科室',NULL,'2016-08-21 16:57:55',0.0659174,0.0112709,0.0119898,0.0500129,0.0141466,0.0148655,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1287,'11','医技2',0.0592441,'7','医辅5-病案室',NULL,'2016-08-21 16:57:55',0.010494,0.0040557,0.0043195,0.00711818,0.00511091,0.00537471,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1288,'12','医技3',0.571807,'9','医辅',NULL,'2016-08-21 16:57:55',0.0659533,0.011277,0.0119963,0.0500401,0.0141543,0.0148736,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1289,'11','医技2',0.0926808,'6','医辅4-住院收费处',NULL,'2016-08-21 16:57:55',0.0104917,0.00405478,0.00431852,0.00711657,0.00510975,0.00537349,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1290,'11','医技2',0.238253,'9','医辅',NULL,'2016-08-21 16:57:55',0.0104988,0.00405754,0.00432147,0.00712141,0.00511323,0.00537715,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1291,'12','医技3',0.10153,'3','医辅-门诊收费处',NULL,'2016-08-21 16:57:55',0.0657382,0.0112402,0.0119572,0.0498769,0.0141081,0.0148251,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1292,'11','医技2',0.0879094,'8','医辅-门诊科室',NULL,'2016-08-21 16:57:55',0.0104964,0.00405662,0.00432049,0.0071198,0.00511207,0.00537593,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1293,'12','医技3',0.0905129,'4','医辅2-挂号处',NULL,'2016-08-21 16:57:55',0.065774,0.0112464,0.0119637,0.0499041,0.0141158,0.0148332,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1294,'12','医技3',0.156552,'5','医辅3-供应室',NULL,'2016-08-21 16:57:55',0.0658098,0.0112525,0.0119702,0.0499312,0.0141235,0.0148412,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1295,'12','医技3',0.222434,'6','医辅4-住院收费处',NULL,'2016-08-21 16:57:55',0.0658457,0.0112586,0.0119768,0.0499584,0.0141312,0.0148493,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1296,'14','临床2-住院',0.56262,'8','医辅-门诊科室',NULL,'2016-08-21 16:57:55',0.16464,0.0313548,0.0331273,0.136139,0.0384449,0.0402175,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1297,'14','临床2-住院',0.379162,'7','医辅5-病案室',NULL,'2016-08-21 16:57:55',0.164401,0.0313093,0.0330793,0.135942,0.0383892,0.0401591,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1298,'14','临床2-住院',0.593157,'6','医辅4-住院收费处',NULL,'2016-08-21 16:57:55',0.164163,0.0312639,0.0330313,0.135744,0.0383335,0.0401009,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1299,'14','临床2-住院',0.417473,'5','医辅3-供应室',NULL,'2016-08-21 16:57:55',0.163925,0.0312186,0.0329834,0.135548,0.0382779,0.0400428,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1300,'14','临床2-住院',0.241368,'4','医辅2-挂号处',NULL,'2016-08-21 16:57:55',0.163687,0.0311733,0.0329356,0.135351,0.0382224,0.0399847,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1301,'14','临床2-住院',0.270747,'3','医辅-门诊收费处',NULL,'2016-08-21 16:57:55',0.16345,0.0311281,0.0328878,0.135155,0.038167,0.0399267,17);
insert  into `t_costaccount_level2`(`id`,`dept_code`,`dept_name`,`share_level2`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (1302,'11','医技2',0.0423042,'3','医辅-门诊收费处',NULL,'2016-08-21 16:57:55',0.0104845,0.00405202,0.00431559,0.00711172,0.00510627,0.00536984,17);

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
  `share_item_old_house_device_common` float DEFAULT NULL COMMENT '分项成本-通用设备折旧费',
  `share_item_old_device_special` float DEFAULT NULL COMMENT '分项成本-专用设备折旧费',
  `share_item_asset_amortize` float DEFAULT NULL COMMENT '分项成本-无形资产摊销费',
  `share_item_vc_funds` float DEFAULT NULL COMMENT '分项成本-计提医疗风险基金',
  `share_item_other` float DEFAULT NULL COMMENT '分项成本-其它',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=280 DEFAULT CHARSET=utf8 COMMENT='成本核算-三级分摊';

/*Data for the table `t_costaccount_level3` */

insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (271,'15','临床3',707.041,'10','医技1',NULL,'2016-08-21 16:57:55',214.465,80.7091,84.8353,194.817,97.214,101.34,17);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (272,'14','临床2-住院',3720.05,'11','医技2',NULL,'2016-08-21 16:57:55',2797.14,532.699,562.814,2312.92,653.157,683.271,17);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (273,'14','临床2-住院',707.041,'10','医技1',NULL,'2016-08-21 16:57:55',437.053,83.2342,87.9396,361.394,102.056,106.761,17);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (274,'14','临床2-住院',2485.96,'12','医技3',NULL,'2016-08-21 16:57:55',1165.47,221.958,234.506,963.717,272.149,284.696,17);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (275,'13','临床1-门诊',70773.1,'10','医技1',NULL,'2016-08-21 16:57:55',27457,7456.22,7886.29,23422.8,9176.5,9606.57,17);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (276,'15','临床3',2485.96,'12','医技3',NULL,'2016-08-21 16:57:55',571.908,215.224,226.228,519.511,259.237,270.241,17);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (277,'13','临床1-门诊',248839,'12','医技3',NULL,'2016-08-21 16:57:55',73218.6,19883.3,21030.1,62460.7,24470.7,25617.5,17);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (278,'15','临床3',3720.05,'11','医技2',NULL,'2016-08-21 16:57:55',1372.58,516.538,542.946,1246.83,622.169,648.577,17);
insert  into `t_costaccount_level3`(`id`,`dept_code`,`dept_name`,`share_level3`,`dept_code_share`,`dept_name_share`,`t_hospital_code`,`creat_time`,`share_item_people`,`share_item_old_house_device_common`,`share_item_old_device_special`,`share_item_asset_amortize`,`share_item_vc_funds`,`share_item_other`,`t_job_id`) values (279,'13','临床1-门诊',372368,'11','医技2',NULL,'2016-08-21 16:57:55',175725,47719.8,50472.2,149906,58729.6,61482,17);

/*Table structure for table `t_costaccount_src` */

DROP TABLE IF EXISTS `t_costaccount_src`;

CREATE TABLE `t_costaccount_src` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_code` varchar(50) NOT NULL COMMENT '科室编码',
  `dept_name` varchar(100) NOT NULL COMMENT '科室名称',
  `dept_id` int(11) DEFAULT NULL COMMENT '科室id',
  `cost_old_house_device_common` float DEFAULT NULL COMMENT '费用-房屋、通用设备折旧费',
  `cost_old_device_special` float DEFAULT NULL COMMENT '费用-专用设备折旧费',
  `cost_asset_amortize` float DEFAULT NULL COMMENT '费用-无形资产摊销费',
  `cost_vc_funds` float DEFAULT NULL COMMENT '费用-计提医疗风险基金',
  `cost_other` float DEFAULT NULL COMMENT '费用-其它',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `work_count_kdgzl` float DEFAULT NULL COMMENT '科室工作量-开单工作量',
  `work_count_xdgzl` float DEFAULT NULL COMMENT '科室工作量-消毒',
  `work_count_inhos` float DEFAULT NULL COMMENT '科室工作量-住院人数',
  `work_count_mz` float DEFAULT NULL COMMENT '科室工作量-门诊量',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `cost_people_zzys` float DEFAULT NULL COMMENT '费用-人员经费-主治医师',
  `cost_people_fzzys` float DEFAULT NULL COMMENT '费用-人员经费-副主任医师',
  `cost_people_zrys` float DEFAULT NULL COMMENT '费用-人员经费-主任医师',
  `cost_people_js` float DEFAULT NULL COMMENT '费用-人员经费-技师',
  `cost_people_hs` float DEFAULT NULL COMMENT '费用-人员经费-护士',
  `cost_people_qt` float DEFAULT NULL COMMENT '费用-人员经费-其它',
  `people_count_zzys` int(11) DEFAULT NULL COMMENT '科室人员数-主治医师',
  `people_count_fzrys` int(11) DEFAULT NULL COMMENT '科室人员数-副主任医生',
  `people_count_zrys` int(11) DEFAULT NULL COMMENT '科室人员数-主任医师',
  `people_count_js` int(11) DEFAULT NULL COMMENT '科室人员数-技师',
  `people_count_hs` int(11) DEFAULT NULL COMMENT '科室人员数-护士',
  `people_count_qt` int(11) DEFAULT NULL COMMENT '科室人员数-其他',
  `work_count_kdsr` float DEFAULT NULL COMMENT '科室工作量-开单收入',
  `work_count_zxsr` float DEFAULT NULL COMMENT '科室工作量-执行收入',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始业务数据';

/*Data for the table `t_costaccount_src` */

insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (76,'1','行政后勤1',NULL,11,12,14,15,16,'2016-08-13 17:22:53',17,124,123,123,12,'2016-08-14 00:00:00',10,1,2,12,123,12,23,12,12,12,2,123,123,123);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (77,'2','行政后勤2',NULL,12,13,15,16,17,'2016-08-13 17:22:53',17,23,21,2,123,'2016-08-14 00:00:00',11,23,1,3,12,3,12,2,3,31,1,1,12,124);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (78,'3','医辅-门诊收费处',NULL,13,14,16,17,18,'2016-08-13 17:22:53',17,12,23,3,121,'2016-08-14 00:00:00',12,12,24,12,3,1,45,31,12,2,23,2,14,1);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (79,'4','医辅2-挂号处',NULL,14,15,17,18,19,'2016-08-13 17:22:53',17,2,3214,3,2,'2016-08-14 00:00:00',13,3,1,3,12,23,12,23,3,3,1,31,12,5);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (80,'5','医辅3-供应室',NULL,7,75,55,42,23,'2016-08-13 17:22:53',17,12,23,4,123,'2016-08-14 00:00:00',25,1,24,12,3,NULL,12,12,12,12,3,2,3,23);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (81,'6','医辅4-住院收费处',NULL,8,77,22,23,42,'2016-08-13 17:22:53',17,3,41,5,12,'2016-08-14 00:00:00',42,23,1,3,12,123,32,31,3,3,12,3,4,233);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (82,'7','医辅5-病案室',NULL,8,78,33,51,32,'2016-08-13 17:22:53',17,3,23,12,31,'2016-08-14 00:00:00',12,1,4,1,3,1,34,23,12,12,3,12,5,3);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (83,'8','医辅-门诊科室',NULL,87,85,44,51,12,'2016-08-13 17:22:53',17,5,3,123,23,'2016-08-14 00:00:00',78,2,12,2,2,2,5,1,3,3,12,3,12,4);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (84,'9','医辅',NULL,412,23,123,12,321,'2016-08-13 17:22:53',17,4,4,12,12,'2016-08-14 00:00:00',123,3,4,3,1,3,6,23,12,1,3,12,12,4);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (85,'10','医技1',NULL,15,16,18,19,20,'2016-08-13 17:22:53',17,23,32,123,3,'2016-08-14 00:00:00',14,12,12,12,23,12,7,1,3,2,2,3,3,56);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (86,'11','医技2',NULL,16,17,19,20,21,'2016-08-13 17:22:53',17,123,5,123,12,'2016-08-14 00:00:00',15,3,4,3,1,3,23,23,12,3,1,12,23,23);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (87,'12','医技3',NULL,17,18,20,21,22,'2016-08-13 17:22:53',17,223,12,123,3,'2016-08-14 00:00:00',16,12,12,12,23,12,12,1,3,123,3,3,123,4);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (88,'13','临床1-门诊',NULL,18,19,21,22,23,'2016-08-13 17:22:53',17,12312,1,123,123,'2016-08-14 00:00:00',17,3,4,3,1,31,23,2,12,2,12,1,1212,12);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (89,'14','临床2-住院',NULL,19,20,22,23,24,'2016-08-13 17:22:53',17,123,2,50,123,'2016-08-14 00:00:00',18,12,2,12,23,23,4,31,3,12,23,24,123,32);
insert  into `t_costaccount_src`(`id`,`dept_code`,`dept_name`,`dept_id`,`cost_old_house_device_common`,`cost_old_device_special`,`cost_asset_amortize`,`cost_vc_funds`,`cost_other`,`create_time`,`t_job_id`,`work_count_kdgzl`,`work_count_xdgzl`,`work_count_inhos`,`work_count_mz`,`update_time`,`cost_people_zzys`,`cost_people_fzzys`,`cost_people_zrys`,`cost_people_js`,`cost_people_hs`,`cost_people_qt`,`people_count_zzys`,`people_count_fzrys`,`people_count_zrys`,`people_count_js`,`people_count_hs`,`people_count_qt`,`work_count_kdsr`,`work_count_zxsr`) values (90,'15','临床3',NULL,20,21,23,24,25,'2016-08-13 17:22:53',17,123,32,12,141,'2016-08-14 00:00:00',19,3,1,13,1,12,1,2,12,4,1,5,123,56);

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

insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (1,'1','行政后勤1','XZHQ','行政后勤',NULL,'',1,'2016-07-26 23:56:02',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (2,'2','行政后勤2','XZHQ','行政后勤',NULL,'',1,'2016-07-26 23:56:25',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (3,'3','医辅-门诊收费处','YF','医辅','OUTPATIENTCASHIER','门诊收费处科室',1,'2016-07-26 23:56:26',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (4,'4','医辅2-挂号处','YF','医辅','REGISTER','挂号处科室',1,'2016-07-26 23:56:26',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (5,'5','医辅3-供应室','YF','医辅','SUPPLY','供应室科室',1,'2016-07-26 23:56:27',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (6,'6','医辅4-住院收费处','YF','医辅','CASHIER','住院收费处科室',1,'2016-07-26 23:56:28',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (7,'7','医辅5-病案室','YF','医辅','MEDICALRECORD','病案室科室',1,'2016-07-26 23:56:29',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (8,'8','医辅-门诊科室','YF','医辅','OUTPATIENT','门诊科室',1,'2016-07-26 23:56:32',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (9,'9','医辅','YF','医辅',NULL,'',1,'2016-07-26 23:56:33',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (10,'10','医技1','YJ','医技',NULL,'',1,'2016-07-26 23:56:35',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (11,'11','医技2','YJ','医技',NULL,'',1,'2016-07-26 23:56:35',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (12,'12','医技3\r\n','YJ','医技',NULL,NULL,1,'2016-07-26 23:56:36',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (13,'13','临床1-门诊','LC','临床','OUTPATIENT','门诊科室',1,'2016-07-26 23:56:37',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (14,'14','临床2-住院\r\n','LC','临床','INHOS',NULL,1,'2016-07-26 23:56:38',NULL);
insert  into `t_dept`(`id`,`dept_code`,`dept_name`,`dept_type_code`,`dept_type_name`,`dept_special_code`,`dept_special_name`,`t_hospital_id`,`create_time`,`update_time`) values (15,'15','临床3','LC','临床',NULL,'',1,'2016-07-26 23:56:38',NULL);

/*Table structure for table `t_hospital` */

DROP TABLE IF EXISTS `t_hospital`;

CREATE TABLE `t_hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hos_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `hos_name` varchar(100) DEFAULT NULL COMMENT '医院名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='医院表';

/*Data for the table `t_hospital` */

insert  into `t_hospital`(`id`,`hos_code`,`hos_name`,`create_time`,`update_time`) values (1,'111','测试医院','2016-07-26 17:40:27',NULL);

/*Table structure for table `t_pro_dic` */

DROP TABLE IF EXISTS `t_pro_dic`;

CREATE TABLE `t_pro_dic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_code` varchar(100) DEFAULT NULL COMMENT '项目代码',
  `pro_name` varchar(200) NOT NULL COMMENT '项目名称',
  `unit` varchar(100) DEFAULT NULL COMMENT '计价单位',
  `price_current` float DEFAULT NULL COMMENT '现行价格',
  `cost_time` float DEFAULT NULL COMMENT '项目耗时',
  `people_count_doctor` int(11) DEFAULT NULL COMMENT '医生人数',
  `people_count_nurse` int(11) DEFAULT NULL COMMENT '护士人数',
  `people_count_tech` int(11) DEFAULT NULL COMMENT '技师人数',
  `cost_low_level` float DEFAULT NULL COMMENT '低值易耗品成本',
  `cost_once` float DEFAULT NULL COMMENT '内涵一次性耗材成本',
  `t_hospital_id` int(11) DEFAULT NULL COMMENT '医院id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `t_pro_dic` */

insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (1,'1','项目1','次',200,50,4,2,5,200,400,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (2,'2','项目2','次',100,30,6,3,2,100,234,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (4,'3','项目3','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (5,'4','项目4','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (6,'5','项目5','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (7,'6','项目6','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (8,'7','项目7','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (9,'8','项目8','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (10,'9','项目9','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (11,'10','项目10','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (12,'11','项目11','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (13,'12','项目12','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (14,'13','项目13','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (15,'14','项目14','次',500,50,4,2,5,200,900,1);
insert  into `t_pro_dic`(`id`,`pro_code`,`pro_name`,`unit`,`price_current`,`cost_time`,`people_count_doctor`,`people_count_nurse`,`people_count_tech`,`cost_low_level`,`cost_once`,`t_hospital_id`) values (16,'15','项目15','次',500,50,4,2,5,200,900,1);

/*Table structure for table `t_pro_result` */

DROP TABLE IF EXISTS `t_pro_result`;

CREATE TABLE `t_pro_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_code` varchar(100) DEFAULT NULL COMMENT '项目编码',
  `pro_name` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `dept_code` varchar(100) DEFAULT NULL COMMENT '科室编码',
  `dept_name` varchar(200) DEFAULT NULL COMMENT '科室名称',
  `cost_direct` float DEFAULT NULL COMMENT '直接成本',
  `cost_serve` float DEFAULT NULL COMMENT '业务成本',
  `cost_all` float DEFAULT NULL COMMENT '全成本',
  `t_job_id` int(11) NOT NULL COMMENT '任务id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

/*Data for the table `t_pro_result` */

insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (76,'1','项目1','1','行政后勤1',600.334,600.334,600.334,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (77,'2','项目2','2','行政后勤2',334.049,334.049,334.049,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (78,'3','项目3','3','医辅-门诊收费处',1100.04,1100.05,1100.05,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (79,'4','项目4','4','医辅2-挂号处',1100.08,1100.14,1100.14,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (80,'5','项目5','5','医辅3-供应室',1100.04,1100.05,1100.05,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (81,'6','项目6','6','医辅4-住院收费处',1100.03,1100.04,1100.04,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (82,'7','项目7','7','医辅5-病案室',1100.02,1100.05,1100.05,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (83,'8','项目8','8','医辅-门诊科室',1100.12,1100.12,1100.12,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (84,'9','项目9','9','医辅',1100.14,1100.16,1100.16,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (85,'10','项目10','10','医技1',1100.14,1100.15,1100.15,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (86,'11','项目11','11','医技2',1100.02,1100.08,1100.08,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (87,'12','项目12','12','医技3',1100.06,1100.1,1100.1,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (88,'13','项目13','13','临床1-门诊',1100.02,1204.64,1204.64,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (89,'14','项目14','14','临床2-住院',1100.02,1101.14,1101.14,17);
insert  into `t_pro_result`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`cost_direct`,`cost_serve`,`cost_all`,`t_job_id`) values (90,'15','项目15','15','临床3',1100.06,1102.72,1102.72,17);

/*Table structure for table `t_pro_src` */

DROP TABLE IF EXISTS `t_pro_src`;

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

/*Data for the table `t_pro_src` */

insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (31,'1','项目1','1','行政后勤1',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (32,'2','项目2','2','行政后勤2',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (33,'3','项目3','3','医辅-门诊收费处',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (34,'4','项目4','4','医辅2-挂号处',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (35,'5','项目5','5','医辅3-供应室',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (36,'6','项目6','6','医辅4-住院收费处',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (37,'7','项目7','7','医辅5-病案室',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (38,'8','项目8','8','医辅-门诊科室',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (39,'9','项目9','9','医辅',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (40,'10','项目10','10','医技1',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (41,'11','项目11','11','医技2',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (42,'12','项目12','12','医技3',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (43,'13','项目13','13','临床1-门诊',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (44,'14','项目14','14','临床2-住院',NULL,17);
insert  into `t_pro_src`(`id`,`pro_code`,`pro_name`,`dept_code`,`dept_name`,`t_dept_id`,`t_job_id`) values (45,'15','项目15','15','临床3',NULL,17);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
