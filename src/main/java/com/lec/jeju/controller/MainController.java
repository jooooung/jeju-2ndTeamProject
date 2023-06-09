package com.lec.jeju.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	@RequestMapping(value = "main", method = { RequestMethod.GET, RequestMethod.POST })
	public String main() {
		return "main/main";
	}

	@RequestMapping(value = "notice", method = { RequestMethod.GET, RequestMethod.POST })
	public String notice() {
		return "main/notice";
	}
	
	@RequestMapping(value = "weather", method = { RequestMethod.GET, RequestMethod.POST })
	public String weather() {
		return "main/weather";
	}
}
