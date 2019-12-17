package com.xunsoft.integration.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

/**
 * @Author: WangXun
 * @Date: 2019/12/12 16:42
 * @Description:
 */
@Configuration
@PropertySource(value = "/liquibase/config/liquibase-mysql.properties",ignoreResourceNotFound = true)
public class DataSourceConfig {
    @Value("driverClassName")
    private String driverClassName;
    @Value("url")
    private String url;
    @Value("username")
    private String username;
    @Value("password")
    private String password;

    @Bean
    public DataSource dataSource(){

        return DataSourceBuilder.create()
                .driverClassName(driverClassName)
                .url(url)
                .username(username)
                .password(password).build();
    }
    @Bean
    public JdbcTemplate jdbcTemplate(){
        return new JdbcTemplate(dataSource());
    }
}
