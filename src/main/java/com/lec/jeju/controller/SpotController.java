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

import com.lec.jeju.service.SpotCommentService;
import com.lec.jeju.service.SpotService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Member;
import com.lec.jeju.vo.Spot;
import com.lec.jeju.vo.SpotComment;
@Controller
@RequestMapping("spot")
public class SpotController {
	@Autowired
	private SpotService sService;
	@Autowired
	private SpotCommentService sCService;
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
	public String detail(String pageNum, Model model, String sname, HttpSession session, SpotComment sComment, String CpageNum) {
		Member member = (Member) session.getAttribute("member");
		String mid = "";
		if(member != null) {
			mid = member.getMid();
		}
		model.addAttribute("detail", sService.detailSpot(sname, mid));
		model.addAttribute("paging", new Paging(sCService.totCntScomment(sname, sComment), CpageNum, 5, 10));
		List<SpotComment> sComments = sCService.sCommentList(sComment, CpageNum, model);
		model.addAttribute("comment", sComments);
		return "spot/detail";
	}
	
	// 댓글 작성
	@RequestMapping(value = "insertComment", method = RequestMethod.POST)
	public String insertComment(SpotComment sComment) throws UnsupportedEncodingException {
		sCService.insertScomment(sComment);
		String sname = URLEncoder.encode(sComment.getSname(), "utf-8");
		return "redirect:detail.do?sname=" + sname;
	}
	
	// 댓글 수정
	@RequestMapping(value = "modifyComment", method = RequestMethod.POST)
	public String mdodifyComment(SpotComment sComment) throws UnsupportedEncodingException {
		String sname = URLEncoder.encode(sComment.getSname(), "utf-8");
		sCService.modifyScomment(sComment);
		return "redirect:detail.do?sname="+sname;
	}
	
	// 댓글 삭제
	@RequestMapping(value = "deleteComment", method = RequestMethod.GET)
	public String deleteComment(SpotComment sComment) throws UnsupportedEncodingException {
		int scommentno = sComment.getScommentno();
		sCService.deleteScomment(scommentno);
		String sname = URLEncoder.encode(sComment.getSname(), "utf-8");
		return "redirect:detail.do?sname="+sname;
	}
}
