package com.github.swrh.pk.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Html5PathsController {
    @RequestMapping(value="/{[path:[^\\.]*}")
    public String forwardAngularPaths() {
        return "forward:/index.html";
    }
}
