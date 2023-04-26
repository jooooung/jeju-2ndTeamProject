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

	public int deleteBusiness( String bid);

	public void logout(HttpSession httpSession);

	// 호텔 등록
	public void insertHotel(Hotel hotel);

    // 호텔 수정
	public void updateHotel(Hotel hotel);

    // 나의 호텔 글 조회
	public List<Hotel> selectMyHotelPosts(String bid);

    // 호텔 등록 승인 여부 확인
	public String selectHotelApprovalStatus(String hname);

    // 레스토랑 등록
	public void insertRestaurant(Restaurant restaurant);

    // 레스토랑 수정
	public void updateRestaurant(Restaurant restaurant);

    // 나의 레스토랑 글 조회
	public List<Restaurant> selectMyRestaurantPosts(String bid);

    // 레스토랑 등록 승인 여부 확인
	public String selectRestaurantApprovalStatus(String rname);

    // 호텔 댓글 조회
	public List<HotelComment> selectMyHotelComments(String bid);

    /*
     * // 레스토랑 댓글 조회
     * public List<RestaurantComment> selectMyRestaurantComments(String bid);
     */

}
