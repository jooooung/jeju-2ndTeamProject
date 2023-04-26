package com.lec.jeju.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.Business;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.HotelComment;
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
	public void insertHotel(Hotel hotel);
    
    // Hotel 수정
	public void updateHotel(Hotel hotel);
    
    // Hotel 삭제
	public void deleteHotel(String hname);
    
    // Hotel 나의 글 조회
	public List<Hotel> selectMyHotelPosts(String bid);
    
    // Hotel 등록 승인 여부 확인
	public String selectHotelApprovalStatus(String hname);
    
    // Restaurant 등록
	public void insertRestaurant(Restaurant restaurant);
    
    // Restaurant 수정
	public void updateRestaurant(Restaurant restaurant);
    
    // Restaurant 삭제
	public void deleteRestaurant(String rname);
    
    // Restaurant 나의 글 조회
	public List<Restaurant> selectMyRestaurantPosts(String bid);
    
    // Restaurant 등록 승인 여부 확인
	public String selectRestaurantApprovalStatus(String rname);
    
    // Hotel 댓글 조회
	public List<HotelComment> selectMyHotelComments(String bid);

    
	/*
	 * // Restaurant 댓글 조회 List<RestaurantComment> selectMyRestaurantComments(String
	 * bid);
	 */
    // 로그아웃
	public void logout(HttpSession httpSession);
//	public List<RestaurantComment> selectMyRestaurantComments(String bid);
}


