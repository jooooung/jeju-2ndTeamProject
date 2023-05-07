package com.lec.jeju.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.Schedule;

@Mapper
public interface ScheduleDao {
	// 일정 생성
	public void createSchedule(Schedule schedule);
	  
	// 일정 조회
	public List<Schedule> myScheduleList(String mid);
	  
	// 특정 일정 조회
	public Schedule getSchedule(int scheduleno);
	  
	// 일정 수정
	public void updateSchedule(Schedule schedule);
	  
	// 일정 삭제
	public void deleteSchedule(int scheduleno);
	  
	// 기간별 일정 검색
	public List<Schedule> scheduleListByPeriod(String mid, Date startdate, Date enddate);
	  
	// 일정명으로 검색
	public List<Schedule> searchScheduleByTitle(String mid, String scheduletitle);

}
