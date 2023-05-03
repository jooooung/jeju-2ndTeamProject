package com.lec.jeju.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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

	// 로그아웃
	public void logout(HttpSession httpSession);
	
	// Hotel 등록
	public boolean registerHotel(Hotel hotel, MultipartHttpServletRequest mRequest);
	// Hotel 더미 등록
	public int registerHoteldummy(Hotel hotel);
	
    // Hotel 수정
	public void modifyHotel(Hotel hotel, MultipartHttpServletRequest mRequest);
    
    // Hotel 나의 글 조회
	public List<Hotel> myHotelPosts(String bid, int startRow, int endRow);
    
    // Hotel 등록 승인 여부 확인
	public String hotelApprovalStatus(String hname);
    
    // Restaurant 등록
	public boolean registerRestaurant(Restaurant restaurant, MultipartHttpServletRequest mRequest);
    
    // Restaurant 수정
	public void modifyRestaurant(Restaurant restaurant);
    
    // Restaurant 나의 글 조회
	public List<Restaurant> myRestaurantPosts(String bid, int startRow, int endRow);
    
    // Restaurant 등록 승인 여부 확인
	public String restaurantApprovalStatus(String rname);
    
	// 특정 숙소 댓글 목록
	public List<HotelComment> hCommentList(HotelComment hotelComment);
	
	// 특정 숙소 댓글수
	public int totCntHcomment(HotelComment hotelComment);
	
	// 숙소 원 댓글 달기
	public int registerHcomment(HotelComment hotelComment);
	
	// 숙소 답 댓글 전 작업
	public int preReplyHcomment(HotelComment hotelComment);
	
	// 숙소 답 댓글 달기
	public int replyHotelComment(HotelComment hotelComment);
	
	// 숙소 댓글 수정
	public int modifyHotelComment(HotelComment hotelComment);
	
	// 숙소 댓글 삭제
	public int deleteHotelComment(int hcommentno);
	
	public int hotelTotalCount(String bid);
	
	public int restaurantTotalCount(String bid);
	
	// 특정 식당 댓글 목록
	/**public List<RestaurantComment> rCommentList(RestaurantComment restaurantComment);
	
	// 특정 식당 댓글수
	public int totCntRcomment(RestaurantComment restaurantComment);
	
	// 식당 원 댓글 달기
	public int registerRcomment(RestaurantComment restaurantComment);
	
	// 식당 답 댓글 전 작업
	public int preReplyRcomment(RestaurantComment restaurantComment);
	
	// 식당 답 댓글 달기
	public int replyRestaurantComment(RestaurantComment restaurantComment);
	
	// 식당 댓글 수정
	public int modifyRestaurantComment(RestaurantComment restaurantComment);
	
	// 식당 댓글 삭제
	public int deleteRestaurantComment(int restaurantComment);**/
}


