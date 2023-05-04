package com.lec.jeju.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.BookMarkService;
import com.lec.jeju.service.BusinessService;
import com.lec.jeju.service.HotelCommentService;
import com.lec.jeju.service.HotelService;
import com.lec.jeju.service.HreservationService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.BookMark;
import com.lec.jeju.vo.Business;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.HotelComment;
import com.lec.jeju.vo.Hreservation;
import com.lec.jeju.vo.Location;
import com.lec.jeju.vo.Member;

@Controller
@RequestMapping("hotel")
public class HotelController {
	@Autowired
	private HotelService hotelService;
	@Autowired
	private HotelCommentService hotelCommentService;
	@Autowired
	private HreservationService hreservService;
	@Autowired
	private BookMarkService bookmarkService;
	@Autowired
	private BusinessService businessService;
	
	// 숙소목록
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(String pageNum, Model model, Hotel hotel, HttpSession session) {
		// model.addAttribute("locList", hotelService.locList());
		model.addAttribute("list", hotelService.hotelList(pageNum, hotel, model));
		BookMark mark = new BookMark();
		String hname = hotel.getHname();
		Member member = (Member) session.getAttribute("member");
		if(member != null) {
			String mid = member.getMid();
			mark.setMid(mid);
			model.addAttribute("checkBookmarkHotel", bookmarkService.checkBookmarkHotel(mark));
		}
		model.addAttribute("bookmark", bookmarkService.cntBmarkHotel(hname));
		return "hotel/list";
	}
	
	// 숙소 상세보기
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(String hname, Model model, String pageNum, HotelComment hotelComment, HttpSession session, String CpageNum) {
		model.addAttribute("hotelVo", hotelService.detailHotel(hname));
		
		List<HotelComment> hotelComments = hotelCommentService.hCommentList(hotelComment, CpageNum, model);
		model.addAttribute("hotelComments", hotelComments);
		
		BookMark mark = new BookMark();
		mark.setHname(hname);
		
		Member member = (Member) session.getAttribute("member");
		if(member != null) {
			String mid = member.getMid();
			mark.setMid(mid);
			model.addAttribute("checkBookmarkHotel", bookmarkService.checkBookmarkHotel(mark));
		}
		model.addAttribute("bookmark", bookmarkService.cntBmarkHotel(hname));
		
		return "hotel/detail";
	}
	
	
	// 예약
	
	// 숙소 예약 페이지
	@RequestMapping(value = "reserv", method = RequestMethod.GET)
	public String reserv(String hname, Model model) {
		model.addAttribute("hotelVo", hotelService.detailHotel(hname));
		model.addAttribute("list", hreservService.hreservationList_Hotel(hname));
		return "hotel/reservation";
	}
	// 숙소 예약 db 저장 후 내 예약 목록으로 가기
	@RequestMapping(value = "reserv", method = RequestMethod.POST)
	public String reserv_post(Hreservation hreservation, Model model) {
		model.addAttribute("hotelReservResult", hreservService.doHreservation(hreservation));
		return "forward:reservList.do?mid="+hreservation.getMid();
	}
	
	// 내 예약 리스트(사용자)
	@RequestMapping(value = "reservList", method = {RequestMethod.GET, RequestMethod.POST})
	public String reservList(Hreservation hreservation, Model model, HttpSession session, String mid) {
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			return "redirect:/main.do";
		}else {
			mid = member.getMid();
			List<Hreservation> reservList = hreservService.hreservationList_Member(mid);
			model.addAttribute("reservList", reservList);
		}
		return "hotel/reservList";
	}
	// 내 예약 리스트(업체)
	@RequestMapping(value = "reservList_buisness", method = {RequestMethod.GET, RequestMethod.POST})
	public String reservList_buisness(Hreservation hreservation, Model model, HttpSession session, String bid) {
		Business buisness = (Business) session.getAttribute("business");
		if (buisness == null) {
			return "redirect:/main.do";
		}else { 
			String hname = buisness.getBname();
			List<Hreservation> reservList = hreservService.hreservationList_Hotel(hname);
			model.addAttribute("reservList", reservList);
		}
		return "hotel/reservList";
	}
	
	// 내 예약 취소(사용자)
	@RequestMapping(value = "deleteReserv", method = RequestMethod.GET)
	public String deleteReserv(Model model, Hreservation hreservation) {
		model.addAttribute("deleteReservResult", hreservService.deleteHreservation(hreservation));
		return "forward:reservList.do?mid="+hreservation.getMid();
	}
	
	
	// 댓글
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
