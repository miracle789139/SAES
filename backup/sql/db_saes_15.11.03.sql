-- --------------------------------------------------------
-- 主机:                           202.120.217.101
-- 服务器版本:                        5.5.36 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 db_saes 的数据库结构
CREATE DATABASE IF NOT EXISTS `db_saes` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_saes`;


-- 导出  表 db_saes.dm_edu_degree 结构
CREATE TABLE IF NOT EXISTS `dm_edu_degree` (
  `ID` int(10) NOT NULL,
  `KEY  EDU_LEVEL_ID` varchar(16) DEFAULT NULL,
  `VALUE EDU_LEVEL_NAME` varchar(50) DEFAULT NULL,
  `TYPE  LEVEL` varchar(50) DEFAULT NULL,
  `NOTE  CAPTION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.dm_edu_degree 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dm_edu_degree` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_edu_degree` ENABLE KEYS */;


-- 导出  表 db_saes.dm_edu_level 结构
CREATE TABLE IF NOT EXISTS `dm_edu_level` (
  `ID` int(10) NOT NULL,
  `EDU_LEVEL_ID` varchar(16) DEFAULT NULL,
  `EDU_LEVEL_NAME` varchar(50) DEFAULT NULL,
  `CAPTION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.dm_edu_level 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dm_edu_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_edu_level` ENABLE KEYS */;


-- 导出  表 db_saes.dm_nation 结构
CREATE TABLE IF NOT EXISTS `dm_nation` (
  `ID` int(10) NOT NULL,
  `NATION_ID` varchar(16) DEFAULT NULL,
  `NATION_NAME` varchar(50) DEFAULT NULL,
  `CAPTION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.dm_nation 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dm_nation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_nation` ENABLE KEYS */;


-- 导出  表 db_saes.dm_role 结构
CREATE TABLE IF NOT EXISTS `dm_role` (
  `ID` varchar(32) NOT NULL DEFAULT '',
  `GROUP_ID` varchar(128) DEFAULT NULL,
  `NOTE` varchar(255) DEFAULT NULL,
  `ROLE_LEVEL` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.dm_role 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dm_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_role` ENABLE KEYS */;


-- 导出  表 db_saes.dm_subject 结构
CREATE TABLE IF NOT EXISTS `dm_subject` (
  `ID` int(10) NOT NULL,
  `SUBJECT_CLASS_ID` varchar(16) NOT NULL,
  `SUBJECT_CLASS_NAME` varchar(50) DEFAULT NULL,
  `CAPTION` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.dm_subject 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dm_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_subject` ENABLE KEYS */;


-- 导出  表 db_saes.dm_title_define 结构
CREATE TABLE IF NOT EXISTS `dm_title_define` (
  `ID` int(10) NOT NULL,
  `TITLE_ID` varchar(32) DEFAULT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `LEVEL_ID` varchar(32) DEFAULT NULL,
  `TYPE_ID` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.dm_title_define 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dm_title_define` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_title_define` ENABLE KEYS */;


-- 导出  表 db_saes.s_notify 结构
CREATE TABLE IF NOT EXISTS `s_notify` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TITLE` varchar(200) DEFAULT NULL COMMENT '公告标题',
  `SENDER_ID` varchar(32) DEFAULT NULL COMMENT '发送人编号－　对应S_PERSON表',
  `SEND_DATE` datetime DEFAULT NULL COMMENT '发送时间',
  `CONTENT` text COMMENT '通知内容',
  `VIEW_TIMES` int(10) NOT NULL DEFAULT '0' COMMENT '查阅次数',
  `TITLE_TOP_FLAG` int(32) DEFAULT NULL COMMENT '是否置顶',
  `OPERATE_TIME` varchar(20) DEFAULT NULL COMMENT '操作时间',
  `NOTIFY_TYPE` varchar(32) DEFAULT NULL COMMENT '公告类型',
  `FILE_ID` varchar(20) DEFAULT NULL COMMENT '附件文件名编号',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储通告信息';

-- 正在导出表  db_saes.s_notify 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `s_notify` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_notify` ENABLE KEYS */;


-- 导出  表 db_saes.s_person 结构
CREATE TABLE IF NOT EXISTS `s_person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GROUP_ID` varchar(128) DEFAULT NULL,
  `PERSON_ID` varchar(32) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `ACCOUNT` varchar(32) NOT NULL,
  `PASSWORD` varchar(64) NOT NULL,
  `UNIT_ID` varchar(32) DEFAULT NULL,
  `SEXID` varchar(1) DEFAULT NULL,
  `ID_CARD` varchar(32) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `SUBJECT_CLASS_ID` varchar(32) DEFAULT NULL,
  `TITLE_ID` varchar(32) DEFAULT NULL,
  `EDU_LEVEL_ID` varchar(32) DEFAULT NULL,
  `EDU_DEGREE_ID` varchar(32) DEFAULT NULL,
  `RESEARCH_FIELD` longtext,
  `NATION_ID` varchar(32) DEFAULT NULL,
  `DUTY` varchar(128) DEFAULT NULL,
  `DUTY_DATE` datetime DEFAULT NULL,
  `TUTOR_TYPE_ID` varchar(9) DEFAULT NULL,
  `MOBILE` varchar(128) DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `ADDRESS` varchar(256) DEFAULT NULL,
  `POSTAL_CODE` varchar(32) DEFAULT NULL,
  `TEL_OFFICE` varchar(32) DEFAULT NULL,
  `FAX_OFFICE` varchar(32) DEFAULT NULL,
  `TEL_HOME` varchar(128) DEFAULT NULL,
  `FAX_HOME` varchar(128) DEFAULT NULL,
  `PERSONAL_WEB_SITE` varchar(128) DEFAULT NULL,
  `PHOTO_ID` varchar(32) DEFAULT NULL,
  `WORK_DATE` datetime DEFAULT NULL,
  `STANDBY1` varchar(200) DEFAULT NULL,
  `STANDBY2` varchar(200) DEFAULT NULL,
  `STANDBY3` varchar(200) DEFAULT NULL,
  `HONOR_TITLE_ID` varchar(128) DEFAULT NULL,
  `EXPERT_FLAG` varchar(9) DEFAULT NULL,
  `QQ` varchar(32) DEFAULT NULL,
  `GRADUATE_SCHOOL` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_person 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `s_person` DISABLE KEYS */;
INSERT INTO `s_person` (`ID`, `GROUP_ID`, `PERSON_ID`, `NAME`, `ACCOUNT`, `PASSWORD`, `UNIT_ID`, `SEXID`, `ID_CARD`, `BIRTHDAY`, `SUBJECT_CLASS_ID`, `TITLE_ID`, `EDU_LEVEL_ID`, `EDU_DEGREE_ID`, `RESEARCH_FIELD`, `NATION_ID`, `DUTY`, `DUTY_DATE`, `TUTOR_TYPE_ID`, `MOBILE`, `EMAIL`, `ADDRESS`, `POSTAL_CODE`, `TEL_OFFICE`, `FAX_OFFICE`, `TEL_HOME`, `FAX_HOME`, `PERSONAL_WEB_SITE`, `PHOTO_ID`, `WORK_DATE`, `STANDBY1`, `STANDBY2`, `STANDBY3`, `HONOR_TITLE_ID`, `EXPERT_FLAG`, `QQ`, `GRADUATE_SCHOOL`) VALUES
	(1, NULL, NULL, NULL, 'admin', '96e79218965eb72c92a549dd5a330112', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_person` ENABLE KEYS */;


-- 导出  表 db_saes.s_schedule 结构
CREATE TABLE IF NOT EXISTS `s_schedule` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `PEASON_ID` varchar(32) DEFAULT NULL COMMENT '人员编号－对应　S_PERSON表',
  `DATE` datetime DEFAULT NULL COMMENT '日程时间',
  `CONTENT` varchar(255) DEFAULT NULL COMMENT '日程内容',
  `TYPE` varchar(32) DEFAULT NULL COMMENT '日程类型',
  `PRIORITY` int(2) NOT NULL DEFAULT '0' COMMENT '优先级',
  `STATUS` int(2) NOT NULL DEFAULT '0' COMMENT '0,1,2对应',
  `OPERATE_TIME` varchar(20) DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='注：存储日程信息';

-- 正在导出表  db_saes.s_schedule 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `s_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_schedule` ENABLE KEYS */;


-- 导出  表 db_saes.s_unit 结构
CREATE TABLE IF NOT EXISTS `s_unit` (
  `ID` int(10) NOT NULL,
  `UNIT_ID` varchar(32) DEFAULT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `KJ_ID` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_unit 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `s_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_unit` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
