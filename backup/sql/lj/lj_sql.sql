-- 5.26
/**
curd
create 
update 
select
delete

*/

/**
一、ask
创建时，接收类字段置空
作为通知，显示关键信息，并且接收后，时间和看过否需要一起更新

新建
INSERT INTO `s_askreport` (`ID`, `TITLE`, `PERSON_ID`, `SENDER_NAME`, `SEND_DATE`, `ASK_DATE`, `SENDER_DP`, `ASKREPORT_CONTENT`, `REC_ID`, `REC_NAME`, `ACCEPT_DATE`, `IS_VIEW`, `DELETEID`, `FILE_ID`, `STATE`) VALUES (1, '买铅笔', 1, '李明明', '2016-05-26 15:24:02', '2016-05-26 15:24:14', '教务处', '现在需要铅笔', 15, '王凯', '2016-05-26 16:03:36', 1, 1, NULL, 0);

阅读前，根据未读是1来判断；阅读后，修改
UPDATE s_askreport s SET s.ACCEPT_DATE = NOW(),s.IS_VIEW = 1
WHERE s.id = 1;

审批
同意
UPDATE s_askreport s SET s.STATE = 1
WHERE s.id = 1;

不同意
UPDATE s_askreport s SET s.STATE = 2
WHERE s.id = 1;

普通查看
select * from s_askreport s where s.ID = 1;

显示列表，默认减少10条
select * from s_askreport limit 10;

删除
UPDATE s_askreport s SET s.DELETEID = 1 WHERE s.id = 1;


一、ask
创建时，接收类字段置空
作为通知，显示关键信息，并且接收后，时间和看过否需要一起更新

-- 导出  表 db_saes.s_askreport 结构
CREATE TABLE IF NOT EXISTS `s_askreport` (
  `ID` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `TITLE` varchar(50) NOT NULL COMMENT '公告标题',
  `PERSON_ID` int(10) NOT NULL COMMENT '发送人工号，关联person表',
  `SENDER_NAME` varchar(32) DEFAULT '' COMMENT '发送人姓名',
  `SEND_DATE` datetime DEFAULT NULL COMMENT '发送时间',
  `ASK_DATE` datetime DEFAULT NULL COMMENT '（可选）申请日期，默认当前时间',
  `SENDER_DP` varchar(32) DEFAULT NULL COMMENT '发送人部门',
  `ASKREPORT_CONTENT` varchar(50) DEFAULT NULL COMMENT '申请汇报内容',
  `REC_ID` int(10) DEFAULT NULL COMMENT '收件人工号，关联person表',
  `REC_NAME` varchar(32) DEFAULT NULL COMMENT '收件人姓名',
  `ACCEPT_DATE` datetime DEFAULT NULL COMMENT '接收日期',
  `IS_VIEW` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否查看，0未读，1已读',
  `STATE` INT(11) NULL DEFAULT '0' COMMENT '状态，默认0未审批，1同意，2不同意',
  `DELETEID` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '删除标记，0未删除，1已删除',
  `FILE_ID` int(10) DEFAULT NULL COMMENT '文件编号，关联file表',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

新建
INSERT INTO `s_askreport` (`ID`, `TITLE`, `PERSON_ID`, `SENDER_NAME`, `SEND_DATE`, `ASK_DATE`, `SENDER_DP`, `ASKREPORT_CONTENT`, `REC_ID`, `REC_NAME`, `ACCEPT_DATE`, `IS_VIEW`, `DELETEID`, `FILE_ID`, `STATE`) VALUES (1, '买铅笔', 1, '李明明', '2016-05-26 15:24:02', '2016-05-26 15:24:14', '教务处', '现在需要铅笔', 15, '王凯', '2016-05-26 16:03:36', 1, 1, NULL, 0);

拉取未读
select * from s_askreport WHERE s.id = ? and s.IS_VIEW=?

阅读前，根据未读是1来判断；阅读后，修改
UPDATE s_askreport s SET s.ACCEPT_DATE = NOW(),s.IS_VIEW = 1 WHERE s.id = 1;

审批
同意
UPDATE s_askreport s SET s.STATE = 1
WHERE s.id = 1;

不同意
UPDATE s_askreport s SET s.STATE = 2
WHERE s.id = 1;

详细查看
select * from s_askreport s where s.ID = 1;

显示列表，默认减少10条
select * from s_askreport limit 10;

删除
UPDATE s_askreport s SET s.DELETEID = 1
WHERE s.id = 1;

二、file
文件上传下载，这个随便在网上都可以查找的到了。问题应该不到。
新建
INSERT INTO `s_file` (`ID`, `NAME`, `PUBLISH_DATE`, `FILE_ID`, `NOTE`, `CREATE_TIME`, `CREATOR_ID`, `CREATOR_NAME`, `UNIT_ID`, `FILE_CLASS_ID`) VALUES (2, '文件', '2016-05-26 17:13:42', 1000, '这是图片', '2016-05-26 17:14:56', 1, '李明明', 1, 1);

修改
update  s_file s set s.NAME = 1,  s.PUBLISH_DATE = NOW(),s.NOTE =2 WHERE s.id = 1;

（不需要）详细查看
select * from s_file s where s.ID = 1;

显示列表，默认减少10条
select * from s_file limit 10;

删除
delete from s_file where id = 1;
db_saesracetrack_dev
三、通知公告
a发出，b审核，c,d,e查看

新建通知公告
INSERT INTO `s_notify` (`ID`, `TITLE`, `SENDER_ID`, `SENDER_NAME`, `SEND_DATE`, `CONTENT`, `VIEW_TIMES`, `TITLE_TOP_FLAG`, `NOTIFY_TYPE`, `FILE_ID`, `APPROVAL_ID`, `APPROVAL_NAME`, `APPROVAL_TIME`, `STATE`) VALUES (1, '刘延东副总理视察上海理工大学', 1, '李明明', '2015-12-11 09:00:05', '12月6日，中共中央政治局委员、国务院副总理刘延东来到上海理工大学视察上海太赫兹波谱与影像技术协同创新中心建设和发展情况。中共中央政治局委员、上海市委书记韩正，教育部部长袁贵仁，国务院副秘书长江小涓，上海市副市长翁铁慧，上海市教委主任苏明等陪同视察。', 1, 1, NULL, NULL, 2, '李科长', NULL, 0);

并插入多个，INSERT INTO `s_notify_view_info` (`ID`, `REC_ID`, `NOTIFY_ID`, `VIEW_DATE`, `IS_VIEW`) VALUES (1, 2, 1, '2016-05-26 23:13:12', -1);

拉取发件人的列表
select * from s_notify s where s.SENDER_ID = ? limit 10;

查看单个详情
select * from s_notify s where s.ID = ?;

拉取未审核的，有需要再在详情，拉取通知的人员和阅读数+1
select * from s_notify WHERE s.approval_id = ? and s.state=?

审核设置为已读（审批，同意不同意）
同意
update  s_notify s set s.APPROVAL_TIME = NOW(),  s.STATE = 1 WHERE s.APPROVAL_ID = 2;
(同意才有)更新多个，更新关联表，正式发出通知，待读
update  s_notify_view_info s set s.IS_VIEW = 0 WHERE s.NOTIFY_ID = 1;

拉取待查看的通知
select a.*,b.* from s_notify a left join s_notify_view_info b on a.id = b.NOTIFY_ID where b.rec_id = 3 and b.IS_VIEW=0;

查看通知，设置为已读
update  s_notify_view_info s set s.VIEW_DATE = NOW(),  s.IS_VIEW = 1 WHERE s.NOTIFY_ID = 1;

删除通知
delete from s_notify where id = 1;
delete from s_notify_view_info where NOTIFY_ID = 1;

？顺便再更新次数，从待读开始计算
update s_notify s set s.VIEW_TIMES = NOW(),  s.STATE = 1 WHERE s.PERSON_ID = 2; 

update s_notify a left join s_notify_view_info b on a.id = b.NOTIFY_ID 
!!!set b.VIEW_DATE = now(),a.VIEW_TIMES+1
where b.rec_id = 3 and a.id= 1;

或者不要times，每次统计总数为is_view=1的
*/

