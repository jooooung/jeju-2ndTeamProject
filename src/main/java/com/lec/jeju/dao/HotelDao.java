package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Location;

@Mapper
public interface HotelDao {
	// 호텔 목록
	public List<Hotel> hotelList(Hotel hotel);
	// 호텔 총 개수
	public int totCntHotel(Hotel hotel);
	// 호텔 상세보기
	public Hotel detailHotel(String hname);
	// 호텔 등록
	public int registerHotel(Hotel hotel);
	// 호텔 수정
	public int modifyHotel(Hotel hotel);
	// 호텔 삭제
	public int deleteHotel(String hname);
	
}
