--  *********************************************************************
--  Update Database Script
--  *********************************************************************
--  Change Log: src/main/resources/liquibase/changelog-master.xml
--  Ran at: 20-3-11 下午2:22
--  Against: root@172.21.48.54@jdbc:mysql://172.21.50.53:3306/HUAYOU_DB?serverTimezone=GMT%2B8
--  Liquibase version: 3.8.2
--  *********************************************************************

--  Create Database Lock Table
CREATE TABLE DV_CHANGE_LOG_LOCK (ID INT NOT NULL, `LOCKED` BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_DV_CHANGE_LOG_LOCK PRIMARY KEY (ID));

--  Initialize Database Lock Table
DELETE FROM DV_CHANGE_LOG_LOCK;

INSERT INTO DV_CHANGE_LOG_LOCK (ID, `LOCKED`) VALUES (1, 0);

--  Lock Database
UPDATE DV_CHANGE_LOG_LOCK SET `LOCKED` = 1, LOCKEDBY = '王勋 (192.168.53.113)', LOCKGRANTED = '2020-03-11 14:22:48.797' WHERE ID = 1 AND `LOCKED` = 0;

--  Create Database Change Log Table
CREATE TABLE DV_CHANGE_LOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, `DESCRIPTION` VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-1::WangXun
CREATE TABLE CF_ALARM_BACKUP (ID VARCHAR(50) NOT NULL, nAlarmType INT NULL COMMENT '报警类型（上限，上上限......）', nAlarmState INT NULL COMMENT '报警状态', nAlarmlevel INT NULL COMMENT '报警级别', strEventTime datetime NULL COMMENT '报警时间', strTagName VARCHAR(100) NULL COMMENT '标签名称', strTagDes VARCHAR(128) NOT NULL COMMENT '标签描述', strArea VARCHAR(64) NOT NULL COMMENT '区域，为DCS日志设计', strDevice VARCHAR(64) NOT NULL COMMENT '装置，为DCS日志设计', strUnit VARCHAR(64) NOT NULL COMMENT '单元,为DCS日志设计', strMsgDes VARCHAR(100) NULL COMMENT '报警描述', fAlarmlimit FLOAT(53) NULL COMMENT '报警阀值', strAlarmValue VARCHAR(30) NULL COMMENT '报警实时值', strRecoveryTime datetime NULL COMMENT '恢复时间', strAckedTime datetime NULL COMMENT '确认时间', strAckedComment VARCHAR(255) NULL COMMENT '恢复内容', nSource INT NULL COMMENT '报警来源', strIsHide CHAR(1) NULL COMMENT '是否隐藏后产生0：非隐藏后生产 1：隐藏后生成', strNodeDomain VARCHAR(255) NULL, strTypeName VARCHAR(10) NULL COMMENT '报警类型', strAlarmTypeDes VARCHAR(60) NULL COMMENT '报警类型描述', nPushStatus INT NULL, strAlarmLevelDes VARCHAR(30) NULL COMMENT '报警级别描述', nDomainNum INT NULL, CONSTRAINT PK_CF_ALARM_BACKUP PRIMARY KEY (ID)) COMMENT='报警备份表';

ALTER TABLE CF_ALARM_BACKUP COMMENT = '报警备份表';

CREATE INDEX IX_ALARMHIS_strEventTime ON CF_ALARM_BACKUP(strEventTime);

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-1', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 1, '8:1b7f0757d176438ed4716bb9170c2cce', 'createTable tableName=CF_ALARM_BACKUP; createIndex indexName=IX_ALARMHIS_strEventTime, tableName=CF_ALARM_BACKUP', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-2::WangXun
CREATE TABLE CF_Alarm (ID NVARCHAR(50) NOT NULL, nAlarmType INT NULL COMMENT '报警类型（上限，上上限......）', nAlarmState INT NULL COMMENT '报警状态', nAlarmlevel INT NULL COMMENT '报警级别', strEventTime datetime NULL COMMENT '报警时间', strTagName NVARCHAR(100) NULL COMMENT '标签名称', strTagDes NVARCHAR(128) NULL COMMENT '标签描述', strArea NVARCHAR(64) NOT NULL COMMENT '区域，为DCS日志设计', strDevice NVARCHAR(64) NOT NULL COMMENT '装置，为DCS日志设计', strUnit NVARCHAR(64) NOT NULL COMMENT '单元,为DCS日志设计', strMsgDes NVARCHAR(100) NULL COMMENT '报警描述', fAlarmlimit FLOAT(53) NULL COMMENT '报警阀值', strAlarmValue NVARCHAR(30) NULL COMMENT '报警实时值', strRecoveryTime datetime NULL COMMENT '恢复时间', strAckedTime datetime NULL COMMENT '确认时间', strAckedComment NVARCHAR(255) NULL COMMENT '恢复内容', nSource INT NULL COMMENT '报警来源', strIsHide CHAR(1) NULL COMMENT '是否隐藏后产生0：非隐藏后生产 1：隐藏后生成', strNodeDomain NVARCHAR(255) NULL, strTypeName NVARCHAR(10) NULL COMMENT '报警类型', strAlarmTypeDes NVARCHAR(60) NULL COMMENT '报警类型描述', nPushStatus INT NULL, strAlarmLevelDes NVARCHAR(30) NULL COMMENT '报警级别描述', nDomainNum INT NULL, CONSTRAINT PK_CF_ALARM_ID PRIMARY KEY (ID)) COMMENT='生产报警表';

ALTER TABLE CF_Alarm COMMENT = '生产报警表';

