package com.lec.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.MapService;

@Controller
@RequestMapping("map")
public class MapController {
	@Autowired
	private MapService mservice;
	@RequestMapping(value = "mapList", method = RequestMethod.GET)
	public String map(Model model) {
		model.addAttribute("spot", mservice.mapSpotList());
		model.addAttribute("res", mservice.mapRestaurantList());
		model.addAttribute("hotel", mservice.mapHotelList());
		return "map/map";
	}
}
