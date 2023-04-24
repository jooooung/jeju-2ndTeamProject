package com.lec.jeju.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Location;

public interface HotelService {
	// 호텔 목록
	public List<Hotel> hotelList(String pageNum, Hotel hotel);
	// 호텔 총 개수
	public int totCntHotel(Hotel hotel);
	// 호텔 상세보기
	public Hotel detailHotel(String hname);
	// 호텔 등록
	public int registerHotel(Hotel hotel, MultipartHttpServletRequest mRequest);
	// 호텔 수정
	public int modifyHotel(Hotel hotel, MultipartHttpServletRequest mRequest);
	// 호텔 삭제
	public int deleteHotel(String hname);
}
