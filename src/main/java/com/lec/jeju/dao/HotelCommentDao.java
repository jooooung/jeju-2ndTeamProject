package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.HotelComment;

@Mapper
public interface HotelCommentDao {
	// 특정 숙소 댓글 목록
	public List<HotelComment> hCommentList(HotelComment hotelComment);
	
	// 특정 숙소 댓글수
	public int totCntHcomment(HotelComment hotelComment);
	
	// 원 댓글 달기
	public int registerHcomment(HotelComment hotelComment);
	
	// 답 댓글 전 작업
	public int preReplyHcomment(HotelComment hotelComment);
	
	// 답 댓글 달기
	public int replyHotelComment(HotelComment hotelComment);
	
	// 댓글 수정
	public int modifyHotelComment(HotelComment hotelComment);
	
	// 댓글 삭제
	public int deleteHotelComment(int hcommentno);
}
