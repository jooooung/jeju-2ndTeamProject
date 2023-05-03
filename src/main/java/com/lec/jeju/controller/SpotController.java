package com.lec.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.SpotService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Spot;
@Controller
@RequestMapping("spot")
public class SpotController {
	@Autowired
	private SpotService sservice;
	
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(String pageNum, Model model, Spot spot, String schitem) {
		model.addAttribute("schitem", schitem);
		model.addAttribute("list", sservice.spotList(pageNum, spot));
		model.addAttribute("paging", new Paging(sservice.totCntSpot(spot), pageNum, 5, 5));
		return "spot/list";
	}
	
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(String pageNum, Model model, String sname) {
		model.addAttribute("detail", sservice.detailSpot(sname));
		return "spot/detail";
	}
	
}
