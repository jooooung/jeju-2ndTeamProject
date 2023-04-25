package com.lec.jeju.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.lec.jeju.vo.Admin;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Restaurant;

@Service
public interface AdminService {
    public String loginCheck(String aid, String apw, HttpSession httpSession);
    
    public Admin getDetailAdmin(String aid);
    
    public List<Hotel> hotelApproval(String requeststatus); // 호텔 등록 요청 목록
    
    public void approveHotel(String hname, String approval, String requeststatus); // 호텔 승인
    
    public void rejectHotel(String hname, String approval, String requeststatus); // 호텔 거절
    
    public List<Restaurant> restaurantApproval(String requeststatus); // 식당 등록 요청 목록
    
    public void approveRestaurant(String rname, String approval, String requeststatus); // 식당 승인
    
    public void rejectRestaurant(String rname, String approval, String requeststatus); // 식당 거절
    
    public List<Hotel> approvedHotels(String requeststatus); // 호텔 승인 목록
    
    public List<Restaurant> approvedRestaurants(String requeststatus); // 식당 승인 목록
    
    public List<Hotel> rejectedHotels(String requeststatus); // 호텔 거절 목록
    
    public List<Restaurant> rejectedRestaurants(String requeststatus); // 식당 거절 목록
    
    public Hotel getHotelByName(String hname);

    public Restaurant getRestaurantByName(String rname);
	
    public void logout(HttpSession httpSession);
}
