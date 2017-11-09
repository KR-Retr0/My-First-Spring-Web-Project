package com.test1.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test1.service.TestService;

@Controller
public class TestController {
	 
	@Autowired TestService testService;
	
	@RequestMapping("/test")
	public String asd(HttpServletRequest req){
		
		return "/test";
	}
	
	@RequestMapping("/join")
	public String showjoin(HttpServletRequest req){
		
		return "/join";
	}
	
}
