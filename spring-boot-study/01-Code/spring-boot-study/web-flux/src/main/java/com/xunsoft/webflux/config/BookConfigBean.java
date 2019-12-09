package com.xunsoft.webflux.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/** @Author: WangXun @Date: 2019/12/6 15:32 @Description: */
@Component
@ConfigurationProperties(prefix = "book")
public class BookConfigBean {
  // 名称
  private String name;
  // 作者
  private String author;
  // 随机字符串
  private String value;
  // 随机整形
  private String intValue;
  // 随机长整形
  private String longValue;
  // 随机UUID
  private String uuid;
  // N以内随机整数
  private String randomInt;
  // N以内随机长整数
  private String randomLong;
  // 属性间引用
  private String title;
}
