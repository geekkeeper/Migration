--  *********************************************************************
--  SQL to roll back currently unexecuted changes
--  *********************************************************************
--  Change Log: src/main/resources/liquibase/changelog-master.xml
--  Ran at: 19-12-23 上午10:16
--  Against: root@172.21.48.50@jdbc:mysql://172.21.50.60:3306/HiODSDB?serverTimezone=GMT%2B8
--  Liquibase version: 3.8.2
--  *********************************************************************

--  Lock Database
UPDATE DV_CHANGE_LOG_LOCK SET `LOCKED` = 1, LOCKEDBY = 'wangxun183963 (192.168.53.113)', LOCKGRANTED = '2019-12-23 10:16:26.253' WHERE ID = 1 AND `LOCKED` = 0;

--  Release Database Lock
UPDATE DV_CHANGE_LOG_LOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