CREATE INDEX IX_Alarm_TagName ON CF_Alarm(strTagName);

CREATE INDEX IX_CF_Alarm_Soft ON CF_Alarm(nAlarmState, nAlarmlevel, strEventTime);

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-2', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 2, '8:08bb42a409e551579db8ffd8d40f9928', 'createTable tableName=CF_Alarm; createIndex indexName=IX_Alarm_TagName, tableName=CF_Alarm; createIndex indexName=IX_CF_Alarm_Soft, tableName=CF_Alarm', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-3::WangXun
CREATE TABLE CF_AlarmHis (ID NVARCHAR(50) NOT NULL, nAlarmType INT NULL COMMENT '报警类型（上限，上上限......）', nAlarmState INT NULL COMMENT '报警状态', nAlarmlevel INT NULL COMMENT '报警级别', strEventTime datetime NULL COMMENT '报警时间', strTagName NVARCHAR(100) NULL COMMENT '标签名称', strTagDes NVARCHAR(128) NOT NULL COMMENT '标签描述', strArea NVARCHAR(64) NOT NULL COMMENT '区域，为DCS日志设计', strDevice NVARCHAR(64) NOT NULL COMMENT '装置，为DCS日志设计', strUnit NVARCHAR(64) NOT NULL COMMENT '单元,为DCS日志设计', strMsgDes NVARCHAR(100) NULL COMMENT '报警描述', fAlarmlimit FLOAT(53) NULL COMMENT '报警阀值', strAlarmValue NVARCHAR(30) NULL COMMENT '报警实时值', strRecoveryTime datetime NULL COMMENT '恢复时间', strAckedTime datetime NULL COMMENT '确认时间', strAckedComment NVARCHAR(255) NULL COMMENT '恢复内容', nSource INT NULL COMMENT '报警来源', strIsHide CHAR(1) NULL COMMENT '是否隐藏后产生0：非隐藏后生产 1：隐藏后生成', strNodeDomain NVARCHAR(255) NULL, strTypeName NVARCHAR(10) NULL COMMENT '报警类型', strAlarmTypeDes NVARCHAR(60) NULL COMMENT '报警类型描述', nPushStatus INT NULL, strAlarmLevelDes NVARCHAR(30) NULL COMMENT '报警级别描述', nDomainNum INT NULL, CONSTRAINT PK_ALARM_HISTORY_ID PRIMARY KEY (ID)) COMMENT='历史报警表';

ALTER TABLE CF_AlarmHis COMMENT = '历史报警表';

CREATE INDEX IX_CF_ALARMHIS_strEventTime ON CF_AlarmHis(strEventTime);

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-3', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 3, '8:d820f47685926c45d70f8734d6ea4b6a', 'createTable tableName=CF_AlarmHis; createIndex indexName=IX_CF_ALARMHIS_strEventTime, tableName=CF_AlarmHis', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-4::WangXun
CREATE TABLE CF_ForbidAlarm (ID NVARCHAR(50) NOT NULL, nAlarmType INT NOT NULL COMMENT '报警类型（上限，上上限......）', ALARM_LEVER INT NULL COMMENT '报警等级', strTagName NVARCHAR(100) NOT NULL COMMENT '标签名称', strTagDes NVARCHAR(100) NOT NULL COMMENT '标签描述', strOperater NVARCHAR(100) NOT NULL COMMENT '操作人', strForbidTime datetime NOT NULL COMMENT '抑制时间', FORBID_DESCRIPTION VARCHAR(256) NULL COMMENT '抑制说明', TAG_AREA NVARCHAR(128) NULL COMMENT '标签所属区域', TAG_DEVICE NVARCHAR(128) NULL COMMENT '标签所属装置', TAG_UNIT NVARCHAR(128) NULL COMMENT '标签所属单元', CONSTRAINT PK_FBALARMID PRIMARY KEY (ID)) COMMENT='报警抑制表';

ALTER TABLE CF_ForbidAlarm COMMENT = '报警抑制表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-4', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 4, '8:695d9087ccc7aecd67e8283b9cc5dd0e', 'createTable tableName=CF_ForbidAlarm', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-5::WangXun
CREATE TABLE CF_HideAlarm (ID NVARCHAR(50) NOT NULL, nAlarmType INT NOT NULL COMMENT '报警类型（上限，上上限......）', strTagName NVARCHAR(100) NOT NULL COMMENT '标签名称', strTagDes NVARCHAR(100) NOT NULL COMMENT '标签描述', strOperater NVARCHAR(100) NOT NULL COMMENT '操作人', strHideTime datetime NOT NULL COMMENT '隐藏时间', TAG_AREA NVARCHAR(128) NULL COMMENT '标签所属区域', TAG_DEVICE NVARCHAR(128) NULL COMMENT '标签所属装置', TAG_UNIT NVARCHAR(128) NULL COMMENT '标签所属单元', CONSTRAINT PK_HIDE_ALARM_ID PRIMARY KEY (ID)) COMMENT='报警隐藏表';

