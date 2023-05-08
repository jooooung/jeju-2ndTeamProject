package com.lec.jeju.dao;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.lec.jeju.vo.Schedule;

@Mapper
public interface ScheduleDao {
	// 일정 생성
	public void createSchedule(Schedule schedule);
	  
	// 일정 조회
	public List<Schedule> myScheduleList(@Param("mid") String mid);
	  
	// 특정 일정 조회
	public Schedule scheduleDetail(@Param("scheduleno") int scheduleno);
	  
	// 일정 수정
	public void updateSchedule(Schedule schedule);
	  
	// 일정 삭제
	public void deleteSchedule(@Param("scheduleno") int scheduleno);
	  
	// 기간별 일정 검색
	public List<Schedule> scheduleListByPeriod(@Param("mid") String mid, @Param("startdate") Date startdate, @Param("enddate") Date enddate);
	  
	// 일정명으로 검색
	public List<Schedule> searchScheduleByTitle(@Param("mid") String mid, @Param("scheduletitle") String scheduletitle);


}