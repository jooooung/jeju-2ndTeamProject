package com.lec.jeju.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.lec.jeju.vo.ReviewBoard;

public interface ReviewService {
	public List<ReviewBoard> ReviewList(String pageNum);

	public int totCntReview();

	public int writeReview(ReviewBoard reviewBoard, HttpServletRequest request);

	public ReviewBoard contentReview(int reviewno);

	public int modifiyReview(ReviewBoard reviewBoard);

	public ReviewBoard modifiyReviewView(int reviewno);

	public int deleteReview(int reviewno);
}