ALTER TABLE CF_HideAlarm COMMENT = '报警隐藏表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-5', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 5, '8:1861239432aaab8ef96a266e2bad950c', 'createTable tableName=CF_HideAlarm', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-6::WangXun
CREATE TABLE CF_NodeState (ID NVARCHAR(50) NOT NULL, nCPULoad INT NOT NULL COMMENT 'CPU负荷', fTemperature FLOAT(53) NOT NULL COMMENT '温度', nMemoryLoad INT NOT NULL COMMENT '内存负荷', nState INT NOT NULL COMMENT '状态 -1:初始化  0：不正常  1:正常', nNodeType INT NOT NULL COMMENT '节点类型（0普通节点，1网闸安全侧，2网闸开放侧，3云卡）', nNodePCID INT NULL COMMENT 'PC号', strStateTime datetime NOT NULL COMMENT '更新时间', strSerialNum NVARCHAR(20) NULL COMMENT '网闸序列号', fNetworkALoad FLOAT(53) NULL, fNetworkBLoad FLOAT(53) NULL, CONSTRAINT PK_NODESTATEID PRIMARY KEY (ID)) COMMENT='节点状态表';

ALTER TABLE CF_NodeState COMMENT = '节点状态表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-6', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 6, '8:b3e5f362d62351c9fb4e13cbb530fe47', 'createTable tableName=CF_NodeState', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-7::WangXun
CREATE TABLE CF_ProcessState (ID NVARCHAR(50) NOT NULL, nProcessID INT NOT NULL COMMENT '进程ID', nNodePCID INT NOT NULL COMMENT 'PC号	关联表CF_NodeState', nState INT NOT NULL COMMENT '状态 -1:初始化  0：不正常  1:正常', strProcessName NVARCHAR(100) NOT NULL COMMENT '进程名', strStateTime datetime NOT NULL COMMENT '更新时间', CONSTRAINT PK_PROCESSSTATEID PRIMARY KEY (ID)) COMMENT='进程状态表';

ALTER TABLE CF_ProcessState COMMENT = '进程状态表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-7', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 7, '8:10246a07186fee02d58519e841f090ec', 'createTable tableName=CF_ProcessState', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-8::WangXun
CREATE TABLE CF_ServiceState (ID NVARCHAR(50) NOT NULL, nNodePCID INT NOT NULL COMMENT 'PC号	关联CF_ProcessState', nState INT NOT NULL COMMENT '状态 -1:初始化  0：不正常  1:正常  2:部分正常', strServiceName NVARCHAR(100) NOT NULL COMMENT '服务名称', strProcessName NVARCHAR(100) NOT NULL COMMENT '进程名称	关联CF_ProcessState', CONSTRAINT PK_SERVICESTATEID PRIMARY KEY (ID)) COMMENT='服务状态表';

ALTER TABLE CF_ServiceState COMMENT = '服务状态表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-8', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 8, '8:8c6318951e85db745d0c5262aa3864d6', 'createTable tableName=CF_ServiceState', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-9::WangXun
CREATE TABLE CF_SysAlarm (ID NVARCHAR(50) NOT NULL, nAlarmType INT NULL COMMENT '报警类型（上限，上上限......）', nAlarmState INT NULL COMMENT '报警状态', nAlarmlevel INT NULL COMMENT '报警级', strEventTime datetime NULL COMMENT '事件发生事件', strTagName NVARCHAR(100) NULL COMMENT '标签名', strTagDes NVARCHAR(100) NULL COMMENT '标签描述', strArea NVARCHAR(64) NULL COMMENT '区域，为DCS日志设计', strDevice NVARCHAR(64) NULL COMMENT '装置，为DCS日志设计', strUnit NVARCHAR(64) NULL COMMENT '单元,为DCS日志设计', strMsgDes NVARCHAR(100) NULL COMMENT '事件信息描述', fAlarmlimit FLOAT(53) NULL COMMENT '报警限', strAlarmValue NVARCHAR(30) NULL COMMENT '报警时刻值', strRecoveryTime datetime NULL COMMENT '恢复事件', strAckedTime datetime NULL COMMENT '报警确认时间', strAckedComment NVARCHAR(255) NULL COMMENT '报警确认信息', nSource INT NULL COMMENT '来源 1:DCS 2:ODS生产 3:ODS设备', strIsHide CHAR(1) NULL COMMENT '是否隐藏后产生0：非隐藏后生产 1：隐藏后生成', strTypeName NVARCHAR(10) NULL COMMENT '报警类型', strAlarmTypeDes NVARCHAR(60) NULL COMMENT '报警类型描述', strAlarmLevelDes NVARCHAR(30) NULL COMMENT '报警级别描述', CONSTRAINT PK_HIDENALERMID PRIMARY KEY (ID)) COMMENT='系统报警表';

ALTER TABLE CF_SysAlarm COMMENT = '系统报警表';

CREATE INDEX IX_SysAlarm ON CF_SysAlarm(nAlarmState, nAlarmlevel, strEventTime);

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-9', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 9, '8:42dae08583511de4e63b9598557dbfb5', 'createTable tableName=CF_SysAlarm; createIndex indexName=IX_SysAlarm, tableName=CF_SysAlarm', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-10::WangXun
CREATE TABLE SM_ALARM_LEVEL_COLOUR (ID VARCHAR(50) NOT NULL, LEVEL1_COLOUR BIGINT NULL, LEVEL2_COLOUR BIGINT NULL, LEVEL3_COLOUR BIGINT NULL, LEVEL4_COLOUR BIGINT NULL, LEVEL5_COLOUR BIGINT NULL, LEVEL6_COLOUR BIGINT NULL, LEVEL7_COLOUR BIGINT NULL, LEVEL8_COLOUR BIGINT NULL, LEVEL9_COLOUR BIGINT NULL, LEVEL10_COLOUR BIGINT NULL, CONSTRAINT PK_SM_ALARM_LEVEL_COLOUR PRIMARY KEY (ID)) COMMENT='报警级别颜色表';

