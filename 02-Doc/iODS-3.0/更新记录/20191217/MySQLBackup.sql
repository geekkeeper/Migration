--  *********************************************************************
--  Update Database Script
--  *********************************************************************
--  Change Log: src/main/resources/db/changelog-master.xml
--  Ran at: 19-12-17 下午4:37
--  Against: root@172.21.48.50@jdbc:mysql://172.21.50.60:3306/HiODSDB?serverTimezone=GMT%2B8
--  Liquibase version: 3.8.1
--  *********************************************************************

CREATE DATABASE HiODSDB CHARACTER SET utf8;
USE HiODSDB;

--  Create Database Lock Table
CREATE TABLE VC_CHANGE_LOG_LOCK (ID INT NOT NULL, `LOCKED` BIT(1) NOT NULL, LOCKGRANTED datetime NULL, LOCKEDBY VARCHAR(255) NULL, CONSTRAINT PK_VC_CHANGE_LOG_LOCK PRIMARY KEY (ID));

--  Initialize Database Lock Table
DELETE FROM VC_CHANGE_LOG_LOCK;

INSERT INTO VC_CHANGE_LOG_LOCK (ID, `LOCKED`) VALUES (1, 0);

--  Lock Database
UPDATE VC_CHANGE_LOG_LOCK SET `LOCKED` = 1, LOCKEDBY = 'wangxun183963 (192.168.53.113)', LOCKGRANTED = '2019-12-17 16:37:12.122' WHERE ID = 1 AND `LOCKED` = 0;

--  Create Database Change Log Table
CREATE TABLE VC_CHANGE_LOG (ID VARCHAR(255) NOT NULL, AUTHOR VARCHAR(255) NOT NULL, FILENAME VARCHAR(255) NOT NULL, DATEEXECUTED datetime NOT NULL, ORDEREXECUTED INT NOT NULL, EXECTYPE VARCHAR(10) NOT NULL, MD5SUM VARCHAR(35) NULL, `DESCRIPTION` VARCHAR(255) NULL, COMMENTS VARCHAR(255) NULL, TAG VARCHAR(255) NULL, LIQUIBASE VARCHAR(20) NULL, CONTEXTS VARCHAR(255) NULL, LABELS VARCHAR(255) NULL, DEPLOYMENT_ID VARCHAR(10) NULL);

