--  *********************************************************************
--  Rollback to 'v3.0.3.0' Script
--  *********************************************************************
--  Change Log: src/main/resources/db/changelog-master.xml
--  Ran at: 19-12-9 下午4:59
--  Against: root@wangxun183963@jdbc:mysql://172.21.48.64:3306/HiODSDB?characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8
--  Liquibase version: 3.8.1
--  *********************************************************************

--  Lock Database
UPDATE VC_CHANGE_LOG_LOCK SET `LOCKED` = 1, LOCKEDBY = 'wangxun183963 (192.168.53.113)', LOCKGRANTED = '2019-12-09 16:59:02.665' WHERE ID = 1 AND `LOCKED` = 0;

--  Rolling Back ChangeSet: src/main/resources/db/changelog/v3.0.3.x-191209.xml::v3.0.3.1::WangXun
ALTER TABLE SM_TREND_GROUP DROP COLUMN VERSION;

DELETE FROM VC_CHANGE_LOG WHERE ID = 'v3.0.3.1' AND AUTHOR = 'WangXun' AND FILENAME = 'src/main/resources/db/changelog/v3.0.3.x-191209.xml';

--  Rolling Back ChangeSet: src/main/resources/db/changelog/v3.0.2.x-191129.xml::v3.0.3.0::WangXun
DELETE FROM VC_CHANGE_LOG WHERE ID = 'v3.0.3.0' AND AUTHOR = 'WangXun' AND FILENAME = 'src/main/resources/db/changelog/v3.0.2.x-191129.xml';

--  Release Database Lock
UPDATE VC_CHANGE_LOG_LOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