ALTER TABLE SM_ALARM_LEVEL_COLOUR COMMENT = '报警级别颜色表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-10', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 10, '8:de04111fa3fc41042230db2bb218bc50', 'createTable tableName=SM_ALARM_LEVEL_COLOUR', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-11::WangXun
CREATE TABLE SM_Log (ID NVARCHAR(50) NOT NULL, strOperater NVARCHAR(100) NOT NULL COMMENT '创建人', strOperateTime datetime NOT NULL COMMENT '创建时间', nLogSource INT NOT NULL COMMENT '日志来源 生产日志 = 1,系统日志 = 2,DCS日志 = 3', nOperateContentKey INT NOT NULL COMMENT '其他0，登录注销1、新增2、删除3、修改4，置位 = 10,写模拟量值 = 11,', nStatus INT NOT NULL COMMENT '状态 1成功  0失败', strIP NVARCHAR(50) NOT NULL COMMENT 'ip', strLabelName NVARCHAR(64) NOT NULL COMMENT '标签名', strLabelDescribe NVARCHAR(128) NULL COMMENT '标签描述', strArea NVARCHAR(64) NULL COMMENT '区域，为DCS日志设计', strDevice NVARCHAR(64) NULL COMMENT '装置，为DCS日志设计', strUnit NVARCHAR(64) NULL COMMENT '单元,为DCS日志设计', strOperateRoute NVARCHAR(255) NULL COMMENT '页面编码或者流程图id', strPreContent NVARCHAR(255) NULL COMMENT '修改前值', strafterContent NVARCHAR(255) NULL COMMENT '修改后值', strContent NVARCHAR(255) NULL COMMENT '日志详情', CONSTRAINT PK_NLOGID PRIMARY KEY (ID)) COMMENT='日志表';

ALTER TABLE SM_Log COMMENT = '日志表';

CREATE INDEX IX_LOG_OPERATE_TIME ON SM_Log(strOperateTime);

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-11', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 11, '8:81aca54bc5093e3491ce19360f07d0c5', 'createTable tableName=SM_Log; createIndex indexName=IX_LOG_OPERATE_TIME, tableName=SM_Log', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-12::WangXun
CREATE TABLE SM_ONLINE_USER (ID VARCHAR(50) NOT NULL, GROUP_NAME VARCHAR(80) NOT NULL, USERNAME VARCHAR(80) NOT NULL, NODE_ID INT NULL, LOGIN_TIME datetime NULL, CONSTRAINT PK_SM_ONLINE_USER PRIMARY KEY (ID)) COMMENT='在线用户表';

ALTER TABLE SM_ONLINE_USER COMMENT = '在线用户表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-12', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 12, '8:62308216531096d6a253269f942d9723', 'createTable tableName=SM_ONLINE_USER', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-13::WangXun
CREATE TABLE SM_OperateContent (ID NVARCHAR(50) NOT NULL, nOperateContentKey NVARCHAR(50) NOT NULL, strOperateContent NVARCHAR(50) NOT NULL COMMENT '操作类型key对应的汉字', CONSTRAINT PK_SM_OperateContent PRIMARY KEY (nOperateContentKey)) COMMENT='操作类型字典表';

ALTER TABLE SM_OperateContent COMMENT = '操作类型字典表';

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('0', '0', '其他');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('1', '1', '登录注销');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('10', '10', '置位');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('11', '11', '写模拟量值');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('12', '12', '写开关量值');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('14', '14', '报警操作');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('2', '2', '新增');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('3', '3', '修改');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('4', '4', '删除');

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-13', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 13, '8:d89cc14cf9ae4609b32c00617a803b6c', 'createTable tableName=SM_OperateContent; insert tableName=SM_OperateContent; insert tableName=SM_OperateContent; insert tableName=SM_OperateContent; insert tableName=SM_OperateContent; insert tableName=SM_OperateContent; insert tableName=SM_Operat...', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-14::WangXun
CREATE TABLE SM_ProjectTag (ID NVARCHAR(50) NOT NULL, strID NVARCHAR(80) NULL COMMENT '标签组态ID', strName NVARCHAR(70) NULL COMMENT '标签节点名称', strDescription NVARCHAR(300) NULL COMMENT '标签节点描述', strArea NVARCHAR(128) NULL COMMENT '区域，为DCS日志设计', strDevice NVARCHAR(128) NULL COMMENT '装置，为DCS日志设计', strUnit NVARCHAR(128) NULL COMMENT '单元,为DCS日志设计', strProjectCode NVARCHAR(50) NULL COMMENT '标签节点父节点编码', nOrderNo INT NULL COMMENT '标签节点序号', nTagType INT NULL COMMENT '标签节点类型（0：普通标签，1：特殊标签）', strResourceUrl NVARCHAR(1000) NULL COMMENT '标签节点资源地址', strGTGuid NVARCHAR(50) NULL COMMENT '标签归属工程标识', strGTPC NVARCHAR(50) NULL COMMENT '标签归属PC', strGTDomain NVARCHAR(50) NULL COMMENT '标签归属MACS域号', strDelFlag CHAR(1) DEFAULT '0' NOT NULL COMMENT '删除标志', nTagDataType INT NULL COMMENT '标签数据类型：开关，模拟', CONSTRAINT PK_PROJECT_TAG_ID PRIMARY KEY (ID), CONSTRAINT UQ_PROJECT_TAG_NAME UNIQUE (strName)) COMMENT='项目标签表';

ALTER TABLE SM_ProjectTag COMMENT = '项目标签表';

