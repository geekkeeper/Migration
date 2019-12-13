package com.xunsoft.integration.config;

import liquibase.Liquibase;
import liquibase.integration.spring.SpringLiquibase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseDataSource;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

/**
 * @Author: WangXun
 * @Date: 2019/12/12 16:54
 * @Description:
 */
@Configuration
public class LiquibaseConfig {

    @Autowired
    private LiquibaseProperties properties;

    @Bean
    public SpringLiquibase liquibase(DataSource dataSource){
        SpringLiquibase liquibase = new SpringLiquibase();
        liquibase.setDataSource(dataSource);
        liquibase.setChangeLog(properties.getChangeLogFile());
        liquibase.setShouldRun(properties.isEnabled().equals("true"));
        liquibase.setDropFirst(properties.isDropFirst().equals("true"));
        return liquibase;
    }
}
