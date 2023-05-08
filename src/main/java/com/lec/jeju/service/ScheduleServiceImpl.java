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
	private ScheduleDao dao;
	
	// 일정 생성
	@Override
	public int createSchedule(Schedule schedule) {
		dao.createSchedule(schedule);
		return dao.getSchedule(schedule.getScheduleno()) != null ? 1 : 0;
	}

	// 일정 조회
	@Override
	public List<Schedule> myScheduleList(String mid) {
		return dao.myScheduleList(mid);
	}

	// 특정 일정 조회
	@Override
	public Schedule getSchedule(int scheduleno) {
		return dao.getSchedule(scheduleno);
	}

	// 일정 수정
	@Override
	public int updateSchedule(Schedule schedule) {
		dao.updateSchedule(schedule);
		return dao.getSchedule(schedule.getScheduleno()) != null ? 1 : 0;
	}

	// 일정 삭제
	@Override
	public int deleteSchedule(int scheduleno) {
		dao.deleteSchedule(scheduleno);
		return dao.getSchedule(scheduleno) == null ? 1 : 0;
	}

	// 기간별 일정 검색
	@Override
	public List<Schedule> scheduleListByPeriod(String mid, Date startdate, Date enddate) {
		return dao.scheduleListByPeriod(mid, startdate, enddate);
	}

	// 일정명으로 검색
	@Override
	public List<Schedule> searchScheduleByTitle(String mid, String scheduletitle) {
		return dao.searchScheduleByTitle(mid, scheduletitle);
	}
}
