package com.xunsoft.webflux;

import com.xunsoft.webflux.config.BookConfigBean;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;

/** @author wangxun183963 */
@SpringBootApplication
@EnableConfigurationProperties(BookConfigBean.class)
// @EnableConfigurationProperties(BookConfigTest.class)
public class WebFluxApplication {

  public static void main(String[] args) {
    SpringApplication.run(WebFluxApplication.class, args);
  }
}
