package com.lec.jeju.controller;

import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.lec.jeju.service.ScheduleService;
import com.lec.jeju.vo.Member;
import com.lec.jeju.vo.Schedule;

@Controller
@RequestMapping("schedule")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@RequestMapping(value = "/createSchedule", method = RequestMethod.GET)
	public String createSchedule() {
		return "schedule/createSchedule"; // 일정 등록 화면으로 이동
	}

	@RequestMapping(value = "/createSchedule", method = RequestMethod.POST)
	public String createSchedule(Schedule schedule, HttpSession session) {
	    Member sessionMember = (Member) session.getAttribute("member");
	    String mid = sessionMember.getMid();
	    schedule.setMid(mid);
	    scheduleService.createSchedule(schedule);
	    return "redirect:/schedule/myScheduleList.do";
	}

	@RequestMapping(value = "/myScheduleList", method = RequestMethod.GET)
	public String myScheduleList(Model model, HttpSession session) {
	    Member sessionMember = (Member) session.getAttribute("member");
	    List<Schedule> myScheduleList = scheduleService.myScheduleList(sessionMember.getMid());
	    model.addAttribute("member", sessionMember);
	    model.addAttribute("scheduleList", myScheduleList);
	    return "schedule/myScheduleList";
	}

	@RequestMapping(value = "/scheduleDetail", method = RequestMethod.GET)
	public String scheduleDetail(@RequestParam int scheduleno, Model model) {
		Schedule schedule = scheduleService.scheduleDetail(scheduleno); // 특정 일정 조회
		model.addAttribute("schedule", schedule);
		return "schedule/scheduleDetail"; // 일정 상세 화면으로 이동
	}

	@RequestMapping(value = "/updateSchedule", method = RequestMethod.GET)
	public String updateSchedule(@RequestParam int scheduleno, Model model) {
		Schedule schedule = scheduleService.scheduleDetail(scheduleno); // 특정 일정 조회
		model.addAttribute("schedule", schedule);
		return "schedule/updateSchedule"; // 일정 수정 화면으로 이동
	}

	@RequestMapping(value = "/updateSchedule", method = RequestMethod.POST)
	public String updateSchedule(Schedule schedule) {
	    scheduleService.updateSchedule(schedule); // 일정 수정
	    return "redirect:/schedule/myScheduleList.do"; // 일정 목록으로 이동
	}

	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String deleteSchedule(@RequestParam int scheduleno) {
		scheduleService.deleteSchedule(scheduleno); // 일정 삭제
		return "redirect:/schedule/myScheduleList.do"; // 일정 목록으로 이동
	}

	/*
	 * @RequestMapping(value = "/searchSchedule", method = RequestMethod.GET) public
	 * String searchSchedule() { return "schedule/searchSchedule"; // 일정 검색 화면으로 이동
	 * }
	 * 
	 * @RequestMapping(value = "/searchSchedule", method = RequestMethod.POST)
	 * public String searchSchedule(@RequestParam String searchType, @RequestParam
	 * String keyword, Model model) { String mid = "mid"; // 현재 로그인한 회원의 아이디
	 * List<Schedule> myScheduleList;
	 * 
	 * if (searchType.equals("period")) { // 기간별 검색 String dates[] =
	 * keyword.split("~"); // 시작일과 종료일을 구분 Date startDate =
	 * Date.valueOf(dates[0].trim()); Date endDate = Date.valueOf(dates[1].trim());
	 * myScheduleList = scheduleService.scheduleListByPeriod(mid, startDate,
	 * endDate); } else { // 일정명 검색 myScheduleList =
	 * scheduleService.searchScheduleByTitle(mid, keyword); }
	 * model.addAttribute("scheduleList", myScheduleList);
	 * model.addAttribute("searchType", searchType); model.addAttribute("keyword",
	 * keyword); return "schedule/myScheduleList"; }
	 */
}
