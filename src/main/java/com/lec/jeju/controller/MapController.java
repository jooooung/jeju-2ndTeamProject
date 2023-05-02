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
	public String map(Model model) {
		model.addAttribute("spot", mservice.mapSpotList());
		model.addAttribute("res", mservice.mapRestaurantList());
		model.addAttribute("hotel", mservice.mapHotelList());
		model.addAttribute("category", "spot");
		return "map/map";
	}
	
	// 지도 카테고리 클릭
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
	
	// 검색창 검색 시
	@RequestMapping(value = "mapSchKeyword", method = RequestMethod.GET)
	public String mapSchKeyword(Model model, String schName, String schCategory) {
		if(schCategory.equals("spot")) {
			model.addAttribute("spot", mservice.schSpotList(schName));
			model.addAttribute("res", mservice.mapRestaurantList());
			model.addAttribute("hotel", mservice.mapHotelList());
		}
		if(schCategory.equals("res")) {
			model.addAttribute("spot", mservice.mapSpotList());
			model.addAttribute("res", mservice.schRestaurantList(schName));
			model.addAttribute("hotel", mservice.mapHotelList());
		}
		if(schCategory.equals("hotel")) {
			model.addAttribute("spot", mservice.mapSpotList());
			model.addAttribute("res", mservice.mapRestaurantList());
			model.addAttribute("hotel", mservice.schHotelList(schName));
		}
		model.addAttribute("category", schCategory);
		model.addAttribute("schName", schName);
		return "map/map";
	}
}
