package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.BookMark;

@Mapper
public interface BookMarkDao {

	// 북마크한 리스트중 호텔만 출력
	List<BookMark> bookmarkHotel(String mid);
	
	// 북마크한 리스트중 식당만 출력
	List<BookMark> bookmarkRes(String mid);

	// 북마크한 리스트중 관광지만 출력
	List<BookMark> bookmarkSpot(String mid);

	// 호텔 북마크 추가
	int addHotel(BookMark bookmark);

	// 식당 북마크 추가

	int addRes(BookMark bookmark);

	// 관광지 북마크 추가

	int addSpot(BookMark bookmark);

	// 호텔 북마크 삭제

	int deleteHotelMark(String mid, String hname);

	// 식당 북마크 삭제

	int deleteResMark(String mid, String rname);

	// 관광지 북마크 삭제

	int deleteSpotMark(String mid, String sname);
	
	// 북마크 관광지 갯수
	Integer SpotCount(String mid);
	
	// 북마크 호텔 갯수
	Integer HotelCount(String mid);
		
	// 북마크 식당갯수
	Integer ResCount(String mid);

}
