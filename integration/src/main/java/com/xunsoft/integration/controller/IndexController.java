package com.xunsoft.integration.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @Author: WangXun
 * @Date: 2019/12/12 15:50
 * @Description:
 */
@RestController
public class IndexController {
    @GetMapping("/")
    public String index(){
        return "Hello World！！";
    }
}
