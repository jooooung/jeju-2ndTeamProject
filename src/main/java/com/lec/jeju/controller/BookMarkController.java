package com.lec.jeju.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.BookMarkService;
import com.lec.jeju.vo.BookMark;
import com.lec.jeju.vo.Member;

@Controller
@RequestMapping("bookmark")
public class BookMarkController {
	@Autowired
	private BookMarkService bookMarkService;

	@RequestMapping(value = "MyAll", method = RequestMethod.GET)
	public String all(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			System.out.println("로그인 안되어있음");
			return "redirect:/main.do";
		} else {
			String mid = member.getMid();
			int hotelCount = bookMarkService.getHotelCount(mid);
			int ResCount = bookMarkService.getResCount(mid);
			int spotCount = bookMarkService.getSpotCount(mid);
			session.setAttribute("otelCount", hotelCount);
			session.setAttribute("resCount", ResCount);
			session.setAttribute("spotCount", spotCount);
			model.addAttribute("HotelCount", hotelCount);
			model.addAttribute("ResCount", ResCount);
			model.addAttribute("SpotCount", spotCount);
		}
		return "bookmark/bookMarkAll";
	}

	@RequestMapping(value = "hotelList", method = { RequestMethod.GET, RequestMethod.POST })
	public String hotelList(String mid, Model model) {
		List<BookMark> hotelList = bookMarkService.getBookmarkHotelList(mid);
		model.addAttribute("hotelList", hotelList);
		return "bookmark/hotelList";
	}
}
