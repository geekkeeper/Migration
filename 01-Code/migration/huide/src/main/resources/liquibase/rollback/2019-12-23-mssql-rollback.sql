-- *********************************************************************
-- SQL to roll back currently unexecuted changes
-- *********************************************************************
-- Change Log: src/main/resources/liquibase/changelog-master.xml
-- Ran at: 19-12-23 上午10:21
-- Against: sa@jdbc:sqlserver://172.21.50.60:1433;useFmtOnly=false;useBulkCopyForBatchInsert=false;cancelQueryTimeout=-1;sslProtocol=TLS;jaasConfigurationName=SQLJDBCDriver;statementPoolingCacheSize=0;serverPreparedStatementDiscardThreshold=10;enablePrepareOnFirstPreparedStatementCall=false;fips=false;socketTimeout=0;authentication=NotSpecified;authenticationScheme=nativeAuthentication;xopenStates=false;sendTimeAsDatetime=true;trustStoreType=JKS;trustServerCertificate=false;TransparentNetworkIPResolution=true;serverNameAsACE=false;sendStringParametersAsUnicode=true;selectMethod=direct;responseBuffering=adaptive;queryTimeout=-1;packetSize=8000;multiSubnetFailover=false;loginTimeout=15;lockTimeout=-1;lastUpdateCount=true;encrypt=false;disableStatementPooling=true;databaseName=HUIDEDB;columnEncryptionSetting=Disabled;applicationName=Microsoft JDBC Driver for SQL Server;applicationIntent=readwrite;
-- Liquibase version: 3.8.2
-- *********************************************************************

USE HUIDEDB;
GO

-- Lock Database
UPDATE DV_CHANGE_LOG_LOCK SET LOCKED = 1, LOCKEDBY = 'wangxun183963 (192.168.53.113)', LOCKGRANTED = '2019-12-23T10:21:28.235' WHERE ID = 1 AND LOCKED = 0
GO

-- Release Database Lock
UPDATE DV_CHANGE_LOG_LOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1
GO

