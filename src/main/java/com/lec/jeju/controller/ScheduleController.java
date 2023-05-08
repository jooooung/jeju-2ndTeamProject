package com.lec.jeju.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.lec.jeju.service.ScheduleService;
import com.lec.jeju.vo.Schedule;

@Controller
@RequestMapping("schedule")
public class ScheduleController {
	
	@Autowired
	private ScheduleService scheduleService;
	
	@GetMapping("/createSchedule")
	public String createSchedule() {
		return "schedule/createSchedule"; // 일정 등록 화면으로 이동
	}
	
	@PostMapping("/createSchedule")
	public String createSchedule(Schedule schedule) {
	    scheduleService.createSchedule(schedule); // 일정 등록
	    return "redirect:/schedule/myScheduleList"; // 일정 목록으로 이동
	}
	
	@GetMapping("/myScheduleList")
	public String myScheduleList(Model model) {
		String mid = "mid"; // 현재 로그인한 회원의 아이디
		List<Schedule> myScheduleList = scheduleService.myScheduleList(mid); // 회원별 일정 목록 조회
		model.addAttribute("myScheduleList", myScheduleList);
		return "schedule/myScheduleList"; // 일정 목록 화면으로 이동
	}
	
	@GetMapping("/scheduleDetail")
	public String scheduleDetail(@RequestParam int scheduleno, Model model) {
		Schedule schedule = scheduleService.getSchedule(scheduleno); // 특정 일정 조회
		model.addAttribute("schedule", schedule);
		return "schedule/scheduleDetail"; // 일정 상세 화면으로 이동
	}
	
	@GetMapping("/updateSchedule")
	public String updateSchedule(@RequestParam int scheduleno, Model model) {
		Schedule schedule = scheduleService.getSchedule(scheduleno); // 특정 일정 조회
		model.addAttribute("schedule", schedule);
		return "schedule/updateSchedule"; // 일정 수정 화면으로 이동
	}
	
	@PostMapping("/updateSchedule")
	public String updateSchedule(Schedule schedule) {
		scheduleService.updateSchedule(schedule); // 일정 수정
		return "redirect:/myScheduleList"; // 일정 목록으로 이동
	}
	
	@GetMapping("/delete")
	public String deleteSchedule(@RequestParam int scheduleno) {
		scheduleService.deleteSchedule(scheduleno); // 일정 삭제
		return "redirect:/myScheduleList"; // 일정 목록으로 이동
	}
	
	@GetMapping("/searchSchedule")
	public String searchSchedule() {
	    return "schedule/searchSchedule"; // 일정 검색 화면으로 이동
	}

	@PostMapping("/searchSchedule")
	public String searchSchedule(@RequestParam String searchType, @RequestParam String keyword, Model model) {
	    String mid = "mid"; // 현재 로그인한 회원의 아이디
	    List<Schedule> myScheduleList;
	    
	    if (searchType.equals("period")) { // 기간별 검색
	        String[] dates = keyword.split("~"); // 시작일과 종료일을 구분
	        Date startDate = Date.valueOf(dates[0].trim());
	        Date endDate = Date.valueOf(dates[1].trim());
	        myScheduleList = scheduleService.scheduleListByPeriod(mid, startDate, endDate);
	    } else { // 일정명 검색
	        myScheduleList = scheduleService.searchScheduleByTitle(mid, keyword);
	    }
	    model.addAttribute("scheduleList", myScheduleList);
	    model.addAttribute("searchType", searchType);
	    model.addAttribute("keyword", keyword);
	    
	    return "schedule/myScheduleList";
	}
}
