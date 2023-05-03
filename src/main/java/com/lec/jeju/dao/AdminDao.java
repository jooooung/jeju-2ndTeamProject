package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.lec.jeju.vo.Admin;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Member;
import com.lec.jeju.vo.Restaurant;

@Mapper
public interface AdminDao {
	public int idConfirm(String aid);
	
	public Admin getDetailAdmin(String aid);
	
	public Admin loginCheck(Admin admin);
	
	public List<Hotel> hotelApproval(String requeststatus);

	public List<Restaurant> restaurantApproval(String requeststatus);
	
	public void approveHotel(@Param("hname") String hname, @Param("approval") String approval, @Param("requeststatus") String requeststatus, @Param("hlatitude") double hlatitude, @Param("hlongitude") double hlongitude);

	public void approveRestaurant(@Param("rname") String rname, @Param("approval") String approval, @Param("requeststatus") String requeststatus, @Param("rlatitude") double rlatitude, @Param("rlongitude") double rlongitude);

	public void rejectHotel(@Param("hname") String hname, @Param("approval") String approval, @Param("requeststatus") String requeststatus);

	public void rejectRestaurant(@Param("rname") String rname, @Param("approval") String approval, @Param("requeststatus") String requeststatus);
	
	public List<Hotel> approvedHotels(String requeststatus);
	
    public List<Restaurant> approvedRestaurants(String requeststatus);
    
    public List<Hotel> rejectedHotels(String requeststatus);
    
    public List<Restaurant> rejectedRestaurants(String requeststatus);
    
    public Hotel selectHotelByName(String hname);

    public Restaurant selectRestaurantByName(String rname);
}