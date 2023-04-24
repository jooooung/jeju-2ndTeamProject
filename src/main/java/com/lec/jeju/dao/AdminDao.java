package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.lec.jeju.vo.Admin;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Restaurant;

@Repository
@Mapper
public interface AdminDao {
	public boolean login(@Param("aId") String aId, @Param("aPw") String aPw);

	public List<Hotel> selectHotelApprovalList();

	public void updateHotelApproval(@Param("hName") String hName, @Param("approval") String approval);

	public List<Restaurant> selectRestaurantApprovalList();

	public void updateRestaurantApproval(@Param("rName") String rName, @Param("approval") String approval);

	public List<Hotel> selectApprovedHotels();

	public List<Restaurant> selectApprovedRestaurants();

	public List<Hotel> selectRejectedHotels();

	public List<Restaurant> selectRejectedRestaurants();

}