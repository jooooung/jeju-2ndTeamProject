package com.lec.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.RestaurantService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Restaurant;

@Controller
@RequestMapping("res")
public class RestaurantController {
	@Autowired
	private RestaurantService resService;

	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String ResList(String pageNum, Model model, Restaurant res) {
		model.addAttribute("list", resService.ResList(pageNum, res));
		model.addAttribute("paging", new Paging(resService.totCntRes(res), pageNum, 5, 5));
		return "restaurant/ResList";
	}
}
