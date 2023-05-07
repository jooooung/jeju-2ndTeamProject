package com.lec.jeju.service;

import java.util.List;

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

	public int deleteBusiness(String bid);

	public void logout(HttpSession httpSession);

	// 호텔 등록
	public boolean registerHotel(Hotel hotel, MultipartHttpServletRequest mRequest);

    // 나의 호텔 글 조회
	public List<Hotel> myHotelPosts(String bid, int startRow, int endRow);

    // 레스토랑 등록
	public boolean registerRestaurant(Restaurant restaurant, MultipartHttpServletRequest mRequest);

    // 나의 레스토랑 글 조회
	public List<Restaurant> myRestaurantPosts(String bid, int startRow, int endRow);

	public int hotelTotalCount(String bid);
	
	public int restaurantTotalCount(String bid);

	public Hotel getHotelByName(String hname);

	public Restaurant getRestaurantByName(String rname);

}
