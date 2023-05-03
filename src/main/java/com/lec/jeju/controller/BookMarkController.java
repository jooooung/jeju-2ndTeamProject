package com.lec.jeju.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.BookMarkService;
import com.lec.jeju.service.HotelService;
import com.lec.jeju.service.MemberService;
import com.lec.jeju.vo.BookMark;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Member;

@Controller
@RequestMapping("bookmark")
public class BookMarkController {
	@Autowired
	private BookMarkService bookMarkService;

	// 즐겨찾기한 숙소, 식당 , 관광지 갯수
	@RequestMapping(value = "MyAll", method = RequestMethod.GET)
	public String all(Model model, HttpSession session) {
		Member member = (Member) session.getAttribute("member");
		if (member == null) {
			System.out.println("로그인 안되어있음");
			return "redirect:/main.do";
		} else {
			String mid = member.getMid();
			int hotelCount = bookMarkService.getHotelCount(mid);
			int resCount = bookMarkService.getResCount(mid);
			int spotCount = bookMarkService.getSpotCount(mid);
			session.setAttribute("hotelCount2", hotelCount);
			session.setAttribute("resCount2", resCount);
			session.setAttribute("spotCount2", spotCount);
			model.addAttribute("hotelCount", hotelCount);
			model.addAttribute("resCount", resCount);
			model.addAttribute("spotCount", spotCount);
			System.out.println("현재 로그인 한 놈 " + mid);
		}
		return "bookmark/bookMarkAll";
	}

	// 즐겨찾기한 호텔 리스트
	@RequestMapping(value = "hotelList", method = RequestMethod.GET)
	public String hotelList(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<BookMark> hotelList = bookMarkService.getBookmarkHotelList(mid, session);
		model.addAttribute("hotelList", hotelList);
		return "bookmark/hotelList";
	}

	// 즐겨찾기한 식당 리스트
	@RequestMapping(value = "resList", method = RequestMethod.GET)
	public String resList(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<BookMark> resList = bookMarkService.getBookmarkResList(mid, session);
		model.addAttribute("resList", resList);
		return "bookmark/resList";
	}

	// 즐겨찾기한 관광지 리스트
	@RequestMapping(value = "spotList", method = RequestMethod.GET)
	public String spotList(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<BookMark> spotList = bookMarkService.getBookmarkSpotList(mid, session);
		model.addAttribute("spotList", spotList);
		return "bookmark/spotList";
	}
	
	// 호텔 목록에서 즐겨찾기 추가
	@RequestMapping(value = "addBookmarkHotelList", method = RequestMethod.GET)
	public String addBookmarkHotelList(BookMark bookmark, String pageNum) throws UnsupportedEncodingException{
		bookMarkService.addHotelBookmark(bookmark);
		return "redirect:../hotel/list.do?&mid="+bookmark.getMid()+"&pageNum="+pageNum;
	}
	// 호텔 목록에서 즐겨찾기 추가
	@RequestMapping(value = "deleteBookmarkHotelList", method = RequestMethod.GET)
	public String deleteBookmarkHotelList(BookMark bookmark, String pageNum) throws UnsupportedEncodingException{
		bookMarkService.addHotelBookmark(bookmark);
		return "redirect:../hotel/list.do?&mid="+bookmark.getMid()+"&pageNum="+pageNum;
	}
	
	// 호텔 즐겨찾기 추가
	@RequestMapping(value = "addBookmarkHotel", method = RequestMethod.GET)
	public String addBookmarkHotel(BookMark bookmark, String mid, String pageNum, String lname) throws UnsupportedEncodingException {
		bookMarkService.addHotelBookmark(bookmark);
		String hname = 	URLEncoder.encode(bookmark.getHname(), "utf-8");
		lname = URLEncoder.encode(lname, "utf-8");
		return "redirect:../hotel/detail.do?hname="+hname+"&mid="+mid+"&pageNum="+pageNum+"&lname="+lname;
	}
	// 호텔 즐겨찾기 취소
	@RequestMapping(value = "deleteBookmarkHotel", method = RequestMethod.GET)
	public String deleteBookmarkHotel(BookMark bookmark, String mid, String pageNum, String lname) throws UnsupportedEncodingException {
		bookMarkService.deleteHotelBookmark(bookmark);
		String hname = 	URLEncoder.encode(bookmark.getHname(), "utf-8");
		lname = URLEncoder.encode(lname, "utf-8");
		return "redirect:../hotel/detail.do?hname="+hname+"&mid="+mid+"&pageNum="+pageNum+"&lname="+lname;
	}
}
