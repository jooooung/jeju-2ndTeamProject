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
	// 더미등록용
	public int registerHoteldummy(Hotel hotel);

    // 호텔 수정
	public void modifyHotel(Hotel hotel, MultipartHttpServletRequest mRequest);

    // 나의 호텔 글 조회
	public List<Hotel> myHotelPosts(String bid, int startRow, int endRow);

    // 호텔 등록 승인 여부 확인
	public String hotelApprovalStatus(String hname);

    // 레스토랑 등록
	public boolean registerRestaurant(Restaurant restaurant, MultipartHttpServletRequest mRequest);

    // 레스토랑 수정
	public void modifyRestaurant(Restaurant restaurant);

    // 나의 레스토랑 글 조회
	public List<Restaurant> myRestaurantPosts(String bid, int startRow, int endRow);

    // 레스토랑 등록 승인 여부 확인
	public String restaurantApprovalStatus(String rname);

	// 특정 숙소 댓글 목록
	public List<HotelComment> hCommentList(HotelComment hotelComment, String pageNum);	
	
	// 특정 숙소 댓글수
	public int totCntHcomment(String hname, HotelComment hotelComment);
	
	// 숙소 원 댓글 달기
	public int registerHcomment(HotelComment hotelComment);
	
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
