package com.xunsoft.integration.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;

/**
 * @Author: WangXun
 * @Date: 2019/12/12 17:07
 * @Description:
 */
@Configuration
@PropertySource(value = "/config/liquibase-config.properties",ignoreResourceNotFound = true)
public class LiquibaseProperties {
    @Value("driverclassname")
    private String driverClassName;
    @Value("url")
    private String url;
    @Value("username")
    private String username;
    @Value("password")
    private String password;

    @Value("databaseChangeLogTableName")
    private String databaseChangeLogTableName;

    @Value("databaseChangeLogLockTableName")
    private String databaseChangeLogLockTableName;

    @Value("changeLogFile")
    private String changeLogFile;

    @Value("outputDirectory")
    private String outputDirectory;

    @Value("migrationSqlOutputFile")
    private String migrationSqlOutputFile;

    @Value("outputFile")
    private String outputFile;

    @Value("outputChangeLogFile")
    private String outputChangeLogFile;

    @Value("diffChangeLogFile")
    private String diffChangeLogFile;

    @Value("outputFileEncoding")
    private String outputFileEncoding;

    @Value("promptOnNonLocalDatabase")
    private String promptOnNonLocalDatabase;

    @Value("changeSetAuthor")
    private String changeSetAuthor;

    @Value("rollbackTag")
    private String rollbackTag;

    @Value("enabled")
    private String enabled;
    @Value("dropFirst")
    private String dropFirst;

    public String getDriverClass() {
        return driverClassName;
    }

    public String getUrl() {
        return url;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getDatabaseChangeLogTableName() {
        return databaseChangeLogTableName;
    }

    public String getDatabaseChangeLogLockTableName() {
        return databaseChangeLogLockTableName;
    }

    public String getChangeLogFile() {
        return changeLogFile;
    }

    public String getOutputDirectory() {
        return outputDirectory;
    }

    public String getMigrationSqlOutputFile() {
        return migrationSqlOutputFile;
    }

    public String getOutputFile() {
        return outputFile;
    }

    public String getOutputChangeLogFile() {
        return outputChangeLogFile;
    }

    public String getDiffChangeLogFile() {
        return diffChangeLogFile;
    }

    public String getOutputFileEncoding() {
        return outputFileEncoding;
    }

    public String getPromptOnNonLocalDatabase() {
        return promptOnNonLocalDatabase;
    }

    public String getChangeSetAuthor() {
        return changeSetAuthor;
    }

    public String getRollbackTag() {
        return rollbackTag;
    }

    public String isEnabled() {
        return enabled;
    }

    public String isDropFirst() {
        return dropFirst;
    }
}
