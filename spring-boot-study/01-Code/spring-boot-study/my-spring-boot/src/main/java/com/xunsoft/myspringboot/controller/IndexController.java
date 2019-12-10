package com.xunsoft.myspringboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/** @Author: WangXun @Date: 2019/12/10 11:38 @Description: */
@Controller
public class IndexController {
  @RequestMapping("/")
  public String index() {
    return "index";
  }
}
