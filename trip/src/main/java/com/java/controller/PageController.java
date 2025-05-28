package com.java.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/trip")

	public class PageController {
		    @GetMapping("/NewFile")
	    public String openPage() {
	        return "NewFile"; // /WEB-INF/views/NewFile.jsp 를 찾게 됨
	    }
	}

