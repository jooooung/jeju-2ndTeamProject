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

	// 작성한 글 조회
	@RequestMapping(value = "getReview", method = RequestMethod.GET)
	public String getReview(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<MyReview> getReview = myReviewService.ReadReview(mid);
		model.addAttribute("getReview", getReview);
		return "myreview/getAll";
	}

	// 작성한 댓글 호텔
	@RequestMapping(value = "getHotel", method = RequestMethod.GET)
	public String getHotel(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<MyReview> getHotel = myReviewService.ReadHotelcomment(mid);
		System.out.println("컨트롤러 호텔");
		model.addAttribute("getHotel", getHotel);
		return "myreview/getAll";
	}

	// 작성한 댓글 식당
	@RequestMapping(value = "getRes", method = RequestMethod.GET)
	public String getRes(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<MyReview> getRes = myReviewService.ReadRescomment(mid);
		System.out.println("컨트롤러 식당");
		model.addAttribute("getRes", getRes);
		return "myreview/getAll";
	}

	// 작성한 댓글 관광지
	@RequestMapping(value = "getSpot", method = RequestMethod.GET)
	public String getSpot(HttpSession session, Model model) {
		Member sessionMember = (Member) session.getAttribute("member");
		String mid = sessionMember.getMid();
		List<MyReview> getSpot = myReviewService.ReadSpotcomment(mid);
		System.out.println("컨트롤러 스팟");
		model.addAttribute("getSpot", getSpot);
		return "myreview/getAll";
	}
}