-- select * from s_notify s where s.SENDER_ID = 1

-- 6.3
-- select * from s_notify s where s.SENDER_ID = 1 limit 10
-- 删除改成deleteid

-- 6.4
-- select * from s_askreport s  where s.DELETEID=0 limit 10;

-- INSERT INTO `s_askreport` (`TITLE`, `PERSON_ID`, `SENDER_NAME`, `SEND_DATE`, `SENDER_DP`, `ASK_DATE`, `ASKREPORT_CONTENT`, `REC_ID`, `REC_NAME`, `ACCEPT_DATE`, `IS_VIEW`, `STATE`, `DELETEID`, `FILE_ID`) VALUES ('关于购置电脑的申请', 1, '李明明', '2016-06-03 20:13:12', '教务处', '2016-06-03 20:13:16', '电脑不够用了', 15, '王凯', '2016-06-03 20:13:38', 1, 0, 0, NULL);

-- CREATE TABLE `calendar` (
-- `id` int(11) NOT NULL auto_increment,
-- `title` varchar(100) NOT NULL,
-- `starttime` int(11) NOT NULL,
-- `endtime` int(11) default NULL,
-- `allday` tinyint(1) NOT NULL default '0',
-- `color` varchar(20) default NULL,
-- PRIMARY KEY  (`id`)
-- ) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- INSERT INTO `s_schedule` (`id`, `title`, `START_TIME`, `END_TIME`, `allday`, `color`) VALUES
-- (1, '121', 1464969600, 0, 1, '#360'),
-- (2, 'dasd', 1466092800, 0, 1, '#f30'),
-- (3, '11', 1465056000, 0, 1, '#360'),
-- (4, '12121', 1466179200, 0, 1, '#06c'),
-- (5, '11111111111', 1466784000, 0, 1, '#06c'),
-- (6, '121', 1465660800, 0, 1, '#f30'),
-- (7, '11', 1465574400, 0, 1, '#360'),
-- (8, '11', 1464710400, 0, 1, '#f30'),
-- (9, 'asdsadas', 1464883200, 0, 1, '#360'),
-- (10, '1212', 1465574400, 0, 1, '#06c'),
-- (11, '2121', 1465583400, 0, 0, '#f30'),
-- (12, 'aaa', 1465660800, 0, 1, '#06c'),
-- (13, 'aa', 1465660800, 0, 1, '#06c'),
-- (14, 'cc', 1465689600, 0, 0, '#06c'),
-- (15, '1212', 1465142400, 1465401600, 1, '#f30'),
-- (16, '212121', 1464710400, 1465228800, 1, '#06c'),
-- (17, 'asdasd', 1464710400, 1466006400, 1, '#360'),
-- 	(18, '2121', 1454428800, 1454515200, 1, '#360');
-- 
-- update s_notify s  set s.DELETEID = 0;
-- 
-- 
-- select u.ID as unit_id,u.NAME  as unit_name ,s.*from s_person s left join s_unit u on s.UNIT_ID=u.ID order by u.unit_id asc;
-- 
-- select * from s_unit u order by u.id asc;
-- 
-- INSERT INTO `s_notify_view_info` (`REC_ID`, `REC_NAM-- E`, `NOTIFY_ID`, `TITLE`, `VIEW_DATE`, `IS_VIEW`) VALUES (8, '刘靖', 2, '0', '2016-05-26 23:13:12', 0);
-- INSERT INTO `s_notify_view_info` (`REC_ID`, `REC_NAME`, `NOTIFY_ID`, `TITLE`, `VIEW_DATE`, `IS_VIEW`) VALUES (8, '刘靖', 3, '0', '2016-05-26 23:13:12', 0);
-- INSERT INTO `s_notify_view_info` (`REC_ID`, `REC_NAME`, `NOTIFY_ID`, `TITLE`, `VIEW_DATE`, `IS_VIEW`) VALUES (15, '王凯', 2, '0', '2016-05-26 23:13:12', 0);
--
-- INSERT INTO `s_notify` (`TITLE`, `SENDER_ID`,SENDER_NAME'', `SEND_DATE`, `CONTENT`, `VIEW_TIMES`, `TITLE_TOP_FLAG`, `NOTIFY_TYPE`, `FILE_ID`, `APPROVAL_ID`, `APPROVAL_NAME`,`APPROVAL_TIME`, `STATE`) VALUES ('萨达2','2','1','2016-06-08 00:36:06','2','','','','','2','里面','','0')
-- 


