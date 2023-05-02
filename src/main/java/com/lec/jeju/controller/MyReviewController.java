package com.lec.jeju.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.MyReviewService;
import com.lec.jeju.vo.Member;
import com.lec.jeju.vo.MyReview;

@Controller
@RequestMapping("myreview")
public class MyReviewController {
	@Autowired
	private MyReviewService myReviewService;

	// 마이페이지 내글
	@RequestMapping(value = "mypage", method = RequestMethod.GET)
	public String mypage(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<MyReview> mypage = myReviewService.ReadReview(mid);
		model.addAttribute("mypage", mypage);
		return "myreview/getAll";
	}

	// 작성한 글 조회
	@RequestMapping(value = "getReview", method = RequestMethod.GET)
	public String getReview(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<MyReview> getReview = myReviewService.ReadReview(mid);
		model.addAttribute("getReview", getReview);
		return "myreview/getReview";
	}

	// 작성한 댓글 호텔
	@RequestMapping(value = "getHotel", method = RequestMethod.GET)
	public String getHotel(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<MyReview> getHotel = myReviewService.ReadHotelcomment(mid);
		model.addAttribute("getHotel", getHotel);
		return "myreview/getHotel";
	}

	// 작성한 댓글 식당
	@RequestMapping(value = "getRes", method = RequestMethod.GET)
	public String getRes(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<MyReview> getRes = myReviewService.ReadRescomment(mid);
		model.addAttribute("getRes", getRes);
		return "myreview/getRes";
	}

	// 작성한 댓글 관광지
	@RequestMapping(value = "getSpot", method = RequestMethod.GET)
	public String getSpot(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<MyReview> getSpot = myReviewService.ReadSpotcomment(mid);
		model.addAttribute("getSpot", getSpot);
		return "myreview/getSpot";
	}
}
