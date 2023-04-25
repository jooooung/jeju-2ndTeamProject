package com.lec.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jeju.dao.HotelCommentDao;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.HotelComment;
@Service
public class HotelCommentServiceImpl implements HotelCommentService {
	@Autowired
	private HotelCommentDao hCommentDao;
	
	@Override
	public List<HotelComment> hCommentList(HotelComment hotelComment, String pageNum) {
		Paging paging = new Paging(hCommentDao.totCntHcomment(hotelComment), pageNum, 5, 5);
		hotelComment.setStartrow(paging.getStartRow());
		hotelComment.setEndrow(paging.getEndRow());
		return hCommentDao.hCommentList(hotelComment);
	}// 숙소 댓글 목록

	@Override
	public int totCntHcomment(HotelComment hotelComment) {
		return hCommentDao.totCntHcomment(hotelComment);
	}// 숙소 댓글 개수

	@Override
	public int registerHcomment(HotelComment hotelComment) {
		return hCommentDao.registerHcomment(hotelComment);
	}// 숙소 댓글 쓰기

	@Override
	public int replyHotelComment(HotelComment hotelComment) {
		hCommentDao.preReplyHcomment(hotelComment);
		return hCommentDao.replyHotelComment(hotelComment);
	}// 답 댓글 쓰기

	@Override
	public int modifyHotelComment(HotelComment hotelComment) {
		return hCommentDao.modifyHotelComment(hotelComment);
	}// 댓글 수정

	@Override
	public int deleteHotelComment(int hcommentno) {
		return hCommentDao.deleteHotelComment(hcommentno);
	}// 댓글 삭제

}
