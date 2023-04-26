package com.lec.jeju.service;

import java.util.List;

import com.lec.jeju.vo.Hreservation;

public interface HreservationService {
	// 특정 호텔 예약 목록
	public List<Hreservation> hreservationList_Hotel(String hname);
	
	// 특정 아이디 예약 목록
	public List<Hreservation> hreservationList_Member(String mid);
	
	// 예약 취소(시용자)
	public int deleteHreservation(Hreservation hreservation);
}
