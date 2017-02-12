# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.35)
# Database: costaccount
# Generation Time: 2017-02-12 07:32:34 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table t_costaccount_fentan
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_costaccount_fentan`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_costaccount_fentan` WRITE;
/*!40000 ALTER TABLE `t_costaccount_fentan` DISABLE KEYS */;

INSERT INTO `t_costaccount_fentan` (`id`, `dept_code`, `dept_name`, `dept_id`, `count_direct`, `count_all`, `fx_l1_people`, `fx_l1_device_common`, `fx_l1_wscl`, `fx_l1_device_spe`, `fx_l1_asset`, `fx_l1_vc`, `fx_l1_other`, `fx_l1`, `fx_l2_people`, `fx_l2_device_common`, `fx_l2_wscl`, `fx_l2_device_spe`, `fx_l2_asset`, `fx_l2_vc`, `fx_l2_other`, `fx_l2`, `fx_l3_people`, `fx_l3_device_common`, `fx_l3_wscl`, `fx_l3_device_spe`, `fx_l3_asset`, `fx_l3_vc`, `fx_l3_other`, `fx_l3`, `t_job_id`, `fx_l3_people_zzys`, `fx_l3_people_fzrys`, `fx_l3_people_zrys`, `fx_l3_people_js`, `fx_l3_people_hs`, `fx_l3_people_qt`, `fx_l2_people_zzys`, `fx_l2_people_fzrys`, `fx_l2_people_zrys`, `fx_l2_people_js`, `fx_l2_people_hs`, `fx_l2_people_qt`, `fx_l1_people_zzys`, `fx_l1_people_fzrys`, `fx_l1_people_zrys`, `fx_l1_people_js`, `fx_l1_people_hs`, `fx_l1_people_qt`)
VALUES
	(592,'101','门诊-消化内科',NULL,1329107.42,1329107.42,4129.89377840681,19072.840090341542,0,0,19067.06889218541,0,19066.627970526464,61336.43073146023,3644.769102081853,17052.51664208565,0,0,17055.539064824097,0,6156.598082972793,60471.30337230518,162017.66719632206,76322.07783918086,0,55213.00159814418,76338.74866067982,55214.447149545755,65554.27090030455,560923.9347744421,26,0,6284.956197628459,11153.264790513835,118236.8898021777,9896.114189723321,16446.44221627876,0,0,0,0,0,3644.769102081853,0,0,0,0,0,4129.89377840681),
	(593,'102','门诊-呼吸内科',NULL,1332910.65,1332910.65,3950.333180531525,18243.58617884685,0,0,18238.065902348026,0,18237.644151195866,58669.629412922266,4558.952199798597,21325.963180928156,0,0,21329.468552325907,0,8338.683479469479,76214.22183600212,172894.0268615955,78199.52251990086,0,56454.81782303454,78217.07610651683,56456.575080712835,66969.9968095647,581176.8908580743,26,0,8060.526782608696,14304.187130434782,120991.47128973374,12691.877391304348,16845.964267513948,0,0,0,0,0,4558.952199798597,0,0,0,0,0,3950.333180531525),
	(594,'201','住院-消化内科',NULL,1330149.84,1330149.84,5566.3785730984855,25706.87143628349,0,0,25699.092864852584,0,25698.49857913812,82670.84145337269,14875.968899796742,69387.89764868031,0,0,69368.1401118205,0,27629.93231678481,235767.88319753768,113250.40894792913,50913.26034914263,0,36741.26937809502,50924.36562872285,36742.545536445,43592.60641697937,379021.3274067641,26,0,5411.2627351778665,9602.810940711463,78747.55420756381,8520.421185770752,10968.35987870526,0,0,0,0,0,14875.968899796742,0,0,0,0,0,5566.3785730984855),
	(595,'103','门诊-神经外科',NULL,1330579.6,1330579.6,3950.333180531525,18243.58617884685,0,0,18238.065902348026,0,18237.644151195866,58669.629412922266,5781.7837989033815,27063.529135751683,0,0,27069.275613452526,0,7559.367266434949,93936.01400431118,156884.04422174557,71831.99244353808,0,51874.584429809845,71846.10334585971,51876.65268092852,61623.298783216786,532013.8079337365,26,0,6961.3640395256925,12353.616158102766,111127.24694605079,10961.166837944666,15480.65024012169,0,0,0,0,0,5781.7837989033815,0,0,0,0,0,3950.333180531525),
	(596,'202','住院-呼吸内科',NULL,1332193,1332193,5386.8179713267355,24877.61750679399,0,0,24870.089857025836,0,24869.51474181857,80004.04007696513,16456.511745132077,76760.09953512085,0,0,76738.28100686595,0,30484.50571904784,260967.15888272223,100957.22039211175,46944.73411524359,0,33940.112552741004,46955.2300458767,33941.01075753315,40280.23574915016,346239.405610123,26,0,4171.181691699605,7402.166766798419,72701.40840854678,6567.824664031621,10114.638861035317,0,0,0,0,0,16456.511745132077,0,0,0,0,0,5386.8179713267355),
	(597,'301','医技-放射科',NULL,906177.66,906177.66,1975.16658831753,9121.79308042602,0,0,9119.03294217933,0,9118.822066603458,29334.814677526338,6031.08292160796,28227.16921844822,0,0,28232.917500137126,0,8455.580911424659,98500.82135979041,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,6031.08292160796,0,0,0,0,0,1975.16658831753),
	(598,'203','住院-神经外科',NULL,1329627.9,1329627.9,6464.181566371375,29853.14101175175,0,0,29844.107832028873,0,29843.417693780073,96004.84810393208,18981.921277247042,88540.98992245417,0,0,88515.42896759674,0,35998.80109679826,299473.8918672811,107637.54710706978,49320.264265108715,0,35615.81421817538,49329.60164466962,35617.32879483473,42322.62408651711,365203.33106512565,26,0,4763.038553359685,8452.474213438734,76292.2093459272,7499.745731225297,10630.07926311887,0,0,0,0,0,18981.921277247042,0,0,0,0,0,6464.181566371375),
	(599,'302','医技-超声科',NULL,749439.27,749439.27,1616.0453925669601,7463.285257436641,0,0,7461.026962504559,0,7460.854427942256,24001.212040450417,5566.422737231802,26038.79560439117,0,0,26043.080513942245,0,10170.076580100626,93046.35742173616,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,5566.422737231802,0,0,0,0,0,1616.0453925669601),
	(600,'401','医辅-挂号收费处',NULL,289066.01,289066.01,1436.48479079521,6634.03132794714,0,0,6632.023954677809,0,6631.870590622706,21334.410664042865,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1436.48479079521),
	(601,'303','医技-病理科',NULL,749823.41,749823.41,1256.924192919925,5804.77741645245,0,0,5803.020964840425,0,5802.886771292105,18667.609345504905,5777.072894129671,27030.440954960213,0,0,27035.356548721844,0,9468.691988369548,95587.54280325753,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,5777.072894129671,0,0,0,0,0,1256.924192919925),
	(602,'402','医辅-供应室',NULL,377193.54,377193.54,1256.924192919925,5804.77741645245,0,0,5803.020964840425,0,5802.886771292105,18667.609345504905,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1256.924192919925),
	(603,'501','行政后勤-行政',NULL,289297.88,289297.88,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(604,'403','医辅-住院收费处',NULL,289248.34,289248.34,1077.36359504464,4975.52350495776,0,0,4974.01797500304,0,4973.902951961504,16000.808026966944,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1077.36359504464),
	(605,'502','行政后勤-后勤',NULL,289398.01,289398.01,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(606,'404','医辅-病案室',NULL,289120.47,289120.47,897.8029971693551,4146.26959346307,0,0,4145.014985165655,0,4144.919132630903,13334.006708428984,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,897.8029971693551);

/*!40000 ALTER TABLE `t_costaccount_fentan` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_costaccount_job
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始数据任务管理';

LOCK TABLES `t_costaccount_job` WRITE;
/*!40000 ALTER TABLE `t_costaccount_job` DISABLE KEYS */;

INSERT INTO `t_costaccount_job` (`id`, `job_desc`, `t_hos_id`, `hos_code`, `hos_name`, `create_time`, `update_time`, `exec_time_start`, `costtime`, `exec_time_end`, `state`)
VALUES
	(26,'123',2,NULL,'测试医院新','2017-02-12 12:22:05','2017-02-12 00:00:00','2017-02-12 00:00:00',0,'2017-02-12 00:00:00','2');

/*!40000 ALTER TABLE `t_costaccount_job` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_costaccount_job_baseinfo
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_costaccount_job_baseinfo`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='任务对应的基础信息';

LOCK TABLES `t_costaccount_job_baseinfo` WRITE;
/*!40000 ALTER TABLE `t_costaccount_job_baseinfo` DISABLE KEYS */;

INSERT INTO `t_costaccount_job_baseinfo` (`id`, `total_cost_kdsr`, `total_cost_mzzxsr`, `total_cost_xdgzl`, `total_cost_zyzxsr`, `total_cost_inhos`, `total_Cost_mz`, `t_job_id`, `total_people`)
VALUES
	(58,0,16258,2457,0,9660,0,26,234);

/*!40000 ALTER TABLE `t_costaccount_job_baseinfo` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_costaccount_level1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_costaccount_level1`;

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



# Dump of table t_costaccount_level2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_costaccount_level2`;

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



# Dump of table t_costaccount_level3
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_costaccount_level3`;

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



# Dump of table t_costaccount_src
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_costaccount_src`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='成本核算原始业务数据';

LOCK TABLES `t_costaccount_src` WRITE;
/*!40000 ALTER TABLE `t_costaccount_src` DISABLE KEYS */;

INSERT INTO `t_costaccount_src` (`id`, `dept_code`, `dept_name`, `dept_id`, `cost_old_house_device_common`, `cost_wscl`, `cost_old_device_special`, `cost_asset_amortize`, `cost_vc_funds`, `cost_other`, `create_time`, `t_job_id`, `work_count_mzzxsr`, `work_count_xdgzl`, `work_count_inhos`, `work_count_mz`, `update_time`, `cost_people_zzys`, `cost_people_fzzys`, `cost_people_zrys`, `cost_people_js`, `cost_people_hs`, `cost_people_qt`, `people_count_zzys`, `people_count_fzrys`, `people_count_zrys`, `people_count_js`, `people_count_hs`, `people_count_qt`, `work_count_kdsr`, `work_count_zyzxsr`)
VALUES
	(211,'101','门诊-消化内科',NULL,89968.32,88934.56,89936.75,89968.32,89950.11,89961.89,'2017-02-12 12:22:05',26,1834,158,NULL,NULL,NULL,191101.12,192101.23,193101.34,NULL,194101.45,19982.33,8,6,1,NULL,6,2,NULL,NULL),
	(212,'102','门诊-呼吸内科',NULL,89925.65,88827.31,89945.11,89925.65,89944.29,89926.16,'2017-02-12 12:22:05',26,2186,214,NULL,NULL,NULL,192601.56,193643.67,193987.78,NULL,194523.89,19659.58,7,5,2,NULL,5,3,NULL,NULL),
	(213,'103','门诊-神经外科',NULL,89936.75,88729.61,89967.34,89963.84,89973.57,89950.11,'2017-02-12 12:22:05',26,3283,194,NULL,NULL,NULL,191984.29,192267.36,193359.15,NULL,194961.35,19486.23,6,4,3,NULL,7,2,NULL,NULL),
	(214,'201','住院-消化内科',NULL,89945.11,88610.62,89936.11,89961.89,89998.83,89944.29,'2017-02-12 12:22:05',26,NULL,356,2836,NULL,NULL,194561.65,191379.11,193489.28,NULL,192469.26,19853.69,7,6,5,NULL,11,2,NULL,NULL),
	(215,'202','住院-呼吸内科',NULL,89967.34,88572.14,89957.54,89926.16,89984.26,89973.57,'2017-02-12 12:22:05',26,NULL,398,3129,NULL,NULL,191874.38,195782.98,192846.91,NULL,193782.94,19524.78,8,5,3,NULL,12,2,NULL,NULL),
	(216,'203','住院-神经外科',NULL,89936.11,88491.25,89968.32,89950.11,89936.75,89998.83,'2017-02-12 12:22:05',26,NULL,416,3695,NULL,NULL,191638.76,193375.62,192845.73,NULL,193812.44,19673.98,9,7,4,NULL,13,3,NULL,NULL),
	(217,'301','医技-放射科',NULL,89957.54,88371.81,89925.65,89944.29,89945.11,89984.26,'2017-02-12 12:22:05',26,3328,217,NULL,NULL,NULL,NULL,35652.33,63268.52,193521.65,56137.15,19469.35,NULL,1,1,5,2,2,NULL,NULL),
	(218,'302','医技-超声科',NULL,89961.89,88217.52,89963.84,89973.57,89967.34,89936.75,'2017-02-12 12:22:05',26,2671,261,NULL,NULL,NULL,NULL,NULL,NULL,191936.84,NULL,19481.52,NULL,NULL,NULL,7,NULL,2,NULL,NULL),
	(219,'303','医技-病理科',NULL,89926.16,88116.25,89950.11,89998.83,89936.11,89945.11,'2017-02-12 12:22:05',26,2956,243,NULL,NULL,NULL,NULL,NULL,NULL,192638.29,NULL,19312.55,NULL,NULL,NULL,6,NULL,1,NULL,NULL),
	(220,'401','医辅-挂号收费处',NULL,89950.11,NULL,NULL,89984.21,NULL,89967.34,'2017-02-12 12:22:05',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19164.35,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),
	(221,'402','医辅-供应室',NULL,89944.29,88092.93,NULL,89936.75,NULL,89936.11,'2017-02-12 12:22:05',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19283.46,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL),
	(222,'403','医辅-住院收费处',NULL,89973.57,NULL,NULL,89945.11,NULL,89957.54,'2017-02-12 12:22:05',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19372.12,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),
	(223,'404','医辅-病案室',NULL,89998.83,NULL,NULL,89967.34,NULL,89968.32,'2017-02-12 12:22:05',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19185.98,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
	(224,'501','行政后勤-行政',NULL,89984.26,NULL,NULL,89936.11,NULL,89925.65,'2017-02-12 12:22:05',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19451.86,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),
	(225,'502','行政后勤-后勤',NULL,89963.84,NULL,NULL,89957.54,NULL,89963.84,'2017-02-12 12:22:05',26,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19512.79,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL);

/*!40000 ALTER TABLE `t_costaccount_src` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_costaccount_src_kdgzl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_costaccount_src_kdgzl`;

CREATE TABLE `t_costaccount_src_kdgzl` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `t_job_id` int(11) DEFAULT NULL COMMENT '任务id',
  `dept_code_base` varchar(50) DEFAULT NULL COMMENT '科室编码-主科室',
  `dept_name_base` varchar(100) DEFAULT NULL COMMENT '科室名-主科室',
  `dept_code_yj` varchar(50) DEFAULT NULL COMMENT '科室编码-医技',
  `dept_name_yj` varchar(100) DEFAULT NULL COMMENT '科室名-医技',
  `kdgzl` double DEFAULT NULL COMMENT '开单工作量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='原始数据-开单工作量';

LOCK TABLES `t_costaccount_src_kdgzl` WRITE;
/*!40000 ALTER TABLE `t_costaccount_src_kdgzl` DISABLE KEYS */;

INSERT INTO `t_costaccount_src_kdgzl` (`id`, `t_job_id`, `dept_code_base`, `dept_name_base`, `dept_code_yj`, `dept_name_yj`, `kdgzl`)
VALUES
	(55,26,'101','门诊-消化内科','301','医技-放射科',223),
	(56,26,'101','门诊-消化内科','302','医技-超声科',296),
	(57,26,'101','门诊-消化内科','303','医技-病理科',86),
	(58,26,'102','门诊-呼吸内科','301','医技-放射科',286),
	(59,26,'102','门诊-呼吸内科','302','医技-超声科',213),
	(60,26,'102','门诊-呼吸内科','303','医技-病理科',99),
	(61,26,'103','门诊-神经外科','301','医技-放射科',247),
	(62,26,'103','门诊-神经外科','302','医技-超声科',258),
	(63,26,'103','门诊-神经外科','303','医技-病理科',75),
	(64,26,'201','住院-消化内科','301','医技-放射科',192),
	(65,26,'201','住院-消化内科','302','医技-超声科',137),
	(66,26,'201','住院-消化内科','303','医技-病理科',63),
	(67,26,'202','住院-呼吸内科','301','医技-放射科',148),
	(68,26,'202','住院-呼吸内科','302','医技-超声科',162),
	(69,26,'202','住院-呼吸内科','303','医技-病理科',56),
	(70,26,'203','住院-神经外科','301','医技-放射科',169),
	(71,26,'203','住院-神经外科','302','医技-超声科',185),
	(72,26,'203','住院-神经外科','303','医技-病理科',49);

/*!40000 ALTER TABLE `t_costaccount_src_kdgzl` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_dept
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='科室表';

LOCK TABLES `t_dept` WRITE;
/*!40000 ALTER TABLE `t_dept` DISABLE KEYS */;

INSERT INTO `t_dept` (`id`, `dept_code`, `dept_name`, `dept_type_code`, `dept_type_name`, `dept_special_code`, `dept_special_name`, `t_hospital_id`, `create_time`, `update_time`)
VALUES
	(1,'1','行政后勤1','XZHQ','行政后勤',NULL,'',1,'2016-07-26 23:56:02',NULL),
	(2,'2','行政后勤2','XZHQ','行政后勤',NULL,'',1,'2016-07-26 23:56:25',NULL),
	(3,'3','医辅-门诊收费处','YF','医辅','OUTPATIENTCASHIER','门诊收费处科室',1,'2016-07-26 23:56:26',NULL),
	(4,'4','医辅2-挂号处','YF','医辅','REGISTER','挂号处科室',1,'2016-07-26 23:56:26',NULL),
	(5,'5','医辅3-供应室','YF','医辅','SUPPLY','供应室科室',1,'2016-07-26 23:56:27',NULL),
	(6,'6','医辅4-住院收费处','YF','医辅','CASHIER','住院收费处科室',1,'2016-07-26 23:56:28',NULL),
	(7,'7','医辅5-病案室','YF','医辅','MEDICALRECORD','病案室科室',1,'2016-07-26 23:56:29',NULL),
	(8,'8','医辅-门诊科室','YF','医辅','OUTPATIENT','门诊科室',1,'2016-07-26 23:56:32',NULL),
	(9,'9','医辅','YF','医辅',NULL,'',1,'2016-07-26 23:56:33',NULL),
	(10,'10','医技1','YJ','医技',NULL,'',1,'2016-07-26 23:56:35',NULL),
	(11,'11','医技2','YJ','医技',NULL,'',1,'2016-07-26 23:56:35',NULL),
	(12,'12','医技3\r\n','YJ','医技',NULL,NULL,1,'2016-07-26 23:56:36',NULL),
	(13,'13','临床1-门诊','LC','临床','OUTPATIENT','门诊科室',1,'2016-07-26 23:56:37',NULL),
	(14,'14','临床2-住院\r\n','LC','临床','INHOS',NULL,1,'2016-07-26 23:56:38',NULL),
	(15,'15','临床3','LC','临床',NULL,'',1,'2016-07-26 23:56:38',NULL),
	(16,'101','门诊-消化内科','LC','临床','OUTPATIENT','门诊科室',2,'2017-02-11 15:57:57',NULL),
	(17,'102','门诊-呼吸内科','LC','临床','OUTPATIENT','门诊科室',2,'2017-02-11 15:58:17',NULL),
	(18,'103','门诊-神经外科','LC','临床','OUTPATIENT','门诊科室',2,'2017-02-11 15:58:32',NULL),
	(19,'201','住院-消化内科','LC','临床','INHOS','住院科室',2,'2017-02-11 15:58:54',NULL),
	(20,'202','住院-呼吸内科','LC','临床','INHOS','住院科室',2,'2017-02-11 15:59:14',NULL),
	(21,'203','住院-神经外科','LC','临床','INHOS','住院科室',2,'2017-02-11 15:59:33',NULL),
	(22,'301','医技-放射科','YJ','医技','','',2,'2017-02-11 15:59:55',NULL),
	(23,'302','医技-超声科','YJ','医技','','',2,'2017-02-11 16:00:16',NULL),
	(24,'303','医技-病理科','YJ','医技','','',2,'2017-02-11 16:00:30',NULL),
	(25,'401','医辅-挂号收费处','YF','医辅','REGISTER','挂号处科室',2,'2017-02-11 16:00:55',NULL),
	(26,'402','医辅-供应室','YF','医辅','SUPPLY','供应室科室',2,'2017-02-11 16:01:10',NULL),
	(27,'403','医辅-住院收费处','YF','医辅','CASHIER','住院收费处科室',2,'2017-02-11 16:01:31',NULL),
	(28,'404','医辅-病案室','YF','医辅','MEDICALRECORD','病案室科室',2,'2017-02-11 16:01:50',NULL),
	(29,'501','行政后勤-行政','XZHQ','行政后勤',NULL,'',2,'2017-02-11 16:02:11',NULL),
	(30,'502','行政后勤-后勤','XZHQ','行政后勤','','',2,'2017-02-11 16:02:26',NULL);

/*!40000 ALTER TABLE `t_dept` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_hospital
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_hospital`;

CREATE TABLE `t_hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hos_code` varchar(50) DEFAULT NULL COMMENT '医院编码',
  `hos_name` varchar(100) DEFAULT NULL COMMENT '医院名称',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='医院表';

LOCK TABLES `t_hospital` WRITE;
/*!40000 ALTER TABLE `t_hospital` DISABLE KEYS */;

INSERT INTO `t_hospital` (`id`, `hos_code`, `hos_name`, `create_time`, `update_time`)
VALUES
	(2,'1','测试医院新','2017-02-11 15:55:27',NULL);

/*!40000 ALTER TABLE `t_hospital` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_pro_dic
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_pro_dic` WRITE;
/*!40000 ALTER TABLE `t_pro_dic` DISABLE KEYS */;

INSERT INTO `t_pro_dic` (`id`, `pro_code`, `pro_name`, `unit`, `price_current`, `cost_time`, `people_count_doctor`, `people_count_nurse`, `people_count_tech`, `cost_low_level`, `cost_once`, `t_hospital_id`)
VALUES
	(1,'1','项目1','次',200,50,4,2,5,200,400,1),
	(2,'2','项目2','次',100,30,6,3,2,100,234,1),
	(4,'3','项目3','次',500,50,4,2,5,200,900,1),
	(5,'4','项目4','次',500,50,4,2,5,200,900,1),
	(6,'5','项目5','次',500,50,4,2,5,200,900,1),
	(7,'6','项目6','次',500,50,4,2,5,200,900,1),
	(8,'7','项目7','次',500,50,4,2,5,200,900,1),
	(9,'8','项目8','次',500,50,4,2,5,200,900,1),
	(10,'9','项目9','次',500,50,4,2,5,200,900,1),
	(11,'10','项目10','次',500,50,4,2,5,200,900,1),
	(12,'11','项目11','次',500,50,4,2,5,200,900,1),
	(13,'12','项目12','次',500,50,4,2,5,200,900,1),
	(14,'13','项目13','次',500,50,4,2,5,200,900,1),
	(15,'14','项目14','次',500,50,4,2,5,200,900,1),
	(16,'15','项目15','次',500,50,4,2,5,200,900,1);

/*!40000 ALTER TABLE `t_pro_dic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_pro_result
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_pro_result` WRITE;
/*!40000 ALTER TABLE `t_pro_result` DISABLE KEYS */;

INSERT INTO `t_pro_result` (`id`, `pro_code`, `pro_name`, `dept_code`, `dept_name`, `cost_direct`, `cost_serve`, `cost_all`, `t_job_id`)
VALUES
	(76,'1','项目1','1','行政后勤1',600.334,600.334,600.334,17),
	(77,'2','项目2','2','行政后勤2',334.049,334.049,334.049,17),
	(78,'3','项目3','3','医辅-门诊收费处',1100.04,1100.05,1100.05,17),
	(79,'4','项目4','4','医辅2-挂号处',1100.08,1100.14,1100.14,17),
	(80,'5','项目5','5','医辅3-供应室',1100.04,1100.05,1100.05,17),
	(81,'6','项目6','6','医辅4-住院收费处',1100.03,1100.04,1100.04,17),
	(82,'7','项目7','7','医辅5-病案室',1100.02,1100.05,1100.05,17),
	(83,'8','项目8','8','医辅-门诊科室',1100.12,1100.12,1100.12,17),
	(84,'9','项目9','9','医辅',1100.14,1100.16,1100.16,17),
	(85,'10','项目10','10','医技1',1100.14,1100.15,1100.15,17),
	(86,'11','项目11','11','医技2',1100.02,1100.08,1100.08,17),
	(87,'12','项目12','12','医技3',1100.06,1100.1,1100.1,17),
	(88,'13','项目13','13','临床1-门诊',1100.02,1204.64,1204.64,17),
	(89,'14','项目14','14','临床2-住院',1100.02,1101.14,1101.14,17),
	(90,'15','项目15','15','临床3',1100.06,1102.72,1102.72,17);

/*!40000 ALTER TABLE `t_pro_result` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_pro_src
# ------------------------------------------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_pro_src` WRITE;
/*!40000 ALTER TABLE `t_pro_src` DISABLE KEYS */;

INSERT INTO `t_pro_src` (`id`, `pro_code`, `pro_name`, `dept_code`, `dept_name`, `t_dept_id`, `t_job_id`)
VALUES
	(46,'科室编码','科室名称','人员经费①','',NULL,17),
	(47,'','','主治医师','副主任医师',NULL,17),
	(48,'101','门诊-消化内科','191101.12','192101.23',NULL,17),
	(49,'102','门诊-呼吸内科','192601.56','193643.67',NULL,17),
	(50,'103','门诊-神经外科','191984.29','192267.36',NULL,17),
	(51,'201','住院-消化内科','194561.65','191379.11',NULL,17),
	(52,'202','住院-呼吸内科','191874.38','195782.98',NULL,17),
	(53,'203','住院-神经外科','191638.76','193375.62',NULL,17),
	(54,'301','医技-放射科','','35652.33',NULL,17),
	(55,'302','医技-超声科','','',NULL,17),
	(56,'303','医技-病理科','','',NULL,17),
	(57,'401','医辅-挂号收费处','','',NULL,17),
	(58,'402','医辅-供应室','','',NULL,17),
	(59,'403','医辅-住院收费处','','',NULL,17),
	(60,'404','医辅-病案室','','',NULL,17),
	(61,'501','行政后勤-行政','','',NULL,17),
	(62,'502','行政后勤-后勤','','',NULL,17),
	(63,'','','','',NULL,17),
	(64,'基础数据模板2：用于导入，由提供人员自行汇总生成','','','',NULL,17),
	(65,'科室编码','科室名称','对医技科室开单工作量','',NULL,17),
	(66,'','','医技-放射科','医技-超声科',NULL,17),
	(67,'101','门诊-消化内科','223','296',NULL,17),
	(68,'102','门诊-呼吸内科','286','213',NULL,17),
	(69,'103','门诊-神经外科','247','258',NULL,17),
	(70,'201','住院-消化内科','192','137',NULL,17),
	(71,'202','住院-呼吸内科','148','162',NULL,17),
	(72,'203','住院-神经外科','169','185',NULL,17),
	(73,'数据库中间表：用于取值','','','',NULL,17),
	(74,'1、一级分摊（临床科室、医技科室、医辅科室分摊的行政后勤科室成本）','','','',NULL,17),
	(75,'科室编码','科室名称','人员经费①','',NULL,17),
	(76,'','','主治医师','副主任医师',NULL,17),
	(77,'101','门诊-消化内科','0','0',NULL,17),
	(78,'102','门诊-呼吸内科','0','0',NULL,17),
	(79,'103','门诊-神经外科','0','0',NULL,17),
	(80,'201','住院-消化内科','0','0',NULL,17),
	(81,'202','住院-呼吸内科','0','0',NULL,17),
	(82,'203','住院-神经外科','0','0',NULL,17),
	(83,'301','医技-放射科','0','0',NULL,17),
	(84,'302','医技-超声科','0','0',NULL,17),
	(85,'303','医技-病理科','0','0',NULL,17),
	(86,'401','医辅-挂号收费处','0','0',NULL,17),
	(87,'402','医辅-供应室','0','0',NULL,17),
	(88,'403','医辅-住院收费处','0','0',NULL,17),
	(89,'404','医辅-病案室','0','0',NULL,17),
	(90,'2、二级分摊（临床科室、医技科室分摊的医辅科室成本）','','','',NULL,17),
	(91,'科室编码','科室名称','人员经费①','',NULL,17),
	(92,'','','主治医师','副主任医师',NULL,17),
	(93,'101','门诊-消化内科','0','0',NULL,17),
	(94,'102','门诊-呼吸内科','0','0',NULL,17),
	(95,'103','门诊-神经外科','0','0',NULL,17),
	(96,'201','住院-消化内科','0','0',NULL,17),
	(97,'202','住院-呼吸内科','0','0',NULL,17),
	(98,'203','住院-神经外科','0','0',NULL,17),
	(99,'301','医技-放射科','0','0',NULL,17),
	(100,'302','医技-超声科','0','0',NULL,17),
	(101,'303','医技-病理科','0','0',NULL,17),
	(102,'3、三级分摊（临床科室分摊的医技科室成本）','','','',NULL,17),
	(103,'科室编码','科室名称','人员经费①','',NULL,17),
	(104,'','','主治医师','副主任医师',NULL,17),
	(105,'101','门诊-消化内科','0','6284.95619762846',NULL,17),
	(106,'102','门诊-呼吸内科','0','8060.5267826087',NULL,17),
	(107,'103','门诊-神经外科','0','6961.36403952569',NULL,17),
	(108,'201','住院-消化内科','0','5411.26273517787',NULL,17),
	(109,'202','住院-呼吸内科','0','4171.1816916996',NULL,17),
	(110,'203','住院-神经外科','0','4763.03855335968',NULL,17),
	(111,'分摊算法结果验证（临床科室全成本）','','','',NULL,17),
	(112,'科室编码','科室名称','人员经费①','',NULL,17),
	(113,'','','主治医师','副主任医师',NULL,17),
	(114,'101','门诊-消化内科','191101.12','198386.186197628',NULL,17),
	(115,'102','门诊-呼吸内科','192601.56','201704.196782609',NULL,17),
	(116,'103','门诊-神经外科','191984.29','199228.724039526',NULL,17),
	(117,'201','住院-消化内科','194561.65','196790.372735178',NULL,17),
	(118,'202','住院-呼吸内科','191874.38','199954.1616917',NULL,17),
	(119,'203','住院-神经外科','191638.76','198138.65855336',NULL,17);

/*!40000 ALTER TABLE `t_pro_src` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
