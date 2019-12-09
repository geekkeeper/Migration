package com.xunsoft.webflux.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/** @Author: WangXun @Date: 2019/12/6 16:40 @Description: */
@Component
@PropertySource("classpath:config/book-info.properties")
@ConfigurationProperties(prefix = "com.book")
public class BookConfigTest {
  private String name;
  private String author;
}
