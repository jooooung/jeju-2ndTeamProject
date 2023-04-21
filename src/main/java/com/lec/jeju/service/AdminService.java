package com.lec.jeju.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Restaurant;

@Service
public interface AdminService {	
	public boolean login(String apd, String apw);

	public List<Hotel> getHotelApprovalList();

	public void updateHotelApproval(String hname, String approval);

	public List<Restaurant> getRestaurantApprovalList();

	public void updateRestaurantApproval(String rname, String approval);

	public List<Hotel> getApprovedHotels();

	public List<Restaurant> getApprovedRestaurants();

	public List<Hotel> getRejectedHotels();

	public List<Restaurant> getRejectedRestaurants();
}
