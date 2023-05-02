package com.lec.jeju.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jeju.dao.ReviewDao;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.ReviewBoard;
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public List<ReviewBoard> ReviewList(String pageNum) {
		Paging paging = new Paging(reviewDao.totCntReview(), pageNum, 5, 5);
		ReviewBoard reviewBoard = new ReviewBoard();
		reviewBoard.setStartRow(paging.getStartRow());
		reviewBoard.setEndRow(paging.getEndRow());
		return reviewDao.ReviewList(reviewBoard);
	}

	@Override
	public int totCntReview() {
		return reviewDao.totCntReview();
	}

	@Override
	public int writeReview(ReviewBoard reviewBoard, HttpServletRequest request) {
		return reviewDao.writeReview(reviewBoard);
	}

	@Override
	public ReviewBoard contentReview(int reviewno) {
		reviewDao.hitUpReview(reviewno);
		return reviewDao.contentReview(reviewno);
	}

	@Override
	public int modifiyReview(ReviewBoard reviewBoard) {
		return reviewDao.modifyReview(reviewBoard);
	}

	@Override
	public ReviewBoard modifiyReviewView(int reviewno) {
		return reviewDao.contentReview(reviewno);
	}

	@Override
	public int deleteReview(int reviewno) {
		return reviewDao.deleteReview(reviewno);
	}
}