CREATE INDEX IX_SM_ProjectTag_C ON SM_ProjectTag(strName);

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-14', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 14, '8:a9f6e852200d5fe7fdcd02214d9fdfdb', 'createTable tableName=SM_ProjectTag; createIndex indexName=IX_SM_ProjectTag_C, tableName=SM_ProjectTag', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-15::WangXun
CREATE TABLE SM_TREND_GROUP (ID VARCHAR(50) NOT NULL, TREND_GROUP_NAME VARCHAR(80) NOT NULL COMMENT '趋势组名', USERNAME VARCHAR(80) NULL COMMENT '用户名，可以为NULL，为NULL则为公共趋势组', GROUP_INFO VARCHAR(4000) NULL COMMENT 'Json串，存储趋势组内标签名、曲线颜色', VERSION INT NULL COMMENT '版本', CONSTRAINT PK_SM_TREND_GROUP PRIMARY KEY (ID)) COMMENT='趋势组表';

ALTER TABLE SM_TREND_GROUP COMMENT = '趋势组表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-15', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 15, '8:d4efda95596a165c281fe892b9867410', 'createTable tableName=SM_TREND_GROUP', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-16::WangXun
CREATE TABLE SM_USER (ID VARCHAR(50) NOT NULL, GROUP_NAME VARCHAR(80) NULL COMMENT '用户组名', USERNAME VARCHAR(80) NULL COMMENT '用户名', PASSWORD VARCHAR(50) NULL COMMENT '密码', CREATE_BY VARCHAR(50) NOT NULL COMMENT '创建人', CREATE_TIME datetime NOT NULL COMMENT '创建时间', MODIFY_BY VARCHAR(50) NULL COMMENT '修改人', MODIFY_TIME datetime NULL COMMENT '修改时间', REMARK VARCHAR(150) NULL COMMENT '备注', CONSTRAINT PK_SM_USER PRIMARY KEY (ID)) COMMENT='用户表';

ALTER TABLE SM_USER COMMENT = '用户表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-16', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 16, '8:6af1610319a0c483a6d106bb547db17d', 'createTable tableName=SM_USER', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-17::WangXun
CREATE TABLE SM_USER_GROUP (ID VARCHAR(50) NOT NULL, GROUP_NAME VARCHAR(80) NULL COMMENT '用户组名称', CREATE_BY VARCHAR(50) NOT NULL COMMENT '创建人', CREATE_TIME datetime NOT NULL COMMENT '创建时间', MODIFY_BY VARCHAR(50) NULL COMMENT '修改人', MODIFY_TIME datetime NULL COMMENT '修改时间', ACCREDIT1 INT NULL COMMENT '权限1', ACCREDIT2 INT NULL COMMENT '权限2', ACCREDIT3 INT NULL COMMENT '权限3', ACCREDIT4 INT NULL COMMENT '权限4', ACCREDIT5 INT NULL COMMENT '权限5', ACCREDIT6 INT NULL COMMENT '权限6', ACCREDIT7 INT NULL COMMENT '权限7', ACCREDIT8 INT NULL COMMENT '权限8', ACCREDIT9 INT NULL COMMENT '权限9', ACCREDIT10 INT NULL COMMENT '权限10', CONSTRAINT PK_SM_USER_GROUP PRIMARY KEY (ID)) COMMENT='用户组表';

ALTER TABLE SM_USER_GROUP COMMENT = '用户组表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-17', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 17, '8:9326b4b217b049ff888413499cd79725', 'createTable tableName=SM_USER_GROUP', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-18::WangXun
CREATE TABLE SM_USER_GROUP_GRAPH (ID VARCHAR(50) NOT NULL, GROUP_NAME VARCHAR(80) NULL COMMENT '用户组名', GRAPH_NAME VARCHAR(80) NULL COMMENT '流程图名称', WRITE_AUTHORITY INT DEFAULT 0 NULL COMMENT '写权限', CONSTRAINT PK_SM_USER_GROUP_GRAPH PRIMARY KEY (ID)) COMMENT='用户组流程图表';

ALTER TABLE SM_USER_GROUP_GRAPH COMMENT = '用户组流程图表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-18', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 18, '8:d61032dc69b375dac2146e93d14059bf', 'createTable tableName=SM_USER_GROUP_GRAPH', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581396439438-19::WangXun
CREATE TABLE SM_ALARM_OPERATE_DESCRIPTION (ID VARCHAR(50) NOT NULL, TYPE CHAR(1) NULL COMMENT '操作类型:1-确认报警;2-抑制报警;3-确认或抑制报警', `DESCRIPTION` VARCHAR(256) NULL COMMENT '说明内容', CONSTRAINT PK_ALARM_OPERATE_ID PRIMARY KEY (ID)) COMMENT='报警操作描述表';

ALTER TABLE SM_ALARM_OPERATE_DESCRIPTION COMMENT = '报警操作描述表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581396439438-19', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 19, '8:e37d49393977f0ce18da7aeac6d53673', 'createTable tableName=SM_ALARM_OPERATE_DESCRIPTION', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-20::WangXun
CREATE TABLE SM_SystemResource (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, PCode NVARCHAR(50) NULL, Title NVARCHAR(50) NULL, EnTitle NVARCHAR(50) NULL, OrderNo INT NULL, IsHide CHAR(1) NULL, IsSysMenu CHAR(1) NULL, Platform CHAR(1) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, CONSTRAINT PK_SM_SYSTEMRESOURCE PRIMARY KEY (ID)) COMMENT='系统资源表';

ALTER TABLE SM_SystemResource COMMENT = '系统资源表';

