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
	
	public List<Hotel> getHotelApprovalList();

	public void updateHotelApproval(String hname, String approval);

	public List<Restaurant> getRestaurantApprovalList();

	public void updateRestaurantApproval(String rname, String approval);

	public List<Hotel> getApprovedHotels();

	public List<Restaurant> getApprovedRestaurants();

	public List<Hotel> getRejectedHotels();

	public List<Restaurant> getRejectedRestaurants();
}
