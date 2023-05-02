package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.ReviewBoard;

@Mapper
public interface ReviewDao {
	public List<ReviewBoard> ReviewList(ReviewBoard reviewBoard);

	public int totCntReview();

	public int writeReview(ReviewBoard reviewBoard);

	public ReviewBoard contentReview(int reviewno);

	public int modifyReview(ReviewBoard reviewBoard);

	public int hitUpReview(int reviewno);

	public int deleteReview(int reviewno);
}