INSERT INTO SM_SystemResource (ID, Code, PCode, Title, EnTitle, OrderNo, IsHide, IsSysMenu, Platform, DelFlag) VALUES ('1', 'System', '-1', '生产执行管理系统', 'System', 0, '1', '1', '0', '0');

INSERT INTO SM_SystemResource (ID, Code, PCode, Title, EnTitle, OrderNo, IsHide, IsSysMenu, Platform, DelFlag) VALUES ('2', 'SystemM', 'System', '系统设置', 'SystemM', 3, '1', '1', '0', '0');

INSERT INTO SM_SystemResource (ID, Code, PCode, Title, EnTitle, OrderNo, IsHide, IsSysMenu, Platform, DelFlag) VALUES ('3', 'PM', 'System', '生产监视', 'ProductionMonitoring', 1, '1', '3', '0', '0');

INSERT INTO SM_SystemResource (ID, Code, PCode, Title, EnTitle, OrderNo, IsHide, IsSysMenu, Platform, DelFlag) VALUES ('4', 'RM', 'System', '运行管理', 'RunManagement', 2, '1', '3', '0', '0');

INSERT INTO SM_SystemResource (ID, Code, PCode, Title, EnTitle, OrderNo, IsHide, IsSysMenu, Platform, DelFlag) VALUES ('5', 'PM_Alarm', 'PM', '生产报警', 'ProductionAlarm', 3, '1', '3', '0', '0');

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-20', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 20, '8:860ec362b2c367cecd917c32397cef6a', 'createTable tableName=SM_SystemResource; insert tableName=SM_SystemResource; insert tableName=SM_SystemResource; insert tableName=SM_SystemResource; insert tableName=SM_SystemResource; insert tableName=SM_SystemResource', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-21::WangXun
CREATE TABLE SM_SystemResourceDtl (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, SystemResourceCode NVARCHAR(50) NOT NULL, Title NVARCHAR(50) NULL, EnTitle NVARCHAR(50) NULL, ResourceType CHAR(1) NULL, ResourceUrl NVARCHAR(1000) NULL, ResourceUrlApp NVARCHAR(100) NULL, Parameter NVARCHAR(200) NULL, OrderNo INT NULL, IsHide CHAR(1) NULL, IsSysMenu CHAR(1) NULL, Platform CHAR(1) NULL, ConfCodeVou CHAR(1) NOT NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, CONSTRAINT PK_SM_SYSTEMRESOURCEDTL PRIMARY KEY (ID)) COMMENT='系统资源详细表';

