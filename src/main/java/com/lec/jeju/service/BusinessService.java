package com.lec.jeju.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.jeju.vo.Business;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.HotelComment;
import com.lec.jeju.vo.Restaurant;

@Service
public interface BusinessService {
	public int idConfirm(String bid);

	public int emailConfirm(String bemail);

	public int joinBusiness(Business business, HttpSession httpSession, MultipartHttpServletRequest mRequest);

	public String loginCheck(String bid, String bpw, HttpSession httpSession);

	public Business getDetailBusiness(String bid);

	public int modifyBusiness (Business business, HttpSession httpSession, MultipartHttpServletRequest mRequest);

	public int deleteBusiness( String bid);

	public void logout(HttpSession httpSession);

	// 호텔 등록
	public void registerHotel(Hotel hotel, HttpServletRequest request);

    // 호텔 수정
	public void modifyHotel(Hotel hotel);

    // 나의 호텔 글 조회
	public List<Hotel> myHotelPosts(String bid);

    // 호텔 등록 승인 여부 확인
	public String hotelApprovalStatus(String hname);

    // 레스토랑 등록
	public void registerRestaurant(Restaurant restaurant);

    // 레스토랑 수정
	public void modifyRestaurant(Restaurant restaurant);

    // 나의 레스토랑 글 조회
	public List<Restaurant> myRestaurantPosts(String bid);

    // 레스토랑 등록 승인 여부 확인
	public String restaurantApprovalStatus(String rname);

    // 호텔 댓글 조회
	public List<HotelComment> myHotelComments(String bid);


    // 레스토랑 댓글 조회
    //public List<RestaurantComment> myRestaurantComments(String bid);

}
