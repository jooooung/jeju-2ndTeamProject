package com.lec.jeju.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.SpotService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Member;
import com.lec.jeju.vo.Spot;
@Controller
@RequestMapping("spot")
public class SpotController {
	@Autowired
	private SpotService sService;
	
	// 리스트 페이지
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(String pageNum, Model model, Spot spot, String schitem, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		String mid = "";
		if(member != null) {
			mid = member.getMid();
		}
		if(schitem == null) {
			schitem = "";
		}
		model.addAttribute("schitem", schitem);
		model.addAttribute("list", sService.spotList(pageNum, spot, mid));
		model.addAttribute("paging", new Paging(sService.totCntSpot(spot), pageNum, 5, 5));
		return "spot/list";
	}
	
	// 상세보기 페이지
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(String pageNum, Model model, String sname) {
		model.addAttribute("detail", sService.detailSpot(sname));
		return "spot/detail";
	}
	
}
