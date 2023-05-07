package com.lec.jeju.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.RestaurantService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Member;
import com.lec.jeju.vo.Restaurant;
import com.lec.jeju.vo.Spot;

@Controller
@RequestMapping("res")
public class RestaurantController {
	@Autowired
	private RestaurantService resService;

	// 리스트 페이지
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(String pageNum, Model model, Restaurant res, String schitem, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		String mid = "";
		if (member != null) {
			mid = member.getMid();
		}
		if (schitem == null) {
			schitem = "";
		}
		model.addAttribute("schitem", schitem);
		model.addAttribute("list", resService.ResList(pageNum, res, mid));
		model.addAttribute("paging", new Paging(resService.totCntRes(res), pageNum, 5, 5));
		return "restaurant/ResList";
	}

	// 상세보기 페이지
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(String pageNum, Model model, String rname) {
		model.addAttribute("detail", resService.detailRes(rname));
		return "restaurant/detail";
	}
}
