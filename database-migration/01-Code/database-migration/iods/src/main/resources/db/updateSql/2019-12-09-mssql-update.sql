-- *********************************************************************
-- Update Database Script
-- *********************************************************************
-- Change Log: src/main/resources/db/changelog-master.xml
-- Ran at: 19-12-9 下午1:46
-- Against: sa@jdbc:sqlserver://172.21.50.60:1433;useFmtOnly=false;useBulkCopyForBatchInsert=false;cancelQueryTimeout=-1;sslProtocol=TLS;jaasConfigurationName=SQLJDBCDriver;statementPoolingCacheSize=0;serverPreparedStatementDiscardThreshold=10;enablePrepareOnFirstPreparedStatementCall=false;fips=false;socketTimeout=0;authentication=NotSpecified;authenticationScheme=nativeAuthentication;xopenStates=false;sendTimeAsDatetime=true;trustStoreType=JKS;trustServerCertificate=false;TransparentNetworkIPResolution=true;serverNameAsACE=false;sendStringParametersAsUnicode=true;selectMethod=direct;responseBuffering=adaptive;queryTimeout=-1;packetSize=8000;multiSubnetFailover=false;loginTimeout=15;lockTimeout=-1;lastUpdateCount=true;encrypt=false;disableStatementPooling=true;databaseName=HiODSDB;columnEncryptionSetting=Disabled;applicationName=Microsoft JDBC Driver for SQL Server;applicationIntent=readwrite;
-- Liquibase version: 3.8.1
-- *********************************************************************

USE HiODSDB;
GO

-- Lock Database
UPDATE VC_CHANGE_LOG_LOCK SET LOCKED = 1, LOCKEDBY = 'wangxun183963 (192.168.53.113)', LOCKGRANTED = '2019-12-09T13:46:31.549' WHERE ID = 1 AND LOCKED = 0
GO

-- Changeset src/main/resources/db/changelog/v3.0.2.x-191129.xml::v3.0.3.0::WangXun
INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID, TAG) VALUES ('v3.0.3.0', 'WangXun', 'src/main/resources/db/changelog/v3.0.2.x-191129.xml', GETDATE(), 199, '8:dedb0ef97d70e62fee9cc46fb7b08106', 'tagDatabase', '', 'EXECUTED', NULL, NULL, '3.8.1', '5870392922', 'v3.0.3.0')
GO

-- Changeset src/main/resources/db/changelog/v3.0.3.x-191209.xml::v3.0.3.0::WangXun
ALTER TABLE SM_TREND_GROUP ADD VERSION int
GO

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('v3.0.3.0', 'WangXun', 'src/main/resources/db/changelog/v3.0.3.x-191209.xml', GETDATE(), 200, '8:f22c6df5cb47dc0cb076b7c6cb7035fc', 'addColumn tableName=SM_TREND_GROUP', '', 'EXECUTED', NULL, NULL, '3.8.1', '5870392922')
GO

-- Changeset src/main/resources/db/changelog/v3.0.3.x-191209.xml::v3.0.3.1::WangXun
ALTER TABLE CF_ForbidAlarm ADD TAG_AREA nvarchar(128)
GO

ALTER TABLE CF_ForbidAlarm ADD TAG_Device nvarchar(128)
GO

ALTER TABLE CF_ForbidAlarm ADD TAG_Unit nvarchar(128)
GO

DECLARE @TableName SYSNAME set @TableName = N'CF_ForbidAlarm'; DECLARE @FullTableName SYSNAME set @FullTableName = N'dbo.CF_ForbidAlarm'; DECLARE @ColumnName SYSNAME set @ColumnName = N'TAG_AREA'; DECLARE @MS_DescriptionValue NVARCHAR(3749); SET @MS_DescriptionValue = N'标签所属区域';DECLARE @MS_Description NVARCHAR(3749) set @MS_Description = NULL; SET @MS_Description = (SELECT CAST(Value AS NVARCHAR(3749)) AS [MS_Description] FROM sys.extended_properties AS ep WHERE ep.major_id = OBJECT_ID(@FullTableName) AND ep.minor_id=COLUMNPROPERTY(ep.major_id, @ColumnName, 'ColumnId') AND ep.name = N'MS_Description'); IF @MS_Description IS NULL BEGIN EXEC sys.sp_addextendedproperty @name  = N'MS_Description', @value = @MS_DescriptionValue, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = @TableName, @level2type = N'COLUMN', @level2name = @ColumnName; END ELSE BEGIN EXEC sys.sp_updateextendedproperty @name  = N'MS_Description', @value = @MS_DescriptionValue, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = @TableName, @level2type = N'COLUMN', @level2name = @ColumnName; END
GO

