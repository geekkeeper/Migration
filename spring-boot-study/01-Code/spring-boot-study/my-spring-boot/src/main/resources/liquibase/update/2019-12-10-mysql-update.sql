--  *********************************************************************
--  Rollback to 'v1.0.0.0' Script
--  *********************************************************************
--  Change Log: src/main/resources/liquibase/changelog-master.xml
--  Ran at: 19-12-10 下午7:23
--  Against: root@172.21.48.50@jdbc:mysql://172.21.50.60:3306/my_spring_boot?characterEncoding=utf-8&useSSL=false&serverTimezone=GMT%2B8
--  Liquibase version: 3.8.0
--  *********************************************************************

--  Lock Database
UPDATE DATABASE_CHANGE_LOG_LOCK SET `LOCKED` = 1, LOCKEDBY = 'wangxun183963 (192.168.53.113)', LOCKGRANTED = '2019-12-10 19:23:07.376' WHERE ID = 1 AND `LOCKED` = 0;

--  Rolling Back ChangeSet: src/main/resources/liquibase/changelog-master.xml::10000000-1::WangXun
DROP TABLE PERSON;

DELETE FROM DATABASE_CHANGE_LOG WHERE ID = '10000000-1' AND AUTHOR = 'WangXun' AND FILENAME = 'src/main/resources/liquibase/changelog-master.xml';

--  Rolling Back ChangeSet: src/main/resources/liquibase/changelog-master.xml::v1.0.0.0::${author}
DELETE FROM DATABASE_CHANGE_LOG WHERE ID = 'v1.0.0.0' AND AUTHOR = '${author}' AND FILENAME = 'src/main/resources/liquibase/changelog-master.xml';

--  Release Database Lock
UPDATE DATABASE_CHANGE_LOG_LOCK SET `LOCKED` = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1;

