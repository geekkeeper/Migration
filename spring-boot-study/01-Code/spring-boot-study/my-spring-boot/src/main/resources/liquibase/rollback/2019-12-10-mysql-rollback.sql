--  *********************************************************************
--  SQL to roll back currently unexecuted changes
--  *********************************************************************
--  Change Log: src/main/resources/liquibase/changelog-master.xml
--  Ran at: 19-12-10 下午7:25
--  Against: root@172.21.48.50@jdbc:mysql://172.21.50.60:3306/my_spring_boot?characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8
--  Liquibase version: 3.8.0
--  *********************************************************************

--  Lock Database
UPDATE DATABASE_CHANGE_LOG_LOCK SET `LOCKED` = 1, LOCKEDBY = 'wangxun183963 (192.168.53.113)', LOCKGRANTED = '2019-12-10 19:25:41.937' WHERE ID = 1 AND `LOCKED` = 0;

--  Release Database Lock
UPDATE DATABASE_CHANGE_LOG_LOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