-- 6.12
-- SELECT COUNT(*) AS tp_count FROM `think_form` LIMIT 1
-- select r.GROUP_ID,r.NOTE,r.ROLE_LEVEL,p.* from s_person  p left join dm_role r on p.GROUP_ID=r.GROUP_ID where p.account='admin';
-- select * from s_notify s where s.SENDER_ID = 2 and s.DELETEID=0 limit 10;

-- select * from s_notify_view_info s where s.NOTIFY_ID = 4


-- delete from s_notify_view_info s where s.NOTIFY_ID=71;
-- -- 接收人，也发给了自己，其实也就是状态=1
-- select a.* from s_notify a left join s_notify_view_info b on a.id = b.NOTIFY_ID where b.rec_id = 8 and a.DELETEID=0;
-- -- 发送人，优先级1，什么状态都有可能；带个参数决定吧，默认先这个
-- select *  from s_notify s where s.SENDER_ID = 8 and s.DELETEID=0;
-- -- -- 待审核人，优先级2，状态为0的
-- select * from s_notify s WHERE s.APPROVAL_ID = 8 and s.STATE=0 and s.DELETEID=0;
-- 

-- -- 接收人，也发给了自己，其实也就是状态=1
-- select a.* from s_notify a left join s_notify_view_info b on a.id = b.NOTIFY_ID where b.rec_id = ? and a.DELETEID=0 and a.STATE = 1;
-- -- 发送人，优先级1，什么状态都有可能；带个参数决定吧，默认先这个
-- select *  from s_notify s where s.SENDER_ID = ? and s.DELETEID= 0 limit 10;
-- -- 待审核人，优先级2，状态为0的
-- select * from s_notify s WHERE s.APPROVAL_ID = ? and s.STATE=0 and s.DELETEID=0;
-- 

