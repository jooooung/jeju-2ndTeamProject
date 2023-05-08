package com.lec.jeju.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jeju.dao.ScheduleDao;
import com.lec.jeju.vo.Schedule;

@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	private ScheduleDao scheduledao;
	
	// 일정 생성
	@Override
	public String createSchedule(Schedule schedule) {
		scheduledao.createSchedule(schedule);
		return scheduledao.scheduleDetail(schedule.getScheduleno()) != null ? "1" : "0";
	}

	// 일정 조회
	@Override
	public List<Schedule> myScheduleList(String mid) {
		return scheduledao.myScheduleList(mid);
	}

	// 특정 일정 조회
	@Override
	public Schedule scheduleDetail(int scheduleno) {
		return scheduledao.scheduleDetail(scheduleno);
	}

	// 일정 수정
	@Override
	public String updateSchedule(Schedule schedule) {
		scheduledao.updateSchedule(schedule);
		return scheduledao.scheduleDetail(schedule.getScheduleno()) != null ? "1" : "0";
	}

	// 일정 삭제
	@Override
	public int deleteSchedule(int scheduleno) {
		scheduledao.deleteSchedule(scheduleno);
		return scheduledao.scheduleDetail(scheduleno) == null ? 1 : 0;
	}

	// 기간별 일정 검색
	@Override
	public List<Schedule> scheduleListByPeriod(String mid, Date startdate, Date enddate) {
		return scheduledao.scheduleListByPeriod(mid, startdate, enddate);
	}

	// 일정명으로 검색
	@Override
	public List<Schedule> searchScheduleByTitle(String mid, String scheduletitle) {
		return scheduledao.searchScheduleByTitle(mid, scheduletitle);
	}
}
