package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.MapRestaurant;

@Mapper
public interface MapRestaurantDao {
	public List<MapRestaurant> mapRestaurantList(); 
	public List<MapRestaurant> restaurantList(MapRestaurant restaurant);
	public List<MapRestaurant> resPlaceSchList(MapRestaurant restaurant);
}
