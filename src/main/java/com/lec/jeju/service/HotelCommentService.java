package com.lec.jeju.service;

import java.util.List;

import com.lec.jeju.vo.HotelComment;

public interface HotelCommentService {
	// 특정 숙소 댓글 목록
	public List<HotelComment> hCommentList(HotelComment hotelComment, String pageNum);	
	
	// 특정 숙소 댓글수
	public int totCntHcomment(String hname, HotelComment hotelComment);
	
	// 원 댓글 달기
	public int registerHcomment(HotelComment hotelComment);
	
	// 답 댓글 달기
	public int replyHotelComment(HotelComment hotelComment);
	
	// 댓글 수정
	public int modifyHotelComment(HotelComment hotelComment);
	
	// 댓글 삭제
	public int deleteHotelComment(int hcommentno);	
}
