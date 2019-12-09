package com.xunsoft.web.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
/** @author wangxun183963 */
@RestController
public class HelloController {
  @GetMapping("/hello")
  public String hello() {
    return "Hello ,This is my first spring boot project";
  }
}
