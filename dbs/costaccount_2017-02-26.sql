# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.35)
# Database: costaccount
# Generation Time: 2017-02-26 14:32:17 +0000
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
	(892,'101','门诊-消化内科',NULL,1329107.42,1329107.42,4129.89377840681,19072.840090341542,0,0,19067.06889218541,0,19066.627970526464,61336.43073146023,3644.769102081853,17052.51664208565,0,0,17055.539064824097,0,17053.568941823945,60471.30337230518,162017.66719632206,76322.07783918086,0,55213.00159814418,76338.74866067982,55214.447149545755,76324.23872757607,560923.9347744421,26,0,6284.956197628459,11153.264790513835,118236.8898021777,9896.114189723321,16446.44221627876,0,0,0,0,0,3644.769102081853,0,0,0,0,0,4129.89377840681),
	(893,'102','门诊-呼吸内科',NULL,1332910.65,1332910.65,3950.333180531525,18243.58617884685,0,0,18238.065902348026,0,18237.644151195866,58669.629412922266,4558.952199798597,21325.963180928156,0,0,21329.468552325907,0,21327.112213083776,76214.22183600212,172894.0268615955,78199.52251990086,0,56454.81782303454,78217.07610651683,56456.575080712835,78205.28257866403,581176.8908580743,26,0,8060.526782608696,14304.187130434782,120991.47128973374,12691.877391304348,16845.964267513948,0,0,0,0,0,4558.952199798597,0,0,0,0,0,3950.333180531525),
	(894,'201','住院-消化内科',NULL,1330149.84,1330149.84,5566.3785730984855,25706.87143628349,0,0,25699.092864852584,0,25698.49857913812,82670.84145337269,14875.968899796742,69387.89764868031,0,0,69368.1401118205,0,69371.90295970657,235767.88319753768,113250.40894792913,50913.26034914263,0,36741.26937809502,50924.36562872285,36742.545536445,50917.10051165757,379021.3274067641,26,0,5411.2627351778665,9602.810940711463,78747.55420756381,8520.421185770752,10968.35987870526,0,0,0,0,0,14875.968899796742,0,0,0,0,0,5566.3785730984855),
	(895,'103','门诊-神经外科',NULL,1330579.6,1330579.6,3950.333180531525,18243.58617884685,0,0,18238.065902348026,0,18237.644151195866,58669.629412922266,5781.7837989033815,27063.529135751683,0,0,27069.275613452526,0,27065.776933615067,93936.01400431118,156884.04422174557,71831.99244353808,0,51874.584429809845,71846.10334585971,51876.65268092852,71834.95707109114,532013.8079337365,26,0,6961.3640395256925,12353.616158102766,111127.24694605079,10961.166837944666,15480.65024012169,0,0,0,0,0,5781.7837989033815,0,0,0,0,0,3950.333180531525),
	(896,'202','住院-呼吸内科',NULL,1332193,1332193,5386.8179713267355,24877.61750679399,0,0,24870.089857025836,0,24869.51474181857,80004.04007696513,16456.511745132077,76760.09953512085,0,0,76738.28100686595,0,76742.43096678774,260967.15888272223,100957.22039211175,46944.73411524359,0,33940.112552741004,46955.2300458767,33941.01075753315,46946.84146096747,346239.405610123,26,0,4171.181691699605,7402.166766798419,72701.40840854678,6567.824664031621,10114.638861035317,0,0,0,0,0,16456.511745132077,0,0,0,0,0,5386.8179713267355),
	(897,'301','医技-放射科',NULL,906177.66,906177.66,1975.16658831753,9121.79308042602,0,0,9119.03294217933,0,9118.822066603458,29334.814677526338,6031.08292160796,28227.16921844822,0,0,28232.917500137126,0,28229.364454639835,98500.82135979041,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,6031.08292160796,0,0,0,0,0,1975.16658831753),
	(898,'203','住院-神经外科',NULL,1329627.9,1329627.9,6464.181566371375,29853.14101175175,0,0,29844.107832028873,0,29843.417693780073,96004.84810393208,18981.921277247042,88540.98992245417,0,0,88515.42896759674,0,88520.34662061813,299473.8918672811,107637.54710706978,49320.264265108715,0,35615.81421817538,49329.60164466962,35617.32879483473,49322.0137267535,365203.33106512565,26,0,4763.038553359685,8452.474213438734,76292.2093459272,7499.745731225297,10630.07926311887,0,0,0,0,0,18981.921277247042,0,0,0,0,0,6464.181566371375),
	(899,'302','医技-超声科',NULL,749439.27,749439.27,1616.0453925669601,7463.285257436641,0,0,7461.026962504559,0,7460.854427942256,24001.212040450417,5566.422737231802,26038.79560439117,0,0,26043.080513942245,0,26040.201533203915,93046.35742173616,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,5566.422737231802,0,0,0,0,0,1616.0453925669601),
	(900,'401','医辅-挂号收费处',NULL,289066.01,289066.01,1436.48479079521,6634.03132794714,0,0,6632.023954677809,0,6631.870590622706,21334.410664042865,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1436.48479079521),
	(901,'303','医技-病理科',NULL,749823.41,749823.41,1256.924192919925,5804.77741645245,0,0,5803.020964840425,0,5802.886771292105,18667.609345504905,5777.072894129671,27030.440954960213,0,0,27035.356548721844,0,27032.184823028223,95587.54280325753,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,5777.072894129671,0,0,0,0,0,1256.924192919925),
	(902,'402','医辅-供应室',NULL,377193.54,377193.54,1256.924192919925,5804.77741645245,0,0,5803.020964840425,0,5802.886771292105,18667.609345504905,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1256.924192919925),
	(903,'501','行政后勤-行政',NULL,289297.88,289297.88,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(904,'403','医辅-住院收费处',NULL,289248.34,289248.34,1077.36359504464,4975.52350495776,0,0,4974.01797500304,0,4973.902951961504,16000.808026966944,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1077.36359504464),
	(905,'502','行政后勤-后勤',NULL,289398.01,289398.01,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(906,'404','医辅-病案室',NULL,289120.47,289120.47,897.8029971693551,4146.26959346307,0,0,4145.014985165655,0,4144.919132630903,13334.006708428984,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,26,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,897.8029971693551);

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
	(26,'123',2,NULL,'测试医院新','2017-02-12 12:22:05','2017-02-25 00:00:00','2017-02-25 00:00:00',0,'2017-02-25 00:00:00','2');

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
	(78,0,16258,2457,0,9660,0,26,234);

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
	(2,'10001','测试医院','2017-02-11 15:55:27',NULL);

/*!40000 ALTER TABLE `t_hospital` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_pro_dic
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_pro_dic`;

CREATE TABLE `t_pro_dic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_code` varchar(100) DEFAULT NULL COMMENT '项目代码',
  `pro_name` varchar(200) NOT NULL COMMENT '项目名称',
  `cost_time` int(11) DEFAULT NULL COMMENT '项目耗时',
  `pc_ys` int(11) DEFAULT NULL COMMENT '基本人力消耗-医生',
  `pc_hs` int(11) DEFAULT NULL COMMENT '基本人力消耗-护士',
  `pc_js` int(11) DEFAULT NULL COMMENT '基本人力消耗-技师',
  `pc_o` int(11) DEFAULT NULL COMMENT '基本人力消耗-其它',
  `t_hospital_id` int(11) DEFAULT NULL COMMENT '医院id',
  `wsclf` double DEFAULT NULL COMMENT '卫生材料费',
  `ylfxjj` double DEFAULT NULL COMMENT '医疗风险基金',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_pro_dic` WRITE;
/*!40000 ALTER TABLE `t_pro_dic` DISABLE KEYS */;

INSERT INTO `t_pro_dic` (`id`, `pro_code`, `pro_name`, `cost_time`, `pc_ys`, `pc_hs`, `pc_js`, `pc_o`, `t_hospital_id`, `wsclf`, `ylfxjj`)
VALUES
	(17,'ABEA0001','清创(缝合)术(小)',60,2,0,1,0,2,30,5),
	(18,'EBBBP001','头部X线计算机体层(CT)增强扫描',120,2,1,1,0,2,62.5,3),
	(19,'HCQ50301','脊髓后根入髓区切开术',360,3,2,1,0,2,55,4);

/*!40000 ALTER TABLE `t_pro_dic` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_pro_dic_dept
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_pro_dic_dept`;

CREATE TABLE `t_pro_dic_dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_code` varchar(100) DEFAULT NULL COMMENT '项目编码',
  `pro_name` varchar(200) DEFAULT NULL COMMENT '项目名称',
  `dept_code` varchar(100) DEFAULT NULL COMMENT '科室编码',
  `dept_name` varchar(200) DEFAULT NULL COMMENT '科室名称',
  `t_dept_id` int(11) DEFAULT NULL COMMENT '科室id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_pro_dic_dept` WRITE;
/*!40000 ALTER TABLE `t_pro_dic_dept` DISABLE KEYS */;

INSERT INTO `t_pro_dic_dept` (`id`, `pro_code`, `pro_name`, `dept_code`, `dept_name`, `t_dept_id`)
VALUES
	(46,'科室编码','科室名称','人员经费①','',NULL),
	(47,'','','主治医师','副主任医师',NULL),
	(48,'101','门诊-消化内科','191101.12','192101.23',NULL),
	(49,'102','门诊-呼吸内科','192601.56','193643.67',NULL),
	(50,'103','门诊-神经外科','191984.29','192267.36',NULL),
	(51,'201','住院-消化内科','194561.65','191379.11',NULL),
	(52,'202','住院-呼吸内科','191874.38','195782.98',NULL),
	(53,'203','住院-神经外科','191638.76','193375.62',NULL),
	(54,'301','医技-放射科','','35652.33',NULL),
	(55,'302','医技-超声科','','',NULL),
	(56,'303','医技-病理科','','',NULL),
	(57,'401','医辅-挂号收费处','','',NULL),
	(58,'402','医辅-供应室','','',NULL),
	(59,'403','医辅-住院收费处','','',NULL),
	(60,'404','医辅-病案室','','',NULL),
	(61,'501','行政后勤-行政','','',NULL),
	(62,'502','行政后勤-后勤','','',NULL),
	(63,'','','','',NULL),
	(64,'基础数据模板2：用于导入，由提供人员自行汇总生成','','','',NULL),
	(65,'科室编码','科室名称','对医技科室开单工作量','',NULL),
	(66,'','','医技-放射科','医技-超声科',NULL),
	(67,'101','门诊-消化内科','223','296',NULL),
	(68,'102','门诊-呼吸内科','286','213',NULL),
	(69,'103','门诊-神经外科','247','258',NULL),
	(70,'201','住院-消化内科','192','137',NULL),
	(71,'202','住院-呼吸内科','148','162',NULL),
	(72,'203','住院-神经外科','169','185',NULL),
	(73,'数据库中间表：用于取值','','','',NULL),
	(74,'1、一级分摊（临床科室、医技科室、医辅科室分摊的行政后勤科室成本）','','','',NULL),
	(75,'科室编码','科室名称','人员经费①','',NULL),
	(76,'','','主治医师','副主任医师',NULL),
	(77,'101','门诊-消化内科','0','0',NULL),
	(78,'102','门诊-呼吸内科','0','0',NULL),
	(79,'103','门诊-神经外科','0','0',NULL),
	(80,'201','住院-消化内科','0','0',NULL),
	(81,'202','住院-呼吸内科','0','0',NULL),
	(82,'203','住院-神经外科','0','0',NULL),
	(83,'301','医技-放射科','0','0',NULL),
	(84,'302','医技-超声科','0','0',NULL),
	(85,'303','医技-病理科','0','0',NULL),
	(86,'401','医辅-挂号收费处','0','0',NULL),
	(87,'402','医辅-供应室','0','0',NULL),
	(88,'403','医辅-住院收费处','0','0',NULL),
	(89,'404','医辅-病案室','0','0',NULL),
	(90,'2、二级分摊（临床科室、医技科室分摊的医辅科室成本）','','','',NULL),
	(91,'科室编码','科室名称','人员经费①','',NULL),
	(92,'','','主治医师','副主任医师',NULL),
	(93,'101','门诊-消化内科','0','0',NULL),
	(94,'102','门诊-呼吸内科','0','0',NULL),
	(95,'103','门诊-神经外科','0','0',NULL),
	(96,'201','住院-消化内科','0','0',NULL),
	(97,'202','住院-呼吸内科','0','0',NULL),
	(98,'203','住院-神经外科','0','0',NULL),
	(99,'301','医技-放射科','0','0',NULL),
	(100,'302','医技-超声科','0','0',NULL),
	(101,'303','医技-病理科','0','0',NULL),
	(102,'3、三级分摊（临床科室分摊的医技科室成本）','','','',NULL),
	(103,'科室编码','科室名称','人员经费①','',NULL),
	(104,'','','主治医师','副主任医师',NULL),
	(105,'101','门诊-消化内科','0','6284.95619762846',NULL),
	(106,'102','门诊-呼吸内科','0','8060.5267826087',NULL),
	(107,'103','门诊-神经外科','0','6961.36403952569',NULL),
	(108,'201','住院-消化内科','0','5411.26273517787',NULL),
	(109,'202','住院-呼吸内科','0','4171.1816916996',NULL),
	(110,'203','住院-神经外科','0','4763.03855335968',NULL),
	(111,'分摊算法结果验证（临床科室全成本）','','','',NULL),
	(112,'科室编码','科室名称','人员经费①','',NULL),
	(113,'','','主治医师','副主任医师',NULL),
	(114,'101','门诊-消化内科','191101.12','198386.186197628',NULL),
	(115,'102','门诊-呼吸内科','192601.56','201704.196782609',NULL),
	(116,'103','门诊-神经外科','191984.29','199228.724039526',NULL),
	(117,'201','住院-消化内科','194561.65','196790.372735178',NULL),
	(118,'202','住院-呼吸内科','191874.38','199954.1616917',NULL),
	(119,'203','住院-神经外科','191638.76','198138.65855336',NULL);

/*!40000 ALTER TABLE `t_pro_dic_dept` ENABLE KEYS */;
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
  `cost_ylfxjj` double DEFAULT NULL COMMENT '其他费用',
  `level` int(11) DEFAULT NULL COMMENT '结果级别：1-科室、2-医院',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_pro_result` WRITE;
/*!40000 ALTER TABLE `t_pro_result` DISABLE KEYS */;

INSERT INTO `t_pro_result` (`id`, `pro_code`, `pro_name`, `dept_code`, `dept_name`, `t_job_id`, `cost_people_direct`, `cost_people_mid_yw`, `cost_people_mid_all`, `cost_house_direct`, `cost_house_mid_yw`, `cost_house_mid_all`, `cost_spe_direct`, `cost_spe_mid_yw`, `cost_spe_mid_all`, `cost_asset_direct`, `cost_asset_mid_yw`, `cost_asset_mid_all`, `cost_other_direct`, `cost_other_mid_yw`, `cost_other_mid_all`, `cost_wsclf`, `cost_ylfxjj`, `level`)
VALUES
	(616,'ABEA0001','清创(缝合)术(小)','101','门诊-消化内科',26,145.9547939759036,3.29346605609806,7.025297783574093,7.069276060764799,1.3399043982780763,2.838556055455254,162.53629518072287,0,0,7.069276060764799,1.3401418856593057,2.83834006995884,7.068770822420115,1.3399870829091627,2.8381506217142807,30,5,1),
	(617,'EBBBP001','头部X线计算机体层(CT)增强扫描','101','门诊-消化内科',26,389.21278393574295,8.782576149594826,18.734127422864248,18.85140282870613,3.5730783954082033,7.569482814547343,433.4301204819277,0,0,18.85140282870613,3.573711695091482,7.568906853223574,18.85005552645364,3.573298887757767,7.568401657904749,62.5,3,1),
	(618,'HCQ50301','脊髓后根入髓区切开术','101','门诊-消化内科',26,1751.4575277108431,39.52159267317672,84.30357340288911,84.83131272917758,16.078852779336916,34.06267266546304,1950.4355421686746,0,0,84.83131272917758,16.081702627911667,34.060080839506085,84.82524986904139,16.07984499490995,34.05780746057137,55,4,1),
	(619,'ABEA0001','清创(缝合)术(小)','102','门诊-呼吸内科',26,157.0539512048193,2.7463567468666246,5.12607553031935,7.387101588170864,1.751858968860473,3.2505106264875416,162.55140361445783,0,0,7.387101588170864,1.7521469237945706,3.2503451085438604,7.387143483023002,1.7519533581394122,3.2501168973942756,30,5,1),
	(620,'EBBBP001','头部X线计算机体层(CT)增强扫描','102','门诊-呼吸内科',26,418.8105365461848,7.323617991644332,13.669534747518268,19.698937568455637,4.671623916961261,8.668028337300111,433.4704096385542,0,0,19.698937568455637,4.672391796785521,8.667586956116962,19.69904928806134,4.671875621705099,8.666978393051401,62.5,3,1),
	(621,'HCQ50301','脊髓后根入髓区切开术','102','门诊-呼吸内科',26,1884.6474144578317,32.9562809623995,61.51290636383221,88.64521905805037,21.022307626325677,39.0061275178505,1950.616843373494,0,0,88.64521905805037,21.025763085534848,39.00414130252633,88.64572179627602,21.023440297672945,39.0014027687313,55,4,1),
	(622,'ABEA0001','清创(缝合)术(小)','103','门诊-神经外科',26,148.24036703958694,5.22450343274402,8.79408160792311,7.388013417305586,2.2231814733640483,3.7218331309911172,162.591578313253,0,0,7.390238773274918,2.223653527939693,3.7218517126889825,7.389110898138007,2.223366122695652,3.7215296619505143,30,5,1),
	(623,'EBBBP001','头部X线计算机体层(CT)增强扫描','103','门诊-神经外科',26,395.3076454388985,13.932009153984051,23.450884287794956,19.701369112814895,5.928483928970795,9.924888349309647,433.57754216867465,0,0,19.70730339539978,5.929742741172514,9.924937900503954,19.70429572836802,5.928976327188405,9.924079098534705,62.5,3,1),
	(624,'HCQ50301','脊髓后根入髓区切开术','103','门诊-神经外科',26,1778.884404475043,62.69404119292823,105.5289792950773,88.65616100766702,26.67817768036858,44.66199757189341,1951.098939759036,0,0,88.68286527929901,26.683842335276314,44.66222055226779,88.66933077765609,26.68039347234782,44.65835594340617,55,4,1),
	(625,'ABEA0001','清创(缝合)术(小)','201','住院-消化内科',26,107.73724379335523,13.44214057210549,18.472000728519784,5.243593664982511,4.045155323475339,5.543806981245461,162.53513855421687,0,0,5.244571900505247,4.044003504381296,5.542201689273596,5.243545860862805,4.044222869784681,5.5423864091825505,30,5,1),
	(626,'EBBBP001','头部X线计算机体层(CT)增强扫描','201','住院-消化内科',26,287.29931678228064,35.84570819228131,49.25866860938609,13.982916439953362,10.787080862600904,14.78348528332123,433.4270361445783,0,0,13.985525068013992,10.784009345016788,14.779204504729588,13.982788962300814,10.784594319425818,14.77969709115347,62.5,3,1),
	(627,'HCQ50301','脊髓后根入髓区切开术','201','住院-消化内科',26,1292.8469255202629,161.30568686526587,221.66400874223743,62.92312397979013,48.54186388170407,66.52568377494553,1950.4216626506025,0,0,62.93486280606296,48.52804205257555,66.50642027128315,62.922550330353666,48.53067443741618,66.5086369101906,55,4,1),
	(628,'ABEA0001','清创(缝合)术(小)','202','住院-呼吸内科',26,112.39605760542167,14.87034193837236,19.73794853896881,5.419719277108434,4.6241023816337865,6.122754038669569,162.5738674698795,0,0,5.417238554216868,4.622788012461804,6.120986196619986,5.420094578313253,4.623038010047455,6.121201548711224,30,5,1),
	(629,'EBBBP001','头部X线计算机体层(CT)增强扫描','202','住院-呼吸内科',26,299.7228202811244,39.65424516899296,52.63452943725015,14.452584738955823,12.330939684356764,16.327344103118854,433.530313253012,0,0,14.445969477911648,12.327434699898143,16.322629857653297,14.453585542168675,12.328101360126546,16.323204129896595,62.5,3,1),
	(630,'HCQ50301','脊髓后根入髓区切开术','202','住院-呼吸内科',26,1348.75269126506,178.4441032604683,236.85538246762567,65.0366313253012,55.48922857960544,73.47304846403483,1950.8864096385541,0,0,65.00686265060241,55.47345614954165,73.45183435943984,65.04113493975903,55.47645612056945,73.45441858453468,55,4,1),
	(631,'ABEA0001','清创(缝合)术(小)','203','住院-神经外科',26,91.01141216404079,11.43489233569099,15.3289776166376,4.5148649598393575,4.444828811368182,5.943480468584634,162.59334939759037,0,0,4.515567771084338,4.443545630903452,5.9417438152422495,4.518013554216868,4.4437925010350465,5.941956039879427,30,5,1),
	(632,'EBBBP001','头部X线计算机体层(CT)增强扫描','203','住院-神经外科',26,242.69709910410876,30.493046228509307,40.87727364436694,12.039639892904953,11.85287683031515,15.849281249559025,433.582265060241,0,0,12.0415140562249,11.849455015742537,15.844650173979332,12.048036144578314,11.850113336093457,15.84521610634514,62.5,3,1),
	(633,'HCQ50301','脊髓后根入髓区切开术','203','住院-神经外科',26,1092.1369459684895,137.21870802829187,183.9477313996512,54.17837951807229,53.33794573641818,71.32176562301561,1951.1201927710845,0,0,54.18681325301205,53.322547570841415,71.300925782907,54.21616265060241,53.32551001242056,71.30347247855313,55,4,1),
	(634,'ABEA0001','清创(缝合)术(小)','301','医技-放射科',26,227.65302108433735,5.449773724344542,7.234562810173636,14.779442497261773,4.637541492625666,6.136193148774519,162.51623493975904,0,0,14.77726560788609,4.6384858981605355,6.136684081432057,14.783832420591455,4.6379021557458655,6.136065693522994,30,5,1),
	(635,'EBBBP001','头部X线计算机体层(CT)增强扫描','301','医技-放射科',26,607.0747228915662,14.532729931585447,19.292167493796363,39.41184665936473,12.366777313668443,16.363181730065385,433.3766265060241,0,0,39.40604162102957,12.369295728428094,16.36449088381882,39.423553121577214,12.367739081988974,16.362841849394652,62.5,3,1),
	(636,'HCQ50301','脊髓后根入髓区切开术','301','医技-放射科',26,2731.836253012048,65.3972846921345,86.81475372208364,177.35330996714126,55.65049791150799,73.63431778529424,1950.1948192771083,0,0,177.32718729463306,55.661830777926426,73.64020897718468,177.40598904709748,55.65482586895039,73.63278832227593,55,4,1),
	(637,'ABEA0001','清创(缝合)术(小)','302','医技-超声科',26,67.15718416523235,5.029900063763677,6.490182044998882,18.064636546184737,5.228673816142805,6.727325474262612,162.58525301204818,0,0,18.066981927710845,5.229534239747439,6.727732424989318,18.059588353413655,5.228956131165445,6.727119670912885,30,5,1),
	(638,'EBBBP001','头部X线计算机体层(CT)增强扫描','302','医技-超声科',26,179.0858244406196,13.413066836703138,17.307152119997017,48.1723641231593,13.943130176380812,17.93953459803363,433.5606746987952,0,0,48.17861847389559,13.945424639326504,17.940619799971515,48.15890227576974,13.943883016441186,17.93898578910103,62.5,3,1),
	(639,'HCQ50301','脊髓后根入髓区切开术','302','医技-超声科',26,805.8862099827883,60.35880076516412,77.88218453998658,216.77563855421687,62.74408579371366,80.72790569115134,1951.0230361445783,0,0,216.80378313253013,62.75441087696927,80.73278909987182,216.71506024096385,62.74747357398534,80.72543605095463,55,4,1),
	(640,'ABEA0001','清创(缝合)术(小)','303','医技-病理科',26,92.92578012048193,10.440493182162056,12.712042928402884,23.21673666092943,6.97859921384515,8.47725087041635,162.56043975903614,0,0,23.235498278829606,6.979868300014246,8.478066483707988,23.22162908777969,6.979049437959094,8.477212976158434,30,5,1),
	(641,'EBBBP001','头部X线计算机体层(CT)增强扫描','303','医技-病理科',26,247.80208032128516,27.84131515243215,33.898781142407685,61.91129776247848,18.609597903587066,22.606002321110267,433.4945060240964,0,0,61.961328743545614,18.61298213337132,22.608177289887966,61.92434423407918,18.610798501224252,22.605901269755822,62.5,3,1),
	(642,'HCQ50301','脊髓后根入髓区切开术','303','医技-病理科',26,1115.1093614457832,125.28591818594467,152.5445151408346,278.6008399311532,83.74319056614179,101.7270104449962,1950.7252771084336,0,0,278.82597934595526,83.75841960017095,101.73679780449584,278.6595490533563,83.74859325550912,101.72655571390119,55,4,1),
	(643,'ABEA0001','清创(缝合)术(小)',NULL,NULL,26,192.87906509083885,7.992429783571979,10.322224396239845,10.34259829694972,3.9193162088437252,5.41796786620389,162.56039558232936,0,0,10.34486005138262,3.9193519914513715,5.4175501759338385,10.343525450973205,3.919140852164646,5.417304391152692,30,5,2),
	(644,'EBBBP001','头部X线计算机体层(CT)增强扫描',NULL,NULL,26,514.3441735755703,21.31314608952528,27.525931723306254,27.580262125199255,10.451509890249934,14.44791430987704,433.49438821954493,0,0,27.586293470353656,10.45160531053699,14.446800469156903,27.582734535928548,10.451042272439055,14.446145043073846,62.5,3,2),
	(645,'HCQ50301','脊髓后根入髓区切开术',NULL,NULL,26,2314.548781090066,95.90915740286376,123.86669275487814,124.11117956339665,47.031794506124704,65.01561439444669,1950.7247469879521,0,0,124.13832061659144,47.03222389741646,65.01060211120607,124.12230541167847,47.02969022597575,65.00765269383231,55,4,2);

/*!40000 ALTER TABLE `t_pro_result` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table t_pro_result_cncbl
# ------------------------------------------------------------

DROP TABLE IF EXISTS `t_pro_result_cncbl`;

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `t_pro_result_cncbl` WRITE;
/*!40000 ALTER TABLE `t_pro_result_cncbl` DISABLE KEYS */;

INSERT INTO `t_pro_result_cncbl` (`id`, `t_job_id`, `dept_code`, `dept_name`, `ys_cncbl`, `hs_cncbl`, `js_cncbl`, `op_cncbl`, `house_cncbl`, `spe_cncbl`, `asset_cncbl`, `oc_cncbl`, `type`, `level`)
VALUES
	(148,26,'101','门诊-消化内科',0.3857454417670682,0.3248016231593039,0,0.10031290160642571,0.03927375589313777,0.9029794176706827,0.03927375589313777,0.039270949013445085,1,1),
	(149,26,'102','门诊-呼吸内科',0.41611661646586345,0.39061022088353414,0,0.06579511378848729,0.04103945326761591,0.9030633534136546,0.04103945326761591,0.041039686016794454,1,1),
	(150,26,'201','住院-消化内科',0.32319837126282913,0.17567475355969334,0,0.09966711847389557,0.029131075916569504,0.9029729919678715,0.029136510558362482,0.029130810338126697,1,1),
	(151,26,'103','门诊-神经外科',0.4461004016064257,0.2796347532989099,0,0.09782243975903614,0.04104451898503103,0.9032865461847389,0.041056882073749544,0.041050616100766706,1,1),
	(152,26,'202','住院-呼吸内科',0.3642722577811245,0.16213432061579652,0,0.09801596385542168,0.030109551539491297,0.9031881526104417,0.030095769745649266,0.03011163654618474,1,1),
	(153,26,'301','医技-放射科',0.49659061244979924,0.2818130020080321,0.3885976907630522,0.09773770080321284,0.08210801387367651,0.9028679718875502,0.08209592004381161,0.0821324023366192,1,1),
	(154,26,'203','住院-神经外科',0.2900904166666667,0.14968523324065494,0,0.06584330655957162,0.025082583110218652,0.9032963855421687,0.02508648761713521,0.02510007530120482,1,1),
	(155,26,'302','医技-超声科',0,0,0.2752966724039013,0.09779879518072289,0.10035909192324854,0.90325140562249,0.1003721218206158,0.10033104640785363,1,1),
	(156,26,'303','医技-病理科',0,0,0.32235322958500673,0.19390110441767067,0.12898187033849684,0.9031135542168675,0.12908610154905337,0.12900905048766495,1,1),
	(157,26,'101','门诊-消化内科',0.3857454417670682,0.3248016231593039,0,0.11860993525141493,0.046717669216904865,0.9029794176706827,0.04671898859124503,0.046715321696273765,2,1),
	(158,26,'102','门诊-呼吸内科',0.41611661646586345,0.39061022088353414,0,0.08105265127107965,0.05077200309461854,0.9030633534136546,0.05077360284425242,0.050772760228680075,2,1),
	(159,26,'201','住院-消化内科',0.32319837126282913,0.17567475355969334,0,0.17434567720781496,0.051604161046988055,0.9029729919678715,0.05160319669381412,0.05159871517026382,2,1),
	(160,26,'103','门诊-神经外科',0.4461004016064257,0.2796347532989099,0,0.12684745882983625,0.053395527170386856,0.9032865461847389,0.05341051278452562,0.05340265011574255,2,1),
	(161,26,'202','住院-呼吸内科',0.3642722577811245,0.16213432061579652,0,0.180628974624157,0.055799009215234556,0.9031881526104417,0.05577792537043706,0.05579518104644837,2,1),
	(162,26,'301','医技-放射科',0.49659061244979924,0.2818130020080321,0.3885976907630522,0.12801422149401587,0.10787213327715243,0.9028679718875502,0.10786528614470348,0.10789852542409623,2,1),
	(163,26,'203','住院-神经外科',0.2900904166666667,0.14968523324065494,0,0.12937048620229935,0.04977607650670855,0.9032963855421687,0.0497728522332655,0.049787811418066194,2,1),
	(164,26,'302','医技-超声科',0,0,0.2752966724039013,0.12574268442385442,0.12940727979070857,0.90325140562249,0.1294250898192127,0.1293808026921061,2,1),
	(165,26,'303','医技-病理科',0,0,0.32235322958500673,0.251903844318571,0.1677518659709699,0.9031135542168675,0.16786314766024363,0.16778154736521547,2,1),
	(166,26,'101','门诊-消化内科',0.3857454417670682,0.3248016231593039,0,0.13934233373739288,0.055043511756778074,0.9029794176706827,0.05504231183735355,0.055038452467413304,3,1),
	(167,26,'102','门诊-呼吸内科',0.41611661646586345,0.39061022088353414,0,0.09427331117915035,0.05909784563699114,0.9030633534136546,0.05909692609285959,0.0590958910023182,3,1),
	(168,26,'201','住院-消化内科',0.32319837126282913,0.17567475355969334,0,0.20228934474344992,0.0599300035901554,0.9029729919678715,0.05992651994321579,0.05992184594469643,3,1),
	(169,26,'103','门诊-神经外科',0.4461004016064257,0.2796347532989099,0,0.1466784486919423,0.06172136971275946,0.9032865461847389,0.06173383603313279,0.061725780889380674,3,1),
	(170,26,'202','住院-呼吸内科',0.3642722577811245,0.16213432061579652,0,0.2076712335163595,0.06412485175432224,0.9031881526104417,0.0641012486157603,0.06411831181680265,3,1),
	(171,26,'301','医技-放射科',0.49659061244979924,0.2818130020080321,0.3885976907630522,0.13792971641528862,0.11619797581131273,0.9028679718875502,0.11618860938510082,0.11622165618952472,3,1),
	(172,26,'203','住院-神经外科',0.2900904166666667,0.14968523324065494,0,0.1510042933186694,0.05810191904679996,0.9032963855421687,0.05809617547959216,0.058110942189423864,3,1),
	(173,26,'302','医技-超声科',0,0,0.2752966724039013,0.13385536209738333,0.1377331223358186,0.90325140562249,0.13774841307055646,0.13770393346848078,3,1),
	(174,26,'303','医技-病理科',0,0,0.32235322958500673,0.26452356513102004,0.17607770850747656,0.9031135542168675,0.17618647090298664,0.17610467813298958,3,1),
	(175,26,NULL,NULL,0.3888734454285396,0.25205055810941784,0.32874919758398674,0.10187716049382717,0.05745887942749845,0.9031133087907186,0.05747144472990345,0.057464030283184475,1,2),
	(176,26,NULL,NULL,0.3888734454285396,0.25205055810941784,0.32874919758398674,0.14627954818033817,0.07923285836551915,0.9031133087907186,0.07924562246018885,0.07923703501743251,2,2),
	(177,26,NULL,NULL,0.3888734454285396,0.25205055810941784,0.32874919758398674,0.15922285158404853,0.08755870090640895,0.9031133087907186,0.08756894570731366,0.08756016578958832,3,2);

/*!40000 ALTER TABLE `t_pro_result_cncbl` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
