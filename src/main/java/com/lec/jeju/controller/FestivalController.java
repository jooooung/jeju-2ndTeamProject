package com.lec.jeju.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.FestivalService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.FestivalBoard;

@Controller
@RequestMapping("festival")
public class FestivalController {
	@Autowired
	private FestivalService festivalService;

	@RequestMapping(value = "list", method = { RequestMethod.GET, RequestMethod.POST })
	public String festivalList(String pageNum, Model model) {
		model.addAttribute("FestivalList", festivalService.FestivalList(pageNum));
		model.addAttribute("paging", new Paging(festivalService.totCntFestival(), pageNum, 5, 5));
		return "festival/list";
	}

	@RequestMapping(value = "write", method = RequestMethod.GET)
	public String writeView() {
		return "festival/write";
	}

	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(FestivalBoard festivalBoard, HttpServletRequest request, Model model) {
		model.addAttribute("writeResult", festivalService.writeFestival(festivalBoard, request));
		return "forward:list.do";
	}

	@RequestMapping(value = "content", method = { RequestMethod.GET, RequestMethod.POST })
	public String detail(int festivalno, Model model) {
		model.addAttribute("contentFestival", festivalService.contentFestival(festivalno));
		return "festival/content";
	}

	@RequestMapping(value = "modifyView", method = RequestMethod.GET)
	public String modifyView(int festivalno, Model model) {
		model.addAttribute("festival", festivalService.modifiyFestivalView(festivalno));
		return "festival/modify";
	}

	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public String modify(FestivalBoard festivalBoard, Model model) {
		model.addAttribute("modifyResult", festivalService.modifiyFestival(festivalBoard));
		return "forward:list.do";
	}

	@RequestMapping(value = "delete", method = RequestMethod.GET)
	public String delete(int festivalno, Model model) {
		model.addAttribute("deleteResult", festivalService.deleteFestival(festivalno));
		return "forward:list.do";
	}
}
