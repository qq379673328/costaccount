# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.35)
# Database: costaccount
# Generation Time: 2017-04-03 07:54:16 +0000
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='分摊算法计算结果表';

LOCK TABLES `t_costaccount_fentan` WRITE;
/*!40000 ALTER TABLE `t_costaccount_fentan` DISABLE KEYS */;

INSERT INTO `t_costaccount_fentan` (`id`, `dept_code`, `dept_name`, `dept_id`, `count_direct`, `count_all`, `fx_l1_people`, `fx_l1_device_common`, `fx_l1_wscl`, `fx_l1_device_spe`, `fx_l1_asset`, `fx_l1_vc`, `fx_l1_other`, `fx_l1`, `fx_l2_people`, `fx_l2_device_common`, `fx_l2_wscl`, `fx_l2_device_spe`, `fx_l2_asset`, `fx_l2_vc`, `fx_l2_other`, `fx_l2`, `fx_l3_people`, `fx_l3_device_common`, `fx_l3_wscl`, `fx_l3_device_spe`, `fx_l3_asset`, `fx_l3_vc`, `fx_l3_other`, `fx_l3`, `t_job_id`, `fx_l3_people_zzys`, `fx_l3_people_fzrys`, `fx_l3_people_zrys`, `fx_l3_people_js`, `fx_l3_people_hs`, `fx_l3_people_qt`, `fx_l2_people_zzys`, `fx_l2_people_fzrys`, `fx_l2_people_zrys`, `fx_l2_people_js`, `fx_l2_people_hs`, `fx_l2_people_qt`, `fx_l1_people_zzys`, `fx_l1_people_fzrys`, `fx_l1_people_zrys`, `fx_l1_people_js`, `fx_l1_people_hs`, `fx_l1_people_qt`)
VALUES
	(1072,'101','门诊-消化内科',NULL,1329107.42,1329107.42,4227.2969324919,19522.6712196246,0,0,19516.7639083059,0,19516.31258755134,62783.044647973744,3650.49721463103,17078.97043981797,5664.909621489622,0,17081.984857974614,0,17080.014123421468,60556.376257334705,149935.47791466222,75583.26432389129,59493.75360299346,55213.00159814418,75600.29589362445,55214.447149545755,75585.80303707405,546626.0435199353,28,0,6435.675518882944,11303.984111768317,121998.26545177866,10197.552832232288,0,1269.738161610793,952.3036212080947,158.71727020134912,317.43454040269825,952.3036212080947,0,1470.3641504319653,1102.773112823974,183.79551880399566,367.5910376079913,1102.773112823974,0),
	(1073,'102','门诊-呼吸内科',NULL,1332910.65,1332910.65,4043.501414873785,18673.85943294369,0,0,18668.208961245884,0,18667.7772631327,60053.34707219606,4566.089487041865,21358.924885411074,7672.72568986569,0,21362.420283017447,0,21360.063181773985,76320.22352711007,160549.52494451206,77467.04868122799,60749.589887649694,56454.81782303454,77484.92262820176,56456.575080712835,77473.1460312327,566635.6250765716,28,0,8253.826001796062,14497.486349622146,124719.73676341478,13078.475829679077,0,1452.846654967866,1037.747610691333,415.09904427653316,622.6485664147998,1037.747610691333,0,1286.5686320052953,918.9775942894966,367.5910377157987,551.3865565736979,918.9775942894966,0),
	(1074,'201','住院-消化内科',NULL,1330149.84,1330149.84,5697.661085126215,26313.165567056312,0,0,26305.203538754115,0,26304.5952368673,84620.62542780394,14893.940394095542,69470.89432010504,12763.973577533576,0,69451.111669511,0,69454.87259869855,236034.7925599437,105215.422593676,50434.04708298597,39532.37705477189,36741.26937809502,50445.36086435541,36742.545536445,50438.106824167044,369549.12933449633,28,0,5541.03004316379,9732.578248697386,81161.85850007224,8779.955801742599,0,3363.1478309247996,2882.698140792685,2402.248450660571,960.8993802642285,5284.946591453257,0,1286.5686321252742,1102.7731132502352,918.977594375196,367.5910377500784,2021.7507076254312,0),
	(1075,'103','门诊-神经外科',NULL,1330579.6,1330579.6,4043.501414873785,18673.85943294369,0,0,18668.208961245884,0,18667.7772631327,60053.34707219606,5790.965772301506,27105.93369134869,6955.648522588523,0,27111.66733797185,0,27108.16767783533,94072.3830020459,145528.15386793358,71128.12207706617,55865.47374076355,51874.584429809845,71142.56554169612,51876.65268092852,71131.43553608026,518546.987874278,28,0,7128.304274278417,12520.55639285549,114584.24589334958,11295.047307450113,0,1579.3543015367743,1052.902867691183,789.6771507683872,526.4514338455915,1842.58001845957,0,1102.7731131473959,735.1820754315974,551.3865565736979,367.5910377157987,1286.5686320052953,0),
	(1076,'202','住院-呼吸内科',NULL,1332193,1332193,5513.8655675081,25464.3537803754,0,0,25456.6485916941,0,25456.059912448658,81890.92785202626,16476.40293707095,76851.9618307179,14269.835628815626,0,76830.11550610396,0,76834.26334237373,261262.5792450821,93532.7648683897,46496.89264660836,36554.25628564933,33940.112552741004,46507.59917354508,33941.01075753315,46499.22093999861,337471.85722446523,28,0,4271.210658272088,7502.195733370901,74991.47587957012,6767.8825971765855,0,4393.707449885586,2746.067156178491,1647.6402937070952,1098.4268624713966,6590.561174828381,0,1470.3641513354933,918.9775945846833,551.38655675081,367.5910378338733,2205.54622700324,0),
	(1077,'301','医技-放射科',NULL,886708.31,886708.31,1654.15967025243,7639.30613411262,0,0,7636.99457750823,0,7636.817973734597,24567.27835560788,6040.636170475354,28271.28841321873,7780.287264957264,0,28277.023345001995,0,28273.469279567005,98642.70447322036,0,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,671.1817967194838,671.1817967194838,3355.908983597419,1342.3635934389677,0,0,183.79551891693666,183.79551891693666,918.9775945846834,367.5910378338733,0),
	(1078,'203','住院-神经外科',NULL,1329627.9,1329627.9,6616.63868100972,30557.22453645048,0,0,30547.97831003292,0,30547.27189493839,98269.11342243152,19004.759107323265,88646.4604997682,14915.205079365078,0,88620.86763085927,0,88625.7828456354,299813.0751629512,99838.87580637523,48832.25556965197,38360.76130851395,35615.81421817538,48841.82635984963,35617.32879483473,48834.24972162672,355941.1117790276,28,0,4877.260819243127,8566.696479322178,78666.72824481774,7728.190262992182,0,4751.189776830816,3695.3698264239683,2111.639900813696,1583.729925610272,6862.829677644512,0,1654.15967025243,1286.5686324185567,735.1820756677466,551.38655675081,2389.341745920177,0),
	(1079,'302','医技-超声科',NULL,729957.17,729957.17,1286.568631119735,5941.68254275599,0,0,5939.884665398835,0,5939.747306908371,19107.883146182932,5575.137764584973,26079.043691148043,9357.857032967033,0,26083.31642214139,0,26080.436510956773,93175.79142179823,0,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,0,0,5575.137764584973,0,0,0,0,0,1286.568631119735,0,0),
	(1080,'401','医辅-挂号收费处',NULL,289066.01,289066.01,1470.3641526343151,6790.494347431711,0,0,6788.439630448215,0,6788.282649315958,21837.5807798302,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1470.3641526343151),
	(1081,'303','医技-病理科',NULL,730510.86,730510.86,1102.77311350162,5092.87075607508,0,0,5091.3297183388195,0,5091.211982489732,16378.185570405252,5786.164645614685,27072.428844121292,8712.487582417582,0,27077.331732883176,0,27074.159036522906,95722.57184155966,0,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,0,0,5786.164645614685,0,0,0,0,0,1102.77311350162,0,0),
	(1082,'402','医辅-供应室',NULL,377193.54,377193.54,1286.568631119735,5941.68254275599,0,0,5939.884665398835,0,5939.747306908371,19107.883146182932,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1286.568631119735),
	(1083,'501','行政后勤-行政',NULL,289297.88,289297.88,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(1084,'403','医辅-住院收费处',NULL,289248.34,289248.34,1102.77311350162,5092.87075607508,0,0,5091.3297183388195,0,5091.211982489732,16378.185570405252,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1102.77311350162),
	(1085,'502','行政后勤-后勤',NULL,289398.01,289398.01,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0),
	(1086,'404','医辅-病案室',NULL,289120.47,289120.47,918.977595883505,4244.05896939417,0,0,4242.774771278805,0,4242.676658071093,13648.487994627574,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,28,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,918.977595883505);

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
	(28,'测试任务',2,NULL,'测试医院','2017-04-03 15:24:51','2017-04-03 00:00:00','2017-04-03 00:00:00',0,'2017-04-03 00:00:00','2');

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
	(90,0,16258,2457,0,9660,0,28,229);

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
	(241,'101','门诊-消化内科',NULL,89968.32,88934.56,89936.75,89968.32,89950.11,89961.89,'2017-04-03 15:24:51',28,1834,158,NULL,NULL,NULL,191101.12,192101.23,193101.34,19982.33,194101.45,NULL,8,6,1,2,6,NULL,NULL,NULL),
	(242,'102','门诊-呼吸内科',NULL,89925.65,88827.31,89945.11,89925.65,89944.29,89926.16,'2017-04-03 15:24:51',28,2186,214,NULL,NULL,NULL,192601.56,193643.67,193987.78,19659.58,194523.89,NULL,7,5,2,3,5,NULL,NULL,NULL),
	(243,'103','门诊-神经外科',NULL,89936.75,88729.61,89967.34,89963.84,89973.57,89950.11,'2017-04-03 15:24:51',28,3283,194,NULL,NULL,NULL,191984.29,192267.36,193359.15,19486.23,194961.35,NULL,6,4,3,2,7,NULL,NULL,NULL),
	(244,'201','住院-消化内科',NULL,89945.11,88610.62,89936.11,89961.89,89998.83,89944.29,'2017-04-03 15:24:51',28,NULL,356,2836,NULL,NULL,194561.65,191379.11,193489.28,19853.69,192469.26,NULL,7,6,5,2,11,NULL,NULL,NULL),
	(245,'202','住院-呼吸内科',NULL,89967.34,88572.14,89957.54,89926.16,89984.26,89973.57,'2017-04-03 15:24:51',28,NULL,398,3129,NULL,NULL,191874.38,195782.98,192846.91,19524.78,193782.94,NULL,8,5,3,2,12,NULL,NULL,NULL),
	(246,'203','住院-神经外科',NULL,89936.11,88491.25,89968.32,89950.11,89936.75,89998.83,'2017-04-03 15:24:51',28,NULL,416,3695,NULL,NULL,191638.76,193375.62,192845.73,19673.98,193812.44,NULL,9,7,4,3,13,NULL,NULL,NULL),
	(247,'301','医技-放射科',NULL,89957.54,88371.81,89925.65,89944.29,89945.11,89984.26,'2017-04-03 15:24:51',28,3328,217,NULL,NULL,NULL,NULL,35652.33,63268.52,193521.65,56137.15,NULL,NULL,1,1,5,2,NULL,NULL,NULL),
	(248,'302','医技-超声科',NULL,89961.31,88217.52,89963.84,89973.57,89967.34,89936.75,'2017-04-03 15:24:51',28,2671,261,NULL,NULL,NULL,NULL,NULL,NULL,191936.84,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL,NULL,NULL),
	(249,'303','医技-病理科',NULL,89926.16,88116.25,89950.11,89998.83,89936.11,89945.11,'2017-04-03 15:24:51',28,2956,243,NULL,NULL,NULL,NULL,NULL,NULL,192638.29,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL,NULL,NULL),
	(250,'401','医辅-挂号收费处',NULL,89950.11,NULL,NULL,89984.21,NULL,89967.34,'2017-04-03 15:24:51',28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19164.35,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),
	(251,'402','医辅-供应室',NULL,89944.29,88092.93,NULL,89936.75,NULL,89936.11,'2017-04-03 15:24:51',28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19283.46,NULL,NULL,NULL,NULL,NULL,7,NULL,NULL),
	(252,'403','医辅-住院收费处',NULL,89973.57,NULL,NULL,89945.11,NULL,89957.54,'2017-04-03 15:24:51',28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19372.12,NULL,NULL,NULL,NULL,NULL,6,NULL,NULL),
	(253,'404','医辅-病案室',NULL,89998.83,NULL,NULL,89967.34,NULL,89968.32,'2017-04-03 15:24:51',28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19185.98,NULL,NULL,NULL,NULL,NULL,5,NULL,NULL),
	(254,'501','行政后勤-行政',NULL,89984.26,NULL,NULL,89936.11,NULL,89925.65,'2017-04-03 15:24:51',28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19451.86,NULL,NULL,NULL,NULL,NULL,8,NULL,NULL),
	(255,'502','行政后勤-后勤',NULL,89963.84,NULL,NULL,89957.54,NULL,89963.84,'2017-04-03 15:24:51',28,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,19512.79,NULL,NULL,NULL,NULL,NULL,9,NULL,NULL);

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
	(91,28,'101','门诊-消化内科','301','医技-放射科',223),
	(92,28,'102','门诊-呼吸内科','301','医技-放射科',286),
	(93,28,'103','门诊-神经外科','301','医技-放射科',247),
	(94,28,'201','住院-消化内科','301','医技-放射科',192),
	(95,28,'202','住院-呼吸内科','301','医技-放射科',148),
	(96,28,'203','住院-神经外科','301','医技-放射科',169),
	(97,28,'101','门诊-消化内科','302','医技-超声科',296),
	(98,28,'102','门诊-呼吸内科','302','医技-超声科',213),
	(99,28,'103','门诊-神经外科','302','医技-超声科',258),
	(100,28,'201','住院-消化内科','302','医技-超声科',137),
	(101,28,'202','住院-呼吸内科','302','医技-超声科',162),
	(102,28,'203','住院-神经外科','302','医技-超声科',185),
	(103,28,'101','门诊-消化内科','303','医技-病理科',86),
	(104,28,'102','门诊-呼吸内科','303','医技-病理科',99),
	(105,28,'103','门诊-神经外科','303','医技-病理科',75),
	(106,28,'201','住院-消化内科','303','医技-病理科',63),
	(107,28,'202','住院-呼吸内科','303','医技-病理科',56),
	(108,28,'203','住院-神经外科','303','医技-病理科',49);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目字典表';

LOCK TABLES `t_pro_dic` WRITE;
/*!40000 ALTER TABLE `t_pro_dic` DISABLE KEYS */;

INSERT INTO `t_pro_dic` (`id`, `pro_code`, `pro_name`, `cost_time`, `pc_ys`, `pc_hs`, `pc_js`, `pc_o`, `t_hospital_id`, `wsclf`, `ylfxjj`)
VALUES
	(17,'ABEA0001','清创(缝合)术(小)',60,2,0,1,0,2,30,5),
	(18,'EBBBP001','头部X线计算机体层(CT)增强扫描',120,2,1,1,0,2,62.5,3),
	(19,'HCQ50301','脊髓后根入髓区切开术',360,3,2,1,0,2,55,4),
	(20,'test','测试项目',60,1,1,1,1,2,33,2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目与科室关系表';



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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='理论成本算法计算结果表';

LOCK TABLES `t_pro_result` WRITE;
/*!40000 ALTER TABLE `t_pro_result` DISABLE KEYS */;

INSERT INTO `t_pro_result` (`id`, `pro_code`, `pro_name`, `dept_code`, `dept_name`, `t_job_id`, `cost_people_direct`, `cost_people_mid_yw`, `cost_people_mid_all`, `cost_house_direct`, `cost_house_mid_yw`, `cost_house_mid_all`, `cost_spe_direct`, `cost_spe_mid_yw`, `cost_spe_mid_all`, `cost_asset_direct`, `cost_asset_mid_yw`, `cost_asset_mid_all`, `cost_other_direct`, `cost_other_mid_yw`, `cost_other_mid_all`, `cost_wsclf`, `cost_ylfxjj`, `level`)
VALUES
	(986,'ABEA0001','清创(缝合)术(小)','101','门诊-消化内科',28,145.9547939759036,0.8605153203687603,1.8569970488241585,7.069276060764799,1.341983009938552,2.875980224681187,162.53629518072287,0,0,7.069276060764799,1.3422198683584035,2.875752915108474,7.068770822420115,1.3420650175553799,2.8755626017003255,30,5,1),
	(987,'EBBBP001','头部X线计算机体层(CT)增强扫描','101','门诊-消化内科',28,389.21278393574295,2.2947075209833607,4.951992130197756,18.85140282870613,3.5786213598361387,7.669280599149832,433.4301204819277,0,0,18.85140282870613,3.5792529822890757,7.668674440289265,18.85005552645364,3.578840046814346,7.668166937867534,62.5,3,1),
	(988,'HCQ50301','脊髓后根入髓区切开术','101','门诊-消化内科',28,1751.4575277108431,10.326183844425124,22.2839645858899,84.83131272917758,16.103796119262622,34.511762696174245,1950.4355421686746,0,0,84.83131272917758,16.10663842030084,34.50903498130169,84.82524986904139,16.104780210664558,34.506751220403906,55,4,1),
	(989,'test','测试项目','101','门诊-消化内科',28,194.60639196787147,1.1473537604916804,2.475996065098878,9.425701414353066,1.7893106799180694,3.834640299574916,216.71506024096385,0,0,9.425701414353066,1.7896264911445379,3.8343372201446324,9.42502776322682,1.789420023407173,3.834083468933767,33,2,1),
	(990,'ABEA0001','清创(缝合)术(小)','102','门诊-呼吸内科',28,157.0539512048193,1.1252684935207224,2.1217502222683695,7.387101588170864,1.7545666663809756,3.288563881573502,162.55140361445783,0,0,7.387101588170864,1.754853802000338,3.2883868492001644,7.387143483023002,1.754660173749232,3.2881577583439223,30,5,1),
	(991,'EBBBP001','头部X线计算机体层(CT)增强扫描','102','门诊-呼吸内科',28,418.8105365461848,3.0007159827219265,5.658000592715652,19.698937568455637,4.6788444436826016,8.769503684196005,433.4704096385542,0,0,19.698937568455637,4.6796101386675675,8.769031597867105,19.69904928806134,4.679093796664619,8.768420688917125,62.5,3,1),
	(992,'HCQ50301','脊髓后根入髓区切开术','102','门诊-呼吸内科',28,1884.6474144578317,13.50322192224867,25.461002667220434,88.64521905805037,21.054799996571706,39.462766578882025,1950.616843373494,0,0,88.64521905805037,21.058245624004055,39.46064219040197,88.64572179627602,21.055922084990783,39.457893100127066,55,4,1),
	(993,'test','测试项目','102','门诊-呼吸内科',28,209.4052682730924,1.5003579913609633,2.829000296357826,9.849468784227819,2.3394222218413008,4.3847518420980025,216.7352048192771,0,0,9.849468784227819,2.3398050693337837,4.384515798933553,9.84952464403067,2.3395468983323093,4.3842103444585625,33,2,1),
	(994,'ABEA0001','清创(缝合)术(小)','103','门诊-神经外科',28,148.24036703958694,1.4271273809067235,2.423609109654371,7.388013417305586,2.2266648705927183,3.7606620857852446,162.591578313253,0,0,7.390238773274918,2.2271358711367895,3.7606689183366155,7.389110898138007,2.226848385364348,3.7603459699590385,30,5,1),
	(995,'EBBBP001','头部X线计算机体层(CT)增强扫描','103','门诊-神经外科',28,395.3076454388985,3.805673015751263,6.4629576257449886,19.701369112814895,5.937772988247249,10.028432228760652,433.57754216867465,0,0,19.70730339539978,5.939028989698105,10.028450448897642,19.70429572836802,5.938262360971594,10.027589253224104,62.5,3,1),
	(996,'HCQ50301','脊髓后根入髓区切开术','103','门诊-神经外科',28,1778.884404475043,17.125528570880682,29.08330931585245,88.65616100766702,26.71997844711262,45.12794502942294,1951.098939759036,0,0,88.68286527929901,26.72563045364147,45.12802702003939,88.66933077765609,26.722180624372175,45.12415163950846,55,4,1),
	(997,'test','测试项目','103','门诊-神经外科',28,197.65382271944924,1.9028365078756315,3.2314788128724943,9.850684556407447,2.9688864941236246,5.014216114380326,216.78877108433733,0,0,9.85365169769989,2.9695144948490526,5.014225224448821,9.85214786418401,2.969131180485797,5.013794626612052,33,2,1),
	(998,'ABEA0001','清创(缝合)术(小)','201','住院-消化内科',28,107.73724379335523,2.604847717583752,3.6013294464243257,5.243593664982511,4.049993839104452,5.583991054440032,162.53513855421687,0,0,5.244571900505247,4.048840555937291,5.582373603280127,5.243545860862805,4.049059809484953,5.58255739422265,30,5,1),
	(999,'EBBBP001','头部X线计算机体层(CT)增强扫描','201','住院-消化内科',28,287.29931678228064,6.946260580223338,9.603545190464867,13.982916439953362,10.799983570945207,14.890642811840086,433.4270361445783,0,0,13.985525068013992,10.796908149166109,14.886329608747005,13.982788962300814,10.797492825293206,14.886819717927066,62.5,3,1),
	(1000,'HCQ50301','脊髓后根入髓区切开术','201','住院-消化内科',28,1292.8469255202629,31.258172611005023,43.215953357091905,62.92312397979013,48.59992606925343,67.00789265328038,1950.4216626506025,0,0,62.93486280606296,48.58608667124749,66.98848323936153,62.922550330353666,48.58871771381943,66.99068873067179,55,4,1),
	(1001,'test','测试项目','201','住院-消化内科',28,143.64965839114032,3.473130290111669,4.801772595232434,6.991458219976681,5.399991785472603,7.445321405920043,216.71351807228916,0,0,6.992762534006996,5.3984540745830545,7.443164804373502,6.991394481150407,5.398746412646603,7.443409858963533,33,2,1),
	(1002,'ABEA0001','清创(缝合)术(小)','202','住院-呼吸内科',28,112.39605760542167,2.9776631813983645,3.9741449104660926,5.419719277108434,4.6296362548625245,6.16363347054779,162.5738674698795,0,0,5.417238554216868,4.628320211211082,6.161853258903497,5.420094578313253,4.628570080865887,6.162067665953155,30,5,1),
	(1003,'EBBBP001','头部X线计算机体层(CT)增强扫描','202','住院-呼吸内科',28,299.7228202811244,7.940435150395638,10.597719761242914,14.452584738955823,12.345696679633399,16.436355921460773,433.530313253012,0,0,14.445969477911648,12.342187229896219,16.431608690409327,14.453585542168675,12.342853548975699,16.432180442541746,62.5,3,1),
	(1004,'HCQ50301','脊髓后根入髓区切开术','202','住院-呼吸内科',28,1348.75269126506,35.731958176780374,47.68973892559311,65.0366313253012,55.5556350583503,73.96360164657348,1950.8864096385541,0,0,65.00686265060241,55.53984253453298,73.94223910684197,65.04113493975903,55.54284097039064,73.94481199143786,55,4,1),
	(1005,'test','测试项目','202','住院-呼吸内科',28,149.8614101405622,3.970217575197819,5.298859880621457,7.226292369477911,6.172848339816699,8.218177960730387,216.765156626506,0,0,7.222984738955824,6.171093614948109,8.215804345204663,7.226792771084337,6.171426774487849,8.216090221270873,33,2,1),
	(1006,'ABEA0001','清创(缝合)术(小)','203','住院-神经外科',28,91.01141216404079,2.8621625161631425,3.858644245230871,4.5148649598393575,4.450123519064669,5.984120734749934,162.59334939759037,0,0,4.515567771084338,4.448838736488919,5.982371784181335,4.518013554216868,4.449085484218645,5.982583069305913,30,5,1),
	(1007,'EBBBP001','头部X线计算机体层(CT)增强扫描','203','住院-神经外科',28,242.69709910410876,7.632433376435047,10.289717987282323,12.039639892904953,11.866996050839116,15.957655292666491,433.582265060241,0,0,12.0415140562249,11.863569963970452,15.952991424483558,12.048036144578314,11.864227957916386,15.953554851482433,62.5,3,1),
	(1008,'HCQ50301','脊髓后根入髓区切开术','203','住院-神经外科',28,1092.1369459684895,34.34595019395771,46.30373094277045,54.17837951807229,53.401482228776025,71.80944881699921,1951.1201927710845,0,0,54.18681325301205,53.38606483786703,71.78846141017601,54.21616265060241,53.389025810623735,71.79099683167095,55,4,1),
	(1009,'test','测试项目','203','住院-神经外科',28,121.34854955205438,3.8162166882175237,5.1448589936411615,6.019819946452476,5.933498025419558,7.9788276463332455,216.7911325301205,0,0,6.02075702811245,5.931784981985226,7.976495712241779,6.024018072289157,5.932113978958193,7.976777425741217,33,2,1),
	(1010,'ABEA0001','清创(缝合)术(小)','301','医技-放射科',28,210.06023493975906,3.6389374520935873,4.635419181161315,18.063763052208834,5.676965544823038,7.210962760508303,162.51623493975904,0,0,18.061102409638554,5.678117137550601,7.211650185243017,18.069128514056224,5.677403469792572,7.21090105487984,30,5,1),
	(1011,'EBBBP001','头部X线计算机体层(CT)增强扫描','301','医技-放射科',28,560.1606265060242,9.7038332055829,12.361117816430175,48.170034805890225,15.138574786194768,19.22923402802214,433.3766265060241,0,0,48.16293975903614,15.141645700134937,19.231067160648045,48.18434270414993,15.139742586113524,19.229069479679573,62.5,3,1),
	(1012,'HCQ50301','脊髓后根入髓区切开术','301','医技-放射科',28,2520.7228192771086,43.667249425123046,55.625030173935784,216.765156626506,68.12358653787646,86.53155312609964,1950.1948192771083,0,0,216.73322891566264,68.13740565060722,86.53980222291621,216.82954216867466,68.12884163751086,86.53081265855808,55,4,1),
	(1013,'test','测试项目','301','医技-放射科',28,280.0803132530121,4.85191660279145,6.180558908215088,24.085017402945113,7.569287393097384,9.61461701401107,216.68831325301204,0,0,24.08146987951807,7.570822850067469,9.615533580324023,24.092171352074963,7.569871293056762,9.614534739839787,33,2,1),
	(1014,'ABEA0001','清创(缝合)术(小)','302','医技-超声科',28,49.55340103270224,1.4393643109943994,1.7715248870149851,23.22581153184165,6.732971693067482,8.26696890720414,162.58525301204818,0,0,23.228976764199658,6.73407480778177,8.267607853926048,23.219470740103272,6.733331285100716,8.266828868639884,30,5,1),
	(1015,'EBBBP001','头部X线计算机体层(CT)增强扫描','302','医技-超声科',28,132.14240275387263,3.8383048293183983,4.724066365373294,61.9354974182444,17.954591181513283,22.045250419211037,433.5606746987952,0,0,61.94393803786575,17.95753282075139,22.046954277136127,61.91858864027539,17.95555009360191,22.04487698303969,62.5,3,1),
	(1016,'HCQ50301','脊髓后根入髓区切开术','302','医技-超声科',28,594.6408123924268,17.272371731932793,21.25829864417982,278.70973838209983,80.79566031680977,99.20362688644967,1951.0230361445783,0,0,278.7477211703959,80.80889769338124,99.21129424711258,278.63364888123925,80.7999754212086,99.20194642367859,55,4,1),
	(1017,'test','测试项目','302','医技-超声科',28,66.07120137693632,1.9191524146591992,2.362033182686647,30.9677487091222,8.977295590756642,11.022625209605518,216.7803373493976,0,0,30.971969018932874,8.978766410375695,11.023477138568063,30.959294320137694,8.977775046800955,11.022438491519845,33,2,1),
	(1018,'ABEA0001','清创(缝合)术(小)','303','医技-病理科',28,58.02358132530121,1.7428206763899652,2.074981252745875,27.086192771084338,8.154346037385931,9.688343253071197,162.56043975903614,0,0,27.108081325301207,8.15582281110939,9.689355858801806,27.091900602409638,8.154867179675573,9.688364764762841,30,5,1),
	(1019,'EBBBP001','头部X线计算机体层(CT)增强扫描','303','医技-病理科',28,154.72955020080323,4.6475218037065735,5.533283340655666,72.22984738955823,21.744922766362485,25.835582008189856,433.4945060240964,0,0,72.28821686746988,21.74886082962504,25.83828229013815,72.24506827309237,21.746312479134865,25.835639372700914,62.5,3,1),
	(1020,'HCQ50301','脊髓后根入髓区切开术','303','医技-病理科',28,696.2829759036146,20.91384811667958,24.899775032950497,325.03431325301204,97.85215244863117,116.26011903685436,1950.7252771084336,0,0,325.29697590361445,97.86987373331269,116.27227030562167,325.10280722891565,97.85840615610688,116.26037717715411,55,4,1),
	(1021,'test','测试项目','303','医技-病理科',28,77.36477510040162,2.3237609018532868,2.766641670327833,36.114923694779115,10.872461383181243,12.917791004094928,216.7472530120482,0,0,36.14410843373494,10.87443041481252,12.919141145069075,36.122534136546186,10.873156239567432,12.917819686350457,33,2,1),
	(1022,'ABEA0001','清创(缝合)术(小)',NULL,NULL,28,145.6404093727283,2.4033806152695663,3.399862344104316,11.710926258145152,4.335250159468927,5.869247374729036,162.56039558232936,0,0,11.713572794128494,4.335358200174953,5.868891247442342,11.711908783727022,4.335098987311922,5.868596571974174,30,5,2),
	(1023,'EBBBP001','头部X线计算机体层(CT)增强扫描',NULL,NULL,28,388.3744249939421,6.409014974052177,9.066299584278175,31.229136688387072,11.56066709191714,15.651326332610761,433.49438821954493,0,0,31.236194117675986,11.560955200466543,15.650376659846245,31.231756756605392,11.560263966165127,15.649590858597797,62.5,3,2),
	(1024,'HCQ50301','脊髓后根入髓区切开术',NULL,NULL,28,1747.6849124727396,28.840567383234795,40.79834812925179,140.53111509774183,52.02300191362712,70.43096849674843,1950.7247469879521,0,0,140.56287352954192,52.02429840209944,70.4266949693081,140.54290540472425,52.02118784774307,70.42315886369009,55,4,2),
	(1025,'test','测试项目',NULL,NULL,28,194.18721249697106,3.2045074870260883,4.5331497921390875,15.614568344193536,5.78033354595857,7.825663166305381,216.74719410977247,0,0,15.618097058837993,5.780477600233271,7.825188329923122,15.615878378302696,5.780131983082564,7.824795429298899,33,2,2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='理论成本算法计算结果表-产能成本率';

LOCK TABLES `t_pro_result_cncbl` WRITE;
/*!40000 ALTER TABLE `t_pro_result_cncbl` DISABLE KEYS */;

INSERT INTO `t_pro_result_cncbl` (`id`, `t_job_id`, `dept_code`, `dept_name`, `ys_cncbl`, `hs_cncbl`, `js_cncbl`, `op_cncbl`, `house_cncbl`, `spe_cncbl`, `asset_cncbl`, `oc_cncbl`, `type`, `level`)
VALUES
	(508,28,'101','门诊-消化内科',0.3857454417670682,0.3248016231593039,0.10031290160642571,0,0.03927375589313777,0.9029794176706827,0.03927375589313777,0.039270949013445085,1,1),
	(509,28,'102','门诊-呼吸内科',0.41611661646586345,0.39061022088353414,0.06579511378848729,0,0.04103945326761591,0.9030633534136546,0.04103945326761591,0.041039686016794454,1,1),
	(510,28,'201','住院-消化内科',0.32319837126282913,0.17567475355969334,0.09966711847389557,0,0.029131075916569504,0.9029729919678715,0.029136510558362482,0.029130810338126697,1,1),
	(511,28,'103','门诊-神经外科',0.4461004016064257,0.2796347532989099,0.09782243975903614,0,0.04104451898503103,0.9032865461847389,0.041056882073749544,0.041050616100766706,1,1),
	(512,28,'202','住院-呼吸内科',0.3642722577811245,0.16213432061579652,0.09801596385542168,0,0.030109551539491297,0.9031881526104417,0.030095769745649266,0.03011163654618474,1,1),
	(513,28,'301','医技-放射科',0.49659061244979924,0.2818130020080321,0.3885976907630522,0,0.10035423917893797,0.9028679718875502,0.1003394578313253,0.10038404730031235,1,1),
	(514,28,'203','住院-神经外科',0.2900904166666667,0.14968523324065494,0.06584330655957162,0,0.025082583110218652,0.9032963855421687,0.02508648761713521,0.02510007530120482,1,1),
	(515,28,'302','医技-超声科',0,0,0.2752966724039013,0,0.12903228628800917,0.90325140562249,0.1290498709122203,0.1289970596672404,1,1),
	(516,28,'303','医技-病理科',0,0,0.32235322958500673,0,0.15047884872824632,0.9031135542168675,0.15060045180722892,0.15051055890227577,1,1),
	(517,28,'101','门诊-消化内科',0.38733898865663996,0.32639517004887564,0.10190644849599749,0,0.04672921705946306,0.9029794176706827,0.04673053293957335,0.04672686577764164,2,1),
	(518,28,'102','门诊-呼吸内科',0.41820044700942033,0.392694051427091,0.06787894433204418,0,0.05078704585862133,0.9030633534136546,0.05078864105650668,0.05078779809317908,2,1),
	(519,28,'201','住院-消化内科',0.3280221633324287,0.18049854562929288,0.10449091054349512,0,0.05163104168937202,0.9029729919678715,0.051630069202458544,0.05162558705748754,2,1),
	(520,28,'103','门诊-神经外科',0.44874323008958633,0.2822775817820705,0.10046526824219673,0,0.0534148793772128,0.9032865461847389,0.053429859135620594,0.053421996019457525,2,1),
	(521,28,'202','住院-呼吸内科',0.3697864488577881,0.16764851169246017,0.10353015493208531,0,0.05582975295539421,0.9031881526104417,0.05580865980793305,0.055825914773217446,2,1),
	(522,28,'301','医技-放射科',0.5033293855092318,0.28855177506746466,0.3953364638224847,0,0.13189293665017707,0.9028679718875502,0.13188455303993973,0.13192517768804884,2,1),
	(523,28,'203','住院-神经外科',0.29539071762252433,0.15498553419651262,0.07114360751542928,0,0.04980549154946681,0.9032963855421687,0.049802258375406985,0.04981721688019729,2,1),
	(524,28,'302','医技-超声科',0,0,0.28329314079831464,0,0.1664376845828285,0.90325140562249,0.16646139762211903,0.1664044556955777,2,1),
	(525,28,'303','医技-病理科',0,0,0.3320355666760621,0,0.19578077115816817,0.9031135542168675,0.19591057853561442,0.19581537656714007,2,1),
	(526,28,'101','门诊-消化内科',0.38918432519081664,0.3282405065830523,0.10375178503017415,0,0.05525142380803326,0.9029794176706827,0.05525016097707374,0.055246296800669115,3,1),
	(527,28,'102','门诊-呼吸内科',0.4200457835441382,0.3945393879618089,0.06972428086676205,0,0.05930925260969092,0.9030633534136546,0.05930826909650571,0.05930722911870513,3,1),
	(528,28,'201','住院-消化内科',0.3298674998673186,0.18234388216418282,0.10633624707838507,0,0.06015324844123635,0.9029729919678715,0.06014969724325207,0.06014501808380808,3,1),
	(529,28,'103','门诊-神经外科',0.4505885666243042,0.2841229183167884,0.1023106047769146,0,0.061937086128282394,0.9032865461847389,0.06194948717561963,0.06194142704498358,3,1),
	(530,28,'202','住院-呼吸内科',0.3716317853930987,0.16949384822777078,0.10537549146739592,0,0.06435195970920124,0.9031881526104417,0.06432828785066869,0.06434534580148005,3,1),
	(531,28,'301','医技-放射科',0.5051747220445424,0.29039711160277526,0.3971818003577953,0,0.1404151434039841,0.9028679718875502,0.14040418108267538,0.14044460871631145,3,1),
	(532,28,'203','住院-神经外科',0.29723605415783494,0.15683087073182322,0.07298894405073988,0,0.05832769830327384,0.9032963855421687,0.05832188641814263,0.05833664790845989,3,1),
	(533,28,'302','医技-超声科',0,0,0.28513847733176234,0,0.17495989132803216,0.90325140562249,0.1749810256562539,0.17492388671523976,3,1),
	(534,28,'303','医技-病理科',0,0,0.3338809032113727,0,0.2043029779119752,0.9031135542168675,0.20443020657835007,0.20433480759540268,3,1),
	(535,28,NULL,NULL,0.3888734454285396,0.25205055810941784,0.1681893818660887,0,0.06506070143413974,0.9031133087907186,0.06507540441182497,0.06506615990959456,1,2),
	(536,28,NULL,NULL,0.39297305443965996,0.25615016712053823,0.1733422783731233,0,0.08914542454230044,0.9031133087907186,0.08916072774613026,0.08915004317243858,2,2),
	(537,28,NULL,NULL,0.39481839097457916,0.2579955036554574,0.17518761490792245,0,0.09766763129374549,0.9031133087907186,0.09768035578650465,0.09766947419833998,3,2);

/*!40000 ALTER TABLE `t_pro_result_cncbl` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
