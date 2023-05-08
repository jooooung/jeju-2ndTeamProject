package com.lec.jeju.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.lec.jeju.vo.Admin;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Restaurant;

@Mapper
public interface AdminDao {
	
	public Admin getDetailAdmin(String aid);
	
	public Admin loginCheck(Admin admin);
	
	public void logout(HttpSession httpSession);
	
	
	public List<Hotel> hotelApproval(String requeststatus, int startRow, int endRow);

	public void approveHotel(@Param("hname") String hname, @Param("approval") String approval, @Param("requeststatus") String requeststatus,@Param("hlatitude") double hlatitude,@Param("hlongitude") double hlongitude); // 호텔 승인

	public List<Hotel> approvedHotels(String requeststatus, int startRow, int endRow);
	
	public void rejectHotel(@Param("hname") String hname, @Param("approval") String approval, @Param("requeststatus") String requeststatus);

    public List<Hotel> rejectedHotels(String requeststatus, int startRow, int endRow);
	
	
	public List<Restaurant> restaurantApproval(String requeststatus, int startRow, int endRow);
	
	public void approveRestaurant(@Param("rname") String rname, @Param("approval") String approval, @Param("requeststatus") String requeststatus, @Param("rlatitude") double rlatitude,@Param("rlongitude") double rlongitude);

    public List<Restaurant> approvedRestaurants(String requeststatus, int startRow, int endRow);
    
    public void rejectRestaurant(@Param("rname") String rname, @Param("approval") String approval, @Param("requeststatus") String requeststatus);
    
    public List<Restaurant> rejectedRestaurants(String requeststatus, int startRow, int endRow);
    
    
    public Hotel selectHotelByName(String hname);

    public Restaurant selectRestaurantByName(String rname);

	public int hotelTotalCount(String requeststatus);

	public int restaurantTotalCount(String requeststatus);
	
}