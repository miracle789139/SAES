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

-- 导出  表 db_saes.s_askreport 结构
CREATE TABLE IF NOT EXISTS `s_askreport` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TITLE` varchar(50) NOT NULL COMMENT '公告标题',
  `PERSON_ID` int(10) NOT NULL COMMENT '发送人工号，关联person表',
  `SENDER_NAME` varchar(32) DEFAULT '' COMMENT '发送人姓名',
  `SEND_DATE` datetime DEFAULT NULL COMMENT '发送时间',
  `SENDER_DP` varchar(32) DEFAULT NULL COMMENT '发送人部门',
  `ASK_DATE` datetime DEFAULT NULL COMMENT '（可选）申请日期，默认当前时间',
  `ASKREPORT_CONTENT` varchar(50) DEFAULT NULL COMMENT '申请汇报内容',
  `REC_ID` int(10) DEFAULT NULL COMMENT '收件人工号，关联person表',
  `REC_NAME` varchar(32) DEFAULT NULL COMMENT '收件人姓名',
  `ACCEPT_DATE` datetime DEFAULT NULL COMMENT '改成审核日期，接收日期，也就是查看日期',
  `IS_VIEW` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否查看，0未读，1已读',
  `STATE` int(11) DEFAULT '0' COMMENT '状态，默认0未审批，1同意，2不同意',
  `DELETEID` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记，0未删除，1已删除',
  `FILE_ID` int(10) DEFAULT NULL COMMENT '文件编号，关联file表',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_askreport 的数据：3 rows
/*!40000 ALTER TABLE `s_askreport` DISABLE KEYS */;
INSERT INTO `s_askreport` (`ID`, `TITLE`, `PERSON_ID`, `SENDER_NAME`, `SEND_DATE`, `SENDER_DP`, `ASK_DATE`, `ASKREPORT_CONTENT`, `REC_ID`, `REC_NAME`, `ACCEPT_DATE`, `IS_VIEW`, `STATE`, `DELETEID`, `FILE_ID`) VALUES
	(1, '买铅笔的申请', 1, '李明明', '2016-05-26 15:24:02', '教务处', '2016-05-26 15:24:14', '现在需要铅笔', 15, '王凯', '2016-05-26 16:03:36', 1, 0, 0, NULL),
	(2, '关于购置办公室文具的申请', 1, '李明明', '2016-06-03 20:13:12', '教务处', '2016-06-03 20:13:16', '办公室的文具已经不够用了', 15, '王凯', '2016-06-03 20:13:38', 1, 1, 0, NULL),
	(3, '关于购置电脑的申请', 1, '李明明', '2016-06-03 20:13:12', '教务处', '2016-06-03 20:13:16', '电脑不够用了', 15, '王凯', '2016-06-03 20:13:38', 1, 2, 0, NULL);
/*!40000 ALTER TABLE `s_askreport` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
