package com.lec.jeju.dao;

import java.util.List;

import com.lec.jeju.vo.Business;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.HotelComment;
import com.lec.jeju.vo.Restaurant;

public interface BusinessDao {
	public int insertBusiness(Business business);
	public int modifyBusiness(Business business);
	public int deleteBusiness(String bid);
	public List<Hotel> selectMyHotelPosts(String bid);
	public List<Restaurant> selectMyRestaurantPosts(String bid);
	public List<HotelComment> selectMyHotelComments(String bid);

	/* public List<RestaurantComment> selectMyRestaurantComments(String bid); */
	public String selectHotelApprovalStatus(String name);
	public String selectRestaurantApprovalStatus(String name);
}
