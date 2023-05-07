package com.lec.jeju.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jeju.dao.BookMarkDao;
import com.lec.jeju.dao.MemberDao;
import com.lec.jeju.vo.BookMark;
import com.lec.jeju.vo.Member;

@Service
public class BookMarkServiceImpl implements BookMarkService {
	@Autowired
	private BookMarkDao bookMarkDao;

	@Override
	public List<BookMark> getBookmarkHotelList(String mid, HttpSession session) {
		Member sessionMember = (Member) session.getAttribute("member");
		return bookMarkDao.bookmarkHotel(mid);
	}

	@Override
	public List<BookMark> getBookmarkResList(String mid, HttpSession session) {
		Member sessionMember = (Member) session.getAttribute("member");
		return bookMarkDao.bookmarkRes(mid);
	}

	@Override
	public List<BookMark> getBookmarkSpotList(String mid, HttpSession session) {
		Member sessionMember = (Member) session.getAttribute("member");
		return bookMarkDao.bookmarkSpot(mid);
	}

	@Override
	public int addHotelBookmark(BookMark bookmark) {
		return bookMarkDao.addHotel(bookmark);
	}

	@Override
	public int addResBookmark(BookMark bookmark) {
		return bookMarkDao.addRes(bookmark);
	}

	@Override
	public int addSpotBookmark(BookMark bookmark) {
		return bookMarkDao.addSpot(bookmark);
	}

	@Override
	public int deleteHotelBookmark(BookMark bookmark) {
		return bookMarkDao.deleteHotelMark(bookmark);
	}

	@Override
	public int deleteResBookmark(BookMark bookmark) {
		return bookMarkDao.deleteResMark(bookmark);
	}

	@Override
	public int deleteSpotBookmark(BookMark bookmark) {
		return bookMarkDao.deleteSpotMark(bookmark);
	}

	@Override
	public Integer getHotelCount(String mid) {
		return bookMarkDao.HotelCount(mid);
	}

	@Override
	public Integer getSpotCount(String mid) {
		return bookMarkDao.SpotCount(mid);
	}

	@Override
	public Integer getResCount(String mid) {
		return bookMarkDao.ResCount(mid);
	}
	
	@Override
	public int checkBookmarkHotel(BookMark bookmark) {
		return bookMarkDao.checkBookmarkHotel(bookmark);
	}
	
	@Override
	public int cntBmarkHotel(String hname) {
		return bookMarkDao.cntBmarkHotel(hname);
	}

	
}
