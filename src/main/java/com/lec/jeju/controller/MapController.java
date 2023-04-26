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
	// 메인 지도
	@RequestMapping(value = "mapList", method = RequestMethod.GET)
	public String map(Model model, String category) {
		model.addAttribute("spot", mservice.mapSpotList());
		model.addAttribute("res", mservice.mapRestaurantList());
		model.addAttribute("hotel", mservice.mapHotelList());
		if(category == null) {
			category = "all";
		}
		model.addAttribute("category", category);
		return "map/map";
	}
	// 지도 검색
	@RequestMapping(value = "mapSchCategory", method = RequestMethod.GET)
	public String mapSchName(Model model, String schCategory) {
		if(schCategory.equals("관광지")) {
			model.addAttribute("spotList", mservice.mapSpotList());
		}else if(schCategory.equals("음식점")) {
			model.addAttribute("resList", mservice.mapRestaurantList());
		}else if(schCategory.equals("숙박")) {
			model.addAttribute("hotelList", mservice.mapHotelList());
		}
		return "map/mapSchCategory";
	}
}
