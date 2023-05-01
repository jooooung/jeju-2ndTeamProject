package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.MyReview;

@Mapper
public interface MyReviewDao {

	// 작성한 리뷰게시판 글 조회
	public List<MyReview> ReadReview(String mid);

	// 작성한 관광지 댓글 조회
	public List<MyReview> ReadSpotcomment(String mid);

	// 작성한 식당 댓글 조회
	public List<MyReview> ReadRescomment(String mid);

	// 작성한 호텔 댓글 조회
	public List<MyReview> ReadHotelcomment(String mid);

}
