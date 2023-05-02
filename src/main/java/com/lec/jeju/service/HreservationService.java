package com.lec.jeju.service;

import java.util.List;

import com.lec.jeju.vo.Hreservation;

public interface HreservationService {
	// 예약하기
	public int doHreservation(Hreservation hreservation);
	
	// 예약 가능 날짜 조회(결과가 있다면 예약 불가)
	public List<Hreservation> checkReserv(Hreservation hreservation);
	
	// 특정 호텔 예약 목록
	public List<Hreservation> hreservationList_Hotel(String hname);
	
	// 특정 아이디 예약 목록
	public List<Hreservation> hreservationList_Member(String mid);
	
	// 예약 취소(시용자)
	public int deleteHreservation(Hreservation hreservation);
}
