package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.lec.jeju.vo.Admin;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Restaurant;

@Mapper
public interface AdminDao {
	public int idConfirm(String aid);
	
	public Admin getDetailAdmin(String aid);
	
	public Admin loginCheck(Admin admin);
	
	
	public List<Hotel> hotelApproval(String requeststatus, int startRow, int endRow);

	public void approveHotel(String hname, String approval, String requeststatus, double hlatitude, double hlongitude, int startRow, int endRow); // 호텔 승인

	public List<Hotel> approvedHotels(String requeststatus, int startRow, int endRow);
	
	public void rejectHotel(@Param("hname") String hname, @Param("approval") String approval, @Param("requeststatus") String requeststatus);

    public List<Hotel> rejectedHotels(String requeststatus, int startRow, int endRow);
	
	
	public List<Restaurant> restaurantApproval(String requeststatus, int startRow, int endRow);
	
	public void approveRestaurant(String hname, String approval, String requeststatus, double hlatitude, double hlongitude, int startRow, int endRow);

    public List<Restaurant> approvedRestaurants(String requeststatus, int startRow, int endRow);
    
    public void rejectRestaurant(@Param("rname") String rname, @Param("approval") String approval, @Param("requeststatus") String requeststatus);
    
    public List<Restaurant> rejectedRestaurants(String requeststatus, int startRow, int endRow);
    
    
    public Hotel selectHotelByName(String hname);

    public Restaurant selectRestaurantByName(String rname);

	public int hotelTotalCount(String requeststatus);

	public int restaurantTotalCount(String requeststatus);
}