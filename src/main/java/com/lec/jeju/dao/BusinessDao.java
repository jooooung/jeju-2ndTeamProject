package com.lec.jeju.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.jeju.vo.Business;
import com.lec.jeju.vo.Hotel;
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

	// 로그아웃
	public void logout(HttpSession httpSession);
	
	// Hotel 등록
	public boolean registerHotel(Hotel hotel, MultipartHttpServletRequest mRequest);
    
    // Hotel 나의 글 조회
	public List<Hotel> myHotelPosts(String bid, int startRow, int endRow);
	
    // Restaurant 등록
	public boolean registerRestaurant(Restaurant restaurant, MultipartHttpServletRequest mRequest);
    
    // Restaurant 나의 글 조회
	public List<Restaurant> myRestaurantPosts(String bid, int startRow, int endRow);
    
	public int hotelTotalCount(String bid);
	
	public int restaurantTotalCount(String bid);
	
    public Hotel selectHotelByName(String hname);

    public Restaurant selectRestaurantByName(String rname);
    
}


