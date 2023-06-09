package com.lec.jeju.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.lec.jeju.vo.BookMark;

public interface BookMarkService {
	List<BookMark> getBookmarkHotelList(String mid, HttpSession session);

	List<BookMark> getBookmarkResList(String mid, HttpSession session);

	List<BookMark> getBookmarkSpotList(String mid, HttpSession session);

	int addHotelBookmark(BookMark bookmark);

	int addResBookmark(BookMark bookmark);

	int addSpotBookmark(BookMark bookmark);

	int deleteHotelBookmark(BookMark bookmark);

	int deleteResBookmark(BookMark bookmark);

	int deleteSpotBookmark(BookMark bookmark);

	Integer getSpotCount(String mid);

	Integer getHotelCount(String mid);

	Integer getResCount(String mid);
	
	int checkBookmarkHotel(BookMark bookmark);
	
	int cntBmarkHotel(String hname);
}
