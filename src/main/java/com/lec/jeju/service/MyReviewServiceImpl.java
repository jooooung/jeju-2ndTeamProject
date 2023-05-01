package com.lec.jeju.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jeju.dao.MyReviewDao;
import com.lec.jeju.vo.Member;
import com.lec.jeju.vo.MyReview;

@Service
public class MyReviewServiceImpl implements MyReviewService {
	@Autowired
	private MyReviewDao reviewDao;

	@Override
	public List<MyReview> ReadReview(String mid) {
		System.out.println("서비스");
		return reviewDao.ReadReview(mid);
	}

	@Override
	public List<MyReview> ReadSpotcomment(String mid) {
		System.out.println("서비스 관광지");
		return reviewDao.ReadSpotcomment(mid);
	}

	@Override
	public List<MyReview> ReadRescomment(String mid) {
		System.out.println("서비스 식당");
		return reviewDao.ReadRescomment(mid);
	}

	@Override
	public List<MyReview> ReadHotelcomment(String mid) {
		System.out.println("서비스 호텔");
		return reviewDao.ReadHotelcomment(mid);
	}

}