-- select count(*) from s_notify a left join s_notify_view_info b on a.id = b.NOTIFY_ID where b.rec_id = 2 and a.DELETEID=0 and a.STATE = 1;
-- 发送人，优先级1，什么状态都有可能；带个参数决定吧，默认先这个
-- select count(*)  from s_notify s where s.SENDER_ID = ? and s.DELETEID= 0;
-- 待审核人，优先级2，状态为0的
-- select count(*) from s_notify s WHERE s.APPROVAL_ID = ? and s.STATE=0 and s.DELETEID=0;

--


-- 拉取未审核
-- select * from s_notify s WHERE s.APPROVAL_ID = 8 and s.STATE=1 and s.DELETEID=0;
-- 拉取待阅读
-- select a.*,b.* from s_notify a left join s_notify_view_info b on a.id = b.NOTIFY_ID where b.rec_id = ? and b.IS_VIEW=? and a.DELETEID=0
--  and b.IS_VIEW=0 ";


-- select s.VIEW_TIMES from s_notify s where s.ID = 87;
-- select * from s_notify s where s.ID = 87;


-- 6.14
-- INSERT INTO `s_askreport` (`TITLE`, `PERSON_ID`, `SENDER_NAME`, `SEND_DATE`, `ASKREPORT_CONTENT`, `REC_ID`, `REC_NAME`, `ACCEPT_DATE`, `IS_VIEW`, `STATE`, `DELETEID`, `FILE_ID`) VALUES (4, '2', 2, '李明明', '0000-00-00 00:00:00', '计算机学院', NULL, '1212大苏打', 8, '刘靖', NULL, 0, 0, 0, 0);
-- INSERT INTO `s_askreport` (`TITLE`, `PERSON_ID`, `SENDER_NAME`, `SEND_DATE`, `ASKREPORT_CONTENT`, `REC_ID`, `REC_NAME`) VALUES ('2', 2, '李明明', '2016-06-14 09:56:27', '1212大苏打', 8, '刘靖');

-- update  s_askreport s  set  s.TITLE='111',s.ASKREPORT_CONTENT='222',s.REC_ID=2,s.REC_NAME='11' WHERE s.ID = 9;


