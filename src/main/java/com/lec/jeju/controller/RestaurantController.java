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

import com.lec.jeju.service.ResCommentService;
import com.lec.jeju.service.RestaurantService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Member;
import com.lec.jeju.vo.ResComment;
import com.lec.jeju.vo.Restaurant;

@Controller
@RequestMapping("res")
public class RestaurantController {
	@Autowired
	private RestaurantService rService;
	@Autowired
	private ResCommentService rCService;

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
		model.addAttribute("list", rService.ResList(pageNum, res, mid));
		model.addAttribute("paging", new Paging(rService.totCntRes(res), pageNum, 5, 5));
		return "restaurant/list";
	}

	// 상세보기 페이지
	@RequestMapping(value = "detail", method = RequestMethod.GET)
	public String detail(String pageNum, Model model, String rname, HttpSession session, ResComment rComment,
			String RpageNum) {
		Member member = (Member) session.getAttribute("member");
		String mid = "";
		if (member != null) {
			mid = member.getMid();
		}
		model.addAttribute("detail", rService.detailRes(rname, mid));
		model.addAttribute("paging", new Paging(rCService.totCntRcomment(rname, rComment), RpageNum, 5, 10));
		List<ResComment> rComments = rCService.rCommentList(rComment, RpageNum, model);
		model.addAttribute("comment", rComments);
		return "restaurant/detail";
	}

	// 댓글 작성
	@RequestMapping(value = "insertComment", method = RequestMethod.POST)
	public String insertComment(ResComment rComment) throws UnsupportedEncodingException {
		rCService.insertRcomment(rComment);
		String rname = URLEncoder.encode(rComment.getRname(), "utf-8");
		return "redirect:detail.do?rname=" + rname;
	}

	// 댓글 수정 뷰
	@RequestMapping(value = "modifyComment", method = RequestMethod.GET)
	public String mdodifyCommentView(int rcommentno, String rname, Model model) throws UnsupportedEncodingException {
		model.addAttribute("modifyComment", rCService.modifyRcommentView(rcommentno));
		return "forward:detail.do";
	}

	// 댓글 수정
	@RequestMapping(value = "modifyComment", method = RequestMethod.POST)
	public String mdodifyComment(ResComment rComment) throws UnsupportedEncodingException {
		String rname = URLEncoder.encode(rComment.getRname(), "utf-8");
		rCService.modifyRcomment(rComment);
		return "redirect:detail.do?rname=" + rname;
	}

	// 댓글 삭제
	@RequestMapping(value = "deleteComment", method = RequestMethod.GET)
	public String deleteComment(ResComment rComment) throws UnsupportedEncodingException {
		int rcommentno = rComment.getRcommentno();
		rCService.deleteRcomment(rcommentno);
		String rname = URLEncoder.encode(rComment.getRname(), "utf-8");
		return "redirect:detail.do?rname=" + rname;
	}
}
