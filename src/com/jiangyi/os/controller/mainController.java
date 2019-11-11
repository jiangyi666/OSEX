package com.jiangyi.os.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class mainController {
    @RequestMapping("main")
    public String toMain(){
        return "main";
    }
}
