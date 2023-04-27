package com.lec.jeju.dao;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.Business;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.HotelComment;
//import com.lec.jeju.vo.RestaurantComment;
import com.lec.jeju.vo.Restaurant;

@Mapper
public interface BusinessDao {
	// id 확인
	public int idConfirm(String bid);

	// email 확인
	public int emailConfirm(String bemail);

	// 업체 회원 가입
	public int joinBusiness(Business business);
	
	// 로그인 체크
	public Business loginCheck(Business business);
	
	// 상세보기
	public Business getDetailBusiness(String bid);
	
	// 정보수정
	public int modifyBusiness(Business business);
	
	// 업체 탈퇴
	public int deleteBusiness(String bid);
	
	// Hotel 등록
	public void registerHotel(Hotel hotel, HttpServletRequest request);
    
    // Hotel 수정
	public void modifyHotel(Hotel hotel);
    
    // Hotel 나의 글 조회
	public List<Hotel> myHotelPosts(String bid);
    
    // Hotel 등록 승인 여부 확인
	public String hotelApprovalStatus(String hname);
    
    // Restaurant 등록
	public void registerRestaurant(Restaurant restaurant);
    
    // Restaurant 수정
	public void modifyRestaurant(Restaurant restaurant);
    
    // Restaurant 나의 글 조회
	public List<Restaurant> myRestaurantPosts(String bid);
    
    // Restaurant 등록 승인 여부 확인
	public String restaurantApprovalStatus(String rname);
    
    // Hotel 댓글 조회
	public List<HotelComment> myHotelComments(String bid);
    
	 // Restaurant 댓글 조회
	//public List<RestaurantComment> myRestaurantComments(String bid);

	// 로그아웃
	public void logout(HttpSession httpSession);


}


