package com.lec.jeju.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lec.jeju.service.ReviewService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.ReviewBoard;

@Controller
@RequestMapping("review")
public class ReviewController {
	@Autowired
	private ReviewService rservice;

	@RequestMapping(value = "list", method = { RequestMethod.GET, RequestMethod.POST })
	public String list(@RequestParam(value = "pageNum", defaultValue = "1") String pageNum, Model model) {
		model.addAttribute("list", rservice.ReviewList(pageNum));
		model.addAttribute("paging", new Paging(rservice.totCntReview(), pageNum, 5, 5));
		return "review/list";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeView() {
		return "review/write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(ReviewBoard reviewBoard, HttpServletRequest request, Model model) {
		model.addAttribute("wrtierResult", rservice.writeReview(reviewBoard, request));
		return "forward:list.do";
	}

	@RequestMapping(value = "content", method = { RequestMethod.GET, RequestMethod.POST })
	public String detail(int reviewno, Model model) {
		model.addAttribute("contentReview", rservice.contentReview(reviewno));
		return "review/content";
	}

	@RequestMapping(value = "modifyView", method = RequestMethod.GET)
	public String modifyView(int reviewno, Model model) {
		model.addAttribute("review", rservice.modifiyReviewView(reviewno));
		return "review/modify";
	}

	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(ReviewBoard reviewBoard, Model model) {
		model.addAttribute("modifyResult", rservice.modifiyReview(reviewBoard));
		return "forward:list.do";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int reviewno, Model model) {
		model.addAttribute("deleteResult", rservice.deleteReview(reviewno));
		return "forward:list.do";
	}
}
