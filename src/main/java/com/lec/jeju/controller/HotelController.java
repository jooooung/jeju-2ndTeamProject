package com.lec.jeju.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.HotelCommentService;
import com.lec.jeju.service.HotelService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.HotelComment;

@Controller
@RequestMapping("hotel")
public class HotelController {
	@Autowired
	private HotelService hotelService;
	@Autowired
	private HotelCommentService hotelCommentService;
	
	// 숙소목록
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(String pageNum, Model model, Hotel hotel) {
		model.addAttribute("list", hotelService.hotelList(pageNum, hotel));
		model.addAttribute("paging", new Paging(hotelService.totCntHotel(hotel), pageNum, 5, 5));
		return "hotel/list";
	}

	// 숙소 상세보기
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(String hname, Model model, String pageNum, HotelComment hotelComment) {
		model.addAttribute("hotelVo", hotelService.detailHotel(hname));
		List<HotelComment> hotelComments = hotelCommentService.hCommentList(hotelComment, pageNum);
		model.addAttribute("paging", new Paging(hotelCommentService.totCntHcomment(hname, hotelComment), pageNum, 5, 5));
		model.addAttribute("hotelComments", hotelComments);
		return "hotel/detail";
	}
	
	// 댓글 작성
	@RequestMapping(value = "writeComment", method = RequestMethod.POST)
	public String writeComment(HotelComment hotelComment) throws UnsupportedEncodingException {
		hotelCommentService.registerHcomment(hotelComment);
		String hname = 	URLEncoder.encode(hotelComment.getHname(), "utf-8");
		return "redirect:detail.do?hname="+hname;
	}
	
	// 댓글수정
	@RequestMapping(value = "modifyComment", method = RequestMethod.GET)
	public String modifyComment() {
		return "hotel/modifyComment";
	}
}
