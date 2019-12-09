package com.xunsoft.thymeleaf.config;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;
import org.springframework.web.servlet.i18n.SessionLocaleResolver;

import java.util.Locale;

/** @Author: WangXun @Date: 2019/12/9 9:26 @Description: */
@Configuration
@EnableAutoConfiguration
@ComponentScan
public class i18nConfig implements WebMvcConfigurer {

  public LocaleResolver localeResolver() {
    SessionLocaleResolver localeResolver = new SessionLocaleResolver();
    localeResolver.setDefaultLocale(Locale.US);
    return localeResolver;
  }

  public LocaleChangeInterceptor localeChangeInterceptor() {
    LocaleChangeInterceptor changeInterceptor = new LocaleChangeInterceptor();
    changeInterceptor.setParamName("larg");
    return changeInterceptor;
  }

  @Override
  public void addInterceptors(InterceptorRegistry registry) {
    registry.addInterceptor(localeChangeInterceptor());
  }
}
