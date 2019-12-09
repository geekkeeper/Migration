package com.xunsoft.thymeleaf.controller;

import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.util.Locale;

/** @Author: WangXun @Date: 2019/12/6 17:08 @Description: */
@Controller
public class IndexController {
  //  @GetMapping("/")
  //  public String index(ModelMap modelMap) {
  //    modelMap.addAttribute("msg", "Hello World!");
  //    return "index";
  //  }
  public String hello(Model model) {
    Locale locale = LocaleContextHolder.getLocale();
    //    model.addAttribute("message", MessageSource)
    return "index";
  }
}
