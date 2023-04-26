package com.lec.jeju.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.HotelCommentService;
import com.lec.jeju.service.HotelService;
import com.lec.jeju.service.HreservationService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.HotelComment;
import com.lec.jeju.vo.Hreservation;

@Controller
@RequestMapping("hotel")
public class HotelController {
	@Autowired
	private HotelService hotelService;
	@Autowired
	private HotelCommentService hotelCommentService;
	@Autowired
	private HreservationService hreservService;
	
	// 숙소목록
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(String pageNum, Model model, Hotel hotel) {
		model.addAttribute("locList", hotelService.locList());
		model.addAttribute("list", hotelService.hotelList(pageNum, hotel));
		model.addAttribute("paging", new Paging(hotelService.totCntHotel(hotel), pageNum, 2, 2));
		return "hotel/list";
	}
	
	// 숙소목록2
	@RequestMapping(value = "list2", method = RequestMethod.GET)
	public String list2(String pageNum, Model model, Hotel hotel) {
		model.addAttribute("locList", hotelService.locList());
		model.addAttribute("list", hotelService.hotelList2(pageNum, hotel));
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

	// 숙소 예약 페이지
	@RequestMapping(value = "reserv", method = RequestMethod.GET)
	public String reserv(String hname, Model model) {
		model.addAttribute("hotelVo", hotelService.detailHotel(hname));
		return "hotel/reservation";
	}
	
	// 댓글 작성
	@RequestMapping(value = "writeComment", method = RequestMethod.POST)
	public String writeComment(HotelComment hotelComment) throws UnsupportedEncodingException {
		hotelCommentService.registerHcomment(hotelComment);
		String hname = 	URLEncoder.encode(hotelComment.getHname(), "utf-8");
		return "redirect:detail.do?hname="+hname;
	}
	
	// 댓글 수정
	@RequestMapping(value = "modifyComment", method = RequestMethod.POST)
	public String modifyComment(HotelComment hotelComment) throws UnsupportedEncodingException {
		String hname = 	URLEncoder.encode(hotelComment.getHname(), "utf-8");
		hotelCommentService.modifyHotelComment(hotelComment);
		return "redirect:detail.do?hname="+hname;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "deleteComment", method = RequestMethod.GET)
	public String deleteComment(HotelComment hotelComment, Model model) throws UnsupportedEncodingException {
		int hcommentno = hotelComment.getHcommentno();
		hotelCommentService.deleteHotelComment(hcommentno);
		String hname = 	URLEncoder.encode(hotelComment.getHname(), "utf-8");
		return "redirect:detail.do?hname="+hname;
	}
	

}
