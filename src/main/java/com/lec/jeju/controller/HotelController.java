package com.lec.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.HotelService;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Location;

@Controller
@RequestMapping("hotel")
public class HotelController {
	@Autowired
	private HotelService hotelService;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(String pageNum, Model model, Hotel hotel) {
		model.addAttribute("list", hotelService.hotelList(pageNum, hotel));
		return "hotel/list";
	}
}