ALTER TABLE SM_SystemResourceDtl COMMENT = '系统资源详细表';

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('44', 'SM_Department', 'SystemM', '组织架构组态', 'Department', '0', '/SM/Department', '', '', 2, '1', '1', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('49', 'SM_Role', 'SystemM', '权限组态', 'Role', '0', '/SM/RoleM', NULL, NULL, 3, '1', '1', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('63', 'PM_Log', 'PM', '生产日志', 'Log', '0', '/PM/Log', NULL, NULL, 4, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('64', 'PM_Trend', 'PM', '生产趋势', 'Trend', '0', '/PM/Trend', '', '', 2, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('65', 'PM_Report', 'PM', '生产报表', 'Report', '0', '/PM/Report', NULL, NULL, 6, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('66', 'PM_Gis', 'PM', 'GIS地图', 'Gis', '0', '/PM/html/Gis.html', NULL, NULL, 7, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('73', 'PM_FlowChart', 'PM', '流程图', 'FlowChart', '0', '/PM/html/FlowChart.html', NULL, NULL, 1, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('75', 'PM_VideoMonitor', 'PM', '视频监视', 'VideoMonitor', '0', '/PM/VideoMonitor', NULL, NULL, 5, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('76', 'RM_System_Alarm', 'RM', '系统报警', 'SystemAlarm', '0', '/RM/SystemAlarm', '', '', 1, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('77', 'RM_System_Log', 'RM', '系统日志', 'SystemLog', '0', '/RM/SystemLog', NULL, NULL, 2, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('79', 'RM_Node_Status', 'RM', '节点状态', 'NodeStatus', '0', '/RM/NodeStatus', NULL, NULL, 3, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('80', 'SM_ProjectArchitecture', 'SystemM', '项目架构组态', 'ProjectArchitecture', '0', '/SM/ProjectArchitecture', '', '', 1, '1', '1', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('81', 'SM_ProjectGis', 'SystemM', 'GIS地图组态', 'ProjectGis', '0', '/SM/ProjectGis', NULL, NULL, 5, '1', '1', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('82', 'PM_Alarm_RealTimeAlarm', 'PM_Alarm', '报警查看', 'AlarmView', '0', 'PM/Alarm/AlarmView', '', '', 1, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('84', 'PM_Alarm_AlarmSuppression', 'PM_Alarm', '报警抑制', 'AlarmSuppression', '0', 'PM/Alarm/AlarmSuppression', NULL, NULL, 3, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('85', 'PM_Alarm_AlarmHiding', 'PM_Alarm', '报警隐藏', 'AlarmHiding', '0', 'PM/Alarm/AlarmHiding', NULL, NULL, 4, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('86', 'SM_ProjectAlarmSet', 'SystemM', '通用设置组态', 'ProjectAlarmSet', '0', '/SM/ProjectAlarmSet', '', '', 6, '1', '1', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('88', 'SM_Report', 'SystemM', '生产报表组态', 'Report', '0', '/SM/Report', '', '', 8, '1', '1', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('89', 'PM_AdvanceReport', 'PM', '高级报表', 'AdvanceReport', '0', '/PM/AdvanceReport', '', '', 8, '1', '3', '0', '1', '0');

INSERT INTO SM_SystemResourceDtl (ID, Code, SystemResourceCode, Title, EnTitle, ResourceType, ResourceUrl, ResourceUrlApp, Parameter, OrderNo, IsHide, IsSysMenu, Platform, ConfCodeVou, DelFlag) VALUES ('90', 'SM_VideoDeviceAccount', 'SystemM', '视频账户组态', 'VideoDevice', '0', '/SM/VideoDevice', '', '', 9, '1', '3', '0', '1', '0');

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-21', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 21, '8:d9deb1cb97fdc4e3c66e08ecc268f1c3', 'createTable tableName=SM_SystemResourceDtl; insert tableName=SM_SystemResourceDtl; insert tableName=SM_SystemResourceDtl; insert tableName=SM_SystemResourceDtl; insert tableName=SM_SystemResourceDtl; insert tableName=SM_SystemResourceDtl; insert t...', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1574840696094-22::WangXun
CREATE TABLE SM_SystemResourceRmisDtl (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, SystemResourceCode NVARCHAR(50) NOT NULL, DeployID INT NULL, Title NVARCHAR(100) NULL, EnTitle NVARCHAR(50) NULL, ResourceType CHAR(1) NULL, Parameter NVARCHAR(200) NULL, OrderNo INT NULL, IsHide CHAR(1) NULL, IsSysMenu CHAR(1) NULL, Platform CHAR(1) NULL, ConfCodeVou CHAR(1) NOT NULL, DelFlag CHAR(1) NOT NULL, ExternalNetwork NVARCHAR(200) NULL, CONSTRAINT PK_SM_SYSTEMRESOURCERMISDTL PRIMARY KEY (ID));

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-22', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 22, '8:28fd20175013a92c84ab9cd896a97e3b', 'createTable tableName=SM_SystemResourceRmisDtl', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1574840696094-23::WangXun
CREATE TABLE t_deply (Id NVARCHAR(50) NOT NULL, name VARCHAR(64) NOT NULL, `description` VARCHAR(64) NULL, type INT NOT NULL, sort INT NOT NULL, `path` VARCHAR(128) NOT NULL, pid INT NOT NULL, RTDBServer NVARCHAR(64) NULL, CONSTRAINT PK_T_DEPLY PRIMARY KEY (Id));

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-23', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 23, '8:773add95ffa235282d148f8b9dc67470', 'createTable tableName=t_deply', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-24::WangXun
CREATE VIEW V_SM_Log AS SELECT
            A.ID,
            A.strOperater,
            A.strOperateTime,
            A.strLabelName,
            A.strLabelDescribe,
            A.nLogSource,
            A.nStatus,
            CASE

            WHEN A.nLogSource = 1 THEN
            'iODS'
            WHEN A.nLogSource = 2 THEN
            '系统日志'
            WHEN A.nLogSource = 3 THEN
            'DCS' ELSE ''
            END AS strLogSourceName,
            A.strOperateRoute,
            CASE

            WHEN A.nLogSource = 1 THEN
            IFNULL( B_1.Title, N'' )
            WHEN A.nLogSource = 2 THEN
            IFNULL( B_1.Title, N'' )
            WHEN A.nLogSource = 3 THEN
            ''
            END AS strOperateRouteName,
            CASE

            WHEN A.nLogSource = 3 THEN
            0 ELSE A.nOperateContentKey
            END AS nOperateContentKey,
            CASE

            WHEN A.nLogSource = 1
            AND nStatus = 0
            AND LENGTH( A.strContent ) = 0 THEN
            '失败'
            WHEN A.nLogSource = 1
            AND nStatus = 1
            AND ( A.nOperateContentKey = 11 OR A.nOperateContentKey = 12 ) THEN
            ( '由' + A.strPreContent + '改为' + A.strafterContent )
            WHEN A.nLogSource = 1
            AND nStatus = 1
            AND A.nOperateContentKey = 10 THEN
            ( '置为' + A.strafterContent + ',脉冲时间为' + A.strPreContent + '毫秒' ) ELSE A.strContent
            END AS strContent,
            CASE

            WHEN A.nLogSource = 3 THEN
            '其他' ELSE C.strOperateContent
            END AS strOperateContent,
            CASE

            WHEN LENGTH( A.strArea ) >
            0 THEN
            A.strArea ELSE IFNULL( D.strArea, N'' )
            END AS strArea,
            CASE

            WHEN LENGTH( A.strDevice ) >
            0 THEN
            A.strDevice ELSE IFNULL( D.strDevice, N'' )
            END AS strDevice,
            CASE

            WHEN LENGTH( A.strUnit ) >
            0 THEN
            A.strUnit ELSE IFNULL( D.strUnit, N'' )
            END AS strUnit
            FROM
            SM_Log AS A
            LEFT OUTER JOIN (
            SELECT
            ID,
            Code,
            PCode,
            OrderNo,
            Title,
            EnTitle,
            DelFlag,
            IsSysMenu,
            '' AS Type,
            '' AS ResourceUrl,
            '' AS Parameter,
            IsHide,
            '' AS ExternalNetwork
            FROM
            SM_SystemResource UNION
            SELECT
            ID,
            Code,
            SystemResourceCode AS PCode,
            OrderNo,
            Title,
            EnTitle,
            DelFlag,
            IsSysMenu,
            '' AS Type,
            ResourceUrl,
            Parameter,
            IsHide,
            '' AS ExternalNetwork
            FROM
            SM_SystemResourceDtl UNION
            SELECT
            a.ID,
            a.Code,
            a.SystemResourceCode AS PCode,
            a.OrderNo,
            a.Title,
            a.EnTitle,
            a.DelFlag,
            a.IsSysMenu,
            b.type,
            b.path AS ResourceUrl,
            a.Parameter,
            a.IsHide,
            a.ExternalNetwork
            FROM
            SM_SystemResourceRmisDtl AS a
            LEFT OUTER JOIN t_deply AS b ON a.DeployID = b.Id
            ) AS B_1 ON A.strOperateRoute = B_1.Code
            AND A.nLogSource = 2
            LEFT OUTER JOIN SM_OperateContent AS C ON C.nOperateContentKey = A.nOperateContentKey
            LEFT OUTER JOIN SM_ProjectTag AS D ON D.strName = A.strLabelName;

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-24', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 24, '8:838b665f05d5ce3395bc815e2533e4e2', 'createView viewName=V_SM_Log', '', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-25::WangXun
--  新建角色表(AM_ROLE)
CREATE TABLE AM_ROLE (ID VARCHAR(32) NOT NULL, TYPE VARCHAR(32) NULL COMMENT '角色类型', CODE VARCHAR(32) NULL COMMENT '角色编码', NAME VARCHAR(64) NOT NULL COMMENT '角色名称', REMARK VARCHAR(128) NULL COMMENT '角色描述', DELETE_TAG CHAR(1) DEFAULT 'N' NULL COMMENT '删除标识:‘Y’-已删除，‘N’-未删除', CREATE_TIME datetime NULL COMMENT '创建时间', CREATE_BY VARCHAR(32) NULL COMMENT '创建人', UPDATE_TIME datetime NULL COMMENT '修改时间', UPDATE_BY VARCHAR(32) NULL COMMENT '修改人', CONSTRAINT PK_ROLE_ID PRIMARY KEY (ID)) COMMENT='角色表';

ALTER TABLE AM_ROLE COMMENT = '角色表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-25', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 25, '8:fd5559a2b9ed1371d8dba84064a6edc7', 'createTable tableName=AM_ROLE', '新建角色表(AM_ROLE)', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-26::WangXun
--  新建用户表(AM_USER)
CREATE TABLE AM_USER (ID VARCHAR(32) NOT NULL, EXTERNAL_ID VARCHAR(32) NULL COMMENT '外部标识', USERNAME VARCHAR(64) NOT NULL COMMENT '登录用户名', PASSWORD VARCHAR(64) NOT NULL COMMENT '密码', PASSWORD_TYPE INT DEFAULT 0 NULL COMMENT '密码类型:0-初始密码,1-用户自定义密码', TYPE_CODE VARCHAR(32) NULL COMMENT '用户类型', DEPART_NAME VARCHAR(64) NULL COMMENT '部门名称', NICK_NAME VARCHAR(64) NULL COMMENT '昵称', PERSON_NAME VARCHAR(64) NULL COMMENT '人员名称', WORK_NO VARCHAR(32) NULL COMMENT '工号', EMAIL VARCHAR(32) NULL COMMENT '邮箱', WECHAT VARCHAR(32) NULL COMMENT '微信', PHONE VARCHAR(11) NULL COMMENT '手机', ONLINE CHAR(1) DEFAULT 'N' NULL COMMENT '是否在线:''Y''-在线，‘N’-离线', DELETE_TAG CHAR(1) DEFAULT 'N' NULL COMMENT '删除标识:‘Y’-已删除，‘N’-未删除', ENABLE CHAR(1) DEFAULT 'Y' NULL COMMENT '启用状态:''Y''-启用，‘N’禁用', STATUS_CODE VARCHAR(32) NULL COMMENT '用户状态码', IS_SUPER CHAR(1) DEFAULT 'N' NULL COMMENT '是否超级管理员', CREATE_TIME datetime NULL COMMENT '创建时间', CREATE_BY VARCHAR(32) NULL COMMENT '创建人', UPDATE_TIME datetime NULL COMMENT '修改时间', UPDATE_BY VARCHAR(32) NULL COMMENT '修改人', CONSTRAINT PK_USER_ID PRIMARY KEY (ID), CONSTRAINT UN_USERNAME UNIQUE (USERNAME)) COMMENT='用户表';

ALTER TABLE AM_USER COMMENT = '用户表';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-26', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 26, '8:e0721a07b1ef04f8528c9d7b67d7fe24', 'createTable tableName=AM_USER', '新建用户表(AM_USER)', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Changeset src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml::1581416841954-27::WangXun
--  创建用户角色关系表(AM_USER_ROLE)
CREATE TABLE AM_USER_ROLE (ID VARCHAR(32) NOT NULL, ROLE_ID VARCHAR(32) NOT NULL COMMENT '角色编号', USER_ID VARCHAR(32) NOT NULL COMMENT '用户编号', CONSTRAINT PK_USER_ROLE_ID PRIMARY KEY (ID)) COMMENT='用户角色';

ALTER TABLE AM_USER_ROLE COMMENT = '用户角色';

INSERT INTO DV_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1581416841954-27', 'WangXun', 'src/main/resources/liquibase/changelog/20200211-HuaYou-Database.xml', NOW(), 27, '8:cc5f566b5ecd0f4dd2650035d291afa6', 'createTable tableName=AM_USER_ROLE', '创建用户角色关系表(AM_USER_ROLE)', 'EXECUTED', NULL, NULL, '3.8.2', '3907769849');

--  Release Database Lock
UPDATE DV_CHANGE_LOG_LOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