DECLARE @TableName SYSNAME set @TableName = N'CF_ForbidAlarm'; DECLARE @FullTableName SYSNAME set @FullTableName = N'dbo.CF_ForbidAlarm'; DECLARE @ColumnName SYSNAME set @ColumnName = N'TAG_Device'; DECLARE @MS_DescriptionValue NVARCHAR(3749); SET @MS_DescriptionValue = N'标签所属装置';DECLARE @MS_Description NVARCHAR(3749) set @MS_Description = NULL; SET @MS_Description = (SELECT CAST(Value AS NVARCHAR(3749)) AS [MS_Description] FROM sys.extended_properties AS ep WHERE ep.major_id = OBJECT_ID(@FullTableName) AND ep.minor_id=COLUMNPROPERTY(ep.major_id, @ColumnName, 'ColumnId') AND ep.name = N'MS_Description'); IF @MS_Description IS NULL BEGIN EXEC sys.sp_addextendedproperty @name  = N'MS_Description', @value = @MS_DescriptionValue, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = @TableName, @level2type = N'COLUMN', @level2name = @ColumnName; END ELSE BEGIN EXEC sys.sp_updateextendedproperty @name  = N'MS_Description', @value = @MS_DescriptionValue, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = @TableName, @level2type = N'COLUMN', @level2name = @ColumnName; END
GO

DECLARE @TableName SYSNAME set @TableName = N'CF_ForbidAlarm'; DECLARE @FullTableName SYSNAME set @FullTableName = N'dbo.CF_ForbidAlarm'; DECLARE @ColumnName SYSNAME set @ColumnName = N'TAG_Unit'; DECLARE @MS_DescriptionValue NVARCHAR(3749); SET @MS_DescriptionValue = N'标签所属单元';DECLARE @MS_Description NVARCHAR(3749) set @MS_Description = NULL; SET @MS_Description = (SELECT CAST(Value AS NVARCHAR(3749)) AS [MS_Description] FROM sys.extended_properties AS ep WHERE ep.major_id = OBJECT_ID(@FullTableName) AND ep.minor_id=COLUMNPROPERTY(ep.major_id, @ColumnName, 'ColumnId') AND ep.name = N'MS_Description'); IF @MS_Description IS NULL BEGIN EXEC sys.sp_addextendedproperty @name  = N'MS_Description', @value = @MS_DescriptionValue, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = @TableName, @level2type = N'COLUMN', @level2name = @ColumnName; END ELSE BEGIN EXEC sys.sp_updateextendedproperty @name  = N'MS_Description', @value = @MS_DescriptionValue, @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = @TableName, @level2type = N'COLUMN', @level2name = @ColumnName; END
GO

INSERT INTO VC_CHANGE_LOG (ID, AUTHOR, FILENAME, DATEEXECUTED, ORDEREXECUTED, MD5SUM, DESCRIPTION, COMMENTS, EXECTYPE, CONTEXTS, LABELS, LIQUIBASE, DEPLOYMENT_ID) VALUES ('v3.0.3.1', 'WangXun', 'src/main/resources/db/changelog/v3.0.3.x-191209.xml', GETDATE(), 201, '8:fcc48cf15b8a9d7a930c4fe386c31bc3', 'addColumn tableName=CF_ForbidAlarm', '', 'EXECUTED', NULL, NULL, '3.8.1', '5870392922')
GO

-- Release Database Lock
UPDATE VC_CHANGE_LOG_LOCK SET LOCKED = 0, LOCKEDBY = NULL, LOCKGRANTED = NULL WHERE ID = 1
GO