--  Changeset src/main/resources/db/changelog-master.xml::v1.0.0.0::WangXun
INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('v1.0.0.0', 'WangXun', 'src/main/resources/db/changelog-master.xml', NOW(), 1, '8:388ce887c8f2ab23d6aa90d054d4aa3c', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438', 'v1.0.0.0');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-1::WangXun
CREATE TABLE CF_Alarm (ID NVARCHAR(50) NOT NULL COMMENT '主键', nAlarmType INT NULL COMMENT '报警类型（上限，上上限......）', nAlarmState INT NULL COMMENT '报警状态', nAlarmlevel INT NULL COMMENT '报警级别', strEventTime datetime NULL COMMENT '报警时间', strTagName NVARCHAR(100) NULL COMMENT '标签名称', strTagDes NVARCHAR(128) NULL COMMENT '标签描述', strArea NVARCHAR(64) NOT NULL COMMENT '区域，为DCS日志设计', strDevice NVARCHAR(64) NOT NULL COMMENT '装置，为DCS日志设计', strUnit NVARCHAR(64) NOT NULL COMMENT '单元,为DCS日志设计', strMsgDes NVARCHAR(100) NULL COMMENT '报警描述', fAlarmlimit FLOAT(53) NULL COMMENT '报警阀值', strAlarmValue NVARCHAR(30) NULL COMMENT '报警实时值', strRecoveryTime datetime NULL COMMENT '恢复时间', strAckedTime datetime NULL COMMENT '确认时间', strAckedComment NVARCHAR(255) NULL COMMENT '恢复内容', nSource INT NULL COMMENT '报警来源', strIsHide CHAR(1) NULL COMMENT '是否隐藏后产生0：非隐藏后生产 1：隐藏后生成', strNodeDomain NVARCHAR(255) NULL, strTypeName NVARCHAR(10) NULL COMMENT '报警类型', strAlarmTypeDes NVARCHAR(60) NULL COMMENT '报警类型描述', nPushStatus INT NULL, strAlarmLevelDes NVARCHAR(30) NULL COMMENT '报警级别描述') COMMENT='生产报警信息';

ALTER TABLE CF_Alarm COMMENT = '生产报警信息';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-1', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 2, '8:79d13fd66a2592e2b82784394d28dc10', 'createTable tableName=CF_Alarm', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-2::WangXun
CREATE TABLE CF_AlarmHis (ID NVARCHAR(50) NOT NULL COMMENT '主键', nAlarmType INT NULL COMMENT '报警类型（上限，上上限......）', nAlarmState INT NULL COMMENT '报警状态', nAlarmlevel INT NULL COMMENT '报警级别', strEventTime datetime NULL COMMENT '报警时间', strTagName NVARCHAR(100) NULL COMMENT '标签名称', strTagDes NVARCHAR(128) NOT NULL COMMENT '标签描述', strArea NVARCHAR(64) NOT NULL COMMENT '区域，为DCS日志设计', strDevice NVARCHAR(64) NOT NULL COMMENT '装置，为DCS日志设计', strUnit NVARCHAR(64) NOT NULL COMMENT '单元,为DCS日志设计', strMsgDes NVARCHAR(100) NULL COMMENT '报警描述', fAlarmlimit FLOAT(53) NULL COMMENT '报警阀值', strAlarmValue NVARCHAR(30) NULL COMMENT '报警实时值', strRecoveryTime datetime NULL COMMENT '恢复时间', strAckedTime datetime NULL COMMENT '确认时间', strAckedComment NVARCHAR(255) NULL COMMENT '恢复内容', nSource INT NULL COMMENT '报警来源', strIsHide CHAR(1) NULL COMMENT '是否隐藏后产生0：非隐藏后生产 1：隐藏后生成', strNodeDomain NVARCHAR(255) NULL, strTypeName NVARCHAR(10) NULL COMMENT '报警类型', strAlarmTypeDes NVARCHAR(60) NULL COMMENT '报警类型描述', nPushStatus INT NULL, strAlarmLevelDes NVARCHAR(30) NULL COMMENT '报警级别描述') COMMENT='生产报警信息';

ALTER TABLE CF_AlarmHis COMMENT = '生产报警信息';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-2', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 3, '8:06880291bbb8d82cee28379d72e65731', 'createTable tableName=CF_AlarmHis', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-3::WangXun
CREATE TABLE CF_ForbidAlarm (ID NVARCHAR(50) NOT NULL, nAlarmType INT NOT NULL COMMENT '报警类型（上限，上上限......）', strTagName NVARCHAR(100) NOT NULL COMMENT '标签名称', strTagDes NVARCHAR(100) NOT NULL COMMENT '标签描述', strOperater NVARCHAR(100) NOT NULL COMMENT '操作人', strForbidTime datetime NOT NULL COMMENT '抑制时间', CONSTRAINT PK_FBALARMID PRIMARY KEY (ID)) COMMENT='抑制报警设置';

ALTER TABLE CF_ForbidAlarm COMMENT = '抑制报警设置';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-3', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 4, '8:5e5da4fdf65b0844d0b2d2130a39a9fa', 'createTable tableName=CF_ForbidAlarm', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-4::WangXun
CREATE TABLE CF_HideAlarm (ID NVARCHAR(50) NOT NULL, nAlarmType INT NOT NULL COMMENT '报警类型（上限，上上限......）', strTagName NVARCHAR(100) NOT NULL COMMENT '标签名称', strTagDes NVARCHAR(100) NOT NULL COMMENT '标签描述', strOperater NVARCHAR(100) NOT NULL COMMENT '操作人', strHideTime datetime NOT NULL COMMENT '隐藏时间', CONSTRAINT PK_HDALARMID PRIMARY KEY (ID)) COMMENT='隐藏报警设置';

ALTER TABLE CF_HideAlarm COMMENT = '隐藏报警设置';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-4', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 5, '8:114ad6cb5bfb62e36f93bbc9bd947fd7', 'createTable tableName=CF_HideAlarm', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-5::WangXun
CREATE TABLE CF_NodeState (ID NVARCHAR(50) NOT NULL, nCPULoad INT NOT NULL COMMENT 'CPU负荷', fTemperature FLOAT(53) NOT NULL COMMENT '温度', nMemoryLoad INT NOT NULL COMMENT '内存负荷', nState INT NOT NULL COMMENT '状态 -1:初始化  0：不正常  1:正常', nNodeType INT NOT NULL COMMENT '节点类型（0普通节点，1网闸安全侧，2网闸开放侧，3云卡）', nNodePCID INT NULL COMMENT 'PC号', strStateTime datetime NOT NULL COMMENT '更新时间', strSerialNum NVARCHAR(20) NULL COMMENT '网闸序列号', fNetworkALoad FLOAT(53) NULL, fNetworkBLoad FLOAT(53) NULL, CONSTRAINT PK_NODESTATEID PRIMARY KEY (ID)) COMMENT='组态节点状态信息';

ALTER TABLE CF_NodeState COMMENT = '组态节点状态信息';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-5', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 6, '8:2b1a62edb1efe6bc19b2afecd236c229', 'createTable tableName=CF_NodeState', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-6::WangXun
CREATE TABLE CF_ProcessState (ID NVARCHAR(50) NOT NULL, nProcessID INT NOT NULL COMMENT '进程ID', nNodePCID INT NOT NULL COMMENT 'PC号	关联表CF_NodeState', nState INT NOT NULL COMMENT '状态 -1:初始化  0：不正常  1:正常', strProcessName NVARCHAR(100) NOT NULL COMMENT '进程名', strStateTime datetime NOT NULL COMMENT '更新时间', CONSTRAINT PK_PROCESSSTATEID PRIMARY KEY (ID)) COMMENT='节点PC下的进程状态信息，非主表，无UUID';

ALTER TABLE CF_ProcessState COMMENT = '节点PC下的进程状态信息，非主表，无UUID';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-6', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 7, '8:1f56cd028b6620143948dc49db0792b7', 'createTable tableName=CF_ProcessState', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-7::WangXun
CREATE TABLE CF_ServiceState (ID NVARCHAR(50) NOT NULL, nNodePCID INT NOT NULL COMMENT 'PC号	关联CF_ProcessState', nState INT NOT NULL COMMENT '状态 -1:初始化  0：不正常  1:正常  2:部分正常', strServiceName NVARCHAR(100) NOT NULL COMMENT '服务名称', strProcessName NVARCHAR(100) NOT NULL COMMENT '进程名称	关联CF_ProcessState', CONSTRAINT PK_SERVICESTATEID PRIMARY KEY (ID)) COMMENT='PC节点进程下的驱动服务信息 ，非主表，无UUID';

ALTER TABLE CF_ServiceState COMMENT = 'PC节点进程下的驱动服务信息 ，非主表，无UUID';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-7', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 8, '8:15a10c5e5f22de2669cb0ecd2b5ce720', 'createTable tableName=CF_ServiceState', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-8::WangXun
CREATE TABLE CF_SysAlarm (ID NVARCHAR(50) NOT NULL, nAlarmType INT NULL COMMENT '报警类型（上限，上上限......）', nAlarmState INT NULL COMMENT '报警状态', nAlarmlevel INT NULL COMMENT '报警级', strEventTime datetime NULL COMMENT '事件发生事件', strTagName NVARCHAR(100) NULL COMMENT '标签名', strTagDes NVARCHAR(100) NULL COMMENT '标签描述', strArea NVARCHAR(64) NULL COMMENT '区域，为DCS日志设计', strDevice NVARCHAR(64) NULL COMMENT '装置，为DCS日志设计', strUnit NVARCHAR(64) NULL COMMENT '单元,为DCS日志设计', strMsgDes NVARCHAR(100) NULL COMMENT '事件信息描述', fAlarmlimit FLOAT(53) NULL COMMENT '报警限', strAlarmValue NVARCHAR(30) NULL COMMENT '报警时刻值', strRecoveryTime datetime NULL COMMENT '恢复事件', strAckedTime datetime NULL COMMENT '报警确认时间', strAckedComment NVARCHAR(255) NULL COMMENT '报警确认信息', nSource INT NULL COMMENT '来源 1:DCS 2:ODS生产 3:ODS设备', strIsHide CHAR(1) NULL COMMENT '是否隐藏后产生0：非隐藏后生产 1：隐藏后生成', strTypeName NVARCHAR(10) NULL COMMENT '报警类型', strAlarmTypeDes NVARCHAR(60) NULL COMMENT '报警类型描述', strAlarmLevelDes NVARCHAR(30) NULL COMMENT '报警级别描述', CONSTRAINT PK_HIDENALERMID PRIMARY KEY (ID)) COMMENT='系统报警信息';

ALTER TABLE CF_SysAlarm COMMENT = '系统报警信息';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-8', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 9, '8:e34c591ee04d4a799a2e15e598cc8af3', 'createTable tableName=CF_SysAlarm', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-9::WangXun
CREATE TABLE PM_TrendGroup (ID NVARCHAR(50) NOT NULL, strInputCode NVARCHAR(50) NOT NULL COMMENT '创建人code', strInputDate datetime DEFAULT NOW() NOT NULL COMMENT '创建时间', strDeptCode NVARCHAR(50) NULL COMMENT '部门code', strCorpCode NVARCHAR(50) NULL COMMENT '公司code', strModifyCode NVARCHAR(50) NOT NULL COMMENT '修改人code', strModifyDate datetime DEFAULT NOW() NOT NULL COMMENT '修改时间', strTrendGroupName NVARCHAR(50) NOT NULL COMMENT '趋势组名称', nTrendGroupType INT DEFAULT 0 NOT NULL COMMENT '趋势组类型，0公共趋势组   1自定义趋势组', strProjectCode NVARCHAR(50) NOT NULL COMMENT '项目架构code', strDelFlag CHAR(1) DEFAULT '0' NOT NULL COMMENT '删除标志 1删除  0未删除', CONSTRAINT PK_PM_TrendGroup PRIMARY KEY (ID)) COMMENT='趋势组表';

ALTER TABLE PM_TrendGroup COMMENT = '趋势组表';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-9', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 10, '8:44e8a061d5c8b2f2fb3501e131c49bc2', 'createTable tableName=PM_TrendGroup', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-10::WangXun
CREATE TABLE PM_TrendGroupAndTag (ID NVARCHAR(50) NOT NULL, strInputCode NVARCHAR(50) NOT NULL COMMENT '创建人code', strInputDate datetime DEFAULT NOW() NOT NULL COMMENT '创建时间', strDeptCode NVARCHAR(50) NULL COMMENT '部门code', strCorpCode NVARCHAR(50) NULL COMMENT '公司code', strModifyCode NVARCHAR(50) NOT NULL COMMENT '修改人code', strModifyDate datetime DEFAULT NOW() NOT NULL COMMENT '修改时间', strTrendGroupID NVARCHAR(50) NOT NULL COMMENT '趋势组ID', strTagName NVARCHAR(64) NOT NULL COMMENT '标签点名称', strTagDes NVARCHAR(128) NOT NULL COMMENT '标签点描述', strTagColor NVARCHAR(50) NOT NULL COMMENT '标签点颜色', nLowest INT DEFAULT 0 NOT NULL COMMENT '最低值', nHighest INT DEFAULT 0 NOT NULL COMMENT '最高值', strDelFlag CHAR(1) DEFAULT '0' NOT NULL COMMENT '删除标志，1删除  0未删除', CONSTRAINT PK_PM_TrendGroupAndTag PRIMARY KEY (ID)) COMMENT='趋势组和标签点关系表';

ALTER TABLE PM_TrendGroupAndTag COMMENT = '趋势组和标签点关系表';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-10', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 11, '8:e161854605300827fb37b07cacb1c3b0', 'createTable tableName=PM_TrendGroupAndTag', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-11::WangXun
CREATE TABLE SM_Attachment (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, EntityName NVARCHAR(100) NOT NULL, Name NVARCHAR(200) NULL, `Path` NVARCHAR(1000) NULL, Size NVARCHAR(50) NULL, UploadTime datetime NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, PersonCode NVARCHAR(50) NULL, ModuleId NVARCHAR(50) NULL, CONSTRAINT PK_SM_ATTACHMENT PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-11', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 12, '8:9067116da2ff5e6f7eea2905f97e7570', 'createTable tableName=SM_Attachment', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-12::WangXun
CREATE TABLE SM_Biz (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, CodeLength INT NULL, Prefix NVARCHAR(20) NULL, Suffix NVARCHAR(10) NULL, CodeOrder NVARCHAR(10) NULL, ModuleCode NVARCHAR(50) NULL, ValueSource NVARCHAR(10) NULL, ISYMD CHAR(1) NULL, MaxCode NVARCHAR(10) NULL, MinCode NVARCHAR(10) NULL, SerialEntity NVARCHAR(10) NULL, SerialTimeGran NVARCHAR(10) NULL, PolishChar NVARCHAR(1) NULL, PolishRule NVARCHAR(10) NULL, Name NVARCHAR(20) NULL, Radix NVARCHAR(10) NULL, Remark NVARCHAR(500) NULL, DelFlag CHAR(1) NOT NULL, InputCode NVARCHAR(50) NOT NULL, InputDate datetime NOT NULL, DeptCode NVARCHAR(50) NOT NULL, CorpCode NVARCHAR(50) NOT NULL, ModifyCode NVARCHAR(50) NOT NULL, ModifyDate datetime NOT NULL, CONSTRAINT PK_BD_BIZ PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-12', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 13, '8:63dd70f2ac954fbea27c7096e4cd580f', 'createTable tableName=SM_Biz', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-13::WangXun
CREATE TABLE SM_CodeVou (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, FiscalYear NVARCHAR(4) NULL, CurrNo INT NULL, LastUpdateDay NVARCHAR(2) NULL, FiscalMonth NVARCHAR(2) NULL, Remark NVARCHAR(500) NULL, DelFlag CHAR(1) NOT NULL, InputCode NVARCHAR(50) NOT NULL, InputDate datetime NOT NULL, DeptCode NVARCHAR(50) NOT NULL, CorpCode NVARCHAR(50) NOT NULL, ModifyCode NVARCHAR(50) NOT NULL, ModifyDate datetime NOT NULL, CONSTRAINT PK_BD_CODEVOU PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-13', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 14, '8:37f6a29fc86991f5c053dff235a53307', 'createTable tableName=SM_CodeVou', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-14::WangXun
CREATE TABLE SM_Department (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, Pcode NVARCHAR(50) NOT NULL, Name NVARCHAR(50) NULL, Charge NVARCHAR(50) NULL, OrderNo INT NULL, IsCompany CHAR(1) NULL, IsProductionDept CHAR(1) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, CONSTRAINT PK_SM_DEPARTMENT PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-14', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 15, '8:412e6ccf2725d46478c793288c0397d2', 'createTable tableName=SM_Department', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-15::WangXun
CREATE TABLE SM_GeneralSettings (ID NVARCHAR(50) NOT NULL, AlarmVoiceCycleNum INT DEFAULT 3 NOT NULL COMMENT '报警声音轮询条数设置，默认3', ConnInterruptTime INT DEFAULT 0 NOT NULL COMMENT '连接中断时间设置，单位分钟', LogoutTime INT DEFAULT 0 NOT NULL COMMENT '无操作注销时间设置，单位分钟', PassWordInValidTime INT NOT NULL COMMENT '密码失效时间设置，单位月', NetworkRecordNumber NVARCHAR(256) NOT NULL COMMENT '版权和网络备案号', LoginBackGroundPicture LONGBLOB NULL COMMENT '登陆页背景图设置，存储文件流', MainLogoPicture LONGBLOB NULL COMMENT '主界面logo设置', CreateTime datetime DEFAULT NOW() NOT NULL COMMENT '创建时间', ModifiedTime datetime DEFAULT NOW() NOT NULL COMMENT '修改设置时间', HomeBackgroundPicture LONGBLOB NULL COMMENT '主页背景图片', CONSTRAINT PK_SM_GeneralSettings PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-15', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 16, '8:f01741510431644f91914c3fa61ad095', 'createTable tableName=SM_GeneralSettings', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-16::WangXun
CREATE TABLE SM_ListFieldConfig (ID NVARCHAR(50) NOT NULL, SystemResourceDtlCode NVARCHAR(50) NOT NULL, ResourceUrl NVARCHAR(200) NULL, ResorceFile NVARCHAR(200) NULL, FieldID NVARCHAR(100) NOT NULL, FieldName NVARCHAR(100) NOT NULL, IsHide CHAR(1) NULL, IsSysMenu CHAR(1) NULL, Remark NVARCHAR(500) NULL, CONSTRAINT PK_SM_LISTFIELDCONFIG PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-16', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 17, '8:7704a94ef285ac1fb22d049d95a573fd', 'createTable tableName=SM_ListFieldConfig', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-17::WangXun
CREATE TABLE SM_Log (ID NVARCHAR(50) NOT NULL, strOperater NVARCHAR(100) NOT NULL COMMENT '创建人', strOperateTime datetime DEFAULT NOW() NOT NULL COMMENT '创建时间', nLogSource INT DEFAULT 2 NOT NULL COMMENT '日志来源 生产日志 = 1,系统日志 = 2,DCS日志 = 3', nOperateContentKey INT DEFAULT 0 NOT NULL COMMENT '其他0，登录注销1、新增2、删除3、修改4，置位 = 10,写模拟量值 = 11,', nStatus INT DEFAULT 1 NOT NULL COMMENT '状态 1成功  0失败', strIP NVARCHAR(50) NOT NULL COMMENT 'ip', strLabelName NVARCHAR(64) NOT NULL COMMENT '标签名', strLabelDescribe NVARCHAR(128) NULL COMMENT '标签描述', strArea NVARCHAR(64) NULL COMMENT '区域，为DCS日志设计', strDevice NVARCHAR(64) NULL COMMENT '装置，为DCS日志设计', strUnit NVARCHAR(64) NULL COMMENT '单元,为DCS日志设计', strOperateRoute NVARCHAR(255) NULL COMMENT '页面编码或者流程图id', strPreContent NVARCHAR(255) NULL COMMENT '修改前值', strafterContent NVARCHAR(255) NULL COMMENT '修改后值', strContent NVARCHAR(255) NULL COMMENT '日志详情', CONSTRAINT PK_NLOGID PRIMARY KEY (ID)) COMMENT='日志表';

ALTER TABLE SM_Log COMMENT = '日志表';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-17', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 18, '8:0655450a856bee7e2e956d752d8909d7', 'createTable tableName=SM_Log', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-18::WangXun
CREATE TABLE SM_MessageInfo (ID NVARCHAR(50) NOT NULL, Title NVARCHAR(50) NULL, EndTime datetime NULL, Content NVARCHAR(4000) NULL, Sender NVARCHAR(50) NULL, SendTime datetime NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, MsgType INT NULL, nPushStatus INT NULL, Client INT NULL, CONSTRAINT PK_SM_MESSAGEINFO PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-18', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 19, '8:23be49f386db6ef19b20b87a3d516692', 'createTable tableName=SM_MessageInfo', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-19::WangXun
CREATE TABLE SM_MessageInfoDtl (ID NVARCHAR(50) NOT NULL, PID NVARCHAR(50) NULL, PersonCode NVARCHAR(50) NULL, IsRead CHAR(1) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, CONSTRAINT PK_SM_MESSAGEINFODTL PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-19', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 20, '8:f5233e64b3078a0433fafef8af306250', 'createTable tableName=SM_MessageInfoDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-20::WangXun
CREATE TABLE SM_OperateContent (ID NVARCHAR(50) NOT NULL, nOperateContentKey NVARCHAR(50) NOT NULL, strOperateContent NVARCHAR(50) NOT NULL COMMENT '操作类型key对应的汉字', CONSTRAINT PK_SM_OperateContent PRIMARY KEY (nOperateContentKey)) COMMENT='操作类型key,value对应表';

ALTER TABLE SM_OperateContent COMMENT = '操作类型key,value对应表';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-20', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 21, '8:ea42b78ac7c49ff0be2cf3bff74d70e9', 'createTable tableName=SM_OperateContent', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-21::WangXun
CREATE TABLE SM_PageButtonConfig (ID NVARCHAR(50) NOT NULL, SystemResourceDtlCode NVARCHAR(50) NOT NULL, ResourceUrl NVARCHAR(200) NULL, ButtonID NVARCHAR(100) NOT NULL, ButtonName NVARCHAR(100) NOT NULL, Remark NVARCHAR(500) NULL, IsSysMenu CHAR(1) NULL, CONSTRAINT PK_SM_PAGEBUTTONCONFIG PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-21', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 22, '8:d1fccca7b81a60a8e4cfa27f30c3e5f8', 'createTable tableName=SM_PageButtonConfig', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-22::WangXun
CREATE TABLE SM_Person (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, Name NVARCHAR(50) NULL, Sex CHAR(1) NULL, WorkNum NVARCHAR(50) NULL, Account NVARCHAR(50) NULL, Password NVARCHAR(200) NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, Duty NVARCHAR(50) NULL, Position INT NULL, Superior NVARCHAR(50) NULL, Mobile NVARCHAR(20) NULL, Email NVARCHAR(50) NULL, OrderNo INT NULL, PersonStatus CHAR(1) NOT NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, RandCode INT NULL, LastPasswordChangeTime datetime DEFAULT NOW() NOT NULL, CONSTRAINT PK_SM_PERSON PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-22', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 23, '8:9d940b5472f38201c307e1890fc4a497', 'createTable tableName=SM_Person', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-23::WangXun
CREATE TABLE SM_PersonDataPower (ID NVARCHAR(50) NOT NULL, PersonCode NVARCHAR(50) NOT NULL, SystemResourceDtlCode NVARCHAR(50) NULL, DataPower CHAR(1) NULL, CustomPower NVARCHAR(1000) NULL, strIsEnable CHAR(1) NULL, CONSTRAINT PK_SM_PERSONDATAPOWER PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-23', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 24, '8:70c36da5f96ade10e3e5469eb2b763e9', 'createTable tableName=SM_PersonDataPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-24::WangXun
CREATE TABLE SM_PersonDepart_Rel (ID NVARCHAR(50) NOT NULL, PersonCode NVARCHAR(50) NULL COMMENT '用户编码', DepartCode NVARCHAR(50) NULL COMMENT '归属部门编码', CONSTRAINT PK_SM_PERSONDEPART_REL PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-24', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 25, '8:7b4d36c13ecf830df3f29c0790bfb436', 'createTable tableName=SM_PersonDepart_Rel', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-25::WangXun
CREATE TABLE SM_PersonDeptPower (ID NVARCHAR(50) NOT NULL, PersonCode NVARCHAR(50) NOT NULL, DeptCode NVARCHAR(50) NULL, CONSTRAINT PK_SM_PERSONDEPTPOWER PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-25', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 26, '8:4769c5ae0b8e3276656dd8d9b9bb9392', 'createTable tableName=SM_PersonDeptPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-26::WangXun
CREATE TABLE SM_PersonProjectPower (ID NVARCHAR(50) NOT NULL, strPersonCode NVARCHAR(50) NULL COMMENT '项目架构关联用户编码', strProjectCode NVARCHAR(50) NULL COMMENT '项目架构叶子节点项编码', strItem NVARCHAR(50) NULL COMMENT '项目架构权限项', strPowerCode NVARCHAR(50) NULL COMMENT '项目架构权限项父节点编码', strDataPower CHAR(1) NULL COMMENT '数据权限', strCustomPower NVARCHAR(500) NULL COMMENT '自定义权限', strIsEnable CHAR(1) NULL, CONSTRAINT PK_SM_PersonProjectPower PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-26', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 27, '8:09dbae19d0b388c7fb436064ad1be9ef', 'createTable tableName=SM_PersonProjectPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-27::WangXun
CREATE TABLE SM_PersonProjectSysPower (ID NVARCHAR(50) NOT NULL, strPersonCode NVARCHAR(50) NOT NULL COMMENT '用户编码', strItemCode NVARCHAR(50) NULL COMMENT '授权项编码', strProjectCode NVARCHAR(50) NULL COMMENT '项目结构节点编码', nPageButtonConfigID INT NOT NULL COMMENT '操作按钮ID', strIsEnable CHAR(1) NULL COMMENT '是否可用', CONSTRAINT PK_SM_PERSONPROJECTSYSPOWER PRIMARY KEY (ID)) COMMENT='用户项目架构树操作权限';

ALTER TABLE SM_PersonProjectSysPower COMMENT = '用户项目架构树操作权限';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-27', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 28, '8:9428c9c47df67167ad9914e6541facc4', 'createTable tableName=SM_PersonProjectSysPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-28::WangXun
CREATE TABLE SM_PersonRole_Rel (ID NVARCHAR(50) NOT NULL, PersonCode NVARCHAR(50) NULL, RoleCode NVARCHAR(50) NULL, CONSTRAINT PK_SM_PERSONROLE_REL PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-28', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 29, '8:6de6cb90500a943c384a280213b73f9d', 'createTable tableName=SM_PersonRole_Rel', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-29::WangXun
CREATE TABLE SM_PersonSysPower (ID NVARCHAR(50) NOT NULL, PersonCode NVARCHAR(50) NOT NULL, SystemResourceDtlCode NVARCHAR(50) NOT NULL, PageButtonConfigID INT NOT NULL, IsEnable CHAR(1) NULL, strIsEnable CHAR(1) NULL, CONSTRAINT PK_SM_PERSONSYSPOWER PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-29', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 30, '8:22d9d20221edb119390e385c28287a5e', 'createTable tableName=SM_PersonSysPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-30::WangXun
CREATE TABLE SM_ProjectArchitecture (ID NVARCHAR(50) NOT NULL COMMENT '项目节点ID', strProjectCode NVARCHAR(50) NOT NULL COMMENT '项目节点编码', strPProjectCode NVARCHAR(50) NOT NULL COMMENT '项目父项节点编码', strName NVARCHAR(50) NULL COMMENT '项目节点名称', nOrderNo INT NULL COMMENT '项目节点序号', strIsFinalLeaf CHAR(1) NULL COMMENT '是否为最终叶子节点', strDelFlag CHAR(1) DEFAULT '0' NOT NULL COMMENT '删除标志') COMMENT='项目架构管理树';

ALTER TABLE SM_ProjectArchitecture COMMENT = '项目架构管理树';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-30', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 31, '8:0838e178820f45f469bb0f1261c7234f', 'createTable tableName=SM_ProjectArchitecture', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-31::WangXun
CREATE TABLE SM_ProjectFlowChart (ID NVARCHAR(50) NOT NULL, strGTGuid NVARCHAR(50) NULL COMMENT '流程图归属工程ID', strGTProject NVARCHAR(50) NULL COMMENT '流程图归属工程', strID NVARCHAR(80) NULL COMMENT '流程图组态ID', strName NVARCHAR(50) NULL COMMENT '流程图节点名称', strDescription NVARCHAR(300) NULL COMMENT '流程图节点描述', strProjectCode NVARCHAR(50) NULL COMMENT '流程图父节点编码', nOrderNo INT NULL COMMENT '流程图节点序号', strResourceUrl NVARCHAR(1000) NULL COMMENT '流程图节点关联资源地址', strDelFlag CHAR(1) DEFAULT '0' NOT NULL COMMENT '删除标志', CONSTRAINT PK_SM_ProjectFlowChart PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-31', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 32, '8:5922f19ae4c45a4968b784a4ff667254', 'createTable tableName=SM_ProjectFlowChart', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-32::WangXun
CREATE TABLE SM_ProjectGIS (ID NVARCHAR(50) NOT NULL, strProjectCode NVARCHAR(50) NOT NULL COMMENT '项目架构编码', nLon DECIMAL(18, 6) DEFAULT 0 NOT NULL COMMENT '经度', nLat DECIMAL(18, 6) DEFAULT 0 NOT NULL COMMENT '纬度', strIcon NVARCHAR(50) NULL COMMENT '图标的名字', nDisplaySet INT DEFAULT 1 NULL COMMENT '始终显示1  鼠标放上显示2', strTagNames LONGTEXT NULL COMMENT '标签名称集合', strRemark NVARCHAR(500) NULL COMMENT '备注', strDelFlag CHAR(1) DEFAULT '0' NOT NULL COMMENT '删除标志 1删除  0未删除', CONSTRAINT PK_SM_ProjectGIS_1 PRIMARY KEY (ID)) COMMENT='项目架构GIS组态';

ALTER TABLE SM_ProjectGIS COMMENT = '项目架构GIS组态';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-32', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 33, '8:db36d809535bb912319dfa165de604c6', 'createTable tableName=SM_ProjectGIS', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-33::WangXun
CREATE TABLE SM_ProjectPageButtonConfig (ID NVARCHAR(50) NOT NULL, strProjectSysPowerCode NVARCHAR(50) NULL COMMENT '归属操作权限Code', strButtonID NVARCHAR(50) NULL COMMENT '按钮ID', strButtonName NVARCHAR(300) NULL COMMENT '按钮名称', strRemark NVARCHAR(50) NULL COMMENT '描述', nPowerCodeType INT NULL COMMENT '操作权限类型', CONSTRAINT PK_SM_ProjectPageButtonConfig PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-33', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 34, '8:1a8727b88a4f54c6f5fb7356eb97a845', 'createTable tableName=SM_ProjectPageButtonConfig', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-34::WangXun
CREATE TABLE SM_ProjectPowerItem (ID NVARCHAR(50) NOT NULL, strCode NVARCHAR(50) NULL COMMENT '项目架构项编码', strName NVARCHAR(50) NULL COMMENT '项目架构项名称', nOrderNo INT NULL COMMENT '项目架构项序号', nVirtualItemType INT NULL COMMENT '虚拟项类型（0：非虚拟项， 1： 普通单虚拟项， 2： 组虚拟项）', nIsCanPowerItem INT NULL COMMENT '是否可以设置对应权限', CONSTRAINT PK_SM_ProjectPowerCode PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-34', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 35, '8:4cfac38333b00c374b9b02b2eaf24a0a', 'createTable tableName=SM_ProjectPowerItem', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-35::WangXun
CREATE TABLE SM_ProjectReportPlan (ID NVARCHAR(50) NOT NULL, strID NVARCHAR(80) NULL COMMENT '报表计划组态ID', strName NVARCHAR(50) NULL COMMENT '报表计划名称', strDescription NVARCHAR(300) NULL COMMENT '报表计划描述', strProjectCode NVARCHAR(50) NULL COMMENT '报表计划父节点编码', nOrderNo INT NULL COMMENT '报表计划序号', strResourceUrl NVARCHAR(1000) NULL COMMENT '报表计划关联资源地址', strReportServiceName NVARCHAR(110) NULL COMMENT '报表服务名称', strGTGuid NVARCHAR(50) NULL COMMENT '报表计划归属工程', strGTProject NVARCHAR(50) NULL COMMENT '报表计划归属工程标识', strDelFlag CHAR(1) NOT NULL COMMENT '删除标志', CONSTRAINT PK_SM_ProjectReportPlan PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-35', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 36, '8:98d45b99fae2b6b85967e8950217b4f7', 'createTable tableName=SM_ProjectReportPlan', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-36::WangXun
CREATE TABLE SM_ProjectReportTemplet (ID NVARCHAR(50) NOT NULL, strID NVARCHAR(80) NULL COMMENT '报表模板组态ID', strName NVARCHAR(50) NULL COMMENT '报表模板名称', strDescription NVARCHAR(300) NULL COMMENT '报表模板描述', strProjectCode NVARCHAR(50) NULL COMMENT '报表模板父节点编码', nOrderNo INT NULL COMMENT '报表模板序号', strResourceUrl NVARCHAR(1000) NULL COMMENT '报表模板关联资源地址', strGTGuid NVARCHAR(50) NULL COMMENT '报表模板归属工程', strGTProject NVARCHAR(50) NULL COMMENT '报表模板归属工程标识', strDelFlag CHAR(1) DEFAULT '0' NOT NULL COMMENT '删除标志', CONSTRAINT PK_SM_ProjectReportTemplet PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-36', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 37, '8:cd38c703c876ca821cd2fa9695af44b1', 'createTable tableName=SM_ProjectReportTemplet', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-37::WangXun
CREATE TABLE SM_ProjectSuperReport (ID NVARCHAR(50) NOT NULL, strGTGuid NVARCHAR(50) NULL COMMENT '高级报表归属工程', strName NVARCHAR(50) NULL COMMENT '高级报表节点名称', strDescription NVARCHAR(300) NULL COMMENT '高级报表节点描述', strProjectCode NVARCHAR(50) NULL COMMENT '高级报表节点父节点编码', nOrderNo INT NULL COMMENT '高级报表节点序号', strResourceUrl NVARCHAR(1000) NULL COMMENT '高级报表节点关联服务器地址', strCompanyID NVARCHAR(50) NULL COMMENT '高级报表厂商ID', strUserName NVARCHAR(50) NULL COMMENT '高级报表服务器用户名', strPassword NVARCHAR(200) NULL COMMENT '高级报表服务器访问密码', strDelFlag CHAR(1) DEFAULT '0' NOT NULL COMMENT '删除标志', CONSTRAINT PK_SM_ProjectSuperReport PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-37', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 38, '8:239ea0aa85c204ab533bfec31083e129', 'createTable tableName=SM_ProjectSuperReport', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-38::WangXun
CREATE TABLE SM_ProjectTag (ID NVARCHAR(50) NOT NULL COMMENT '标签节点ID', strID NVARCHAR(80) NULL COMMENT '标签组态ID', strName NVARCHAR(70) NULL COMMENT '标签节点名称', strDescription NVARCHAR(300) NULL COMMENT '标签节点描述', strArea NVARCHAR(64) NULL COMMENT '区域，为DCS日志设计', strDevice NVARCHAR(64) NULL COMMENT '装置，为DCS日志设计', strUnit NVARCHAR(64) NOT NULL COMMENT '单元,为DCS日志设计', strProjectCode NVARCHAR(50) NULL COMMENT '标签节点父节点编码', nOrderNo INT NULL COMMENT '标签节点序号', nTagType INT NULL COMMENT '标签节点类型（0：普通标签，1：特殊标签）', strResourceUrl NVARCHAR(1000) NULL COMMENT '标签节点资源地址', strGTGuid NVARCHAR(50) NULL COMMENT '标签归属工程标识', strGTPC NVARCHAR(50) NULL COMMENT '标签归属PC', strGTDomain NVARCHAR(50) NULL COMMENT '标签归属MACS域号', strDelFlag CHAR(1) DEFAULT '0' NOT NULL COMMENT '删除标志', nTagDataType INT NULL COMMENT '标签数据类型：开关，模拟');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-38', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 39, '8:96c70b1540556923910391f5da7e5270', 'createTable tableName=SM_ProjectTag', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-39::WangXun
CREATE TABLE SM_ProjectVideo (ID NVARCHAR(50) NOT NULL, strGTGuid NVARCHAR(50) NULL COMMENT '视频归属工程', strName NVARCHAR(50) NULL COMMENT '视频节点名称', strDescription NVARCHAR(300) NULL COMMENT '视频节点描述', strProjectCode NVARCHAR(50) NULL COMMENT '视频节点父节点编码', nOrderNo INT NULL COMMENT '视频节点序号', strResourceUrl NVARCHAR(1000) NULL COMMENT '视频节点关联视频服务器地址', strDevType NVARCHAR(50) NULL COMMENT '视频设备类型', strUserName NVARCHAR(50) NULL COMMENT '视频服务器用户名', strPassword NVARCHAR(50) NULL COMMENT '视频服务器访问密码', strDelFlag CHAR(1) DEFAULT '0' NOT NULL COMMENT '删除标志', strAccountID NVARCHAR(50) NULL COMMENT '视频帐户ID', strSerialNum NVARCHAR(50) NULL COMMENT '视频序列号', CONSTRAINT PK_SM_ProjectVideo PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-39', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 40, '8:86bcfa7952cac27e9dfdfad8399a1274', 'createTable tableName=SM_ProjectVideo', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-40::WangXun
CREATE TABLE SM_QueryFieldConfig (ID NVARCHAR(50) NOT NULL, SystemResourceDtlCode NVARCHAR(50) NOT NULL, ResourceUrl NVARCHAR(200) NULL, ResorceFile NVARCHAR(200) NULL, FieldID NVARCHAR(100) NOT NULL, FieldName NVARCHAR(100) NOT NULL, FieldType CHAR(1) NULL, Remark NVARCHAR(500) NULL, IsHide CHAR(1) NULL, IsSysMenu CHAR(1) NULL, CONSTRAINT PK_SM_QUERYFIELDCONFIG PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-40', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 41, '8:023bd592e1dd3b4773fba89129d90877', 'createTable tableName=SM_QueryFieldConfig', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-41::WangXun
CREATE TABLE SM_ReceiverGroup (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, GroupName NVARCHAR(50) NULL, Remark NVARCHAR(500) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NOT NULL, InputDate datetime NOT NULL, DeptCode NVARCHAR(50) NOT NULL, CorpCode NVARCHAR(50) NOT NULL, ModifyCode NVARCHAR(50) NOT NULL, ModifyDate datetime NOT NULL, CONSTRAINT PK_SM_RECEIVERGROUP PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-41', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 42, '8:3f923875fbcaf16ba832d21c2ba9d41a', 'createTable tableName=SM_ReceiverGroup', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-42::WangXun
CREATE TABLE SM_ReceiverGroupDtl (ID NVARCHAR(50) NOT NULL, PCode NVARCHAR(50) NOT NULL, PersonCode NVARCHAR(50) NULL, CONSTRAINT PK_SM_RECEIVERGROUPDTL PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-42', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 43, '8:d8b8e36f148f30550e6b7b092b7b8465', 'createTable tableName=SM_ReceiverGroupDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-43::WangXun
CREATE TABLE SM_ReportPlan (ID NVARCHAR(50) NOT NULL, strInputDate datetime DEFAULT NOW() NOT NULL COMMENT '创建时间', strModifyDate datetime DEFAULT NOW() NOT NULL COMMENT '修改时间', strGTName NVARCHAR(64) NOT NULL COMMENT '工程名称', strGTGuid NVARCHAR(50) NOT NULL COMMENT 'GTPlus工程id', strReportServiceA NVARCHAR(50) NOT NULL COMMENT '报表服务A系统号', strReportServiceAName NVARCHAR(64) NOT NULL COMMENT '报表服务A系统名称', strReportServiceB NVARCHAR(50) NULL COMMENT '报表服务B系统号', strReportServiceBName NVARCHAR(64) NULL COMMENT '报表服务B系统名称', strPlanName NVARCHAR(50) NOT NULL COMMENT '报表打印计划名称', strPlanDescription NVARCHAR(50) NULL COMMENT '报表服务描述', nPlanAttribute INT DEFAULT 1 NOT NULL COMMENT '计划属性 1自动  2手动', nIsSendPrinter INT DEFAULT 0 NOT NULL COMMENT '是否自动发送打印机 1发送  0不发送', nPrintCycle INT NOT NULL COMMENT '打印周期 1按小时，2按天，3按周，4按月，5按季度，6按年', nMonth INT DEFAULT 0 NULL COMMENT '月份，1到12', nDay INT DEFAULT 0 NULL COMMENT '日，1到31', nHour INT DEFAULT 0 NULL COMMENT '时，0到23', nMinute INT DEFAULT 0 NULL COMMENT '分 0到59', nMonthNumber INT DEFAULT 0 NULL COMMENT '第几个月，为季度报表用', nWeekNumber INT DEFAULT 0 NULL COMMENT '周几，1到7，为周报用', strReportTemplateID NVARCHAR(50) NOT NULL COMMENT '报表模板id', strReportTemplateName NVARCHAR(64) NULL COMMENT '报表模板名称', strReportTemplateResourceUrl NVARCHAR(256) NOT NULL COMMENT '报表模板文件磁盘地址', strDelFlag INT DEFAULT 0 NOT NULL COMMENT '删除标志  1删除  0未删除', strIsSynchronize INT DEFAULT 1 NULL COMMENT '重新下装后数据是否同步了，1是同步  0是未同步', CONSTRAINT PK_SM_ReportPlan PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-43', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 44, '8:1d80b099a216f729c02d6a7a7e7c21ea', 'createTable tableName=SM_ReportPlan', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-44::WangXun
CREATE TABLE SM_ReportRecord (ID NVARCHAR(50) NOT NULL, PID NVARCHAR(50) NOT NULL, strInputDate datetime DEFAULT NOW() NOT NULL COMMENT '创建时间', strModifyDate datetime DEFAULT NOW() NOT NULL COMMENT '修改时间', strReportNameAndTime NVARCHAR(128) NOT NULL COMMENT '报表名称(带生成时间)', strOperatorAccount NVARCHAR(50) NULL COMMENT '执行人（自动报表为空）', strDelFlag INT DEFAULT 0 NOT NULL COMMENT '删除标志  1删除  0未删除', CONSTRAINT PK_SM_ReportRecord PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-44', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 45, '8:508a987766823a05a42e4f715813118f', 'createTable tableName=SM_ReportRecord', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-45::WangXun
CREATE TABLE SM_Role (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, Name NVARCHAR(50) NULL, `Describe` NVARCHAR(1000) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, CONSTRAINT PK_SM_ROLE PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-45', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 46, '8:b53bfd66f543fdcec0411456e20ef294', 'createTable tableName=SM_Role', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-46::WangXun
CREATE TABLE SM_RoleDataPower (ID NVARCHAR(50) NOT NULL, RoleCode NVARCHAR(50) NULL, SystemResourceDtlCode NVARCHAR(50) NULL, DataPower CHAR(1) NULL, CustomPower NVARCHAR(1000) NULL, strIsEnable CHAR(1) NULL, CONSTRAINT PK_SM_ROLEDATAPOWER PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-46', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 47, '8:f95958290052dfc606413a54c1620f64', 'createTable tableName=SM_RoleDataPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-47::WangXun
CREATE TABLE SM_RoleDeptPower (ID NVARCHAR(50) NOT NULL, RoleCode NVARCHAR(50) NOT NULL, DeptCode NVARCHAR(50) NULL, CONSTRAINT PK_SM_ROLEDEPTPOWER PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-47', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 48, '8:4a07f4a0234b4c2df0cc1c464388d326', 'createTable tableName=SM_RoleDeptPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-48::WangXun
CREATE TABLE SM_RoleProjectPower (ID NVARCHAR(50) NOT NULL, strRoleCode NVARCHAR(50) NULL COMMENT '项目架构关联角色编码', strProjectCode NVARCHAR(50) NULL COMMENT '项目架构叶子节点项编码', strItem NVARCHAR(50) NULL COMMENT '项目架构权限项', strPowerCode NVARCHAR(50) NULL COMMENT '项目架构权限项父节点编码', strDataPower CHAR(1) NULL COMMENT '数据权限', strCustomPower NVARCHAR(500) NULL COMMENT '自定义权限', strIsEnable CHAR(1) NULL, CONSTRAINT PK_SM_RoleProjectPower PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-48', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 49, '8:95744fbeabe162dca0c43707a4885162', 'createTable tableName=SM_RoleProjectPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-49::WangXun
CREATE TABLE SM_RoleProjectSysPower (ID NVARCHAR(50) NOT NULL, strRoleCode NVARCHAR(50) NOT NULL COMMENT '角色编码', strItemCode NVARCHAR(50) NULL COMMENT '授权项编码', strProjectCode NVARCHAR(50) NULL COMMENT '项目结构节点编码', nPageButtonConfigID INT NOT NULL COMMENT '操作按钮ID', strIsEnable CHAR(1) NULL COMMENT '是否可用', CONSTRAINT PK_SM_ROLEPROJECTSYSPOWER PRIMARY KEY (ID)) COMMENT='角色项目架构树操作权限';

ALTER TABLE SM_RoleProjectSysPower COMMENT = '角色项目架构树操作权限';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-49', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 50, '8:000b715047ee04f2fcadb7eac903a7dc', 'createTable tableName=SM_RoleProjectSysPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-50::WangXun
CREATE TABLE SM_RoleSysPower (ID NVARCHAR(50) NOT NULL, RoleCode NVARCHAR(50) NOT NULL, SystemResourceDtlCode NVARCHAR(50) NULL, PageButtonConfigID INT NOT NULL, IsEnable CHAR(1) NULL, strIsEnable CHAR(1) NULL, CONSTRAINT PK_SM_ROLESYSPOWER PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-50', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 51, '8:3878bfe030b45c99bc8312cfd7967eac', 'createTable tableName=SM_RoleSysPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-51::WangXun
CREATE TABLE SM_SyncObject (ID NVARCHAR(50) NOT NULL, strObjectName NVARCHAR(50) NOT NULL, nStatus INT NULL, dtLastLockTime datetime NULL, dtLastUnlockTime datetime NULL, ts timestamp NOT NULL, CONSTRAINT PK_SM_SyncObject PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-51', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 52, '8:04583764fc57b35de66f0de321ffa321', 'createTable tableName=SM_SyncObject', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-52::WangXun
CREATE TABLE SM_SysSetting (ID NVARCHAR(50) NOT NULL, strKey NVARCHAR(50) NOT NULL, strValue NVARCHAR(50) NOT NULL, CONSTRAINT PK_SM_SysSetting PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-52', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 53, '8:809ac2e9509ba36aed343bef785ff4d0', 'createTable tableName=SM_SysSetting', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-53::WangXun
CREATE TABLE SM_SystemResource (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, PCode NVARCHAR(50) NULL, Title NVARCHAR(50) NULL, EnTitle NVARCHAR(50) NULL, OrderNo INT NULL, IsHide CHAR(1) NULL, IsSysMenu CHAR(1) NULL, Platform CHAR(1) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, CONSTRAINT PK_SM_SYSTEMRESOURCE PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-53', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 54, '8:e16775c766f79ce1cc81d71092fe381c', 'createTable tableName=SM_SystemResource', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-54::WangXun
CREATE TABLE SM_SystemResourceDtl (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, SystemResourceCode NVARCHAR(50) NOT NULL, Title NVARCHAR(50) NULL, EnTitle NVARCHAR(50) NULL, ResourceType CHAR(1) NULL, ResourceUrl NVARCHAR(1000) NULL, ResourceUrlApp NVARCHAR(100) NULL, Parameter NVARCHAR(200) NULL, OrderNo INT NULL, IsHide CHAR(1) NULL, IsSysMenu CHAR(1) NULL, Platform CHAR(1) NULL, ConfCodeVou CHAR(1) NOT NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, CONSTRAINT PK_SM_SYSTEMRESOURCEDTL PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-54', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 55, '8:3b85f927e9150e331ab1915f7b6da394', 'createTable tableName=SM_SystemResourceDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-55::WangXun
CREATE TABLE SM_SystemResourceRmisDtl (ID NVARCHAR(50) NOT NULL, Code NVARCHAR(50) NOT NULL, SystemResourceCode NVARCHAR(50) NOT NULL, DeployID INT NULL, Title NVARCHAR(100) NULL, EnTitle NVARCHAR(50) NULL, ResourceType CHAR(1) NULL, Parameter NVARCHAR(200) NULL, OrderNo INT NULL, IsHide CHAR(1) NULL, IsSysMenu CHAR(1) NULL, Platform CHAR(1) NULL, ConfCodeVou CHAR(1) NOT NULL, DelFlag CHAR(1) NOT NULL, ExternalNetwork NVARCHAR(200) NULL, CONSTRAINT PK_SM_SYSTEMRESOURCERMISDTL PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-55', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 56, '8:28fd20175013a92c84ab9cd896a97e3b', 'createTable tableName=SM_SystemResourceRmisDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-56::WangXun
CREATE TABLE SM_UserConfig (ID NVARCHAR(50) NOT NULL, strPersonCode NVARCHAR(50) NULL COMMENT '配置关联用户编码', strAlarmVoiceOff CHAR(1) NULL COMMENT '报警消音开关（0：开启， 1：关闭）', strAlarmLightTime datetime NULL COMMENT '报警灯时间戳', CONSTRAINT PK_SM_UserConfig PRIMARY KEY (ID)) COMMENT='用户配置';

ALTER TABLE SM_UserConfig COMMENT = '用户配置';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-56', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 57, '8:9c6e32f6bf999bc40cf241e081cc0496', 'createTable tableName=SM_UserConfig', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-57::WangXun
CREATE TABLE SM_UserLogin (ID NVARCHAR(50) NOT NULL, strAccount NVARCHAR(50) NULL COMMENT '用户登录帐号', strUID NVARCHAR(50) NULL COMMENT '用户登录唯一标识', strLogTime NVARCHAR(50) NULL COMMENT '用户登录时间', strLastReqTime NVARCHAR(50) NULL COMMENT '客户端最近请求时间', IsOrNotLogin INT DEFAULT 0 NOT NULL COMMENT '是否登陆，1登陆，0未登录', CONSTRAINT PK_SM_UserLogin PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-57', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 58, '8:2d22cf7e93580902842573c3a3af81b2', 'createTable tableName=SM_UserLogin', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-58::WangXun
CREATE TABLE SM_UserPushConfig (ID NVARCHAR(50) NOT NULL, strPersonCode NVARCHAR(50) NOT NULL, dtAlarmPushLastTime datetime NULL, dtNotifyPushLastTime datetime NULL, CONSTRAINT PK_SM_UserPushConfig PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-58', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 59, '8:269d58b71dcef6a22de0a78c16a51630', 'createTable tableName=SM_UserPushConfig', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-59::WangXun
CREATE TABLE SM_UserSession (ID NVARCHAR(50) NOT NULL, strAccount NVARCHAR(50) NOT NULL, strSessionID NVARCHAR(50) NULL, strLastUpdateTime NVARCHAR(50) NOT NULL, CONSTRAINT PK_SM_UserSession PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-59', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 60, '8:3a2c5c4049358669af0d431f833f7663', 'createTable tableName=SM_UserSession', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-60::WangXun
CREATE TABLE SM_UserSetting (ID NVARCHAR(50) NOT NULL, strAccount NVARCHAR(50) NOT NULL, bEnablePush BIT NULL, bEnableAlarmPush BIT NULL, nAlarmPushLevel INT NULL, CONSTRAINT PK_SM_UserSetting PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-60', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 61, '8:fd6538dad6a3ad8f9451430dcb4ca483', 'createTable tableName=SM_UserSetting', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-61::WangXun
CREATE TABLE SM_VideoAccount (ID NVARCHAR(50) NULL COMMENT '视频帐户ID', strAccountName NVARCHAR(50) NULL COMMENT '视频帐户名称', strAppKey NVARCHAR(50) NULL COMMENT 'AppKey', strAppSecret NVARCHAR(50) NULL COMMENT 'AppSecret');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-61', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 62, '8:910de3c50bde2768dd39c5eac35af90b', 'createTable tableName=SM_VideoAccount', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-62::WangXun
CREATE TABLE SM_VideoDevDict (ID NVARCHAR(50) NULL COMMENT '视频设备类型ID', strDeviceType NVARCHAR(50) NULL COMMENT '视频设备类型');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-62', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 63, '8:f1f56a792a24fc9316f27142cd0f8c8f', 'createTable tableName=SM_VideoDevDict', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-63::WangXun
CREATE TABLE t_BD_ArrangePeriod (ID NVARCHAR(50) NOT NULL, WorkDate date NULL, ShiftCode NVARCHAR(50) NULL, TeamCode NVARCHAR(50) NULL, Dept NVARCHAR(50) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_BD_ArrangePeriod PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-63', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 64, '8:1aa25fd9579b85ecb096572538c0b99f', 'createTable tableName=t_BD_ArrangePeriod', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-64::WangXun
CREATE TABLE t_BD_ArrangeResult (ID NVARCHAR(50) NOT NULL, WorkDate date NOT NULL, ShiftCode NVARCHAR(50) NOT NULL, TeamCode NVARCHAR(50) NOT NULL, Dept NVARCHAR(50) NOT NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_ArrangeResult PRIMARY KEY (WorkDate, ShiftCode, TeamCode, Dept));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-64', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 65, '8:9a4178dded74871ec686854d47f22ea5', 'createTable tableName=t_BD_ArrangeResult', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-65::WangXun
CREATE TABLE t_BD_Dict (ID NVARCHAR(50) NOT NULL, DictCode NVARCHAR(50) NOT NULL, DictName NVARCHAR(50) NOT NULL, TypeCode NVARCHAR(50) NULL, Remark NVARCHAR(500) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, Inputcode NVARCHAR(50) NULL, Inputdate datetime NULL, Deptcode NVARCHAR(50) NULL, Corpcode NVARCHAR(50) NULL, Modifycode NVARCHAR(50) NULL, Modifydate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_Dict PRIMARY KEY (DictCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-65', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 66, '8:7002cf9fb20bb50e11d51d169c679aaa', 'createTable tableName=t_BD_Dict', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-66::WangXun
CREATE TABLE t_BD_DictDtl (ID NVARCHAR(50) NOT NULL, DictDtlCode NVARCHAR(50) NOT NULL, DictDtlName NVARCHAR(50) NOT NULL, DictCode NVARCHAR(50) NOT NULL, SeqNo INT DEFAULT 0 NULL, Remark NVARCHAR(500) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, Inputcode NVARCHAR(50) NULL, Inputdate datetime NULL, Deptcode NVARCHAR(50) NULL, Corpcode NVARCHAR(50) NULL, Modifycode NVARCHAR(50) NULL, Modifydate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_DictDtl PRIMARY KEY (DictDtlCode, DictCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-66', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 67, '8:21b04118666a274c6322f871aa269526', 'createTable tableName=t_BD_DictDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-67::WangXun
CREATE TABLE t_BD_Material (ID NVARCHAR(50) NOT NULL, MatCode NVARCHAR(50) NOT NULL, MatName NVARCHAR(200) NOT NULL, Spec NVARCHAR(200) NULL, Model NVARCHAR(200) NULL, FirstUnitCode NVARCHAR(50) NULL, SecondUnitCode NVARCHAR(50) NULL, PYCode NVARCHAR(50) NULL, UseFlag NCHAR(1) NULL, MatType NVARCHAR(50) NULL, MaxInventory DECIMAL(22, 6) NULL, MinInventory DECIMAL(22, 6) NULL, SafeInventory DECIMAL(22, 6) NULL, IsSetBatch INT NULL, Remark NVARCHAR(500) NULL, DelFlag NCHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_Material PRIMARY KEY (MatCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-67', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 68, '8:8e59741e9149b4d18122a6bd5791cd8c', 'createTable tableName=t_BD_Material', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-68::WangXun
CREATE TABLE t_BD_MaterialAttr (ID NVARCHAR(50) NOT NULL, AttrCode NVARCHAR(50) NOT NULL, MatCode NVARCHAR(50) NOT NULL, AttrName NVARCHAR(50) NOT NULL, AttrValue NVARCHAR(50) NOT NULL, Remark NVARCHAR(500) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_MaterialAttr PRIMARY KEY (AttrCode, MatCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-68', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 69, '8:5070111cbfcba000f7928c1e9bb35434', 'createTable tableName=t_BD_MaterialAttr', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-69::WangXun
CREATE TABLE t_BD_MaterialRelType (ID NVARCHAR(50) NOT NULL, TypeCode NVARCHAR(50) NOT NULL, MatCode NVARCHAR(50) NOT NULL, DelFlag CHAR(1) DEFAULT '0' NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_MaterialRelType PRIMARY KEY (TypeCode, MatCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-69', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 70, '8:c404e8f653102b65bdeab06cb07b40d9', 'createTable tableName=t_BD_MaterialRelType', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-70::WangXun
CREATE TABLE t_BD_Member (ID NVARCHAR(50) NOT NULL, TeamCode NVARCHAR(50) NOT NULL, PersonCode NVARCHAR(50) NOT NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_Member PRIMARY KEY (PersonCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-70', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 71, '8:0b067015616959709b5d9ac4b97992ec', 'createTable tableName=t_BD_Member', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-71::WangXun
CREATE TABLE t_BD_Supplier (ID NVARCHAR(50) NOT NULL, SupplierCode NVARCHAR(50) NOT NULL, SupplierName NVARCHAR(50) NOT NULL, ContactPerson NVARCHAR(50) NULL, ContactInfo NVARCHAR(100) NULL, ShortName NVARCHAR(50) NULL, Place NVARCHAR(200) NULL, Remark NVARCHAR(500) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_Supplier PRIMARY KEY (SupplierCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-71', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 72, '8:24d52c7ec347dbd72eedd6e627cc0f51', 'createTable tableName=t_BD_Supplier', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-72::WangXun
CREATE TABLE t_BD_SupplierMaterialDtl (ID NVARCHAR(50) NOT NULL, SupplierCode NVARCHAR(50) NOT NULL, MatCode NVARCHAR(50) NOT NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_SupplierMaterialDtl PRIMARY KEY (SupplierCode, MatCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-72', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 73, '8:d382ca2ad9995ed0da55168606e241bd', 'createTable tableName=t_BD_SupplierMaterialDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-73::WangXun
CREATE TABLE t_BD_Team (ID NVARCHAR(50) NOT NULL, TeamCode NVARCHAR(50) NOT NULL, TeamName NVARCHAR(50) NULL, Leader NVARCHAR(50) NULL, Dept NVARCHAR(50) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_Team PRIMARY KEY (TeamCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-73', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 74, '8:42b5a674b13cebf33f72e3d81439e2c7', 'createTable tableName=t_BD_Team', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-74::WangXun
CREATE TABLE t_BD_Unit (ID NVARCHAR(50) NOT NULL, UnitCode NVARCHAR(50) NOT NULL, UnitName NVARCHAR(50) NOT NULL, Remark NVARCHAR(500) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, Inputcode NVARCHAR(50) NULL, Inputdate datetime NULL, Deptcode NVARCHAR(50) NULL, Corpcode NVARCHAR(50) NULL, Modifycode NVARCHAR(50) NULL, Modifydate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_Unit PRIMARY KEY (UnitCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-74', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 75, '8:8ee027aeb15fad366a010316927c66a4', 'createTable tableName=t_BD_Unit', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-75::WangXun
CREATE TABLE t_BD_UnitConv (ID NVARCHAR(50) NOT NULL, MatCode NVARCHAR(50) NOT NULL, BeforeConvCode NVARCHAR(50) NOT NULL, AfterConvCode NVARCHAR(50) NOT NULL, ScaledValue NVARCHAR(50) NULL, Remark NVARCHAR(500) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_UnitConv PRIMARY KEY (MatCode, BeforeConvCode, AfterConvCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-75', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 76, '8:12a86d9d4c709839de657cc7df5fe28b', 'createTable tableName=t_BD_UnitConv', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-76::WangXun
CREATE TABLE t_BD_UnitDtl (ID NVARCHAR(50) NOT NULL, UnitDtlCode NVARCHAR(50) NOT NULL, UnitDtlName NVARCHAR(50) NOT NULL, UnitCode NVARCHAR(50) NOT NULL, Symbol NVARCHAR(50) NULL, Remark NVARCHAR(500) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, Inputcode NVARCHAR(50) NULL, Inputdate datetime NULL, Deptcode NVARCHAR(50) NULL, Corpcode NVARCHAR(50) NULL, Modifycode NVARCHAR(50) NULL, Modifydate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_UnitDtl PRIMARY KEY (UnitDtlCode, UnitCode));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-76', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 77, '8:18f672cfa3146c0ba29b9cb769d4c7be', 'createTable tableName=t_BD_UnitDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-77::WangXun
CREATE TABLE t_BD_WorkShift (ID NVARCHAR(50) NOT NULL, ShiftCode NVARCHAR(50) NOT NULL, ShiftName NVARCHAR(50) NOT NULL, BeginTime CHAR(5) NULL, EndTime CHAR(5) NULL, Remark NVARCHAR(500) NULL, DelFlag CHAR(1) DEFAULT '0' NOT NULL, InputCode NVARCHAR(50) NULL, InputDate datetime NULL, DeptCode NVARCHAR(50) NULL, CorpCode NVARCHAR(50) NULL, ModifyCode NVARCHAR(50) NULL, ModifyDate datetime NULL, FlowSts INT NULL, CONSTRAINT PK_t_BD_WorkShift PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-77', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 78, '8:c1b55696d3d7f19d533ac8a8e3f97918', 'createTable tableName=t_BD_WorkShift', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-78::WangXun
CREATE TABLE t_clctr (id NVARCHAR(50) NOT NULL, name NVARCHAR(16) NULL, `description` NVARCHAR(32) NULL, version INT NULL, idletimeout INT NULL, syncrate INT NULL, updaterate INT NULL, compensation INT NULL, CONSTRAINT PK_T_CLCTR PRIMARY KEY (id));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-78', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 79, '8:44fc7a2bea5f2f3f748d5a55d0405b01', 'createTable tableName=t_clctr', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-79::WangXun
CREATE TABLE t_deply (Id NVARCHAR(50) NOT NULL, name VARCHAR(64) NOT NULL, `description` VARCHAR(64) NULL, type INT NOT NULL, sort INT NOT NULL, `path` VARCHAR(128) NOT NULL, pid INT NOT NULL, RTDBServer NVARCHAR(64) NULL, CONSTRAINT PK_T_DEPLY PRIMARY KEY (Id));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-79', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 80, '8:773add95ffa235282d148f8b9dc67470', 'createTable tableName=t_deply', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-80::WangXun
CREATE TABLE t_tag (id NVARCHAR(50) NOT NULL, clctr INT NULL, name NVARCHAR(60) NULL, ioaddr NVARCHAR(76) NULL, type TINYINT NULL, version INT NULL, arcmode INT NULL, arcto INT NULL, arcoff INT NULL, clctrate INT NULL, clctto INT NULL, `description` NVARCHAR(32) NULL, unit NVARCHAR(16) NULL, arcddbnd FLOAT(53) NULL, clctddbnd FLOAT(53) NULL, minimal FLOAT(53) NULL, maximal FLOAT(53) NULL, lowlimit FLOAT(53) NULL, highlimit FLOAT(53) NULL, lololimit FLOAT(53) NULL, hihilimit FLOAT(53) NULL, CONSTRAINT PK_T_TAG PRIMARY KEY (id));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-80', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 81, '8:487b047219ae8fe290a2bffdf9bf050d', 'createTable tableName=t_tag', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-81::WangXun
CREATE TABLE t_tag_mobile (id NVARCHAR(50) NOT NULL, sortid INT NULL, sortname NVARCHAR(50) NULL, secondname NVARCHAR(50) NULL, clctrname NVARCHAR(50) NULL, tagname NVARCHAR(50) NULL, tagdesc NVARCHAR(50) NULL, unit NVARCHAR(50) NULL, sortby INT NULL, CONSTRAINT PK_t_tag_mobile PRIMARY KEY (id));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-81', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 82, '8:a9f8d6a8147e07b65d58411ac1eb95b8', 'createTable tableName=t_tag_mobile', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-82::WangXun
CREATE TABLE tagtest (id NVARCHAR(50) NOT NULL, projectcode NVARCHAR(50) NOT NULL, tagname NVARCHAR(50) NOT NULL, tagdes NVARCHAR(50) NOT NULL, CONSTRAINT PK_tagtest PRIMARY KEY (id));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-82', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 83, '8:ac4b3442409d248ea0bce648f233555c', 'createTable tableName=tagtest', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-83::WangXun
ALTER TABLE CF_Alarm ADD PRIMARY KEY (ID);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-83', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 84, '8:a4b130f3c080c80495b566f197fab5af', 'addPrimaryKey constraintName=PK_CF_Alarm, tableName=CF_Alarm', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-84::WangXun
ALTER TABLE CF_AlarmHis ADD PRIMARY KEY (ID);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-84', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 85, '8:02bfde0582f29dd28bccf4f6ea4841b9', 'addPrimaryKey constraintName=PK_CF_AlarmHis, tableName=CF_AlarmHis', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-85::WangXun
ALTER TABLE SM_ProjectArchitecture ADD PRIMARY KEY (ID);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-85', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 86, '8:19197d54d23fb30899b75df87563c909', 'addPrimaryKey constraintName=PK_SM_ProjectArchitecture, tableName=SM_ProjectArchitecture', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-86::WangXun
ALTER TABLE SM_ProjectTag ADD PRIMARY KEY (ID);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-86', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 87, '8:c754cabe0f1d1197ba9ebe6082bf83b9', 'addPrimaryKey constraintName=PK_SM_ProjectTag, tableName=SM_ProjectTag', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-87::WangXun
ALTER TABLE SM_SyncObject ADD CONSTRAINT UQ__SM_SyncO__96439D4DAC4FD534 UNIQUE (strObjectName);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-87', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 88, '8:3c57afe04f0ca0fff0ecf6c3f6c84b5e', 'addUniqueConstraint constraintName=UQ__SM_SyncO__96439D4DAC4FD534, tableName=SM_SyncObject', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-88::WangXun
ALTER TABLE SM_UserPushConfig ADD CONSTRAINT UQ__SM_UserP__4AE80FD304D4B198 UNIQUE (strPersonCode);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-88', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 89, '8:a72e1a58bcee83599ce74700031c55b7', 'addUniqueConstraint constraintName=UQ__SM_UserP__4AE80FD304D4B198, tableName=SM_UserPushConfig', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-89::WangXun
ALTER TABLE SM_UserSetting ADD CONSTRAINT UQ__SM_UserS__9C0CF01868C968C4 UNIQUE (strAccount);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-89', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 90, '8:1766d66e121e109f15ed56ccb2cb7654', 'addUniqueConstraint constraintName=UQ__SM_UserS__9C0CF01868C968C4, tableName=SM_UserSetting', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-90::WangXun
CREATE INDEX IX_CF_Alarm_C ON CF_Alarm(strTagName);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-90', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 91, '8:8d9066e07e0afeafaa3521c496970e9b', 'createIndex indexName=IX_CF_Alarm_C, tableName=CF_Alarm', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-91::WangXun
CREATE INDEX IX_CF_Alarm_Soft ON CF_Alarm(nAlarmState, nAlarmlevel, strEventTime);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-91', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 92, '8:31e057ad2cd111d4be5b436197dfcd50', 'createIndex indexName=IX_CF_Alarm_Soft, tableName=CF_Alarm', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-92::WangXun
CREATE INDEX IX_CF_SysAlarm ON CF_SysAlarm(nAlarmState, nAlarmlevel, strEventTime);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-92', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 93, '8:d403e5449c135370c9da4d5ff391ce88', 'createIndex indexName=IX_CF_SysAlarm, tableName=CF_SysAlarm', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-93::WangXun
CREATE UNIQUE INDEX IX_SM_Department_Name ON SM_Department(Name, Pcode);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-93', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 94, '8:cfbb56cb1b499bffab14406a3be10005', 'createIndex indexName=IX_SM_Department_Name, tableName=SM_Department', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-94::WangXun
CREATE INDEX IX_SM_Log ON SM_Log(strOperateTime);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-94', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 95, '8:4bcf064fa468fb8538f1eb720b23a5ab', 'createIndex indexName=IX_SM_Log, tableName=SM_Log', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-95::WangXun
CREATE UNIQUE INDEX IX_SM_Person_Account ON SM_Person(Account);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-95', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 96, '8:edb0cb5536434d670f6e9997888c677c', 'createIndex indexName=IX_SM_Person_Account, tableName=SM_Person', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-96::WangXun
CREATE UNIQUE INDEX IX_SM_ProjectArchitecture_C ON SM_ProjectArchitecture(strProjectCode);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-96', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 97, '8:9897cfbf9c4f98b060f64436a737cca1', 'createIndex indexName=IX_SM_ProjectArchitecture_C, tableName=SM_ProjectArchitecture', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-97::WangXun
CREATE UNIQUE INDEX IX_SM_ProjectArchitecture_Name ON SM_ProjectArchitecture(strPProjectCode, strName);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-97', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 98, '8:7d7afacbd60fa785e9e8b5aa5be7ce21', 'createIndex indexName=IX_SM_ProjectArchitecture_Name, tableName=SM_ProjectArchitecture', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-98::WangXun
CREATE INDEX IX_SM_ProjectArchitecture_PP ON SM_ProjectArchitecture(strPProjectCode);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-98', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 99, '8:46e700fb4dd0bc7d015fb7e829653a9d', 'createIndex indexName=IX_SM_ProjectArchitecture_PP, tableName=SM_ProjectArchitecture', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-99::WangXun
CREATE UNIQUE INDEX IX_SM_ProjectFlowChart_strID ON SM_ProjectFlowChart(strID);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-99', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 100, '8:88446dcf97b8f67e1c2e9f944f5bdd02', 'createIndex indexName=IX_SM_ProjectFlowChart_strID, tableName=SM_ProjectFlowChart', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-100::WangXun
CREATE UNIQUE INDEX IX_SM_ProjectReportPlan ON SM_ProjectReportPlan(strID, strDelFlag);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-100', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 101, '8:1f494ab9ec7d82011ecaadada286ef08', 'createIndex indexName=IX_SM_ProjectReportPlan, tableName=SM_ProjectReportPlan', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-101::WangXun
CREATE UNIQUE INDEX IX_SM_ProjectSuperReport_Name ON SM_ProjectSuperReport(strName);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-101', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 102, '8:d3d70934873fbf73d8c575332f6a96a8', 'createIndex indexName=IX_SM_ProjectSuperReport_Name, tableName=SM_ProjectSuperReport', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-102::WangXun
CREATE UNIQUE INDEX IX_SM_ProjectTag_C ON SM_ProjectTag(strName);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-102', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 103, '8:c452a25493bcc58e36331cb3c51f4f2b', 'createIndex indexName=IX_SM_ProjectTag_C, tableName=SM_ProjectTag', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-103::WangXun
CREATE INDEX IX_SM_ProjectTag_P ON SM_ProjectTag(strProjectCode);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-103', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 104, '8:293cf8e2169e069abee4892170f3748b', 'createIndex indexName=IX_SM_ProjectTag_P, tableName=SM_ProjectTag', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-104::WangXun
CREATE UNIQUE INDEX IX_SM_ProjectVideo_Name ON SM_ProjectVideo(strName);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-104', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 105, '8:3191bd2bf39ad93411943cddfc307878', 'createIndex indexName=IX_SM_ProjectVideo_Name, tableName=SM_ProjectVideo', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-105::WangXun
CREATE UNIQUE INDEX IX_SM_Role_Name ON SM_Role(Name);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-105', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 106, '8:c3194bcab9713f478db100f0c49ad2d3', 'createIndex indexName=IX_SM_Role_Name, tableName=SM_Role', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-106::WangXun
ALTER TABLE PM_TrendGroup ADD CONSTRAINT FK_PM_TrendGroup_SM_ProjectArchitecture FOREIGN KEY (strProjectCode) REFERENCES SM_ProjectArchitecture (strProjectCode) ON UPDATE NO ACTION ON DELETE NO ACTION;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-106', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 107, '8:bc9136c734e6acd2c48c0c17b58d8cb1', 'addForeignKeyConstraint baseTableName=PM_TrendGroup, constraintName=FK_PM_TrendGroup_SM_ProjectArchitecture, referencedTableName=SM_ProjectArchitecture', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-107::WangXun
CREATE VIEW V_BD_ArrangePeriod AS SELECT
            a.ID,
            DATE_FORMAT(a.WorkDate,'%Y-%m-%d %T:%f')AS WorkDate,
            a.ShiftCode,
            a.TeamCode,
            a.Dept,
            a.DelFlag,
            a.InputCode,
            a.InputDate,
            b.BeginTime,
            b.EndTime,
            b.ShiftName,
            c.TeamName
            FROM
            t_BD_ArrangePeriod AS a
            LEFT OUTER JOIN t_BD_WorkShift AS b ON a.ShiftCode = b.ShiftCode
            AND b.DelFlag = 0
            LEFT OUTER JOIN t_BD_Team AS c ON a.TeamCode = c.TeamCode
            AND c.DelFlag = 0;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-107', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 108, '8:47e4bd096e48078bfffa07fac91b5948', 'createView viewName=V_BD_ArrangePeriod', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-108::WangXun
CREATE VIEW V_BD_ArrangeResult AS SELECT
            a.ID,
            DATE_FORMAT(a.WorkDate,'%Y-%m-%d %T:%f')AS WorkDate,
            a.ShiftCode,
            a.TeamCode,
            a.Dept,
            a.InputCode,
            a.InputDate,
            a.DelFlag,
            b.BeginTime,
            b.EndTime,
            b.ShiftName,
            c.TeamName,
            c.Leader,
            d.Name AS LeaderName,
            e.Name AS DeptName
            FROM
            t_BD_ArrangeResult AS a
            LEFT OUTER JOIN t_BD_WorkShift AS b ON a.ShiftCode = b.ShiftCode
            AND b.DelFlag = '0'
            LEFT OUTER JOIN t_BD_Team AS c ON a.TeamCode = c.TeamCode
            AND c.DelFlag = '0'
            LEFT OUTER JOIN SM_Person AS d ON c.Leader = d.Code
            AND d.DelFlag = '0'
            LEFT OUTER JOIN SM_Department AS e ON a.DeptCode = e.Code
            AND e.DelFlag = '0';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-108', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 109, '8:676d95bd5f1f6d213393a8acc5b98018', 'createView viewName=V_BD_ArrangeResult', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-109::WangXun
CREATE VIEW V_BD_Dict AS SELECT
            d.ID,
            d.DictCode,
            d.DictName,
            d.TypeCode,
            d.Remark,
            d.DelFlag,
            dd.ID AS dtlId,
            dd.DictDtlName AS dtlName,
            dd.DictDtlCode AS dtlCode,
            dd.SeqNo,
            dd.Remark AS dtlRemark
            FROM
            t_BD_Dict AS d
            INNER JOIN t_BD_DictDtl AS dd ON d.DictCode = dd.DictCode
            AND dd.DelFlag = 0;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-109', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 110, '8:cae0e4685793f6c85bc4cab8e9c1d5ce', 'createView viewName=V_BD_Dict', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-110::WangXun
CREATE VIEW V_BD_GetTeamInfo AS SELECT
            a.WorkDate,
            a.ShiftCode,
            a.TeamCode,
            a.Dept,
            a.DelFlag,
            b.ShiftName,
            b.BeginTime,
            b.EndTime,
            c.TeamName,
            c.Leader,
            DATE_FORMAT( a.WorkDate, '%Y-%m-%d' ) + ' ' + b.BeginTime + ':00' AS BeginDate,
            CASE

            WHEN BeginTime > EndTime THEN
            DATE_FORMAT( DATE_ADD( WorkDate, INTERVAL 1 DAY ), '%Y-%m-%d' ) + ' ' + EndTime + ':00' ELSE DATE_FORMAT( WorkDate, '%Y-%m-%d' ) + ' ' + EndTime + ':00'
            END AS EndDate
            FROM
            t_BD_ArrangeResult AS a
            INNER JOIN t_BD_WorkShift AS b ON a.ShiftCode = b.ShiftCode
            AND b.DelFlag = '0'
            INNER JOIN t_BD_Team AS c ON a.TeamCode = c.TeamCode
            AND c.DelFlag = '0'
            WHERE
            ( a.DelFlag = '0' );

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-110', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 111, '8:17340f265994adc5edc25f17d2dd9395', 'createView viewName=V_BD_GetTeamInfo', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-111::WangXun
CREATE VIEW V_BD_Mat AS SELECT
            a.ID,
            a.MatName,
            a.MatCode,
            a.Spec,
            a.Model,
            a.FirstUnitCode,
            a.SecondUnitCode,
            a.PYCode,
            a.UseFlag,
            a.MaxInventory,
            a.MinInventory,
            a.SafeInventory,
            a.Remark,
            a.DelFlag,
            a.InputCode,
            a.InputDate,
            a.DeptCode,
            a.CorpCode,
            a.ModifyCode,
            a.ModifyDate,
            a.IsSetBatch,
            b.UnitDtlName AS FirstUnitName,
            c.UnitDtlName AS SecondUnitName
            FROM
            t_BD_Material AS a
            LEFT OUTER JOIN t_BD_UnitDtl AS b ON a.FirstUnitCode = b.UnitDtlCode
            AND b.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS c ON a.SecondUnitCode = c.UnitDtlCode
            AND c.DelFlag = 0;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-111', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 112, '8:60b0ce0a9e7096bced27ebdfc8f6ae13', 'createView viewName=V_BD_Mat', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-112::WangXun
CREATE VIEW V_BD_Material AS SELECT
            a.ID,
            a.MatName,
            a.MatCode,
            a.Spec,
            a.Model,
            a.FirstUnitCode,
            a.SecondUnitCode,
            a.PYCode,
            a.UseFlag,
            a.MaxInventory,
            a.MinInventory,
            a.SafeInventory,
            a.Remark,
            a.DelFlag,
            a.InputCode,
            a.InputDate,
            a.DeptCode,
            a.CorpCode,
            a.ModifyCode,
            a.ModifyDate,
            b.UnitDtlName AS FirstUnitName,
            c.UnitDtlName AS SecondUnitName,
            t.TypeCode
            FROM
            t_BD_Material AS a
            LEFT OUTER JOIN t_BD_UnitDtl AS b ON a.FirstUnitCode = b.UnitDtlCode
            AND b.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS c ON a.SecondUnitCode = c.UnitDtlCode
            AND c.DelFlag = 0
            LEFT OUTER JOIN t_BD_MaterialRelType AS t ON a.MatCode = t.MatCode
            AND t.DelFlag = 0;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-112', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 113, '8:0f012c25b25c7db705fd698f8f1c1220', 'createView viewName=V_BD_Material', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-113::WangXun
CREATE VIEW V_BD_MaterialAttr AS SELECT
            b.ID,
            b.MatCode,
            b.AttrCode,
            b.AttrName,
            b.AttrValue,
            b.Remark,
            b.InputCode,
            b.InputDate,
            a.DelFlag,
            a.Spec
            FROM
            t_BD_Material AS a
            INNER JOIN t_BD_MaterialAttr AS b ON a.MatCode = b.MatCode
            AND b.DelFlag = 0;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-113', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 114, '8:44fcd1e4c3303899ca01f8989af8531b', 'createView viewName=V_BD_MaterialAttr', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-114::WangXun
CREATE VIEW V_BD_MaterialType AS SELECT
            t.ID,
            m.MatName,
            m.MatCode,
            m.Spec,
            m.Model,
            m.FirstUnitCode,
            m.SecondUnitCode,
            v.DelFlag,
            v.TypeCode,
            v.dtlId,
            v.dtlCode,
            a.UnitDtlName AS FirstUnitName,
            b.UnitDtlName AS SecondUnitName,
            v.dtlCode AS MatType
            FROM
            V_BD_Dict AS v
            INNER JOIN t_BD_MaterialRelType AS t ON v.dtlCode = t.TypeCode
            AND t.DelFlag = 0
            INNER JOIN t_BD_Material AS m ON t.MatCode = m.MatCode
            AND m.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS a ON m.FirstUnitCode = a.UnitDtlCode
            AND a.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS b ON m.SecondUnitCode = b.UnitDtlCode
            AND b.DelFlag = 0
            WHERE
            ( v.DictCode = 'MatType' )
            AND (
            m.UseFlag = '1');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-114', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 115, '8:7f782c8ba93b156daa531954a0779a71', 'createView viewName=V_BD_MaterialType', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-115::WangXun
CREATE VIEW V_BD_Team AS SELECT
            a.ID,
            a.TeamCode,
            a.TeamName,
            a.Leader,
            a.Dept,
            a.DelFlag,
            a.InputCode,
            a.InputDate,
            a.DeptCode,
            a.CorpCode,
            a.ModifyCode,
            a.ModifyDate,
            b.Name AS LeaderName
            FROM
            t_BD_Team AS a
            LEFT OUTER JOIN SM_Person AS b ON a.Leader = b.Code;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-115', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 116, '8:3b62df1b377d73a85853b7e9ca2f84f1', 'createView viewName=V_BD_Team', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-116::WangXun
CREATE VIEW V_BD_PersonDeptInfo AS SELECT
            a.PersonCode,
            a.DeptCode,
            b.Name
            FROM
            SM_PersonDeptPower a
            INNER JOIN SM_Department b ON a.DeptCode = b.Code
            AND b.DelFlag = '0' UNION
            SELECT
            b.Code AS PersonCode,
            b.DeptCode,
            a.Name
            FROM
            SM_Department a
            INNER JOIN SM_Person b ON a.Code = b.DeptCode;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-116', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 117, '8:83b3ec49f0112f16e3106e51886277a4', 'createView viewName=V_BD_PersonDeptInfo', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-117::WangXun
CREATE VIEW V_BD_StartDate AS SELECT
            MIN(DATE_FORMAT(t.WorkDate ,'%Y-%m-%d %T:%f'))AS WorkDate,
            t.Dept
            FROM
            t_BD_ArrangePeriod t
            WHERE
            t.DelFlag = '0'
            GROUP BY
            t.Dept;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-117', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 118, '8:fb24cc0cabf68288ad876413f82bf88e', 'createView viewName=V_BD_StartDate', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-118::WangXun
CREATE VIEW V_BD_SupplierMaterialDtl AS SELECT
            dtl.ID,
            dtl.SupplierCode,
            sup.SupplierName,
            mat.MatName,
            mat.MatCode,
            mat.Spec,
            mat.Model,
            mat.FirstUnitCode,
            mat.SecondUnitCode,
            mat.DelFlag,
            a.UnitDtlName AS FirstUnitName,
            b.UnitDtlName AS SecondUnitName
            FROM
            t_BD_SupplierMaterialDtl AS dtl
            INNER JOIN t_BD_Material AS mat ON dtl.MatCode = mat.MatCode
            AND mat.DelFlag = 0
            INNER JOIN t_BD_Supplier AS sup ON dtl.SupplierCode = sup.SupplierCode
            AND sup.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS a ON mat.FirstUnitCode = a.UnitDtlCode
            AND a.DelFlag = 0
            LEFT OUTER JOIN t_BD_UnitDtl AS b ON mat.SecondUnitCode = b.UnitDtlCode
            AND b.DelFlag = 0;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-118', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 119, '8:5f95ddd74fe23bf3c2c88927855b0d9e', 'createView viewName=V_BD_SupplierMaterialDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-119::WangXun
CREATE VIEW V_BD_Tag AS SELECT
            t_tag.id,
            t_tag.clctr,
            t_tag.name,
            t_tag.ioaddr,
            t_tag.type,
            t_tag.version,
            t_tag.arcmode,
            t_tag.arcto,
            t_tag.arcoff,
            t_tag.clctrate,
            t_tag.clctto,
            t_tag.description,
            t_tag.unit,
            t_tag.arcddbnd,
            t_tag.clctddbnd,
            t_tag.minimal,
            t_tag.maximal,
            t_tag.lowlimit,
            t_tag.highlimit,
            t_tag.lololimit,
            t_tag.hihilimit,
            t_clctr.name AS clctrname,
            t_clctr.name + '.' + t_tag.name AS fullname
            FROM
            t_clctr
            INNER JOIN t_tag ON t_clctr.id = t_tag.clctr;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-119', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 120, '8:f97124a24e274952df2339e7761916d0', 'createView viewName=V_BD_Tag', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-120::WangXun
CREATE VIEW V_BD_Member AS SELECT
            a.ID,
            a.TeamCode,
            a.PersonCode,
            a.DelFlag,
            b.Name AS PersonName,
            b.Sex,
            b.WorkNum,
            b.Account,
            b.DeptCode,
            b.CorpCode,
            b.Duty,
            b.Position,
            b.Superior,
            b.Mobile,
            b.Email,
            b.PersonStatus,
            c.TeamName
            FROM
            t_BD_Member AS a
            LEFT OUTER JOIN SM_Person AS b ON a.PersonCode = b.Code
            LEFT OUTER JOIN V_BD_Team AS c ON a.TeamCode = c.TeamCode;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-120', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 121, '8:7393c6a72ee1254d4da9c5906c22f0e0', 'createView viewName=V_BD_Member', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-121::WangXun
CREATE VIEW V_BD_UnitConv AS SELECT
            a.ID,
            a.MatCode,
            a.BeforeConvCode,
            a.AfterConvCode,
            a.ScaledValue,
            a.Remark,
            a.DelFlag,
            b.UnitDtlName AS BeforeConvName,
            c.UnitDtlName AS AfterConvName
            FROM
            t_BD_UnitConv AS a
            INNER JOIN t_BD_Material AS m ON a.MatCode = m.MatCode
            AND m.DelFlag = 0
            INNER JOIN t_BD_UnitDtl AS b ON a.BeforeConvCode = b.UnitDtlCode
            AND b.DelFlag = 0
            INNER JOIN t_BD_UnitDtl AS c ON a.AfterConvCode = c.UnitDtlCode
            AND c.DelFlag = 0;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-121', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 122, '8:44ed88f1b50ab4bebbe063b0ac191ab4', 'createView viewName=V_BD_UnitConv', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-122::WangXun
CREATE VIEW V_CF_Alarm AS SELECT
            SM_ProjectArchitecture.strProjectCode,
            SM_ProjectArchitecture.strName AS strProjectName,
            CF_Alarm.ID,
            CF_Alarm.nAlarmType,
            CF_Alarm.nAlarmState,
            CF_Alarm.nAlarmlevel,
            CF_Alarm.strEventTime,
            CF_Alarm.strTagName,
            CF_Alarm.strTagDes,
            CF_Alarm.strArea,
            CF_Alarm.strDevice,
            CF_Alarm.strUnit,
            CF_Alarm.strMsgDes,
            CF_Alarm.fAlarmlimit,
            CF_Alarm.strAlarmValue,
            CF_Alarm.strRecoveryTime,
            CF_Alarm.strAckedTime,
            CF_Alarm.strAckedComment,
            CF_Alarm.nSource,
            CF_Alarm.strIsHide,
            CF_Alarm.strNodeDomain,
            CF_Alarm.strTypeName,
            CF_Alarm.strAlarmTypeDes,
            CF_Alarm.nPushStatus,
            CF_Alarm.strAlarmLevelDes
            FROM
            SM_ProjectArchitecture
            INNER JOIN SM_ProjectTag ON SM_ProjectArchitecture.strDelFlag = '0'
            AND SM_ProjectArchitecture.strProjectCode = SM_ProjectTag.strProjectCode
            INNER JOIN CF_Alarm ON SM_ProjectTag.strName = CF_Alarm.strTagName
            OR SM_ProjectTag.strName = CF_Alarm.strNodeDomain;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-122', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 123, '8:56ab8019dd9f61030238f1ac1d52a513', 'createView viewName=V_CF_Alarm', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-123::WangXun
CREATE VIEW V_CF_NodeState AS SELECT
            `a`.`ID` AS `ID`,
            ( CASE WHEN ( `a`.`nNodeType` = 3 ) THEN `a`.`strSerialNum` ELSE `a`.`nNodePCID` END ) AS `nNodePCID`,
            `a`.`nCPULoad` AS `nCPULoad`,
            `a`.`fTemperature` AS `fTemperature`,
            `a`.`nMemoryLoad` AS `nMemoryLoad`,
            `a`.`nState` AS `nState`,
            ( CASE WHEN ( `a`.`nState` = 1 ) THEN '正常' ELSE '不正常' END ) AS `StateName`,
            `a`.`nNodeType` AS `nNodeType`,
            (
            CASE

            WHEN ( `a`.`nNodeType` = 0 ) THEN
            '普通节点'
            WHEN ( `a`.`nNodeType` = 1 ) THEN
            '网闸安全侧'
            WHEN ( `a`.`nNodeType` = 2 ) THEN
            '网闸开放侧'
            WHEN ( `a`.`nNodeType` = 3 ) THEN
            '云卡'
            END
            ) AS `NodeTypeName`,
            `a`.`strStateTime` AS `strStateTime`,
            ( SELECT count( 0 ) AS `Expr1` FROM `cf_processstate` WHERE ( `cf_processstate`.`nNodePCID` = `a`.`nNodePCID` ) ) AS `IsHaveDetail`
            FROM
            `cf_nodestate` `a`;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-123', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 124, '8:fcf0e8a220fecef5bd6fd20f19563c65', 'createView viewName=V_CF_NodeState', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-124::WangXun
CREATE VIEW V_CF_ProcessState AS SELECT
            `a`.`ID` AS `ID`,
            `a`.`nNodePCID` AS `nNodePCID`,
            `a`.`nProcessID` AS `nProcessID`,
            `a`.`strProcessName` AS `strProcessName`,
            `a`.`nState` AS `nState`,
            ( CASE WHEN ( `a`.`nState` = 1 ) THEN '正常' ELSE '不正常' END ) AS `StateName`,
            `a`.`strStateTime` AS `strStateTime`,
            (
            SELECT
            count( 0 ) AS `Expr1`
            FROM
            `cf_servicestate`
            WHERE
            (
            ( `cf_servicestate`.`strProcessName` = `a`.`strProcessName` )
            AND ( `cf_servicestate`.`nNodePCID` = `a`.`nNodePCID` )
            AND ( `a`.`strProcessName` LIKE '%IOSERVER%' )
            )
            ) AS `IsHaveDetail`
            FROM
            `cf_processstate` `a`;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-124', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 125, '8:48debbb86446ec45c173b479c9df3635', 'createView viewName=V_CF_ProcessState', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-125::WangXun
CREATE VIEW V_CF_ServiceState AS SELECT
            ID,
            nNodePCID,
            strProcessName,
            strServiceName,
            nState,
            CASE

            WHEN nState = 1 THEN
            '正常' ELSE '不正常'
            END AS StateName
            FROM
            CF_ServiceState AS A;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-125', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 126, '8:b3310095b700e91eb9647023c420ee57', 'createView viewName=V_CF_ServiceState', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-126::WangXun
CREATE VIEW V_SM_Biz AS SELECT
            a.Code,
            a.CodeLength,
            a.CodeOrder,
            a.CorpCode,
            a.DelFlag,
            a.DeptCode,
            a.ID,
            a.InputCode,
            a.InputDate,
            a.ISYMD,
            ( CASE a.ISYMD WHEN '0' THEN '否' WHEN '1' THEN '是' END ) AS ISYMDName,
            a.MaxCode,
            a.MinCode,
            a.ModifyCode,
            a.ModifyDate,
            a.ModuleCode,
            a.Name,
            a.PolishChar,
            a.PolishRule,
            ( CASE a.PolishRule WHEN '0' THEN '左补' WHEN '1' THEN '右补' WHEN '2' THEN '不补' END ) AS PolishRuleName,
            a.Prefix,
            a.Radix,
            ( CASE a.Radix WHEN '0' THEN '二进制' WHEN '1' THEN '八进制' WHEN '2' THEN '十进制' WHEN '3' THEN '十六进制' END ) AS RadixName,
            a.Remark,
            a.SerialEntity,
            a.SerialTimeGran,
            ( CASE a.SerialTimeGran WHEN '0' THEN '日' WHEN '1' THEN '月' WHEN '2' THEN '年' ELSE '无' END ) AS SerialTimeGranName,
            a.Suffix,
            a.ValueSource,
            b.Title
            FROM
            SM_Biz AS a
            LEFT OUTER JOIN SM_SystemResourceDtl AS b ON a.ModuleCode = b.Code;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-126', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 127, '8:8be3436c91c2c5c6d60114be8f2cde60', 'createView viewName=V_SM_Biz', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-127::WangXun
CREATE VIEW V_SM_Department AS SELECT
            ID,
            Code,
            Pcode,
            Name,
            Charge,
            OrderNo,
            IsCompany,
            IsProductionDept,
            DelFlag,
            '' AS hasAuthority
            FROM
            SM_Department;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-127', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 128, '8:98a7d8a35cf1c0596f39709f162b6998', 'createView viewName=V_SM_Department', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-128::WangXun
CREATE VIEW V_SM_DepartmentPerson AS SELECT
            c.ID,
            c.Code,
            c.Name,
            c.Pcode,
            c.Charge AS PersonCode,
            d.Name AS Charge,
            c.OrderNo,
            c.IsCompany,
            c.IsProductionDept,
            c.DelFlag
            FROM
            SM_Department AS c
            LEFT OUTER JOIN SM_Person AS d ON c.Charge = d.Code;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-128', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 129, '8:df09359faba998237f273693619b282b', 'createView viewName=V_SM_DepartmentPerson', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-129::WangXun
CREATE VIEW V_SM_DeployDataPower AS SELECT
            b.Parameter,
            b.DeployID,
            c.path,
            c.type,
            c.pid,
            a.PersonCode
            FROM
            SM_PersonDataPower AS a
            INNER JOIN SM_SystemResourceRmisDtl AS b ON a.SystemResourceDtlCode = b.Code
            AND b.DelFlag = '0'
            INNER JOIN t_deply AS c ON b.DeployID = c.Id;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-129', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 130, '8:63e2cd604a6d77c844f71b3a17d3dcf0', 'createView viewName=V_SM_DeployDataPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-130::WangXun
CREATE VIEW V_SM_DeptPerson AS SELECT
            c.ID,
            c.Code,
            c.Name,
            c.DeptCode,
            d.Name AS DeptName,
            c.WorkNum,
            c.Account,
            c.OrderNo
            FROM
            (
            SELECT
            ID,
            Code,
            Name,
            Sex,
            WorkNum,
            Account,
            Password,
            DeptCode,
            CorpCode,
            Duty,
            POSITION,
            Superior,
            Mobile,
            Email,
            OrderNo,
            PersonStatus,
            DelFlag
            FROM
            SM_Person
            WHERE
            ( Code <> 'System' )) AS c
            LEFT OUTER JOIN SM_Department AS d ON c.DeptCode = d.Code
            WHERE
            ( d.DelFlag = '0' )
            AND (
            c.DelFlag = '0');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-130', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 131, '8:fa569b123f7f3805dc88acb344a5717b', 'createView viewName=V_SM_DeptPerson', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-131::WangXun
CREATE VIEW V_SM_GetAllRoleForCode AS SELECT
            a.Code AS RoleCode,
            b.ID,
            c.Code
            FROM
            SM_PersonRole_Rel AS b
            LEFT OUTER JOIN SM_Role AS a ON a.Code = b.RoleCode
            LEFT OUTER JOIN SM_Person AS c ON c.Code = b.PersonCode;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-131', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 132, '8:76ed70149063bcbaaa0c69246ff4175f', 'createView viewName=V_SM_GetAllRoleForCode', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-132::WangXun
CREATE VIEW V_SM_GetButtonForCode AS SELECT
            a.PersonCode,
            a.PageButtonConfigID,
            a.SystemResourceDtlCode
            FROM
            SM_PersonSysPower AS a
            LEFT OUTER JOIN SM_PageButtonConfig AS b ON b.ID = a.PageButtonConfigID;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-132', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 133, '8:ade7a93c629e98f61d86a9fa1cafe268', 'createView viewName=V_SM_GetButtonForCode', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-133::WangXun
CREATE VIEW V_SM_GetButtonForRole AS SELECT
            a.PageButtonConfigID,
            a.SystemResourceDtlCode,
            a.RoleCode
            FROM
            SM_RoleSysPower AS a
            LEFT OUTER JOIN SM_PageButtonConfig AS b ON b.ID = a.PageButtonConfigID;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-133', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 134, '8:df3de7926edb981b2b59a45d8068f406', 'createView viewName=V_SM_GetButtonForRole', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-134::WangXun
CREATE VIEW V_SM_GetPersonResourceForRole AS SELECT
            a.Title,
            b.Title AS subtitle,
            c.RoleCode,
            b.ResourceUrl,
            b.Parameter,
            c.CustomPower,
            c.DataPower,
            a.ID,
            c.SystemResourceDtlCode
            FROM
            SM_SystemResource AS a
            LEFT OUTER JOIN SM_SystemResourceDtl AS b ON a.Code = b.SystemResourceCode
            LEFT OUTER JOIN SM_RoleDataPower AS c ON c.SystemResourceDtlCode = b.Code;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-134', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 135, '8:9a7fdd87ac7c35905d1cd944583cf650', 'createView viewName=V_SM_GetPersonResourceForRole', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-135::WangXun
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

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-135', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 136, '8:838b665f05d5ce3395bc815e2533e4e2', 'createView viewName=V_SM_Log', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-136::WangXun
CREATE VIEW V_SM_MessageInfo AS SELECT
            a.ID,
            a.Sender,
            a.SendTime,
            a.Content,
            a.DelFlag,
            a.EndTime,
            a.Title,
            a.InputCode,
            a.InputDate,
            a.DeptCode,
            a.CorpCode,
            a.ModifyCode,
            a.ModifyDate,
            a.MsgType,
            b.Name,
            a.nPushStatus
            FROM
            SM_MessageInfo AS a
            LEFT OUTER JOIN SM_Person AS b ON a.Sender = b.Code
            WHERE
            ( b.DelFlag = '0' )
            AND (
            b.PersonStatus = '1');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-136', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 137, '8:82da9b28bef0c6c92e572c08255ce561', 'createView viewName=V_SM_MessageInfo', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-137::WangXun
CREATE VIEW V_SM_MessageInfoAll AS SELECT
            SM_MessageInfoDtl.ID,
            SM_MessageInfo.Title,
            SM_MessageInfo.Content,
            SM_MessageInfoDtl.PersonCode,
            SM_MessageInfoDtl.IsRead,
            SM_MessageInfoDtl.DelFlag,
            SM_MessageInfo.SendTime,
            SM_MessageInfo.Sender,
            SM_Person.Name AS SenderName,
            SM_MessageInfo.ID AS PID,
            SM_MessageInfo.MsgType,
            SM_MessageInfo.nPushStatus,
            SM_MessageInfo.Client
            FROM
            SM_MessageInfo
            INNER JOIN SM_MessageInfoDtl ON SM_MessageInfo.ID = SM_MessageInfoDtl.PID
            INNER JOIN SM_Person ON SM_MessageInfo.Sender = SM_Person.Code;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-137', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 138, '8:8f796f4c0a1f91c281d20b8ffe5ac979', 'createView viewName=V_SM_MessageInfoAll', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-138::WangXun
CREATE VIEW V_SM_MessageInfoDtl AS SELECT
            a.PID,
            a.PersonCode,
            b.Name,
            a.ID
            FROM
            SM_MessageInfoDtl AS a
            LEFT OUTER JOIN SM_Person AS b ON a.PersonCode = b.Code;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-138', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 139, '8:5fbe9759948e2dcd1bcdf478647eb86f', 'createView viewName=V_SM_MessageInfoDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-139::WangXun
CREATE VIEW V_SM_PersonDataPower AS SELECT
            a.ID,
            PersonCode,
            SystemResourceDtlCode,
            DataPower,
            CustomPower,
            '0' AS strIsEnable
            FROM
            SM_RoleDataPower AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.RoleCode = b.RoleCode
            WHERE
            a.SystemResourceDtlCode IS NOT NULL UNION ALL
            SELECT
            ID,
            PersonCode,
            SystemResourceDtlCode,
            DataPower,
            CustomPower,
            '1' AS strIsEnable
            FROM
            SM_PersonDataPower
            WHERE
            SystemResourceDtlCode IS NOT NULL;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-139', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 140, '8:02c0c6764ef1c59aab6b4447ca99efc4', 'createView viewName=V_SM_PersonDataPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-140::WangXun
CREATE VIEW V_SM_PersonDeptPower AS SELECT
            a.ID AS Code,
            a.DeptCode,
            b.PersonCode
            FROM
            SM_RoleDeptPower AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.RoleCode = b.RoleCode UNION ALL
            SELECT
            ID AS Code,
            DeptCode,
            PersonCode
            FROM
            SM_PersonDeptPower;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-140', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 141, '8:b5a60703b6ff75d07240ee736d01c792', 'createView viewName=V_SM_PersonDeptPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-141::WangXun
CREATE VIEW V_SM_PersonInfo AS SELECT
            c.ID,
            c.CODE,
            c.NAME,
            c.Sex,
            CASE
            c.Sex
            WHEN '0' THEN
            '男'
            WHEN '1' THEN
            '女'
            END AS SexName,
            c.Account,
            c.WorkNum,
            c.PASSWORD AS Pwd,
            c.DeptCode,
            c.Mobile,
            c.Duty,
            c.Position,
            c.Superior,
            c.DelFlag,
            c.CorpCode,
            d.NAME AS DeptName,
            e.NAME AS CorpName,
            ee.RoleCode,
            ee.RoleName,
            ff.DepartCode,
            ff.DepartName,
            h.NAME AS SuperiorName
            FROM
            SM_Person AS c
            LEFT JOIN (
            SELECT CODE AS
            Code1,
            RoleCode = (
            INSERT (
            (
            SELECT
            GROUP_CONCAT( RoleCode, ',' )
            FROM
            (
            SELECT
            a.CODE,
            c.CODE AS RoleCode,
            c.NAME AS RoleName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.CODE = b.PersonCode
            LEFT JOIN SM_Role AS c ON b.RoleCode = c.CODE
            AND c.DelFlag = '0'
            ) AS bb
            WHERE
            CODE = aa.CODE
            ),
            1,
            1,
            ''
            )
            ) AS RoleCode,
            RoleName = (
            INSERT (
            (
            SELECT
            GROUP_CONCAT( RoleName, ',' )
            FROM
            (
            SELECT
            a.CODE,
            c.CODE AS RoleCode,
            c.NAME AS RoleName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.CODE = b.PersonCode
            LEFT JOIN SM_Role AS c ON b.RoleCode = c.CODE
            AND c.DelFlag = '0'
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            CODE = aa.CODE
            ORDER BY
            RoleName
            ),
            1,
            1,
            ''
            )
            ) AS RoleName
            FROM
            (
            SELECT
            a.CODE,
            c.CODE AS RoleCode,
            c.NAME AS RoleName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.CODE = b.PersonCode
            LEFT JOIN SM_Role AS c ON b.RoleCode = c.CODE
            AND c.DelFlag = '0'
            WHERE
            a.DelFlag = '0'
            ) AS aa
            GROUP BY
            CODE
            ) AS ee ON c.CODE = ee.Code1
            LEFT JOIN (
            SELECT CODE AS
            Code2,
            DepartCode = (
            INSERT (
            (
            SELECT
            GROUP_CONCAT( DepartCode, ',' )
            FROM
            (
            SELECT
            a.CODE,
            c.CODE AS DepartCode,
            c.NAME AS DepartName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonDepart_Rel AS b ON a.CODE = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Department WHERE DelFlag = '0' ) AS c ON b.DepartCode = c.CODE
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            CODE = hh.CODE
            ),
            1,
            1,
            ''
            )
            ) AS DepartCode,
            DepartName = (
            INSERT (
            (
            SELECT
            GROUP_CONCAT( DepartName, ',' )
            FROM
            (
            SELECT
            a.CODE,
            c.CODE AS DepartCode,
            c.NAME AS DepartName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonDepart_Rel AS b ON a.CODE = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Department WHERE DelFlag = '0' ) AS c ON b.DepartCode = c.CODE
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            CODE = hh.CODE
            ORDER BY
            DepartName
            ),
            1,
            1,
            ''
            )
            ) AS DepartName
            FROM
            (
            SELECT
            a.CODE,
            c.CODE AS DepartCode,
            c.NAME AS DepartName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonDepart_Rel AS b ON a.CODE = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Department WHERE DelFlag = '0' ) AS c ON b.DepartCode = c.CODE
            WHERE
            a.DelFlag = '0'
            ) AS hh
            GROUP BY
            CODE
            ) AS ff ON c.CODE = ff.Code2
            LEFT JOIN SM_Department AS d ON c.DeptCode = d.
            CODE LEFT JOIN SM_Department AS e ON c.CorpCode = e.
            CODE LEFT JOIN SM_Person AS h ON c.Superior = h.CODE;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-141', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 142, '8:854f2c4631080e5e74fdee90657e1971', 'createView viewName=V_SM_PersonInfo', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-142::WangXun
CREATE VIEW V_SM_PersonProjectPower AS SELECT
            a.ID,
            PersonCode AS strPersonCode,
            strProjectCode,
            strItem,
            strPowerCode,
            strDataPower,
            strCustomPower,
            '0' AS strIsEnable
            FROM
            SM_RoleProjectPower AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.strRoleCode = b.RoleCode UNION ALL
            SELECT
            ID,
            strPersonCode,
            strProjectCode,
            strItem,
            strPowerCode,
            strDataPower,
            strCustomPower,
            '1' AS strIsEnable
            FROM
            SM_PersonProjectPower;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-142', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 143, '8:4e2873e226777aa55977d89c61785854', 'createView viewName=V_SM_PersonProjectPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-143::WangXun
CREATE VIEW V_SM_PersonProjectSysPower AS SELECT
            a.ID,
            b.PersonCode AS strPersonCode,
            c.strButtonID,
            c.strButtonName,
            c.strProjectSysPowerCode,
            c.nPowerCodeType,
            a.strProjectCode,
            a.strItemCode,
            a.nPageButtonConfigID,
            '0' AS strIsEnable
            FROM
            SM_RoleProjectSysPower AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.strRoleCode = b.RoleCode
            LEFT JOIN SM_ProjectPageButtonConfig AS c ON a.nPageButtonConfigID = c.ID UNION
            SELECT
            a.ID,
            a.strPersonCode,
            b.strButtonID,
            b.strButtonName,
            b.strProjectSysPowerCode,
            b.nPowerCodeType,
            a.strProjectCode,
            a.strItemCode,
            a.nPageButtonConfigID,
            '1' AS strIsEnable
            FROM
            SM_PersonProjectSysPower AS a
            LEFT JOIN SM_ProjectPageButtonConfig AS b ON a.nPageButtonConfigID = b.ID;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-143', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 144, '8:0fe5c63d1a3d919ee7974ec5dc3958e2', 'createView viewName=V_SM_PersonProjectSysPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-144::WangXun
CREATE VIEW V_SM_PersonResourceForCode AS SELECT
            a.Title,
            b.Title AS subtitle,
            c.PersonCode,
            b.ResourceUrl,
            b.Parameter,
            c.DataPower,
            b.Code,
            c.CustomPower,
            a.ID
            FROM
            SM_SystemResource AS a
            LEFT OUTER JOIN SM_SystemResourceDtl AS b ON a.Code = b.SystemResourceCode
            LEFT OUTER JOIN SM_PersonDataPower AS c ON c.SystemResourceDtlCode = b.Code;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-144', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 145, '8:83d3000be2adb916edd1da3613ea5b3a', 'createView viewName=V_SM_PersonResourceForCode', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-145::WangXun
CREATE VIEW V_SM_PersonSuperior AS SELECT
            c.ID,
            c.Code,
            c.Name,
            c.Account,
            c.CorpCode,
            c.DelFlag,
            c.DeptCode,
            c.Duty,
            c.Email,
            c.Mobile,
            c.Password,
            c.PersonStatus,
            c.Position,
            c.Sex,
            c.WorkNum,
            c.OrderNo,
            c.Superior,
            d.Name AS SuperiorName,
            b.RoleCode,
            a.Name AS RoleName
            FROM
            SM_Person AS c
            LEFT OUTER JOIN SM_PersonRole_Rel AS b ON c.Code = b.PersonCode
            LEFT OUTER JOIN SM_Role AS a ON a.Code = b.RoleCode
            LEFT OUTER JOIN SM_Person AS d ON c.Superior = d.Code;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-145', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 146, '8:ce3d7dc58e165c4e27fc016dca5e59a3', 'createView viewName=V_SM_PersonSuperior', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-146::WangXun
CREATE VIEW V_SM_PersonSuperiorRole AS SELECT
            dd.ID,
            dd.CODE,
            dd.NAME,
            dd.Account,
            dd.CorpCode,
            dd.DelFlag,
            dd.DeptCode,
            dd.Duty,
            dd.Email,
            dd.Mobile,
            dd.PASSWORD,
            dd.PersonStatus,
            dd.Position,
            dd.Sex,
            dd.WorkNum,
            dd.OrderNo,
            dd.Superior,
            dd.SuperiorName,
            dd.DeptName,
            ee.Code1,
            RoleCode,
            RoleName,
            ff.Code2,
            ff.DepartCode,
            ff.DepartName
            FROM
            (
            SELECT
            c.ID,
            c.CODE,
            c.NAME,
            c.Account,
            c.CorpCode,
            c.DelFlag,
            c.DeptCode,
            c.Duty,
            c.Email,
            c.Mobile,
            c.PASSWORD,
            c.PersonStatus,
            c.Position,
            c.Sex,
            c.WorkNum,
            c.OrderNo,
            c.Superior,
            d.NAME AS SuperiorName,
            e.NAME AS DeptName
            FROM
            (
            SELECT
            ID,
            CODE,
            NAME,
            Sex,
            WorkNum,
            Account,
            PASSWORD,
            DeptCode,
            CorpCode,
            Duty,
            POSITION,
            Superior,
            Mobile,
            Email,
            OrderNo,
            PersonStatus,
            DelFlag,
            RandCode,
            LastPasswordChangeTime
            FROM
            SM_Person
            WHERE
            ( Account <> 'System' )
            OR ( Account IS NULL )
            ) AS c
            LEFT OUTER JOIN SM_Person AS d ON c.Superior = d.
            CODE LEFT OUTER JOIN SM_Department AS e ON c.DeptCode = e.CODE
            ) AS dd
            LEFT OUTER JOIN (
            SELECT CODE AS
            Code1,
            INSERT (
            (
            SELECT
            ',' + RoleCode
            FROM
            (
            SELECT
            a.CODE,
            c.CODE AS RoleCode,
            c.NAME AS RoleName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.CODE = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Role WHERE DelFlag = '0' ) AS c ON b.RoleCode = c.CODE
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            CODE = GROUP_CONCAT( aa.CODE, ',' )
            ),
            1,
            1,
            ''
            ) AS RoleCode,
            INSERT (
            (
            SELECT
            ',' + RoleName
            FROM
            (
            SELECT
            a.CODE,
            c.CODE AS RoleCode,
            c.NAME AS RoleName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.CODE = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Role WHERE DelFlag = '0' ) AS c ON b.RoleCode = c.CODE
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            CODE = aa.CODE
            ORDER BY
            RoleName
            ),
            1,
            1,
            ''
            ) AS RoleName
            FROM
            (
            SELECT
            a.CODE,
            c_2.CODE AS RoleCode,
            c_2.NAME AS RoleName
            FROM
            SM_Person AS a
            LEFT OUTER JOIN SM_PersonRole_Rel AS b ON a.CODE = b.PersonCode
            LEFT OUTER JOIN ( SELECT ID, CODE, NAME, 'DESCRIBE', DelFlag FROM SM_Role WHERE ( DelFlag = '0' ) ) AS c_2 ON b.RoleCode = c_2.CODE
            WHERE
            a.DelFlag = '0'
            ) AS aa
            GROUP BY
            CODE
            ) AS ee ON dd.CODE = ee.Code1
            LEFT OUTER JOIN (
            SELECT CODE AS
            Code2,
            INSERT (
            (
            SELECT
            ',' + DepartCode
            FROM
            (
            SELECT
            a.CODE,
            c.CODE AS DepartCode,
            c.NAME AS DepartName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonDepart_Rel AS b ON a.CODE = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Department WHERE DelFlag = '0' ) AS c ON b.DepartCode = c.CODE
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            CODE = GROUP_CONCAT( hh.CODE, ',' )
            ),
            1,
            1,
            ''
            ) AS DepartCode,
            INSERT (
            (
            SELECT
            ',' + DepartName
            FROM
            (
            SELECT
            a.CODE,
            c.CODE AS DepartCode,
            c.NAME AS DepartName
            FROM
            SM_Person AS a
            LEFT JOIN SM_PersonDepart_Rel AS b ON a.CODE = b.PersonCode
            LEFT JOIN ( SELECT * FROM SM_Department WHERE DelFlag = '0' ) AS c ON b.DepartCode = c.CODE
            WHERE
            a.DelFlag = '0'
            ) AS bb
            WHERE
            CODE = hh.CODE
            ORDER BY
            ',' + DepartName
            ),
            1,
            1,
            ''
            ) AS DepartName
            FROM
            (
            SELECT
            a.CODE,
            c_1.CODE AS DepartCode,
            c_1.NAME AS DepartName
            FROM
            SM_Person AS a
            LEFT OUTER JOIN SM_PersonDepart_Rel AS b ON a.CODE = b.PersonCode
            LEFT OUTER JOIN (
            SELECT
            ID,
            CODE,
            Pcode,
            NAME,
            Charge,
            OrderNo,
            IsCompany,
            IsProductionDept,
            DelFlag
            FROM
            SM_Department
            WHERE
            ( DelFlag = '0' )
            ) AS c_1 ON b.DepartCode = c_1.CODE
            WHERE
            a.DelFlag = '0'
            ) AS hh
            GROUP BY
            CODE
            ) AS ff ON dd.CODE = ff.Code2;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-146', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 147, '8:dac21eebb1fa0b4dffe146f866828ce0', 'createView viewName=V_SM_PersonSuperiorRole', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-147::WangXun
CREATE VIEW V_SM_PersonSysPower AS SELECT
            a.ID AS Code,
            b.PersonCode,
            a.IsEnable,
            c.ButtonID,
            c.ButtonName,
            c.SystemResourceDtlCode,
            c.IsSysMenu,
            a.PageButtonConfigID,
            '0' AS strIsEnable
            FROM
            SM_RoleSysPower AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.RoleCode = b.RoleCode
            LEFT JOIN SM_PageButtonConfig AS c ON a.PageButtonConfigID = c.ID UNION
            SELECT
            a.ID AS Code,
            a.PersonCode,
            a.IsEnable,
            b.ButtonID,
            b.ButtonName,
            b.SystemResourceDtlCode,
            b.IsSysMenu,
            a.PageButtonConfigID,
            '1' AS strIsEnable
            FROM
            SM_PersonSysPower AS a
            LEFT JOIN SM_PageButtonConfig AS b ON a.PageButtonConfigID = b.ID;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-147', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 148, '8:d3acbba7f619e18eb3a4c9d372494e71', 'createView viewName=V_SM_PersonSysPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-149::WangXun
CREATE VIEW V_SM_ProjectReportPlan AS SELECT
            c.ID,
            c.strID,
            c.strGTGuid,
            c.strProjectCode,
            c.nOrderNo,
            d.strPlanName,
            d.strPlanDescription,
            d.strReportTemplateResourceUrl,
            d.strGTName,
            d.strReportServiceAName,
            d.strReportServiceBName,
            c.strDelFlag
            FROM
            SM_ProjectReportPlan AS c
            INNER JOIN SM_ReportPlan AS d ON c.strID = d.ID
            AND c.strGTGuid = d.strGTGuid;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-149', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 149, '8:6e1ba2b79b891d1f80155d16b0ff710f', 'createView viewName=V_SM_ProjectReportPlan', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-150::WangXun
CREATE VIEW V_SM_ProjectVideo AS SELECT
            SM_ProjectVideo.ID,
            SM_ProjectVideo.strGTGuid,
            SM_ProjectVideo.strName,
            SM_ProjectVideo.strDescription,
            SM_ProjectVideo.strProjectCode,
            SM_ProjectVideo.nOrderNo,
            SM_ProjectVideo.strResourceUrl,
            SM_ProjectVideo.strDevType,
            SM_ProjectVideo.strUserName,
            SM_ProjectVideo.strPassword,
            SM_ProjectVideo.strDelFlag,
            SM_ProjectVideo.strAccountID,
            SM_ProjectVideo.strSerialNum,
            SM_VideoAccount.strAccountName
            FROM
            SM_ProjectVideo
            LEFT OUTER JOIN SM_VideoAccount ON SM_ProjectVideo.strAccountID = SM_VideoAccount.ID;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-150', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 150, '8:77ae1ffd4e184b82f8d9b806b911c0d4', 'createView viewName=V_SM_ProjectVideo', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-151::WangXun
CREATE VIEW V_SM_ReceiverGroupDtl AS SELECT
            a.PCode AS GroupCode,
            a.PersonCode,
            b.WorkNum,
            b.Sex,
            b.Name AS PersonName,
            b.Position,
            b.Mobile,
            b.Email,
            c.Name AS DeptName
            FROM
            SM_ReceiverGroupDtl AS a
            INNER JOIN SM_Person AS b ON a.PersonCode = b.Code
            INNER JOIN SM_Department AS c ON b.DeptCode = c.Code
            WHERE
            ( b.DelFlag = '0' )
            AND (
            c.DelFlag = '0');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-151', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 151, '8:2706742f027d7d536bbeee87bc340f9d', 'createView viewName=V_SM_ReceiverGroupDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-152::WangXun
CREATE VIEW V_SM_RolePerson AS SELECT
            a.Code AS RoleCode,
            c.Code,
            c.Name,
            c.Sex,
            c.WorkNum,
            c.Account,
            c.Duty,
            c.Position,
            c.Superior,
            (
            SELECT
            Name
            FROM
            SM_Person AS d
            WHERE
            ( Code = c.Superior )) AS SuperiorName,
            c.Mobile,
            c.Email,
            c.OrderNo,
            b.ID
            FROM
            SM_PersonRole_Rel AS b
            LEFT OUTER JOIN SM_Role AS a ON a.Code = b.RoleCode
            LEFT OUTER JOIN SM_Person AS c ON c.Code = b.PersonCode
            WHERE
            ( a.DelFlag = 0 )
            AND (
            c.DelFlag = 0);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-152', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 152, '8:3cf3cc509c9e84265684cdd4066cde13', 'createView viewName=V_SM_RolePerson', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-153::WangXun
CREATE VIEW V_SM_RoleProjectSysPower AS SELECT
            a.ID,
            a.strRoleCode,
            b.strButtonID,
            b.strButtonName,
            b.strProjectSysPowerCode,
            b.nPowerCodeType,
            a.strProjectCode,
            a.strItemCode,
            a.nPageButtonConfigID,
            '1' AS strIsEnable
            FROM
            SM_RoleProjectSysPower AS a
            LEFT OUTER JOIN SM_ProjectPageButtonConfig AS b ON a.nPageButtonConfigID = b.ID;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-153', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 153, '8:c20f7c559f353d9ac116d49e9b7546d6', 'createView viewName=V_SM_RoleProjectSysPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-154::WangXun
CREATE VIEW V_SM_RoleSysPower AS SELECT
            a.RoleCode,
            a.IsEnable,
            b.ButtonID,
            b.ButtonName,
            b.SystemResourceDtlCode,
            b.IsSysMenu
            FROM
            SM_RoleSysPower AS a
            LEFT OUTER JOIN SM_PageButtonConfig AS b ON a.PageButtonConfigID = b.ID;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-154', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 154, '8:92acbbaf2cf25bfac241f43734743e55', 'createView viewName=V_SM_RoleSysPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-155::WangXun
CREATE VIEW V_SM_SystemResourceAll AS SELECT
            id,
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
            id,
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
            a.id,
            Code,
            SystemResourceCode AS PCode,
            OrderNo,
            Title,
            EnTitle,
            DelFlag,
            IsSysMenu,
            Type,
            path AS ResourceUrl,
            Parameter,
            IsHide,
            ExternalNetwork
            FROM
            SM_SystemResourceRmisDtl AS a
            LEFT JOIN t_deply b ON a.DeployID = b.id;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-155', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 155, '8:fc6ce1cc95bcb2818b3ba06fdc0e441f', 'createView viewName=V_SM_SystemResourceAll', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-156::WangXun
CREATE OR REPLACE VIEW V_SM_SystemResourceRmisDtl AS SELECT
            a.Code,
            a.DelFlag,
            a.ID,
            a.IsHide,
            a.IsSysMenu,
            a.OrderNo,
            a.Parameter,
            a.ResourceType,
            a.SystemResourceCode,
            a.Title,
            a.EnTitle,
            a.Platform,
            a.ConfCodeVou,
            b.path AS ResourceUrl,
            b.Id AS DeployID,
            '' AS ResourceUrlApp
            FROM
            SM_SystemResourceRmisDtl AS a
            LEFT OUTER JOIN t_deply AS b ON a.DeployID = b.Id;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-156', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 156, '8:29413bc36c190cf4e26339ef8ddd2c4f', 'createView viewName=V_SM_SystemResourceRmisDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-157::WangXun
CREATE VIEW V_SM_SystemResourceDtl AS SELECT
            ID,
            Code,
            SystemResourceCode,
            Title,
            EnTitle,
            ResourceType,
            ResourceUrl,
            ResourceUrlApp,
            Parameter,
            OrderNo,
            IsHide,
            IsSysMenu,
            Platform,
            ConfCodeVou,
            DelFlag,
            '' AS DeployID
            FROM
            SM_SystemResourceDtl UNION
            SELECT
            ID,
            Code,
            SystemResourceCode,
            Title,
            EnTitle,
            ResourceType,
            ResourceUrl,
            ResourceUrlApp,
            Parameter,
            OrderNo,
            IsHide,
            IsSysMenu,
            Platform,
            ConfCodeVou,
            DelFlag,
            DeployID
            FROM
            V_SM_SystemResourceRmisDtl;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-157', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 157, '8:2a76413119f4c49fbfed4d2f40e7764e', 'createView viewName=V_SM_SystemResourceDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-struct.xml::1574840696094-158::WangXun
CREATE VIEW V_SM_SystemResourcePowerDtl AS SELECT DISTINCT
            b.PersonCode,
            a.ID,
            a.Code,
            a.SystemResourceCode,
            a.Title,
            a.EnTitle,
            a.ResourceType,
            a.ResourceUrl,
            a.ResourceUrlApp,
            a.Parameter,
            a.OrderNo,
            a.IsHide,
            a.IsSysMenu,
            a.Platform,
            a.DeployID,
            a.ConfCodeVou,
            a.DelFlag
            FROM
            V_SM_SystemResourceDtl AS a
            CROSS JOIN V_SM_PersonDataPower AS b
            WHERE
            (
            a.Code IN (
            SELECT
            SystemResourceDtlCode
            FROM
            V_SM_PersonDataPower AS c
            WHERE
            ( a.Code = SystemResourceDtlCode )))
            OR (
            a.IsSysMenu <> '1');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840696094-158', 'WangXun', 'src/main/resources/db/changelog/init-struct.xml', NOW(), 158, '8:a5723926ff545d388e0f20076ada27df', 'createView viewName=V_SM_SystemResourcePowerDtl', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-1::WangXun
INSERT INTO CF_NodeState (ID, nCPULoad, fTemperature, nMemoryLoad, nState, nNodeType, nNodePCID, strStateTime, strSerialNum, fNetworkALoad, fNetworkBLoad) VALUES ('{1F990A66-B7F4-48E9-B005-89E9F3575798}', 15, 48.0, 15, 1, 0, 1, '2019-11-27 15:46:34', '0', 0.111724, 0.0);

INSERT INTO CF_NodeState (ID, nCPULoad, fTemperature, nMemoryLoad, nState, nNodeType, nNodePCID, strStateTime, strSerialNum, fNetworkALoad, fNetworkBLoad) VALUES ('{8A6848E1-576A-47D3-920C-7411CC8D7223}', 40, 27.0, 64, 1, 0, 2, '2019-11-27 15:46:34', '0', 0.09854399999999999, 0.09854399999999999);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-1', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 159, '8:0b7ec4b98fad7f4b8eca75452fdca7bd', 'insert tableName=CF_NodeState; insert tableName=CF_NodeState', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-2::WangXun
INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{3260BD66-984E-4665-A01C-7AB92CCA1E66}', 1292, 2, 1, 'ISPlatform.Service.MesQueueService.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{365F64AC-CDEA-48DB-BCFB-136FF7A1AC0A}', 8400, 1, 1, 'DatabaseService.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{4CFC77AF-94E3-4A47-8AFE-203EC378BC7B}', 6720, 1, 1, 'LogCalculateService.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{5355B98C-4712-46BC-ABC3-139DB73D4CB7}', 8256, 1, 1, 'NodeStateCalculateService.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{55528FBE-A707-400B-B39C-1F8A1CA1EBBD}', 4596, 2, 1, 'ISPlatform.Service.DataPushService.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{57206401-4133-481D-AC56-680182C183AA}', 6616, 2, 1, 'GTPlusAdjustTimeClient.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{57883148-AF8F-4736-98FC-E27188684A4F}', 5236, 2, 1, 'NodeStateCalculateClient.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{5DD44734-CD31-4E9F-B59F-7DF9EB261D0A}', 916, 2, 1, 'ISPlatform.Service.DynamicFeature.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{71736B69-B1E6-4A72-B82F-AEA54D53ACEC}', 8204, 1, 1, 'GTPlusAdjustTimeClient.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{86171F72-548F-42A5-939F-300FCE01BAC3}', 4000, 2, 1, 'ISPlatform.Service.WebAPIService.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{88D35A2B-9AA6-4331-A2A8-C3C0124EC6EB}', 2020, 1, 1, 'AlarmCalculateService.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{9A1F87FD-AED3-499F-9496-BB29C06102A3}', 1592, 2, 1, 'ISPlatform.Service.PollingService.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{A5D2DAFB-71AF-4751-92E7-32DAA35AA6B1}', 5876, 2, 1, 'ISPlatform.Service.LogService.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{D2C75773-1D56-4C60-88CB-20818DF1A4CE}', 8528, 1, 1, 'NodeStateCalculateClient.exe', '2019-11-27 15:46:34');

INSERT INTO CF_ProcessState (ID, nProcessID, nNodePCID, nState, strProcessName, strStateTime) VALUES ('{F842D906-90A0-4510-BC40-7B9EF847AC95}', 2460, 1, 1, 'GTPlusRDB.exe', '2019-11-27 15:46:34');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-2', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 160, '8:a0ba62915304b7c2f49a9b11a17d50bc', 'insert tableName=CF_ProcessState; insert tableName=CF_ProcessState; insert tableName=CF_ProcessState; insert tableName=CF_ProcessState; insert tableName=CF_ProcessState; insert tableName=CF_ProcessState; insert tableName=CF_ProcessState; insert ta...', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-3::WangXun
INSERT INTO SM_Department (ID, Code, Pcode, Name, Charge, OrderNo, IsCompany, IsProductionDept, DelFlag) VALUES ('1', '1', '-1', '×××集团', '3', 0, '1', '0', '0');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-3', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 161, '8:b8b5292c8e5c5687dd5f403436e5ed78', 'insert tableName=SM_Department', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-4::WangXun
INSERT INTO SM_GeneralSettings (ID, AlarmVoiceCycleNum, ConnInterruptTime, LogoutTime, PassWordInValidTime, NetworkRecordNumber, LoginBackGroundPicture, MainLogoPicture, CreateTime, ModifiedTime, HomeBackgroundPicture) VALUES ('42EAC5B6-2CEF-4603-8365-DD364C8A8AC1', 3, 5, 9999, 9999, '', NULL, NULL, '2019-04-22 14:46:03.693', '2019-04-22 14:46:03.693', NULL);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-4', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 162, '8:4e432ba256df92c6778b13690c0529e8', 'insert tableName=SM_GeneralSettings', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-5::WangXun
INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('1', 'SM_SystemResource', NULL, NULL, 'Title', '标题', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('10', 'SM_Role', NULL, NULL, 'Describe', '描述', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('11', 'SM_Department', NULL, NULL, 'DeptName', '所属部门', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('12', 'SM_Department', NULL, NULL, 'Code', '编码', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('13', 'SM_Department', NULL, NULL, 'Name', '姓名', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('14', 'SM_Department', NULL, NULL, 'Sex', '性别', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('15', 'SM_Department', NULL, NULL, 'WorkNum', '工号', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('16', 'SM_Department', NULL, NULL, 'Account', '账号', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('17', 'SM_Department', NULL, NULL, 'Duty', '职务', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('18', 'SM_Department', NULL, NULL, 'Position', '职等', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('19', 'SM_Department', NULL, NULL, 'SuperiorName', '上级人员', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('2', 'SM_SystemResource', NULL, NULL, 'ResourceType', '功能类型', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('20', 'SM_Department', NULL, NULL, 'RoleName', '所属角色', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('21', 'SM_Department', NULL, NULL, 'Mobile', '手机号码', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('22', 'SM_Department', NULL, NULL, 'Email', '邮箱地址', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('23', 'SM_Department', NULL, NULL, 'PersonStatus', '人员状态', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('24', 'SM_SystemResource', NULL, NULL, 'Code', '编码', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('25', 'SM_SystemResource', NULL, NULL, 'EnTitle', '英文标题', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('26', 'SM_SystemResource', NULL, NULL, 'ResourceUrlApp', '移动端资源地址', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('27', 'SM_SystemResource', NULL, NULL, 'ConfCodeVou', '配置业务单据编号', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('28', 'SM_SystemResource', NULL, NULL, 'Platform', '平台', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('29', 'SM_Department', NULL, NULL, 'OrderNo', '序号', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('3', 'SM_SystemResource', NULL, NULL, 'ResourceUrl', '资源地址', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('4', 'SM_SystemResource', NULL, NULL, 'Parameter', '参数', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('5', 'SM_SystemResource', NULL, NULL, 'IsHide', '是否显示', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('6', 'SM_SystemResource', NULL, NULL, 'OrderNo', '序号', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('7', 'SM_SystemResource', NULL, NULL, 'IsSysMenu', '是否系统菜单', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('8', 'SM_Role', NULL, NULL, 'Code', '编码', '1', '1', '系统内置，勿删勿改');

INSERT INTO SM_ListFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, IsHide, IsSysMenu, Remark) VALUES ('9', 'SM_Role', NULL, NULL, 'Name', '名称', '1', '1', '系统内置，勿删勿改');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-5', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 163, '8:eb9443ca31bf2955945a672898cd069d', 'insert tableName=SM_ListFieldConfig; insert tableName=SM_ListFieldConfig; insert tableName=SM_ListFieldConfig; insert tableName=SM_ListFieldConfig; insert tableName=SM_ListFieldConfig; insert tableName=SM_ListFieldConfig; insert tableName=SM_ListF...', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-6::WangXun
INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('0', '0', '其他');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('1', '1', '登录注销');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('10', '10', '置位');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('11', '11', '写模拟量值');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('12', '12', '写开关量值');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('14', '14', '报警操作');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('2', '2', '新增');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('3', '3', '修改');

INSERT INTO SM_OperateContent (ID, nOperateContentKey, strOperateContent) VALUES ('4', '4', '删除');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-6', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 164, '8:28c393d6549c51baec9fdc9ba2229afd', 'insert tableName=SM_OperateContent; insert tableName=SM_OperateContent; insert tableName=SM_OperateContent; insert tableName=SM_OperateContent; insert tableName=SM_OperateContent; insert tableName=SM_OperateContent; insert tableName=SM_OperateCont...', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-7::WangXun
INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('198', 'SM_Department', '', 'btnResetPwd_M', '重置密码', '系统内置,勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('199', 'MARTER', NULL, 'btnAdd_T', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('200', 'MARTER', NULL, 'btnEdit_T', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('201', 'MARTER', NULL, 'btnDelete_T', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('202', 'MARTER', NULL, 'btnReload_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('203', 'MARTER', NULL, 'btnImpo_M', '导入', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('204', 'MARTER', NULL, 'btnAddAttr_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('205', 'MARTER', NULL, 'btnEditAttr_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('206', 'MARTER', NULL, 'btnSaveAttr_M', '保存', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('207', 'MARTER', NULL, 'btnDeleteAttr_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('208', 'MARTER', NULL, 'btnReloadAttr_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('209', 'MARTER', NULL, 'btnImpoAttr_M', '导入', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('210', 'MARTER', NULL, 'btnAddConv_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('211', 'MARTER', NULL, 'btnEditConv_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('212', 'MARTER', NULL, 'btnSaveConv_M', '保存', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('213', 'MARTER', NULL, 'btnDeleteConv_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('214', 'MARTER', NULL, 'btnReloadConv_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('215', 'MARTER', NULL, 'btnImpoConv_M', '导入', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('216', 'MATTYPE', NULL, 'btnAdd_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('217', 'MATTYPE', NULL, 'btnSave_M', '保存', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('218', 'MATTYPE', NULL, 'btnDelete_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('219', 'MATTYPE', NULL, 'btnReload_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('220', 'MATTYPE', NULL, 'btnImpo_M', '导入', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('221', 'Dict', NULL, 'btnAdd_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('222', 'Dict', NULL, 'btnEdit_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('223', 'Dict', NULL, 'btnDelete_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('224', 'Dict', NULL, 'btnReload_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('225', 'Dict', NULL, 'btnAddDtl_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('226', 'Dict', NULL, 'btnEditDtl_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('227', 'Dict', NULL, 'btnDeleteDtl_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('228', 'Dict', NULL, 'btnReloadDtl_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('229', 'Unit', NULL, 'btnAdd_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('230', 'Unit', NULL, 'btnEdit_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('231', 'Unit', NULL, 'btnDelete_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('232', 'Unit', NULL, 'btnReload_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('233', 'Unit', NULL, 'btnAddDtl_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('234', 'Unit', NULL, 'btnEditDtl_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('235', 'Unit', NULL, 'btnDeleteDtl_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('236', 'Unit', NULL, 'btnReloadDtl_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('237', 'Supplier', NULL, 'btnAdd_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('238', 'Supplier', NULL, 'btnEdit_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('239', 'Supplier', NULL, 'btnDelete_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('240', 'Supplier', NULL, 'btnReload_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('241', 'Supplier', NULL, 'btnAddDtl_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('242', 'Supplier', NULL, 'btnSaveDtl_M', '保存', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('243', 'Supplier', NULL, 'btnDeleteDtl_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('244', 'Supplier', NULL, 'btnReloadDtl_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('245', 'WorkShift', NULL, 'btnAddWorkShift_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('246', 'WorkShift', NULL, 'btnEditWorkShift_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('247', 'WorkShift', NULL, 'btnSaveWorkShift_M', '保存', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('248', 'WorkShift', NULL, 'btnDeleteWorkShift_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('249', 'WorkShift', NULL, 'btnReloadWorkShift_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('250', 'TeamLeader', NULL, 'btnAdd_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('251', 'TeamLeader', NULL, 'btnEdit_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('252', 'TeamLeader', NULL, 'btnDelete_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('253', 'TeamLeader', NULL, 'btnReload_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('254', 'TeamLeader', NULL, 'btnAdd_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('255', 'TeamLeader', NULL, 'btnSaveMember_M', '保存', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('256', 'TeamLeader', NULL, 'btnDeleteMember_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('257', 'TeamLeader', NULL, 'btnReloadMember_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('258', 'ArrangePeriod', NULL, 'btnAddAP_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('259', 'ArrangePeriod', NULL, 'btnEditAP_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('260', 'ArrangePeriod', NULL, 'btnDeleteAP_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('261', 'ArrangePeriod', NULL, 'btnCA_M', '生成排班', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('262', 'ArrangePeriod', NULL, 'btnReloadAP_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('263', 'ArrangeResult', NULL, 'btnEditAR_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('264', 'ArrangeResult', NULL, 'btnDeleteAR_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('265', 'ArrangeResult', NULL, 'btnSaveAR_M', '保存', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('266', 'ArrangeResult', NULL, 'btnReloadAR_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('267', 'Produce_Log', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('268', 'Produce_Trend', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('269', 'Produce_Report', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('270', 'Produce_Gis', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('271', 'Produce_Alarm', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('272', 'Produce_FlowChart', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('273', 'Produce_VideoSurveillance', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('274', 'RunM_System_Alarm', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('275', 'RunM_System_Log', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('276', 'RunM_Node_Status', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('31', 'SM_SystemResource', NULL, 'btnAdd_T', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('32', 'SM_SystemResource', NULL, 'btnEdit_T', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('33', 'SM_SystemResource', NULL, 'btnDelete_T', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('34', 'SM_SystemResource', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('35', 'SM_SystemResource', NULL, 'btnAdd_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('36', 'SM_SystemResource', NULL, 'btnEdit_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('37', 'SM_SystemResource', NULL, 'btnDelete_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('38', 'SM_SystemResource', NULL, 'btnReload_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('39', 'SM_SystemResource', NULL, 'btnBrowse_M', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('40', 'SM_Department', NULL, 'btnAdd_T', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('41', 'SM_Department', NULL, 'btnEdit_T', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('42', 'SM_Department', NULL, 'btnDelete_T', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('43', 'SM_Department', NULL, 'btnBrowse_T', '浏览', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('44', 'SM_Department', NULL, 'btnAdd_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('45', 'SM_Department', NULL, 'btnEdit_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('46', 'SM_Department', NULL, 'btnDelete_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('47', 'SM_Department', NULL, 'btnReload_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('48', 'SM_Department', NULL, 'btnAuthorize_M', '授权', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('49', 'SM_Department', NULL, 'btnDeptAuth_M', '部门授权', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('50', 'SM_Department', NULL, 'btnImpo_M', '导入', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('52', 'SM_Role', NULL, 'btnAdd_M', '增加', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('53', 'SM_Role', NULL, 'btnEdit_M', '编辑', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('54', 'SM_Role', NULL, 'btnDelete_M', '删除', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('55', 'SM_Role', NULL, 'btnReload_M', '刷新', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('56', 'SM_Role', NULL, 'btnAuthorize_M', '授权', '系统内置，勿删勿改', '1');

INSERT INTO SM_PageButtonConfig (ID, SystemResourceDtlCode, ResourceUrl, ButtonID, ButtonName, Remark, IsSysMenu) VALUES ('57', 'SM_Role', NULL, 'btnDeptAuth_M', '部门授权', '系统内置，勿删勿改', '1');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-7', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 165, '8:bc3e163b0d6aa3e918d8b9cbba7ebd59', 'insert tableName=SM_PageButtonConfig; insert tableName=SM_PageButtonConfig; insert tableName=SM_PageButtonConfig; insert tableName=SM_PageButtonConfig; insert tableName=SM_PageButtonConfig; insert tableName=SM_PageButtonConfig; insert tableName=SM...', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-8::WangXun
INSERT INTO SM_Person (ID, Code, Name, Sex, WorkNum, Account, Password, DeptCode, CorpCode, Duty, Position, Superior, Mobile, Email, OrderNo, PersonStatus, DelFlag, RandCode, LastPasswordChangeTime) VALUES ('1', 'system', 'system', '1', 'system', 'system', 'e10adc3949ba59abbe56e057f20f883e', '-1', '-1', NULL, 0, NULL, NULL, NULL, -1, '1', '0', 51104250, '2019-01-14 19:40:49.65');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-8', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 166, '8:0f35a8570815e5e2723ee353ea308d17', 'insert tableName=SM_Person', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-9::WangXun
INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('10', 'system', 'PM_Alarm_RealTimeAlarm', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('11', 'system', 'PM_Alarm_AlarmSuppression', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('12', 'system', 'PM_Alarm_AlarmHiding', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('13', 'system', 'PM_Log', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('14', 'system', 'PM_VideoMonitor', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('15', 'system', 'PM_Report', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('16', 'system', 'PM_Gis', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('17', 'system', 'RM_System_Alarm', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('18', 'system', 'RM_System_Log', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('19', 'system', 'RM_Node_Status', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('2', 'system', 'SM_Department', '2', '', NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('20', 'system', 'SM_Report', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('21', 'system', 'PM_AdvanceReport', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('22', 'system', 'SM_VideoDeviceAccount', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('3', 'system', 'SM_Role', '2', '', NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('4', 'system', 'SM_ProjectArchitecture', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('5', 'system', 'SM_ProjectGis', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('6', 'system', 'SM_ProjectAlarmSet', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('8', 'system', 'PM_FlowChart', '2', NULL, NULL);

INSERT INTO SM_PersonDataPower (ID, PersonCode, SystemResourceDtlCode, DataPower, CustomPower, strIsEnable) VALUES ('9', 'system', 'PM_Trend', '2', NULL, NULL);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-9', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 167, '8:f368925790e4f881ee80596e8016d3ab', 'insert tableName=SM_PersonDataPower; insert tableName=SM_PersonDataPower; insert tableName=SM_PersonDataPower; insert tableName=SM_PersonDataPower; insert tableName=SM_PersonDataPower; insert tableName=SM_PersonDataPower; insert tableName=SM_Perso...', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-10::WangXun
INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('671', 'system', 'SM_Role', 52, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('672', 'system', 'SM_Role', 53, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('673', 'system', 'SM_Role', 54, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('674', 'system', 'SM_Role', 55, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('675', 'system', 'SM_Role', 56, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('676', 'system', 'SM_Role', 57, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('677', 'system', 'SM_Department', 40, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('678', 'system', 'SM_Department', 41, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('679', 'system', 'SM_Department', 42, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('680', 'system', 'SM_Department', 43, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('682', 'system', 'SM_Department', 44, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('683', 'system', 'SM_Department', 45, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('684', 'system', 'SM_Department', 46, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('685', 'system', 'SM_Department', 47, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('687', 'system', 'SM_Department', 48, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('688', 'system', 'SM_Department', 49, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('689', 'system', 'SM_Department', 50, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('690', 'system', 'SM_Department', 51, NULL, NULL);

INSERT INTO SM_PersonSysPower (ID, PersonCode, SystemResourceDtlCode, PageButtonConfigID, IsEnable, strIsEnable) VALUES ('692', 'system', 'SM_Department', 198, NULL, NULL);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-10', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 168, '8:2e153463aeed7583cbc9f2a0661fd362', 'insert tableName=SM_PersonSysPower; insert tableName=SM_PersonSysPower; insert tableName=SM_PersonSysPower; insert tableName=SM_PersonSysPower; insert tableName=SM_PersonSysPower; insert tableName=SM_PersonSysPower; insert tableName=SM_PersonSysPo...', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-11::WangXun
INSERT INTO SM_ProjectArchitecture (ID, strProjectCode, strPProjectCode, strName, nOrderNo, strIsFinalLeaf, strDelFlag) VALUES ('1', 'Group', '-1', 'xxx集团', 0, '0', '0');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-11', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 169, '8:9782bad4f175f4b2eb2a2a3825c08dbe', 'insert tableName=SM_ProjectArchitecture', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-12::WangXun
INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('1', 'FlowChart', 'btnWrite_M', '写值', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('12', 'Alarm', 'btnAffirmAll_M', '确认全部', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('13', 'Alarm', 'btnAffirm_M', '确认', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('14', 'Alarm', 'btnSuppress_M', '抑制', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('15', 'Alarm', 'btnHide_M', '隐藏', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('17', 'Alarm', 'btnSuppressCancel_M', '取消抑制', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('18', 'Alarm', 'btnHideCancel_M', '取消隐藏', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('19', 'Alarm', 'btnSuppressSet_M', '抑制设置', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('2', 'FlowChart', 'btnViewVideo_M', '查看视频', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('20', 'Alarm', 'btnHideSet_M', '隐藏设置', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('21', 'ReportPlan', 'btnView_M', '查看', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('22', 'ReportPlan', 'btnDelete_M', '删除', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('23', 'ReportPlan', 'btnDownLoad_M', '下载', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('24', 'ReportPlan', 'btnPrint_M', '打印', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('25', 'ReportPlan', 'btnExecute_T', '执行', NULL, 1);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('3', 'FlowChart', 'btnPlayback_M', '回放', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('4', 'Trend', 'btnAdd_P', '设置公共趋势组', NULL, 2);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('5', 'Trend', 'btnDelete_T', '删除', NULL, 1);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('6', 'Trend', 'btnEdit_T', '编辑', NULL, 1);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('7', 'Trend', 'btnAdd_M', '增加', NULL, 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('8', 'Trend', 'btnDelete_M', '删除', NULL, 0);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-12', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 170, '8:5e595a7f4be6aee6cb904de078b791e4', 'insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_Pr...', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-13::WangXun
INSERT INTO SM_ProjectPowerItem (ID, strCode, strName, nOrderNo, nVirtualItemType, nIsCanPowerItem) VALUES ('1', 'FlowChart', '流程图', 1, 2, 0);

INSERT INTO SM_ProjectPowerItem (ID, strCode, strName, nOrderNo, nVirtualItemType, nIsCanPowerItem) VALUES ('2', 'Alarm', '生产报警', 2, 1, 1);

INSERT INTO SM_ProjectPowerItem (ID, strCode, strName, nOrderNo, nVirtualItemType, nIsCanPowerItem) VALUES ('3', 'ReportPlan', '生产报表', 3, 2, 0);

INSERT INTO SM_ProjectPowerItem (ID, strCode, strName, nOrderNo, nVirtualItemType, nIsCanPowerItem) VALUES ('4', 'SuperReport', '高级报表', 4, 2, 0);

INSERT INTO SM_ProjectPowerItem (ID, strCode, strName, nOrderNo, nVirtualItemType, nIsCanPowerItem) VALUES ('5', 'Trend', '生产趋势', 5, 2, 1);

INSERT INTO SM_ProjectPowerItem (ID, strCode, strName, nOrderNo, nVirtualItemType, nIsCanPowerItem) VALUES ('6', 'Vedio', '视频监视', 6, 2, 0);

INSERT INTO SM_ProjectPowerItem (ID, strCode, strName, nOrderNo, nVirtualItemType, nIsCanPowerItem) VALUES ('7', 'GISMap', 'GIS地图', 7, 1, 1);

INSERT INTO SM_ProjectPowerItem (ID, strCode, strName, nOrderNo, nVirtualItemType, nIsCanPowerItem) VALUES ('8', 'PMLog', '生产日志', 8, 1, 1);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-13', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 171, '8:2974cf4ad6f595656619a45e1ae31187', 'insert tableName=SM_ProjectPowerItem; insert tableName=SM_ProjectPowerItem; insert tableName=SM_ProjectPowerItem; insert tableName=SM_ProjectPowerItem; insert tableName=SM_ProjectPowerItem; insert tableName=SM_ProjectPowerItem; insert tableName=SM...', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-14::WangXun
INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('1', 'SM_SystemResource', NULL, NULL, 'Title', '标题', '0', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('10', 'SM_Department', NULL, NULL, 'WorkNum', '工号', '0', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('11', 'SM_Department', NULL, NULL, 'Account', '账号', '0', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('12', 'SM_Department', NULL, NULL, 'Duty', '职务', '0', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('13', 'SM_Department', NULL, NULL, 'PersonStatus', '人员状态', '2', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('14', 'SM_SystemResource', NULL, NULL, 'EnTitle', '英文标题', '0', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('2', 'SM_SystemResource', NULL, NULL, 'ResourceType', '功能类型', '2', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('3', 'SM_SystemResource', NULL, NULL, 'ResourceUrl', '资源地址', '0', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('4', 'SM_SystemResource', NULL, NULL, 'Code', '编码', '0', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('5', 'SM_Role', NULL, NULL, 'Code', '编码', '0', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('6', 'SM_Role', NULL, NULL, 'Name', '名称', '0', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('7', 'SM_Department', NULL, NULL, 'Code', '编码', '0', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('8', 'SM_Department', NULL, NULL, 'Name', '姓名', '0', '系统内置，勿删勿改', '1', '1');

INSERT INTO SM_QueryFieldConfig (ID, SystemResourceDtlCode, ResourceUrl, ResorceFile, FieldID, FieldName, FieldType, Remark, IsHide, IsSysMenu) VALUES ('9', 'SM_Department', NULL, NULL, 'Sex', '性别', '2', '系统内置，勿删勿改', '1', '1');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-14', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 172, '8:47e6476cbd0498ebc449ed3f1a3d5260', 'insert tableName=SM_QueryFieldConfig; insert tableName=SM_QueryFieldConfig; insert tableName=SM_QueryFieldConfig; insert tableName=SM_QueryFieldConfig; insert tableName=SM_QueryFieldConfig; insert tableName=SM_QueryFieldConfig; insert tableName=SM...', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-15::WangXun
INSERT INTO SM_SyncObject (ID, strObjectName, nStatus, dtLastLockTime, dtLastUnlockTime, ts) VALUES ('fad02c32-63b8-4a3c-b664-291c17930c16', 'AppPush', 0, '2019-11-27 15:46:25', '2019-11-27 15:46:25', '2019-11-27 15:46:25');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-15', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 173, '8:878c6d2ad8e1c21c03c3281299630be5', 'insert tableName=SM_SyncObject', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-16::WangXun
INSERT INTO SM_SysSetting (ID, strKey, strValue) VALUES ('190cb417-19a5-4c14-b047-c8c82d45aex1', 'userName', 'wangzhenguo183173@hollysys.com');

INSERT INTO SM_SysSetting (ID, strKey, strValue) VALUES ('190cb417-19a5-4c14-b047-c8c82d45aex2', 'password', 'Www#5678');

INSERT INTO SM_SysSetting (ID, strKey, strValue) VALUES ('190cb417-19a5-4c14-b047-c8c82d45aex3', 'fromEmailAddress', 'wangzhenguo183173@hollysys.com');

INSERT INTO SM_SysSetting (ID, strKey, strValue) VALUES ('190cb417-19a5-4c14-b047-c8c82d45aex4', 'toEmailAddress', 'wangzhenguo183173@hollysys.com');

INSERT INTO SM_SysSetting (ID, strKey, strValue) VALUES ('190cb417-19a5-4c14-b047-c8c82d45aexx', 'host', 'smtp.hollysys.com');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-16', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 174, '8:d2eff78101fb72515139e41edc1bd3e9', 'insert tableName=SM_SysSetting; insert tableName=SM_SysSetting; insert tableName=SM_SysSetting; insert tableName=SM_SysSetting; insert tableName=SM_SysSetting', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-17::WangXun
INSERT INTO SM_SystemResource (ID, Code, PCode, Title, EnTitle, OrderNo, IsHide, IsSysMenu, Platform, DelFlag) VALUES ('1', 'System', '-1', '生产执行管理系统', 'System', 0, '1', '1', '0', '0');

INSERT INTO SM_SystemResource (ID, Code, PCode, Title, EnTitle, OrderNo, IsHide, IsSysMenu, Platform, DelFlag) VALUES ('2', 'SystemM', 'System', '系统设置', 'SystemM', 3, '1', '1', '0', '0');

INSERT INTO SM_SystemResource (ID, Code, PCode, Title, EnTitle, OrderNo, IsHide, IsSysMenu, Platform, DelFlag) VALUES ('3', 'PM', 'System', '生产监视', 'ProductionMonitoring', 1, '1', '3', '0', '0');

INSERT INTO SM_SystemResource (ID, Code, PCode, Title, EnTitle, OrderNo, IsHide, IsSysMenu, Platform, DelFlag) VALUES ('4', 'RM', 'System', '运行管理', 'RunManagement', 2, '1', '3', '0', '0');

INSERT INTO SM_SystemResource (ID, Code, PCode, Title, EnTitle, OrderNo, IsHide, IsSysMenu, Platform, DelFlag) VALUES ('5', 'PM_Alarm', 'PM', '生产报警', 'ProductionAlarm', 3, '1', '3', '0', '0');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-17', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 175, '8:3ba66449d1af7b4e6ccb125d9142beed', 'insert tableName=SM_SystemResource; insert tableName=SM_SystemResource; insert tableName=SM_SystemResource; insert tableName=SM_SystemResource; insert tableName=SM_SystemResource', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-18::WangXun
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

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-18', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 176, '8:a4bb4e2bc3f237a1b7c694a532437ad3', 'insert tableName=SM_SystemResourceDtl; insert tableName=SM_SystemResourceDtl; insert tableName=SM_SystemResourceDtl; insert tableName=SM_SystemResourceDtl; insert tableName=SM_SystemResourceDtl; insert tableName=SM_SystemResourceDtl; insert tableN...', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-19::WangXun
INSERT INTO SM_VideoDevDict (ID, strDeviceType) VALUES ('hk_1', '海康');

INSERT INTO SM_VideoDevDict (ID, strDeviceType) VALUES ('dh_1', '大华');

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-19', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 177, '8:7dc87a31f27028fc2d1884d192010788', 'insert tableName=SM_VideoDevDict; insert tableName=SM_VideoDevDict', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-20::WangXun
INSERT INTO t_BD_Dict (ID, DictCode, DictName, TypeCode, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('1', 'MatType', '物料类别', 'MatType', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-20', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 178, '8:dbbd721f979a1589d028a1226a5d3e36', 'insert tableName=t_BD_Dict', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-21::WangXun
INSERT INTO t_BD_Unit (ID, UnitCode, UnitName, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('1', 'length', '长度', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_Unit (ID, UnitCode, UnitName, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('2', 'time', '时间', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_Unit (ID, UnitCode, UnitName, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('3', 'weight', '重量', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-21', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 179, '8:08bcdd939d03cf987423b699f8e90662', 'insert tableName=t_BD_Unit; insert tableName=t_BD_Unit; insert tableName=t_BD_Unit', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::1574840791512-22::WangXun
INSERT INTO t_BD_UnitDtl (ID, UnitDtlCode, UnitDtlName, UnitCode, Symbol, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('2', 'centimeter', '厘米', 'length', 'cm', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_UnitDtl (ID, UnitDtlCode, UnitDtlName, UnitCode, Symbol, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('3', 'decimeter', '分米', 'length', 'dm', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_UnitDtl (ID, UnitDtlCode, UnitDtlName, UnitCode, Symbol, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('9', 'gram', '克', 'weight', 'g', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_UnitDtl (ID, UnitDtlCode, UnitDtlName, UnitCode, Symbol, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('8', 'hour', '小时', 'time', 'h', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_UnitDtl (ID, UnitDtlCode, UnitDtlName, UnitCode, Symbol, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('10', 'kilogram', '千克', 'weight', 'kg', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_UnitDtl (ID, UnitDtlCode, UnitDtlName, UnitCode, Symbol, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('5', 'kilometer', '千米', 'length', 'km', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_UnitDtl (ID, UnitDtlCode, UnitDtlName, UnitCode, Symbol, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('4', 'meter', '米', 'length', 'm', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_UnitDtl (ID, UnitDtlCode, UnitDtlName, UnitCode, Symbol, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('1', 'millimeter', '毫米', 'length', 'mm', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_UnitDtl (ID, UnitDtlCode, UnitDtlName, UnitCode, Symbol, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('7', 'minute', '分钟', 'time', 'm', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_UnitDtl (ID, UnitDtlCode, UnitDtlName, UnitCode, Symbol, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('6', 'second', '秒', 'time', 's', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO t_BD_UnitDtl (ID, UnitDtlCode, UnitDtlName, UnitCode, Symbol, Remark, DelFlag, Inputcode, Inputdate, Deptcode, Corpcode, Modifycode, Modifydate, FlowSts) VALUES ('11', 'ton', '吨', 'weight', 't', '系统设置，请勿删除', '0', 'admin', '2018-06-27 10:14:41', '1', '1', 'admin', '2018-06-27 10:14:41', 0);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574840791512-22', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 180, '8:aa8e8df77c9eeb7293eb7f856676180b', 'insert tableName=t_BD_UnitDtl; insert tableName=t_BD_UnitDtl; insert tableName=t_BD_UnitDtl; insert tableName=t_BD_UnitDtl; insert tableName=t_BD_UnitDtl; insert tableName=t_BD_UnitDtl; insert tableName=t_BD_UnitDtl; insert tableName=t_BD_UnitDtl;...', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/init-data.xml::v3.0.0.0::WangXun
INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('v3.0.0.0', 'WangXun', 'src/main/resources/db/changelog/init-data.xml', NOW(), 181, '8:757e825a64ba6a3f985b56cc170eaf9c', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438', 'v3.0.0.0');

--  Changeset src/main/resources/db/changelog/v3.0.0.x-191129.xml::1574956800000-1::WangXun
--  修改SM_Person表OrderNo字段自增
INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800000-1', 'WangXun', 'src/main/resources/db/changelog/v3.0.0.x-191129.xml', NOW(), 182, '8:d41d8cd98f00b204e9800998ecf8427e', 'empty', '修改SM_Person表OrderNo字段自增', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.0.x-191129.xml::1574956800000-2::WangXun
--  修改工程标签表区域、装置、单元字段长度为128字节（64个汉字）
ALTER TABLE SM_ProjectTag MODIFY strArea NVARCHAR(128);

ALTER TABLE SM_ProjectTag MODIFY strDevice NVARCHAR(128);

ALTER TABLE SM_ProjectTag MODIFY strUnit NVARCHAR(128);

DROP INDEX IX_SM_ProjectTag_P ON SM_ProjectTag;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800000-2', 'WangXun', 'src/main/resources/db/changelog/v3.0.0.x-191129.xml', NOW(), 183, '8:99cd649d9369d6e69fa1f5c75768df6a', 'modifyDataType columnName=strArea, tableName=SM_ProjectTag; modifyDataType columnName=strDevice, tableName=SM_ProjectTag; modifyDataType columnName=strUnit, tableName=SM_ProjectTag; dropIndex indexName=IX_SM_ProjectTag_P, tableName=SM_ProjectTag', '修改工程标签表区域、装置、单元字段长度为128字节（64个汉字）', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.0.x-191129.xml::1574956800000-3::WangXun
ALTER TABLE CF_Alarm ADD nDomainNum INT NULL;

ALTER TABLE CF_AlarmHis ADD nDomainNum INT NULL;

CREATE OR REPLACE VIEW V_CF_Alarm AS SELECT
            SM_ProjectArchitecture.strProjectCode,
            SM_ProjectArchitecture.strName AS strProjectName,
            CF_Alarm.ID,
            CF_Alarm.nAlarmType,
            CF_Alarm.nAlarmState,
            CF_Alarm.nAlarmlevel,
            CF_Alarm.strEventTime,
            CF_Alarm.strTagName,
            CF_Alarm.strTagDes,
            CF_Alarm.strArea,
            CF_Alarm.strDevice,
            CF_Alarm.strUnit,
            CF_Alarm.strMsgDes,
            CF_Alarm.fAlarmlimit,
            CF_Alarm.strAlarmValue,
            CF_Alarm.strRecoveryTime,
            CF_Alarm.strAckedTime,
            CF_Alarm.strAckedComment,
            CF_Alarm.nSource,
            CF_Alarm.strIsHide,
            CF_Alarm.strNodeDomain,
            CF_Alarm.strTypeName,
            CF_Alarm.strAlarmTypeDes,
            CF_Alarm.nPushStatus,
            CF_Alarm.strAlarmLevelDes,
            CF_Alarm.nDomainNum
            FROM
            SM_ProjectArchitecture
            INNER JOIN SM_ProjectTag ON SM_ProjectArchitecture.strDelFlag = '0'
            AND SM_ProjectArchitecture.strProjectCode = SM_ProjectTag.strProjectCode
            INNER JOIN CF_Alarm ON SM_ProjectTag.strName = CF_Alarm.strTagName
            OR SM_ProjectTag.strName = CF_Alarm.strNodeDomain;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800000-3', 'WangXun', 'src/main/resources/db/changelog/v3.0.0.x-191129.xml', NOW(), 184, '8:8bc36e4e97a672e2ab79297e026725f0', 'addColumn tableName=CF_Alarm; addColumn tableName=CF_AlarmHis; createView viewName=V_CF_Alarm', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.0.x-191129.xml::v3.0.1.0::WangXun
INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('v3.0.1.0', 'WangXun', 'src/main/resources/db/changelog/v3.0.0.x-191129.xml', NOW(), 185, '8:3772b982493edf734d4985bd41b5336e', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438', 'v3.0.1.0');

--  Changeset src/main/resources/db/changelog/v3.0.1.x-191129.xml::1574956800001-1::WangXun
--  SM_ProjectPageButtonConfig加入按钮配置
INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('32', 'SM_Role', 'btnAdd_T', '增加', '系统内置,勿删勿改', 1);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('33', 'SM_Role', 'btnEdit_T', '编辑', '系统内置,勿删勿改', 1);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('34', 'SM_Role', 'btnDelete_T', '删除', '系统内置,勿删勿改', 1);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('35', 'SM_Role', 'btnCopy_T', '复制', '系统内置,勿删勿改', 1);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('36', 'SM_Role', 'btnAuthorize_T', '授权', '系统内置,勿删勿改', 1);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('37', 'SM_Role', 'btnAdd_M', '增加', '系统内置,勿删勿改', 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('38', 'SM_Role', 'btnDelete_M', '删除', '系统内置,勿删勿改', 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('39', 'SM_Role', 'btnAuthorize_M', '授权', '系统内置,勿删勿改', 0);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800001-1', 'WangXun', 'src/main/resources/db/changelog/v3.0.1.x-191129.xml', NOW(), 186, '8:e49545f9424abab7add1ed084952a22c', 'insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_Pr...', 'SM_ProjectPageButtonConfig加入按钮配置', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.1.x-191129.xml::1574956800001-2::WangXun
--  修改视图:V_SM_RoleSysPower和V_SM_PersonSysPower
CREATE OR REPLACE VIEW V_SM_RoleSysPower AS SELECT
            a.ID,
            a.RoleCode,
            a.SystemResourceDtlCode,
            a.PageButtonConfigID,
            b.strButtonID AS ButtonID,
            b.strButtonName AS ButtonName,
            b.nPowerCodeType,
            '1' AS IsEnable
            FROM
            SM_RoleSysPower AS a
            LEFT OUTER JOIN SM_ProjectPageButtonConfig AS b ON a.PageButtonConfigID = b.ID;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800001-2', 'WangXun', 'src/main/resources/db/changelog/v3.0.1.x-191129.xml', NOW(), 187, '8:0f1a624264a5b8b888dd8826f73d2b2f', 'createView viewName=V_SM_RoleSysPower', '修改视图:V_SM_RoleSysPower和V_SM_PersonSysPower', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.1.x-191129.xml::1574956800001-3::WangXun
CREATE OR REPLACE VIEW V_SM_PersonSysPower AS SELECT
            a.ID,
            a.SystemResourceDtlCode,
            a.PageButtonConfigID,
            b.PersonCode,
            c.strButtonID AS ButtonID,
            c.strButtonName AS ButtonName,
            c.nPowerCodeType,
            '0' AS IsEnable
            FROM
            SM_RoleSysPower AS a
            LEFT JOIN SM_PersonRole_Rel AS b ON a.RoleCode = b.RoleCode
            LEFT JOIN SM_ProjectPageButtonConfig AS c ON a.PageButtonConfigID = c.ID UNION
            SELECT
            a.ID,
            a.SystemResourceDtlCode,
            a.PageButtonConfigID,
            a.PersonCode,
            b.strButtonID AS ButtonID,
            b.strButtonName AS ButtonName,
            b.nPowerCodeType,
            '1' AS IsEnable
            FROM
            SM_PersonSysPower AS a
            LEFT JOIN SM_ProjectPageButtonConfig AS b ON a.PageButtonConfigID = b.ID;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800001-3', 'WangXun', 'src/main/resources/db/changelog/v3.0.1.x-191129.xml', NOW(), 188, '8:600b2b5ad4b1b50a7881c3ab7005989d', 'createView viewName=V_SM_PersonSysPower', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.1.x-191129.xml::1574956800001-4::WangXun
--  更新数据:SM_SystemResourceDtl
UPDATE SM_SystemResourceDtl SET Title = '角色权限组态' WHERE Code = 'SM_Role';

UPDATE SM_SystemResourceDtl SET Title = '角色权限组态' WHERE Code = 'SM_Role';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800001-4', 'WangXun', 'src/main/resources/db/changelog/v3.0.1.x-191129.xml', NOW(), 189, '8:f8dabf04bf883a223fdae8358f9f4024', 'update tableName=SM_SystemResourceDtl; update tableName=SM_SystemResourceDtl', '更新数据:SM_SystemResourceDtl', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.1.x-191129.xml::1574956800001-5::WangXun
--  清空表SM_PersonSysPower脏数据
DELETE FROM SM_PersonSysPower;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800001-5', 'WangXun', 'src/main/resources/db/changelog/v3.0.1.x-191129.xml', NOW(), 190, '8:bec1899daea69563082d7a3e246217a3', 'delete tableName=SM_PersonSysPower', '清空表SM_PersonSysPower脏数据', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.1.x-191129.xml::v3.0.2.0::WangXun
INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('v3.0.2.0', 'WangXun', 'src/main/resources/db/changelog/v3.0.1.x-191129.xml', NOW(), 191, '8:d22d8e5dd2656b5a2b7e39a169ecc4e2', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438', 'v3.0.2.0');

--  Changeset src/main/resources/db/changelog/v3.0.2.x-191129.xml::1574956800002-1::WangXun
CREATE TABLE SM_ALARM_LEVEL_COLOUR (ID VARCHAR(50) NOT NULL, LEVEL1_COLOUR BIGINT NULL, LEVEL2_COLOUR BIGINT NULL, LEVEL3_COLOUR BIGINT NULL, LEVEL4_COLOUR BIGINT NULL, LEVEL5_COLOUR BIGINT NULL, LEVEL6_COLOUR BIGINT NULL, LEVEL7_COLOUR BIGINT NULL, LEVEL8_COLOUR BIGINT NULL, LEVEL9_COLOUR BIGINT NULL, LEVEL10_COLOUR BIGINT NULL, CONSTRAINT PK_SM_ALARM_LEVEL_COLOUR PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800002-1', 'WangXun', 'src/main/resources/db/changelog/v3.0.2.x-191129.xml', NOW(), 192, '8:deccc8297113dfec0f28c271430ff7bd', 'createTable tableName=SM_ALARM_LEVEL_COLOUR', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.2.x-191129.xml::1574956800002-2::WangXun
CREATE TABLE SM_TREND_GROUP (ID VARCHAR(50) NOT NULL, TREND_GROUP_NAME VARCHAR(50) NOT NULL COMMENT '趋势组名', USERNAME VARCHAR(50) NULL COMMENT '用户名，可以为NULL，为NULL则为公共趋势组', GROUP_INFO TEXT NULL COMMENT 'Json串，存储趋势组内标签名、曲线颜色', CONSTRAINT PK_SM_TREND_GROUP PRIMARY KEY (ID));

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800002-2', 'WangXun', 'src/main/resources/db/changelog/v3.0.2.x-191129.xml', NOW(), 193, '8:bc7db69c27d897ca084dfcac157586e8', 'createTable tableName=SM_TREND_GROUP', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.2.x-191129.xml::1574956800002-3::WangXun
CREATE TABLE SM_ONLINE_USER (ID VARCHAR(50) NOT NULL, GROUP_NAME VARCHAR(50) NOT NULL, USERNAME VARCHAR(50) NOT NULL, NODE_ID INT NULL, LOGIN_TIME datetime NULL, CONSTRAINT PK_SM_ONLINE_USER PRIMARY KEY (ID)) COMMENT='在线用户信息';

ALTER TABLE SM_ONLINE_USER COMMENT = '在线用户信息';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800002-3', 'WangXun', 'src/main/resources/db/changelog/v3.0.2.x-191129.xml', NOW(), 194, '8:ab84db25b9f208cd0c06bfb6f5f48752', 'createTable tableName=SM_ONLINE_USER', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.2.x-191129.xml::1574956800002-4::WangXun
CREATE TABLE SM_USER (ID VARCHAR(50) NOT NULL, GROUP_NAME VARCHAR(50) NOT NULL COMMENT '用户组名', USERNAME VARCHAR(50) NOT NULL COMMENT '用户名', PASSWORD VARCHAR(50) NULL COMMENT '密码', CREATE_BY VARCHAR(50) NOT NULL COMMENT '创建人', CREATE_TIME datetime NOT NULL COMMENT '创建时间', MODIFY_BY VARCHAR(50) NULL COMMENT '修改人', MODIFY_TIME datetime NULL COMMENT '修改时间', CONSTRAINT PK_SM_USER PRIMARY KEY (ID)) COMMENT='用户信息';

ALTER TABLE SM_USER COMMENT = '用户信息';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800002-4', 'WangXun', 'src/main/resources/db/changelog/v3.0.2.x-191129.xml', NOW(), 195, '8:f027045ae70506abf9adfb1ec2a0bfff', 'createTable tableName=SM_USER', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.2.x-191129.xml::1574956800002-5::WangXun
CREATE TABLE SM_USER_GROUP_GRAPH (ID VARCHAR(50) NOT NULL, GROUP_NAME VARCHAR(50) NOT NULL COMMENT '用户组名', GRAPH_NAME VARCHAR(50) NOT NULL COMMENT '流程图名称', WRITE_AUTHORITY INT DEFAULT 0 NULL COMMENT '写权限', CONSTRAINT PK_SM_USER_GROUP_GRAPH PRIMARY KEY (ID)) COMMENT='用户组下挂接的流程图';

ALTER TABLE SM_USER_GROUP_GRAPH COMMENT = '用户组下挂接的流程图';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800002-5', 'WangXun', 'src/main/resources/db/changelog/v3.0.2.x-191129.xml', NOW(), 196, '8:5eea23eed2eb8c005a1dc789ce3323fd', 'createTable tableName=SM_USER_GROUP_GRAPH', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.2.x-191129.xml::1574956800002-6::WangXun
CREATE TABLE SM_USER_GROUP (ID VARCHAR(50) NOT NULL, GROUP_NAME VARCHAR(50) NOT NULL COMMENT '用户组名称', CREATE_BY VARCHAR(50) NOT NULL COMMENT '创建人', CREATE_TIME datetime NOT NULL COMMENT '创建时间', MODIFY_BY VARCHAR(50) NULL COMMENT '修改人', MODIFY_TIME datetime NULL COMMENT '修改时间', ACCREDIT1 INT NULL COMMENT '权限1', ACCREDIT2 INT NULL COMMENT '权限2', ACCREDIT3 INT NULL COMMENT '权限3', ACCREDIT4 INT NULL COMMENT '权限4', ACCREDIT5 INT NULL COMMENT '权限5', ACCREDIT6 INT NULL COMMENT '权限6', ACCREDIT7 INT NULL COMMENT '权限7', ACCREDIT8 INT NULL COMMENT '权限8', ACCREDIT9 INT NULL COMMENT '权限9', ACCREDIT10 INT NULL COMMENT '权限10', CONSTRAINT PK_SM_USER_GROUP PRIMARY KEY (ID)) COMMENT='用户组';

ALTER TABLE SM_USER_GROUP COMMENT = '用户组';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1574956800002-6', 'WangXun', 'src/main/resources/db/changelog/v3.0.2.x-191129.xml', NOW(), 197, '8:88c489ba10a8d26f101457fc5b796ad5', 'createTable tableName=SM_USER_GROUP', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.2.x-191129.xml::v3.0.3.0::WangXun
INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('v3.0.3.0', 'WangXun', 'src/main/resources/db/changelog/v3.0.2.x-191129.xml', NOW(), 198, '8:dedb0ef97d70e62fee9cc46fb7b08106', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438', 'v3.0.3.0');

--  Changeset src/main/resources/db/changelog/v3.0.3.x-191209.xml::1575883800000-1::WangXun
--  趋势组表添加版本列
ALTER TABLE SM_TREND_GROUP ADD VERSION INT NULL COMMENT '版本';

ALTER TABLE SM_TREND_GROUP COMMENT = '版本';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1575883800000-1', 'WangXun', 'src/main/resources/db/changelog/v3.0.3.x-191209.xml', NOW(), 199, '8:e3499cbfb95806d61bab3208df64157e', 'addColumn tableName=SM_TREND_GROUP', '趋势组表添加版本列', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.3.x-191209.xml::1575883800000-2::WangXun
--  报警抑制表添加区域、装置、单元字段
ALTER TABLE CF_FORBIDALARM ADD TAG_AREA NVARCHAR(128) NULL COMMENT '标签所属区域' , ADD TAG_DEVICE NVARCHAR(128) NULL COMMENT '标签所属装置' , ADD TAG_UNIT NVARCHAR(128) NULL COMMENT '标签所属单元';

ALTER TABLE CF_FORBIDALARM COMMENT = '标签所属区域';

ALTER TABLE CF_FORBIDALARM COMMENT = '标签所属装置';

ALTER TABLE CF_FORBIDALARM COMMENT = '标签所属单元';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1575883800000-2', 'WangXun', 'src/main/resources/db/changelog/v3.0.3.x-191209.xml', NOW(), 200, '8:d73e7358cdd993bb5f59de6d6740e38f', 'addColumn tableName=CF_FORBIDALARM', '报警抑制表添加区域、装置、单元字段', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.3.x-191209.xml::1575883800000-3::WangXun
--  报警隐藏表添加区域、装置、单元字段
ALTER TABLE CF_HIDEALARM ADD TAG_AREA NVARCHAR(128) NULL COMMENT '标签所属区域' , ADD TAG_DEVICE NVARCHAR(128) NULL COMMENT '标签所属装置' , ADD TAG_UNIT NVARCHAR(128) NULL COMMENT '标签所属单元';

ALTER TABLE CF_HIDEALARM COMMENT = '标签所属区域';

ALTER TABLE CF_HIDEALARM COMMENT = '标签所属装置';

ALTER TABLE CF_HIDEALARM COMMENT = '标签所属单元';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1575883800000-3', 'WangXun', 'src/main/resources/db/changelog/v3.0.3.x-191209.xml', NOW(), 201, '8:6b0a9164c83cbbd7671fbb9c3ad04da3', 'addColumn tableName=CF_HIDEALARM', '报警隐藏表添加区域、装置、单元字段', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.3.x-191209.xml::1576054965000-4::WangXun
--  用户表(SM_USER)添加备注(REMARK)字段
ALTER TABLE SM_USER ADD REMARK NVARCHAR(128) NULL COMMENT '备注';

ALTER TABLE SM_USER COMMENT = '备注';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1576054965000-4', 'WangXun', 'src/main/resources/db/changelog/v3.0.3.x-191209.xml', NOW(), 202, '8:7575c56eec1ce02d646923e6a79994cb', 'addColumn tableName=SM_USER', '用户表(SM_USER)添加备注(REMARK)字段', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.3.x-191209.xml::1576202400000-5::GongPei
--  添加SM_ProjectPageButtonConfig初始化数据
INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('41', 'SM_Department', 'btnAdd_T', '增加', '系统内置,勿删勿改', 1);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('42', 'SM_Department', 'btnEdit_T', '编辑', '系统内置,勿删勿改', 1);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('43', 'SM_Department', 'btnDelete_T', '删除', '系统内置,勿删勿改', 1);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('44', 'SM_Department', 'btnAdd_M', '增加', '系统内置,勿删勿改', 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('45', 'SM_Department', 'btnEdit_M', '编辑', '系统内置,勿删勿改', 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('46', 'SM_Department', 'btnDelete_M', '删除', '系统内置,勿删勿改', 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('47', 'SM_Department', 'btnAuthorize_M', '授权', '系统内置,勿删勿改', 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('48', 'SM_Department', 'btnImpo_M', '导入', '系统内置,勿删勿改', 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('49', 'SM_Department', 'btnExpo_M', '导出', '系统内置,勿删勿改', 0);

INSERT INTO SM_ProjectPageButtonConfig (ID, strProjectSysPowerCode, strButtonID, strButtonName, strRemark, nPowerCodeType) VALUES ('50', 'SM_Department', 'btnResetPwd_M', '重置密码', '系统内置,勿删勿改', 0);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1576202400000-5', 'GongPei', 'src/main/resources/db/changelog/v3.0.3.x-191209.xml', NOW(), 203, '8:d0e2618e6fd9ce0106267deb568b1770', 'insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_ProjectPageButtonConfig; insert tableName=SM_Pr...', '添加SM_ProjectPageButtonConfig初始化数据', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.3.x-191209.xml::1576202400000-6::GongPei
--  更新SM_Department表Code='1'的数据Charge='system'
UPDATE SM_Department SET Charge = 'system' WHERE Code='1';

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1576202400000-6', 'GongPei', 'src/main/resources/db/changelog/v3.0.3.x-191209.xml', NOW(), 204, '8:0c4ea2df88658fa439acde84ce25a67f', 'update tableName=SM_Department', '更新SM_Department表Code=''1''的数据Charge=''system''', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.3.x-191209.xml::1576571280000-7::ShiWeiChen
--  添加索引
CREATE INDEX IX_CF_ALARMHIS_strEventTime ON CF_ALARMHIS(strEventTime);

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1576571280000-7', 'ShiWeiChen', 'src/main/resources/db/changelog/v3.0.3.x-191209.xml', NOW(), 205, '8:3942abd9ab4ba2d0a582bbbbfc6a6a8c', 'createIndex indexName=IX_CF_ALARMHIS_strEventTime, tableName=CF_ALARMHIS', '添加索引', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Changeset src/main/resources/db/changelog/v3.0.3.x-191209.xml::1576571280000-8::ShiWeiChen
--  添加索引
CREATE INDEX IX_SM_LOG_strOperateTime ON SM_LOG(strOperateTime);

DROP INDEX IX_SM_LOG_strOperateTime ON SM_LOG;

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, `DESCRIPTION`, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('1576571280000-8', 'ShiWeiChen', 'src/main/resources/db/changelog/v3.0.3.x-191209.xml', NOW(), 206, '8:c592f18ce6e95a006d53a4e911b99f48', 'createIndex indexName=IX_SM_LOG_strOperateTime, tableName=SM_LOG; dropIndex indexName=IX_SM_LOG_strOperateTime, tableName=SM_LOG', '添加索引', 'EXECUTED', NULL, NULL, '3.8.1', '6571833438');

--  Release Database Lock
UPDATE VC_CHANGE_LOG_LOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

