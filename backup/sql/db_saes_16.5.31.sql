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

-- 导出  表 db_saes.code_generation 结构
CREATE TABLE IF NOT EXISTS `code_generation` (
  `id` int(1) NOT NULL AUTO_INCREMENT,
  `declare_number` int(4) DEFAULT '0' COMMENT '申报管理的编号统计',
  `project_number` int(4) DEFAULT '0' COMMENT '项目管理的编号统计',
  KEY `id` (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='项目唯一编号生成累计表';

-- 正在导出表  db_saes.code_generation 的数据：1 rows
/*!40000 ALTER TABLE `code_generation` DISABLE KEYS */;
INSERT INTO `code_generation` (`id`, `declare_number`, `project_number`) VALUES
	(1, 12, 18);
/*!40000 ALTER TABLE `code_generation` ENABLE KEYS */;


-- 导出  表 db_saes.dm_edu_degree 结构
CREATE TABLE IF NOT EXISTS `dm_edu_degree` (
  `ID` int(10) NOT NULL COMMENT '主键',
  `KEY_EDU_LEVEL_ID` varchar(16) DEFAULT NULL COMMENT '学位编号',
  `VALUE_EDU_LEVEL_NAME` varchar(50) DEFAULT NULL COMMENT '学位名称',
  `TYPE_LEVEL` varchar(50) DEFAULT NULL COMMENT '等级',
  `NOTE_CAPTION` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学位表';

-- 正在导出表  db_saes.dm_edu_degree 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `dm_edu_degree` DISABLE KEYS */;
INSERT INTO `dm_edu_degree` (`ID`, `KEY_EDU_LEVEL_ID`, `VALUE_EDU_LEVEL_NAME`, `TYPE_LEVEL`, `NOTE_CAPTION`) VALUES
	(0, '0', '学士', NULL, NULL),
	(1, '1', '硕士', NULL, NULL),
	(2, '2', '博士', NULL, NULL);
/*!40000 ALTER TABLE `dm_edu_degree` ENABLE KEYS */;


-- 导出  表 db_saes.dm_edu_level 结构
CREATE TABLE IF NOT EXISTS `dm_edu_level` (
  `ID` int(10) NOT NULL COMMENT '主键',
  `EDU_LEVEL_ID` varchar(16) DEFAULT NULL COMMENT '学历编号',
  `EDU_LEVEL_NAME` varchar(50) DEFAULT NULL COMMENT '学历名称',
  `CAPTION` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学历表';

-- 正在导出表  db_saes.dm_edu_level 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `dm_edu_level` DISABLE KEYS */;
INSERT INTO `dm_edu_level` (`ID`, `EDU_LEVEL_ID`, `EDU_LEVEL_NAME`, `CAPTION`) VALUES
	(0, '0', '小学', NULL),
	(1, '1', '初中', NULL),
	(2, '2', '中专', NULL),
	(3, '3', '高中', NULL),
	(4, '4', '专科', NULL),
	(5, '5', '本科', NULL),
	(6, '6', '硕士研究生', NULL),
	(7, '7', '博士研究生', NULL);
/*!40000 ALTER TABLE `dm_edu_level` ENABLE KEYS */;


-- 导出  表 db_saes.dm_file_class 结构
CREATE TABLE IF NOT EXISTS `dm_file_class` (
  `ID` int(10) NOT NULL,
  `FILE_CLASS_ID` varchar(32) NOT NULL,
  `FILE_CLASS_NAME` varchar(128) DEFAULT NULL,
  `NOTE` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.dm_file_class 的数据：0 rows
/*!40000 ALTER TABLE `dm_file_class` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_file_class` ENABLE KEYS */;


-- 导出  表 db_saes.dm_nation 结构
CREATE TABLE IF NOT EXISTS `dm_nation` (
  `ID` int(10) NOT NULL COMMENT '主键',
  `NATION_ID` varchar(16) DEFAULT NULL COMMENT '民族编号',
  `NATION_NAME` varchar(50) DEFAULT NULL COMMENT '民族名称',
  `CAPTION` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='民族表';

-- 正在导出表  db_saes.dm_nation 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dm_nation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_nation` ENABLE KEYS */;


-- 导出  表 db_saes.dm_project_type 结构
CREATE TABLE IF NOT EXISTS `dm_project_type` (
  `ID` varchar(32) NOT NULL COMMENT '项目类别编号',
  `PROJECT_TYPE_NAME` varchar(255) DEFAULT NULL COMMENT '项目类别',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目分类';

-- 正在导出表  db_saes.dm_project_type 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dm_project_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_project_type` ENABLE KEYS */;


-- 导出  表 db_saes.dm_role 结构
CREATE TABLE IF NOT EXISTS `dm_role` (
  `ID` varchar(32) NOT NULL DEFAULT '' COMMENT '主键',
  `GROUP_ID` varchar(128) DEFAULT NULL COMMENT '用户组',
  `NOTE` varchar(255) DEFAULT NULL COMMENT '备注',
  `ROLE_LEVEL` varchar(64) DEFAULT NULL COMMENT '角色级别',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- 正在导出表  db_saes.dm_role 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `dm_role` DISABLE KEYS */;
INSERT INTO `dm_role` (`ID`, `GROUP_ID`, `NOTE`, `ROLE_LEVEL`) VALUES
	('1', '1', '管理员', '1');
/*!40000 ALTER TABLE `dm_role` ENABLE KEYS */;


-- 导出  表 db_saes.dm_subject 结构
CREATE TABLE IF NOT EXISTS `dm_subject` (
  `ID` int(10) NOT NULL COMMENT '主键',
  `SUBJECT_CLASS_ID` varchar(16) NOT NULL COMMENT '学科分类编号',
  `SUBJECT_CLASS_NAME` varchar(50) DEFAULT NULL COMMENT '学科分类名称',
  `CAPTION` varchar(50) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学科分类';

-- 正在导出表  db_saes.dm_subject 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `dm_subject` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_subject` ENABLE KEYS */;


-- 导出  表 db_saes.dm_title_define 结构
CREATE TABLE IF NOT EXISTS `dm_title_define` (
  `ID` int(10) NOT NULL COMMENT '主键',
  `TITLE_ID` varchar(32) DEFAULT NULL COMMENT '国际码',
  `NAME` varchar(128) DEFAULT NULL COMMENT '职称名称',
  `LEVEL_ID` varchar(32) DEFAULT NULL COMMENT '职称级别',
  `TYPE_ID` varchar(32) DEFAULT NULL COMMENT '职称类别',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职称表';

-- 正在导出表  db_saes.dm_title_define 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `dm_title_define` DISABLE KEYS */;
INSERT INTO `dm_title_define` (`ID`, `TITLE_ID`, `NAME`, `LEVEL_ID`, `TYPE_ID`) VALUES
	(1, '10001', '教授', NULL, NULL),
	(2, '1002', '副教授', NULL, NULL),
	(3, '1003', '讲师', NULL, NULL);
/*!40000 ALTER TABLE `dm_title_define` ENABLE KEYS */;


-- 导出  表 db_saes.s_achievement 结构
CREATE TABLE IF NOT EXISTS `s_achievement` (
  `ID` int(10) NOT NULL COMMENT '系统编号',
  `Apply_ID` varchar(32) DEFAULT NULL COMMENT '申报编号',
  `AUTHOR_NAME` varchar(32) DEFAULT NULL COMMENT '著作者',
  `ACHIEVEMENT_NAME` varchar(128) DEFAULT NULL COMMENT '成果名称',
  `ACHIEVEMENT_MODE` varchar(64) DEFAULT NULL COMMENT '成果形式',
  `PUBLISH_UNIT` varchar(128) DEFAULT NULL COMMENT '出版单位',
  `PUBLISH_TIME` date DEFAULT NULL COMMENT '出版时间',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='近期主要研究成果';

-- 正在导出表  db_saes.s_achievement 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `s_achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_achievement` ENABLE KEYS */;


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
  `ACCEPT_DATE` datetime DEFAULT NULL COMMENT '接收日期，也就是查看日期',
  `IS_VIEW` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否查看，0未读，1已读',
  `STATE` int(11) DEFAULT '0' COMMENT '状态，默认0未审批，1同意，2不同意',
  `DELETEID` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记，0未删除，1已删除',
  `FILE_ID` int(10) DEFAULT NULL COMMENT '文件编号，关联file表',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_askreport 的数据：1 rows
/*!40000 ALTER TABLE `s_askreport` DISABLE KEYS */;
INSERT INTO `s_askreport` (`ID`, `TITLE`, `PERSON_ID`, `SENDER_NAME`, `SEND_DATE`, `SENDER_DP`, `ASK_DATE`, `ASKREPORT_CONTENT`, `REC_ID`, `REC_NAME`, `ACCEPT_DATE`, `IS_VIEW`, `STATE`, `DELETEID`, `FILE_ID`) VALUES
	(1, '买铅笔', 1, '李明明', '2016-05-26 15:24:02', '教务处', '2016-05-26 15:24:14', '现在需要铅笔', 15, '王凯', '2016-05-26 16:03:36', 1, 0, 1, NULL);
/*!40000 ALTER TABLE `s_askreport` ENABLE KEYS */;


-- 导出  表 db_saes.s_book 结构
CREATE TABLE IF NOT EXISTS `s_book` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '系统编号',
  `NAME` varchar(256) DEFAULT NULL COMMENT '著作名称',
  `FIRST_AUTHOR_NAME` varchar(40) DEFAULT NULL COMMENT '第一作者名称',
  `OTHER_AUTHOR_NAME` varchar(300) DEFAULT NULL COMMENT '其他作者编号',
  `PUBLISH_UNIT` varchar(256) DEFAULT NULL COMMENT '出版单位',
  `PUBLISH_DATE` varchar(32) DEFAULT NULL COMMENT '出版日期',
  `WORD_NUMBER` varchar(32) DEFAULT NULL COMMENT '字数',
  `REMARK` varchar(400) DEFAULT NULL,
  `EDITOR` varchar(40) DEFAULT NULL,
  `PROJECT_SOURCE_ID` varchar(32) DEFAULT NULL COMMENT '项目来源代码',
  `ISREAD` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_book 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `s_book` DISABLE KEYS */;
INSERT INTO `s_book` (`ID`, `NAME`, `FIRST_AUTHOR_NAME`, `OTHER_AUTHOR_NAME`, `PUBLISH_UNIT`, `PUBLISH_DATE`, `WORD_NUMBER`, `REMARK`, `EDITOR`, `PROJECT_SOURCE_ID`, `ISREAD`) VALUES
	(1, '软件测试', '李明明', '', '机械工业出版社', '2015-07-02', '1561564', '', '李明明', '[object Object]', '未阅读'),
	(2, 'Automated Software Testing', '李明明', '', '清华大学出版社', '2015-07-12 00:00:00', '1565486', '', '李明明', '0', '未阅读'),
	(3, '软件测试自动化', '李明明', '111]', '机械工业出版社', '2015-08-15 00:00:00', '3786574', '[object Object]', '李明明', '[object Object]', '未阅读'),
	(4, '有效软件测试', '李明明', '[object Object]', '机械工业出版社', '2015-12-20 00:00:00', '6578867', '[object Object]', '李明明', '[object Object]', '未阅读');
/*!40000 ALTER TABLE `s_book` ENABLE KEYS */;


-- 导出  表 db_saes.s_division 结构
CREATE TABLE IF NOT EXISTS `s_division` (
  `ID` int(10) NOT NULL COMMENT '主键',
  `DIVISION_ID` varchar(32) DEFAULT NULL COMMENT '部门编号',
  `NAME` varchar(128) DEFAULT NULL COMMENT '部门名称',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_division 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `s_division` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_division` ENABLE KEYS */;


-- 导出  表 db_saes.s_file 结构
CREATE TABLE IF NOT EXISTS `s_file` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `NAME` varchar(128) NOT NULL COMMENT '文件名称',
  `PUBLISH_DATE` datetime DEFAULT NULL COMMENT '上传日期（修改时间）',
  `FILE_ID` int(10) DEFAULT NULL COMMENT '附件编号',
  `NOTE` varchar(500) DEFAULT NULL COMMENT '备注',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '记录创建时间',
  `CREATOR_ID` int(10) DEFAULT NULL COMMENT '创建者编号',
  `CREATOR_NAME` varchar(50) DEFAULT NULL COMMENT '创建者姓名',
  `UNIT_ID` int(32) DEFAULT NULL COMMENT '所属单位编号',
  `FILE_CLASS_ID` int(32) DEFAULT NULL COMMENT '文件类别编号--对应DM_FILE_CLASS',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='文件表';

-- 正在导出表  db_saes.s_file 的数据：2 rows
/*!40000 ALTER TABLE `s_file` DISABLE KEYS */;
INSERT INTO `s_file` (`ID`, `NAME`, `PUBLISH_DATE`, `FILE_ID`, `NOTE`, `CREATE_TIME`, `CREATOR_ID`, `CREATOR_NAME`, `UNIT_ID`, `FILE_CLASS_ID`) VALUES
	(3, '2', '2016-05-26 18:50:20', NULL, NULL, '2016-05-26 18:50:24', NULL, NULL, NULL, NULL),
	(2, '文件', '2016-05-26 17:13:42', 1000, '这是图片', '2016-05-26 17:14:56', 1, '李明明', 1, 1);
/*!40000 ALTER TABLE `s_file` ENABLE KEYS */;


-- 导出  表 db_saes.s_magazine 结构
CREATE TABLE IF NOT EXISTS `s_magazine` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(128) DEFAULT NULL,
  `LEVEL` varchar(32) DEFAULT NULL,
  `ISSN` varchar(32) DEFAULT NULL,
  `CN` varchar(32) DEFAULT NULL,
  `PAPER_TYPE_ID` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_magazine 的数据：~18 rows (大约)
/*!40000 ALTER TABLE `s_magazine` DISABLE KEYS */;
INSERT INTO `s_magazine` (`ID`, `NAME`, `LEVEL`, `ISSN`, `CN`, `PAPER_TYPE_ID`) VALUES
	(1, '无线电通信技术', 'A', '1003-3114', '3216', '学术期刊'),
	(2, '现代企业教育', 'B', '1332-9898', '3215', '行业期刊'),
	(10, '科学通报', 'A', '1003-4174', '4342', '学术期刊'),
	(11, '清华大学学报', 'B', '1563-3175', '4342', '学术期刊'),
	(12, '上海交通大学学报', 'A', '1003-3177', '4342', '学术期刊'),
	(13, '华中科技大学学报', 'B', '1343-2774', '4342', '学术期刊'),
	(14, '西安交通大学学报', 'A', '1053-3574', '4342', '学术期刊'),
	(15, '华南理工大学学报', 'A', '1003-3174', '4342', '行业期刊'),
	(16, '东北大学学报', 'B', '1003-3178', '4342', '学术期刊'),
	(17, '厦门大学学报学报', 'B', '1003-3188', '4342', '行业期刊'),
	(18, '东南大学学报', 'A', '1003-3199', '4342', '行业期刊'),
	(19, '北京大学学报', 'B', '1073-3133', '4342', '行业期刊'),
	(20, '中南大学学报', 'B', '1003-3125', '4342', '学术期刊'),
	(21, '大连理工大学学报', 'B', '1003-3177', '4342', '行业期刊'),
	(22, '成都理工大学学报', 'B', '1003-3102', '4342', '行业期刊'),
	(23, '北京科技大学学报', 'A', '1003-3104', '4342', '行业期刊'),
	(24, '东北师大学报', 'A', '1003-3110', '4342', '行业期刊'),
	(25, '兰州大学学报', 'A', '1003-3177', '4342', '行业期刊');
/*!40000 ALTER TABLE `s_magazine` ENABLE KEYS */;


-- 导出  表 db_saes.s_notify 结构
CREATE TABLE IF NOT EXISTS `s_notify` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TITLE` varchar(200) DEFAULT NULL COMMENT '公告标题',
  `SENDER_ID` int(10) DEFAULT NULL COMMENT '发送人编号－　对应S_PERSON表',
  `SENDER_NAME` varchar(50) DEFAULT NULL COMMENT '发送人姓名',
  `SEND_DATE` datetime DEFAULT NULL COMMENT '发送时间',
  `CONTENT` text COMMENT '通知内容',
  `VIEW_TIMES` int(10) NOT NULL DEFAULT '0' COMMENT '查阅次数',
  `TITLE_TOP_FLAG` int(2) NOT NULL DEFAULT '0' COMMENT '是否置顶，默认0未置顶，1置顶',
  `NOTIFY_TYPE` varchar(50) DEFAULT NULL COMMENT '公告类型，默认0，现在也不知道有什么类型',
  `FILE_ID` int(10) DEFAULT NULL COMMENT '附件文件名编号',
  `APPROVAL_ID` int(10) DEFAULT NULL COMMENT '审批人ID',
  `APPROVAL_NAME` varchar(50) DEFAULT NULL COMMENT '审批人姓名',
  `APPROVAL_TIME` datetime DEFAULT NULL COMMENT '审批时间',
  `STATE` int(10) NOT NULL DEFAULT '0' COMMENT '审批状态，0未读（待审批），1同意，2不同意',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='存储通告信息';

-- 正在导出表  db_saes.s_notify 的数据：1 rows
/*!40000 ALTER TABLE `s_notify` DISABLE KEYS */;
INSERT INTO `s_notify` (`ID`, `TITLE`, `SENDER_ID`, `SENDER_NAME`, `SEND_DATE`, `CONTENT`, `VIEW_TIMES`, `TITLE_TOP_FLAG`, `NOTIFY_TYPE`, `FILE_ID`, `APPROVAL_ID`, `APPROVAL_NAME`, `APPROVAL_TIME`, `STATE`) VALUES
	(1, '刘延东副总理视察上海理工大学', 1, '李明明', '2015-12-11 09:00:05', '12月6日，中共中央政治局委员、国务院副总理刘延东来到上海理工大学视察上海太赫兹波谱与影像技术协同创新中心建设和发展情况。中共中央政治局委员、上海市委书记韩正，教育部部长袁贵仁，国务院副秘书长江小涓，上海市副市长翁铁慧，上海市教委主任苏明等陪同视察。', 1, 1, NULL, NULL, 2, '李科长', NULL, 0);
/*!40000 ALTER TABLE `s_notify` ENABLE KEYS */;


-- 导出  表 db_saes.s_notify_view_info 结构
CREATE TABLE IF NOT EXISTS `s_notify_view_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `REC_ID` int(11) DEFAULT NULL COMMENT '查看人编号－对应业务表　S_PERSON',
  `NOTIFY_ID` int(11) DEFAULT NULL COMMENT '通知编号－对应业务表 S_NOTIRY',
  `VIEW_DATE` datetime DEFAULT NULL COMMENT '查看时间',
  `IS_VIEW` int(11) DEFAULT '0' COMMENT '是否查看，0还没审核发出，1未查看，2已查看',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='个人接收公告情况表息';

-- 正在导出表  db_saes.s_notify_view_info 的数据：1 rows
/*!40000 ALTER TABLE `s_notify_view_info` DISABLE KEYS */;
INSERT INTO `s_notify_view_info` (`ID`, `REC_ID`, `NOTIFY_ID`, `VIEW_DATE`, `IS_VIEW`) VALUES
	(1, 3, 1, '2016-05-26 23:13:12', 0);
/*!40000 ALTER TABLE `s_notify_view_info` ENABLE KEYS */;


-- 导出  表 db_saes.s_paper 结构
CREATE TABLE IF NOT EXISTS `s_paper` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UNIT_ID` varchar(32) DEFAULT NULL COMMENT '来源项目',
  `NAME` varchar(1024) DEFAULT NULL COMMENT '论文题目',
  `PUBLISH_DATE` varchar(23) DEFAULT NULL COMMENT '发表日期DM_YEAR',
  `SUBJECT_CLASS_ID` varchar(32) DEFAULT NULL COMMENT '学科门类编号－对应代码表DM_SUBJECT',
  `SUBJECT_ID` varchar(32) DEFAULT NULL,
  `PAPER_MODE_ID` varchar(32) DEFAULT NULL,
  `PUBLISH_UNIT` varchar(128) DEFAULT NULL COMMENT '发表期刊',
  `PAPER_TYPE_ID` int(10) DEFAULT NULL COMMENT '类型编号--对应S_PAPER_PUBLICATION_LEVEL',
  `PUBLISH_YEAR` varchar(32) DEFAULT NULL COMMENT '发表日期DM_YEAR',
  `JUAN_NUMBER` varchar(32) DEFAULT NULL,
  `QI_NUMBER` varchar(32) DEFAULT NULL,
  `PAGE_SCOPE` varchar(128) DEFAULT NULL,
  `WORD_NUMBER` varchar(18) DEFAULT NULL COMMENT '论文字数',
  `AUTHOR_NUMBER` int(10) DEFAULT NULL COMMENT '作者数',
  `PUBLISH_RANGE_ID` varchar(32) DEFAULT NULL,
  `PROJECT_SOURCE_ID` varchar(32) DEFAULT NULL COMMENT '项目来源ID',
  `ISSN` varchar(100) DEFAULT NULL COMMENT 'ISSN号',
  `KEYWORDS` varchar(100) DEFAULT NULL,
  `CHECK_STATUS_ID` varchar(32) DEFAULT NULL,
  `CREATOR_ID` varbinary(50) DEFAULT NULL,
  `CREATOR_NAME` varchar(40) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `PAPER_PUBLISH_UNIT` varchar(128) DEFAULT NULL,
  `PAGE_SPACE` varchar(128) DEFAULT NULL,
  `IS_TRANSLATED` varchar(128) DEFAULT NULL,
  `ENGLISH_NAME` varchar(1024) DEFAULT NULL,
  `CN` varchar(100) DEFAULT NULL COMMENT 'CN号',
  `STANDBY10` varchar(200) DEFAULT NULL,
  `FIRST_AUTHOR_NAME` varchar(40) DEFAULT NULL,
  `OTHER_AUTHOR_NAME` varchar(300) DEFAULT NULL,
  `FIRST_AUTHOR_CODE` varchar(50) DEFAULT NULL,
  `OTHER_AUTHOR_CODE` varchar(200) DEFAULT NULL,
  `OPERATE_TIME` varchar(20) DEFAULT NULL,
  `PAPER_CLAIM_ID` varchar(32) DEFAULT NULL,
  `TXZZ_ID` varchar(32) DEFAULT NULL,
  `FILE_IDS` varchar(128) DEFAULT NULL,
  `PAPER_SOURCE` varchar(500) DEFAULT NULL,
  `PAPER_CONTRIBUTOR` varchar(128) DEFAULT NULL,
  `TXZZ_NAME` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_paper 的数据：~19 rows (大约)
/*!40000 ALTER TABLE `s_paper` DISABLE KEYS */;
INSERT INTO `s_paper` (`id`, `UNIT_ID`, `NAME`, `PUBLISH_DATE`, `SUBJECT_CLASS_ID`, `SUBJECT_ID`, `PAPER_MODE_ID`, `PUBLISH_UNIT`, `PAPER_TYPE_ID`, `PUBLISH_YEAR`, `JUAN_NUMBER`, `QI_NUMBER`, `PAGE_SCOPE`, `WORD_NUMBER`, `AUTHOR_NUMBER`, `PUBLISH_RANGE_ID`, `PROJECT_SOURCE_ID`, `ISSN`, `KEYWORDS`, `CHECK_STATUS_ID`, `CREATOR_ID`, `CREATOR_NAME`, `CREATE_TIME`, `PAPER_PUBLISH_UNIT`, `PAGE_SPACE`, `IS_TRANSLATED`, `ENGLISH_NAME`, `CN`, `STANDBY10`, `FIRST_AUTHOR_NAME`, `OTHER_AUTHOR_NAME`, `FIRST_AUTHOR_CODE`, `OTHER_AUTHOR_CODE`, `OPERATE_TIME`, `PAPER_CLAIM_ID`, `TXZZ_ID`, `FILE_IDS`, `PAPER_SOURCE`, `PAPER_CONTRIBUTOR`, `TXZZ_NAME`) VALUES
	(44, NULL, '自动化软件错误定位技术', '1992-07-16', NULL, NULL, '', '科学通报', NULL, NULL, NULL, NULL, NULL, '4655', NULL, NULL, '312', NULL, NULL, '待审核', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李明明', '123', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(57, NULL, '基于谓词执行序列的软件缺陷定位', '1993-07-07 00:00:00', NULL, NULL, '综合研究', '无线电通信技术', NULL, NULL, NULL, NULL, NULL, '78686', NULL, NULL, '', NULL, NULL, '已通过', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李明明', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(58, NULL, '自适应缺陷定位算法', '1994-07-07 00:00:00', NULL, NULL, '基础研究', '无线电通信技术', NULL, NULL, NULL, NULL, NULL, '45455', NULL, NULL, 'qwe', NULL, NULL, '已通过', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李明明', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(59, NULL, '考虑类特性的面向对象', '2000-07-07 00:00:00', NULL, NULL, '应用研究', '点击选择期刊', NULL, NULL, NULL, NULL, NULL, '15515', NULL, NULL, '', NULL, NULL, '已通过', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李明明', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(60, NULL, '信息量的缺陷定位方法', '2012-07-07 00:00:00', NULL, NULL, '基础研究', '无线电通信技术', NULL, NULL, NULL, NULL, NULL, '1157', NULL, NULL, '网上', NULL, NULL, '待审核', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '李明明', '一22', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(82, NULL, '基于程序变异的软件错误定位', '2015-07-07 00:00:00', NULL, NULL, '应用研究', '无线电通信技术', NULL, NULL, NULL, NULL, NULL, '15515', NULL, NULL, '333', NULL, NULL, '待审核', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '333', '7', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
	(87, NULL, '3211232312', 'uyt', NULL, NULL, '---请选择---', '点击选择期刊', NULL, NULL, NULL, NULL, NULL, 'yut', NULL, NULL, '23123132', NULL, NULL, 'uy', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '13213', 'ut', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
	(88, NULL, '21', '57', NULL, NULL, '---请选择---', '1212121', NULL, NULL, NULL, NULL, NULL, '6567', NULL, NULL, '2121', NULL, NULL, '567', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7', '576', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
	(89, NULL, '121', '121', NULL, NULL, '---请选择---', '121', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '121', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '121', '121', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
	(90, NULL, '121', '121121121', NULL, NULL, '---请选择---', '点击选择期刊', NULL, NULL, NULL, NULL, NULL, '121', NULL, NULL, '121', NULL, NULL, '121', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '121', '121', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
	(91, NULL, '121', '121', NULL, NULL, '---请选择---', '点击选择期刊', NULL, NULL, NULL, NULL, NULL, '121121', NULL, NULL, '121', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '121', '121', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
	(92, NULL, '00000', '', NULL, NULL, '应用研究', '点击选择期刊', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '111', NULL, NULL, '---请选择---', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '/file/paper/2016010310072515688.txt', NULL, NULL, NULL),
	(93, NULL, '0000000000000', '', NULL, NULL, '---请选择---', '点击选择期刊', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, '111', NULL, NULL, '---请选择---', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '/file/paper/2016010310175061679.pdf', NULL, NULL, NULL),
	(94, NULL, '', '', NULL, NULL, '---请选择---', '点击选择期刊', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'D2015122310', NULL, NULL, '---请选择---', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
	(95, NULL, '', '', NULL, NULL, '---请选择---', '点击选择期刊', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'D2015122310', NULL, NULL, '---请选择---', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
	(96, NULL, '', '', NULL, NULL, '基础研究', '点击选择期刊', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'D2015122310', NULL, NULL, '---请选择---', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
	(97, NULL, '123', '2016-01-05', NULL, NULL, '基础研究', '无线电通信技术', NULL, NULL, NULL, NULL, NULL, '12333', NULL, NULL, 'D2015122310', NULL, NULL, '其他', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1', '2', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL),
	(98, NULL, '', '', NULL, NULL, '---请选择---', '点击选择期刊', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'D2015122310', NULL, NULL, '---请选择---', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '/file/paper/2016010521165561211.pdf', NULL, NULL, NULL),
	(99, NULL, '', '', NULL, NULL, '---请选择---', '点击选择期刊', NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 'D2015122310', NULL, NULL, '---请选择---', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '', NULL, NULL, NULL, NULL, NULL, '/file/paper/2016010521184744085.rar', NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_paper` ENABLE KEYS */;


-- 导出  表 db_saes.s_paper_publication_level 结构
CREATE TABLE IF NOT EXISTS `s_paper_publication_level` (
  `ID` int(32) NOT NULL,
  `PAPER_ID` int(32) DEFAULT NULL,
  `PAPER_TYPE_ID` int(32) DEFAULT NULL,
  `PAPER_TYPE_NAME` varchar(50) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_paper_publication_level 的数据：0 rows
/*!40000 ALTER TABLE `s_paper_publication_level` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_paper_publication_level` ENABLE KEYS */;


-- 导出  表 db_saes.s_person 结构
CREATE TABLE IF NOT EXISTS `s_person` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `GROUP_ID` varchar(128) DEFAULT NULL COMMENT '用户组--对应DM_ROLE；0是用户，1是管理员',
  `PERSON_ID` varchar(32) DEFAULT NULL COMMENT '工号',
  `NAME` varchar(40) DEFAULT NULL COMMENT '姓名',
  `ACCOUNT` varchar(32) DEFAULT NULL COMMENT '登陆系统账号',
  `PASSWORD` varchar(64) DEFAULT NULL COMMENT '登陆密码',
  `UNIT_ID` varchar(32) DEFAULT NULL COMMENT '部门编号--对应S_UNIT',
  `SEXID` varchar(32) DEFAULT NULL COMMENT '性别',
  `ID_CARD` varchar(32) DEFAULT NULL COMMENT '身份证号',
  `BIRTHDAY` datetime DEFAULT NULL COMMENT '出生日期',
  `SUBJECT_CLASS_ID` varchar(32) DEFAULT NULL COMMENT '学科门类编号－对应代码表DM_SUBJECT',
  `SCHOOL` varchar(255) DEFAULT NULL COMMENT '工作单位',
  `TITLE_ID` varchar(32) DEFAULT NULL COMMENT '职称',
  `EDU_LEVEL_ID` varchar(32) DEFAULT NULL COMMENT '学历编号－对应代码表 DM_EDU_LEVEL',
  `EDU_DEGREE_ID` varchar(32) DEFAULT NULL COMMENT '学位编号－对应代码表 DM_EDU_DEGREE',
  `RESEARCH_FIELD` longtext COMMENT '研究方向',
  `NATION_ID` varchar(32) DEFAULT NULL COMMENT '民族编号－对应代码表 DM_NATION',
  `DUTY` varchar(128) DEFAULT NULL COMMENT '职务',
  `DUTY_DATE` date DEFAULT NULL COMMENT '入职日期',
  `TUTOR_TYPE_ID` varchar(9) DEFAULT NULL COMMENT '是否博导',
  `MOBILE` varchar(128) DEFAULT NULL COMMENT '手机号',
  `EMAIL` varchar(128) DEFAULT NULL COMMENT '个人Email地址',
  `ADDRESS` varchar(256) DEFAULT NULL COMMENT '地址',
  `POSTAL_CODE` varchar(32) DEFAULT NULL COMMENT '邮编',
  `TEL_OFFICE` varchar(32) DEFAULT NULL COMMENT '办公电话',
  `FAX_OFFICE` varchar(32) DEFAULT NULL COMMENT '传真号',
  `TEL_HOME` varchar(128) DEFAULT NULL COMMENT '家庭电话',
  `FAX_HOME` varchar(128) DEFAULT NULL COMMENT '家庭传真号',
  `PERSONAL_WEB_SITE` varchar(128) DEFAULT NULL COMMENT '个人网站',
  `PHOTO_ID` varchar(128) DEFAULT NULL COMMENT '个人照片（文件路径）',
  `WORK_DATE` datetime DEFAULT NULL COMMENT '到任时间',
  `STANDBY1` varchar(200) DEFAULT NULL COMMENT '备注字段',
  `STANDBY2` varchar(200) DEFAULT NULL COMMENT '备注字段',
  `STANDBY3` varchar(200) DEFAULT NULL COMMENT '备注字段',
  `HONOR_TITLE_ID` varchar(128) DEFAULT NULL COMMENT '荣誉称号',
  `EXPERT_FLAG` varchar(9) DEFAULT NULL COMMENT '是否为专家',
  `QQ` varchar(32) DEFAULT NULL COMMENT 'QQ号码',
  `GRADUATE_SCHOOL` longtext COMMENT '毕业学校信息',
  `STATUS` int(11) DEFAULT '0',
  `SELF_EVA` varchar(256) DEFAULT NULL COMMENT '自我评价',
  `WORK_EXP` varchar(256) DEFAULT NULL COMMENT '工作经历',
  `EDU-EXP` varchar(256) DEFAULT NULL COMMENT '教育经历',
  `PRO_SKILL` varchar(256) DEFAULT NULL COMMENT '专业技能',
  `EELSE` varchar(256) DEFAULT NULL COMMENT '其它',
  `DAOSHINAME` varchar(32) DEFAULT NULL COMMENT '导师名字',
  `DAOSHIZHICHENG` varchar(32) DEFAULT NULL COMMENT '导师职称',
  `DAOSHIDANWEI` varchar(128) DEFAULT NULL COMMENT '导师工作单位',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8 COMMENT='个人信息表';

-- 正在导出表  db_saes.s_person 的数据：~23 rows (大约)
/*!40000 ALTER TABLE `s_person` DISABLE KEYS */;
INSERT INTO `s_person` (`ID`, `GROUP_ID`, `PERSON_ID`, `NAME`, `ACCOUNT`, `PASSWORD`, `UNIT_ID`, `SEXID`, `ID_CARD`, `BIRTHDAY`, `SUBJECT_CLASS_ID`, `SCHOOL`, `TITLE_ID`, `EDU_LEVEL_ID`, `EDU_DEGREE_ID`, `RESEARCH_FIELD`, `NATION_ID`, `DUTY`, `DUTY_DATE`, `TUTOR_TYPE_ID`, `MOBILE`, `EMAIL`, `ADDRESS`, `POSTAL_CODE`, `TEL_OFFICE`, `FAX_OFFICE`, `TEL_HOME`, `FAX_HOME`, `PERSONAL_WEB_SITE`, `PHOTO_ID`, `WORK_DATE`, `STANDBY1`, `STANDBY2`, `STANDBY3`, `HONOR_TITLE_ID`, `EXPERT_FLAG`, `QQ`, `GRADUATE_SCHOOL`, `STATUS`, `SELF_EVA`, `WORK_EXP`, `EDU-EXP`, `PRO_SKILL`, `EELSE`, `DAOSHINAME`, `DAOSHIZHICHENG`, `DAOSHIDANWEI`) VALUES
	(1, '1', '11011', '李明明', 'admin', '96e79218965eb72c92a549dd5a330112', '1', '2', '', '1992-07-07 17:55:09', '上理科室', '', '教授', NULL, '本科', '上理研究所', '汉', '授课', NULL, NULL, '18262800067', '243696826@qq.com', '上海市杨浦区', '221400', '', NULL, '188111', '', NULL, '/file/photo/2015121818443812832_s.jpg', NULL, NULL, NULL, NULL, NULL, '好多年', NULL, '上海理工大学', 0, '本人性格开朗、为人诚恳、乐观向上、兴趣广泛、拥有较强的组织能力和适应能力、并具有较强的管理策划与组织管理协调能力。', '1979年9月—1983年7月：武汉大学英语系本科，获英语语言文学学士学位；1983年9月—1986年7月：首都师范大学英语系硕士研究生，获英美文学硕士学位', '2007年9月—2015年深圳市罗湖区妇幼保健院护理部/急诊科护士', '1.	全面掌握Java语言及面向对象的设计思想。', '无', NULL, NULL, NULL),
	(2, '0', '11111', '李科长', '1', '96e79218965eb72c92a549dd5a330112', '1', '2', NULL, NULL, '上理科室', NULL, '教授', NULL, '本科', NULL, NULL, '授课', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'file/photo/1464573444445.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, '本人性格开朗、为人诚恳、乐观向上、兴趣广泛、拥有较强的组织能力和适应能力、并具有较强的管理策划与组织管理协调能力。', '1979年9月—1983年7月：武汉大学英语系本科，获英语语言文学学士学位；1983年9月—1986年7月：首都师范大学英语系硕士研究生，获英美文学硕士学位', '研究生', '1.	全面掌握Java语言及面向对象的设计思想。', '无', NULL, NULL, NULL),
	(3, '1', NULL, NULL, 'qwe', 'qwe', '1', '1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(6, NULL, NULL, '郑博文', NULL, NULL, NULL, '1', '4104542316527890985', NULL, NULL, '上海理工大学', '学生', NULL, NULL, '人工智能', NULL, '学生', NULL, NULL, '13676237873', '432348765@outlook.com', '上海理工大学', '200093', '6333540', NULL, '6535467', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, NULL, NULL, '', NULL, NULL, NULL, '1', 'sdfgdf', NULL, NULL, '', '', NULL, NULL, 'dsfgfdg', NULL, '', NULL, NULL, '', '', '', '', '', NULL, '', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(8, NULL, NULL, '', NULL, NULL, NULL, '1', 'fdsafdsa', NULL, NULL, '', '', NULL, NULL, '', NULL, '', NULL, NULL, '', '', '', '', '', NULL, '', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(15, NULL, NULL, '王凯', NULL, NULL, NULL, '1', '410243145298736740x', NULL, NULL, '上海理工大学', '学生', NULL, NULL, '软件开发', NULL, '学生', NULL, NULL, '15736548903', '8876354789@qq.com', '上海理工大学', '200093', '6334342', NULL, '6535464', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(25, NULL, NULL, '第三方', NULL, NULL, NULL, '1', '412736489036538749', NULL, NULL, '上海理工大学', '10001', NULL, NULL, '软件开发', NULL, '学生', NULL, NULL, '13875839847', '436456787@qq.com', '上海理工大学', '20093', '6445378', NULL, '6354783', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(27, NULL, NULL, '郑博文', NULL, NULL, NULL, '1', '4104542316527890985', NULL, NULL, '上海理工大学', '学生', NULL, NULL, '人工智能', NULL, '学生', NULL, NULL, '13676237873', '432348765@qq.com', '上海理工大学', '200093', '6333542', NULL, '6535467', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(30, NULL, NULL, '黄小红', NULL, NULL, NULL, '2', '410423199103674893', NULL, NULL, '上海理工大学', '学生', NULL, NULL, '软件测试', NULL, '学生', NULL, NULL, '15736578345', '15736548903@163.com', '上海理工大学', '200093', '6388542', NULL, '6535337', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(37, NULL, NULL, '', NULL, NULL, NULL, '2', 'sf', NULL, NULL, '', '', NULL, NULL, '', NULL, '', NULL, NULL, '', '', '', '', '', NULL, '', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(44, NULL, NULL, '第三方', NULL, NULL, NULL, '2', '412736489036538749', NULL, NULL, 'sadf', '1002', NULL, NULL, 'sadf', NULL, 'dsfg', NULL, NULL, '13875839847', '436456787@qq.com', 'sf', 'dsfg', '6445378', NULL, '6354783', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(52, NULL, NULL, '', NULL, NULL, NULL, '2', 'sdg', NULL, NULL, '', '', NULL, NULL, 'sdg', NULL, '', NULL, NULL, '', '', '', 'gfdsgfd', '', NULL, '', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(53, NULL, NULL, '郑博文', NULL, NULL, NULL, '1', '412736489036538749', NULL, NULL, '上海理工大学', '学生', NULL, NULL, '软件开发', NULL, '学生', NULL, NULL, '13875839847', '436456787@qq.com', '上海理工大学', '20093', '6445378', NULL, '6354783', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(62, NULL, NULL, '第三方', NULL, NULL, NULL, '2', 'sdf', NULL, NULL, 'sdf', 'sdf', NULL, NULL, 'sdg', NULL, 'sdf', NULL, NULL, 'sdf', 'sdf', 'sf', 'sfd', 'sdf', NULL, 'sdf', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(67, NULL, NULL, 'dsf', NULL, NULL, NULL, '2', '34324', NULL, NULL, 'sdf', 'sdf', NULL, NULL, 'dsf', NULL, 'dsf', NULL, NULL, '3434', 'sdfg', 'dsfg', 'd435', '2342343', NULL, '434234', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(69, NULL, NULL, '', NULL, NULL, NULL, '1', '', NULL, NULL, '', '', NULL, NULL, '', NULL, '', NULL, NULL, '', '', '', '', '', NULL, '', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(75, NULL, NULL, '', NULL, NULL, NULL, '', '', NULL, NULL, '', '10001', NULL, NULL, '', NULL, '', NULL, NULL, '', '', '', '', '', NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(77, NULL, NULL, 'dfgdf', NULL, NULL, NULL, '1', 'dfg', NULL, NULL, 'vbn', 'vb', NULL, NULL, 'vbn', NULL, 'vbnvn', NULL, NULL, '2', 'vbn', 'vbn', 'vbn', '6333542', NULL, '6535467', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(79, NULL, NULL, 'sdafs', NULL, NULL, NULL, '1', 'sdaf', NULL, NULL, '', '', NULL, NULL, '', NULL, '', NULL, NULL, '', '', '', '', '', NULL, '', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(86, NULL, NULL, '', NULL, NULL, NULL, '1', 'dfsgdf', NULL, NULL, '', '', NULL, NULL, '', NULL, '', NULL, NULL, '', '', '', '', '', NULL, '', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(88, NULL, NULL, '刘靖', NULL, NULL, NULL, '1', '234253199356490365', NULL, NULL, '上海理工大学', '学生', NULL, NULL, '软件开发', NULL, '学生', NULL, NULL, '13676237873', '20093', '上海理工大学', '200093', '6333542', NULL, '6535337', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(96, NULL, NULL, '', NULL, NULL, NULL, '2', 'sdfds', NULL, NULL, '', '', NULL, NULL, '', NULL, '', NULL, NULL, '', '', '', '', '', NULL, '', NULL, NULL, '/file/photo/2015123016344364882_s.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `s_person` ENABLE KEYS */;


-- 导出  表 db_saes.s_personal_info 结构
CREATE TABLE IF NOT EXISTS `s_personal_info` (
  `sname` varchar(40) DEFAULT NULL,
  `sno` int(11) NOT NULL,
  `ssex` varchar(2) NOT NULL,
  `sduty` varchar(40) DEFAULT NULL,
  `srank` varchar(40) DEFAULT NULL,
  `stele` varchar(32) DEFAULT NULL,
  `szip` varchar(32) DEFAULT NULL,
  `saddr` varchar(40) DEFAULT NULL,
  `soff` varchar(40) DEFAULT NULL,
  `slabor` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_personal_info 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `s_personal_info` DISABLE KEYS */;
INSERT INTO `s_personal_info` (`sname`, `sno`, `ssex`, `sduty`, `srank`, `stele`, `szip`, `saddr`, `soff`, `slabor`) VALUES
	('许益通', 1109030248, '男', '技术员', '中级', '18888888888', '221400', '上海理工大学', '科研一室', '科研所');
/*!40000 ALTER TABLE `s_personal_info` ENABLE KEYS */;


-- 导出  表 db_saes.s_prize 结构
CREATE TABLE IF NOT EXISTS `s_prize` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROJECT_SOURCE_ID` varchar(32) DEFAULT NULL,
  `NAME` varchar(256) DEFAULT NULL,
  `FIRST_PRIZE_NAME` varchar(40) DEFAULT NULL,
  `OTHER_PRIZE_NAME` varchar(300) DEFAULT NULL,
  `UNIT` varchar(40) DEFAULT NULL,
  `PRIZE_DATE` varchar(32) DEFAULT NULL,
  `LEVEL` varchar(32) DEFAULT NULL,
  `FILE_IDS` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_prize 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `s_prize` DISABLE KEYS */;
INSERT INTO `s_prize` (`ID`, `PROJECT_SOURCE_ID`, `NAME`, `FIRST_PRIZE_NAME`, `OTHER_PRIZE_NAME`, `UNIT`, `PRIZE_DATE`, `LEVEL`, `FILE_IDS`) VALUES
	(1, '', '优秀博士学位论文奖', '李明明', '', '上海教育科学研究院', '2015-12-02', '---请选择---', 'asd'),
	(4, '12', 'CCF终身成就奖', '李明明', '', '上海理工大学', '2015-12-20', '二等奖', NULL),
	(5, NULL, '青年科学家奖', '李明明', '', '上海教育科学研究院', '2015-12-20', '二等奖', NULL),
	(6, NULL, '最佳贡献奖', '李明明', '', '上海理工大学', '2015-12-20', '一等奖', NULL),
	(7, NULL, '最佳创意奖', '李明明', '', '上海教育科学研究院', '2015-12-20', '二等奖', NULL),
	(8, NULL, '最佳科普奖', '李明明', '', '上海理工大学', '2015-12-20', '一等奖', NULL),
	(9, NULL, '最佳新人奖', '李明明', '', '上海教育科学研究院', '2015-12-20', '二等奖', NULL),
	(10, '21', '21', '212', '12', '2', '1212121', '---请选择---', NULL);
/*!40000 ALTER TABLE `s_prize` ENABLE KEYS */;


-- 导出  表 db_saes.s_project 结构
CREATE TABLE IF NOT EXISTS `s_project` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(200) DEFAULT NULL,
  `UNIT` varchar(40) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `FROMTO` varchar(40) DEFAULT NULL,
  `ROLE` varchar(40) DEFAULT NULL,
  `ACHIEVE` varchar(40) DEFAULT NULL,
  `CHARGE` varchar(40) DEFAULT NULL,
  `MONEY` varchar(128) DEFAULT NULL,
  `DATE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_project 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `s_project` DISABLE KEYS */;
INSERT INTO `s_project` (`ID`, `NAME`, `UNIT`, `TYPE`, `FROMTO`, `ROLE`, `ACHIEVE`, `CHARGE`, `MONEY`, `DATE`) VALUES
	(1, '软件开发', '上海理工大学', 'ASD', 'ASD', '项目主管', '一等奖', '李明明', '1000,000', '2015.01.02-2015.12.20');
/*!40000 ALTER TABLE `s_project` ENABLE KEYS */;


-- 导出  表 db_saes.s_project_actualize_info 结构
CREATE TABLE IF NOT EXISTS `s_project_actualize_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增量',
  `UNIQUE_CODE` varchar(50) NOT NULL COMMENT '项目唯一编号',
  `ACTUALIZE_STATUS` smallint(2) unsigned DEFAULT '0' COMMENT '项目实施状态，0：未实施，1：实施中',
  `MIDEXAM_APPLY` smallint(2) unsigned DEFAULT '0' COMMENT '项目中检申请，0：未申请，1：已申请',
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='项目实施表';

-- 正在导出表  db_saes.s_project_actualize_info 的数据：1 rows
/*!40000 ALTER TABLE `s_project_actualize_info` DISABLE KEYS */;
INSERT INTO `s_project_actualize_info` (`ID`, `UNIQUE_CODE`, `ACTUALIZE_STATUS`, `MIDEXAM_APPLY`) VALUES
	(1, 'P2015121812', 0, 1);
/*!40000 ALTER TABLE `s_project_actualize_info` ENABLE KEYS */;


-- 导出  表 db_saes.s_project_apply_info 结构
CREATE TABLE IF NOT EXISTS `s_project_apply_info` (
  `APPLYID` varchar(32) NOT NULL COMMENT '主键',
  `NAME` varchar(255) DEFAULT NULL COMMENT '申报名称',
  `PROJECT_LOCATION` varchar(32) DEFAULT NULL COMMENT '来源：院内，院外',
  `KEY` varchar(64) DEFAULT NULL COMMENT '关键字',
  `SEARCH_AREAR` varchar(32) DEFAULT NULL COMMENT '研究领域',
  `SUBJECT_CLASS` varchar(32) DEFAULT NULL COMMENT '学科类别',
  `SEARCH_CLASS` varchar(32) DEFAULT NULL COMMENT '研究类型',
  `PROJECT_CLASS` varchar(255) DEFAULT NULL COMMENT '项目性质',
  `PROJECT_TYPE` varchar(32) DEFAULT NULL COMMENT '项目分类',
  `PROJECT_SOURCE_UNIT` varchar(255) DEFAULT NULL COMMENT '项目来源单位',
  `YUQI_PROJECT` varchar(128) DEFAULT NULL COMMENT '预期成果',
  `YUQI_TIME` date DEFAULT NULL COMMENT '预期完成时间',
  `BEGIN_DATE` datetime DEFAULT NULL COMMENT '开始日期',
  `END_DATE` datetime DEFAULT NULL COMMENT '结束日期',
  `STATE` varchar(32) DEFAULT NULL COMMENT '状态',
  `NOTE` text COMMENT '备注',
  `CREATE_TIME` date DEFAULT NULL COMMENT '创建日期',
  `CREATOR_ID` varchar(32) DEFAULT NULL COMMENT '创建者编号-对应业务表S_PERSON',
  `CREATOR_NAME` varchar(40) DEFAULT NULL COMMENT '创建者姓名',
  `REVIEWSTATE` varchar(32) DEFAULT NULL COMMENT '申报状态',
  `REVIEWSTATE_NOTE` text COMMENT '申报状态备注',
  `SUO_CHECK_STATE` smallint(2) DEFAULT NULL COMMENT '所审核状态 0:未通过，1：通过',
  `SUO_CHECK_STATE_NOTE` text COMMENT '所审核状态备注',
  `YUAN_CHECK_STATE` smallint(2) DEFAULT NULL COMMENT '院审核状态 0：未通过，1：通过',
  `YUAN_CHECK_STATE_NOTE` text COMMENT '院审核状态备注',
  `UNIT_ID` int(4) DEFAULT NULL COMMENT '所属单位编号对应S_UNIT',
  `DIVISION_ID` int(4) DEFAULT NULL COMMENT '所属科室编号-对应S_DIVISION',
  `APPLIER_ID` int(10) DEFAULT NULL COMMENT '申请人编号-对应S_PERSON',
  `SUBJECT_ID` varchar(32) DEFAULT NULL COMMENT '一级学科编号-对应DM_SUBJECT',
  `APPLY_FEE` decimal(9,0) DEFAULT NULL COMMENT '申请经费',
  `APPLY_DATE` datetime DEFAULT NULL COMMENT '申请日期',
  `FILE_ID` int(4) DEFAULT NULL COMMENT '申报表附件编号-对应系统表S_ATTACHMENT',
  `IS_CONFIRM` varchar(64) DEFAULT NULL COMMENT '是否批准立项',
  `BEFORE_RESEARCH_INFO` tinytext COMMENT '前期研究情况',
  `PROJECT_MODE` varchar(100) DEFAULT NULL COMMENT '成果形成',
  `APPLY_CLASS` int(4) DEFAULT NULL COMMENT '申报类型 0：课题申报，1：结题申报，2：报奖申报，3：团队申报，4：其他申报',
  PRIMARY KEY (`APPLYID`),
  KEY `APPLIER_ID` (`APPLIER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目申报基本信息表';

-- 正在导出表  db_saes.s_project_apply_info 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `s_project_apply_info` DISABLE KEYS */;
INSERT INTO `s_project_apply_info` (`APPLYID`, `NAME`, `PROJECT_LOCATION`, `KEY`, `SEARCH_AREAR`, `SUBJECT_CLASS`, `SEARCH_CLASS`, `PROJECT_CLASS`, `PROJECT_TYPE`, `PROJECT_SOURCE_UNIT`, `YUQI_PROJECT`, `YUQI_TIME`, `BEGIN_DATE`, `END_DATE`, `STATE`, `NOTE`, `CREATE_TIME`, `CREATOR_ID`, `CREATOR_NAME`, `REVIEWSTATE`, `REVIEWSTATE_NOTE`, `SUO_CHECK_STATE`, `SUO_CHECK_STATE_NOTE`, `YUAN_CHECK_STATE`, `YUAN_CHECK_STATE_NOTE`, `UNIT_ID`, `DIVISION_ID`, `APPLIER_ID`, `SUBJECT_ID`, `APPLY_FEE`, `APPLY_DATE`, `FILE_ID`, `IS_CONFIRM`, `BEFORE_RESEARCH_INFO`, `PROJECT_MODE`, `APPLY_CLASS`) VALUES
	('D2015122310', '软件开发', '院外', NULL, NULL, NULL, NULL, '省部级', '院外其他', '河南', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-23', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0),
	('D201512239', '0000', '院外', NULL, NULL, NULL, NULL, '省部级', '院外其他', '河南', NULL, NULL, NULL, NULL, NULL, NULL, '2015-12-23', NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, 25, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1);
/*!40000 ALTER TABLE `s_project_apply_info` ENABLE KEYS */;


-- 导出  表 db_saes.s_project_approval_info 结构
CREATE TABLE IF NOT EXISTS `s_project_approval_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '增量',
  `UNIQUE_CODE` varchar(50) NOT NULL COMMENT '项目唯一编号',
  `RESEARCH_CLASS_ID` varchar(50) DEFAULT NULL COMMENT '研究类别代码-对应代码表 DM_RESEARCH_TYPE',
  `APPROVAL_TIME` datetime DEFAULT NULL COMMENT '立项日期（一览项目审核均通过后自动立项）',
  `PLAN_END_DATE` varchar(50) DEFAULT NULL COMMENT '计划完成时间',
  `PROJECT_FEE` int(11) DEFAULT '0' COMMENT '项目经费',
  `EXPECT_RESULT` varchar(200) DEFAULT NULL COMMENT '预期成果形式',
  KEY `id` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='项目立项';

-- 正在导出表  db_saes.s_project_approval_info 的数据：2 rows
/*!40000 ALTER TABLE `s_project_approval_info` DISABLE KEYS */;
INSERT INTO `s_project_approval_info` (`ID`, `UNIQUE_CODE`, `RESEARCH_CLASS_ID`, `APPROVAL_TIME`, `PLAN_END_DATE`, `PROJECT_FEE`, `EXPECT_RESULT`) VALUES
	(2, 'D2015122310', NULL, '2016-05-20 18:15:28', NULL, 0, NULL),
	(1, 'P2015121812', NULL, '2015-12-20 18:15:28', '2015-12-29 18:15:28', 22000, '纸质');
/*!40000 ALTER TABLE `s_project_approval_info` ENABLE KEYS */;


-- 导出  表 db_saes.s_project_basic_info 结构
CREATE TABLE IF NOT EXISTS `s_project_basic_info` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `UNIQUE_CODE` varchar(50) NOT NULL DEFAULT '0' COMMENT '唯一标示编号',
  `PROJECT_CODE` varchar(50) DEFAULT NULL COMMENT '项目编号',
  `PROJECT_TYPE` varchar(50) DEFAULT NULL COMMENT '项目类型',
  `PROJECT_NAME` varchar(50) DEFAULT NULL COMMENT '项目名称',
  `CHARGER_NAME` varchar(50) DEFAULT NULL COMMENT '负责人姓名',
  `UNIT_ID` int(4) DEFAULT '0' COMMENT '所属部门编号－对应代码表　S_UNIT',
  `APPLIER_ID` int(4) DEFAULT '0' COMMENT '所属科室编号-对应S_UNIT',
  `CREATE_TIME` datetime DEFAULT NULL COMMENT '创建日期',
  `SUO_CHECK_STATE` smallint(2) DEFAULT '0' COMMENT '所审核状态,0：不通过，1：通过',
  `YUAN_CHECK_STATE` smallint(2) DEFAULT '0' COMMENT '院审核状态,0：不通过，1：通过',
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='项目基本信息表（项目一览）';

-- 正在导出表  db_saes.s_project_basic_info 的数据：3 rows
/*!40000 ALTER TABLE `s_project_basic_info` DISABLE KEYS */;
INSERT INTO `s_project_basic_info` (`ID`, `UNIQUE_CODE`, `PROJECT_CODE`, `PROJECT_TYPE`, `PROJECT_NAME`, `CHARGER_NAME`, `UNIT_ID`, `APPLIER_ID`, `CREATE_TIME`, `SUO_CHECK_STATE`, `YUAN_CHECK_STATE`) VALUES
	(26, 'P2016052517', 'hh', 'hh', '11aa', 'hh', 11, 11, '2016-05-25 14:50:50', 0, 0),
	(21, 'P2015121812', 'P', '院外其他', '测试', '王凯', 1, 1, '2015-12-30 12:17:25', 1, 1),
	(23, 'D2015122310', 'D', '院外其他', '申请项目', '王凯', 1, 1, '2015-12-30 16:46:53', 1, 1);
/*!40000 ALTER TABLE `s_project_basic_info` ENABLE KEYS */;


-- 导出  表 db_saes.s_project_enditem 结构
CREATE TABLE IF NOT EXISTS `s_project_enditem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增量',
  `UNIQUE_CODE` varchar(50) NOT NULL COMMENT '项目唯一编号',
  `ENDITEM_TIME` datetime DEFAULT NULL COMMENT '结项日期（项目中检完成）',
  `FINISH_NOTE` varchar(200) DEFAULT NULL COMMENT '结项说明',
  `SUO_CHECK_STATE` smallint(2) DEFAULT '0' COMMENT '所审核状态,0：不通过，1：通过',
  `SUO_SUGGEST` varchar(200) DEFAULT NULL COMMENT '所审核建议',
  `YUAN_CHECK_STATE` smallint(2) DEFAULT '0' COMMENT '院审核状态,0：不通过，1：通过',
  `YUAN_SUGGEST` varchar(200) DEFAULT NULL COMMENT '院审核建议',
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='项目结项表';

-- 正在导出表  db_saes.s_project_enditem 的数据：1 rows
/*!40000 ALTER TABLE `s_project_enditem` DISABLE KEYS */;
INSERT INTO `s_project_enditem` (`ID`, `UNIQUE_CODE`, `ENDITEM_TIME`, `FINISH_NOTE`, `SUO_CHECK_STATE`, `SUO_SUGGEST`, `YUAN_CHECK_STATE`, `YUAN_SUGGEST`) VALUES
	(1, 'P2015121812', NULL, '实验详细', 0, NULL, 0, NULL);
/*!40000 ALTER TABLE `s_project_enditem` ENABLE KEYS */;


-- 导出  表 db_saes.s_project_midexam 结构
CREATE TABLE IF NOT EXISTS `s_project_midexam` (
  `ID` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增量',
  `UNIQUE_CODE` varchar(50) NOT NULL COMMENT '项目唯一编号',
  `MIDEXAM_TIME` datetime DEFAULT NULL COMMENT '中检日期（项目实施完成可自行提出中检）',
  `SUO_CHECK_STATE` smallint(2) DEFAULT '0' COMMENT '所审核状态,0：不通过，1：通过',
  `SUO_SUGGEST` varchar(200) DEFAULT NULL COMMENT '所审核建议',
  `YUAN_CHECK_STATE` smallint(2) DEFAULT '0' COMMENT '院审核状态,0：不通过，1：通过',
  `YUAN_SUGGEST` varchar(200) DEFAULT NULL COMMENT '院审核建议',
  KEY `ID` (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='项目中检表';

-- 正在导出表  db_saes.s_project_midexam 的数据：1 rows
/*!40000 ALTER TABLE `s_project_midexam` DISABLE KEYS */;
INSERT INTO `s_project_midexam` (`ID`, `UNIQUE_CODE`, `MIDEXAM_TIME`, `SUO_CHECK_STATE`, `SUO_SUGGEST`, `YUAN_CHECK_STATE`, `YUAN_SUGGEST`) VALUES
	(4, 'P2015121812', NULL, 1, NULL, 1, '很好');
/*!40000 ALTER TABLE `s_project_midexam` ENABLE KEYS */;


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
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='注：存储日程信息';

-- 正在导出表  db_saes.s_schedule 的数据：0 rows
/*!40000 ALTER TABLE `s_schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `s_schedule` ENABLE KEYS */;


-- 导出  表 db_saes.s_train 结构
CREATE TABLE IF NOT EXISTS `s_train` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` varchar(256) DEFAULT NULL,
  `UNIT` varchar(40) DEFAULT NULL,
  `DATE` varchar(32) DEFAULT NULL,
  `CONTENT` varchar(200) DEFAULT NULL,
  `RAMARK` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- 正在导出表  db_saes.s_train 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `s_train` DISABLE KEYS */;
INSERT INTO `s_train` (`ID`, `NAME`, `UNIT`, `DATE`, `CONTENT`, `RAMARK`) VALUES
	(1, '计算机二级', '上海理工大学', '2015-12-10', '计算机二级备考经验', '计算机二级备考经验'),
	(4, 'NCRE考试', '上海理工大学', '2015-12-19', 'NCRE考试', ''),
	(5, '计算机三级', '上海理工大学', '2015-12-18', '计算机三级', ''),
	(6, '计算机高级工程师就业培训', '上海理工大学', '2015-12-17', '计算机高级工程师就业培训', ''),
	(7, 'UI设计师周末培训', '上海理工大学', '2015-12-16', 'UI设计师周末培训', ''),
	(8, '12', '12', '2016-01-04', ' 112', '123fghjklffgvhbjnkghjklhbjnkl、hjkhjklhjklhjklhjklhj\n');
/*!40000 ALTER TABLE `s_train` ENABLE KEYS */;


-- 导出  表 db_saes.s_unit 结构
CREATE TABLE IF NOT EXISTS `s_unit` (
  `ID` int(10) NOT NULL COMMENT '主键',
  `UNIT_ID` varchar(32) DEFAULT NULL COMMENT '部门编号',
  `NAME` varchar(128) DEFAULT NULL COMMENT '部门名称',
  `KJ_ID` varchar(32) DEFAULT NULL COMMENT '对应教育部科技统计的机构类别',
  `STATUS` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- 正在导出表  db_saes.s_unit 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `s_unit` DISABLE KEYS */;
INSERT INTO `s_unit` (`ID`, `UNIT_ID`, `NAME`, `KJ_ID`, `STATUS`) VALUES
	(1, '1', '计算机系', '1', 0);
/*!40000 ALTER TABLE `s_unit` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
