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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC COMMENT='科室表';

/*Data for the table `t_dept` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
