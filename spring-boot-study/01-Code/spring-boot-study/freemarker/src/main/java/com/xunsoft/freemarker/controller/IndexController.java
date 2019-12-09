package com.xunsoft.freemarker.controller;

import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/** @Author: WangXun @Date: 2019/12/6 17:08 @Description: */
@RestController
public class IndexController {
  @GetMapping("/")
  public String index(ModelMap modelMap) {
    modelMap.addAttribute("msg", "Hello World!");
    return "Hello World";
  }
}
