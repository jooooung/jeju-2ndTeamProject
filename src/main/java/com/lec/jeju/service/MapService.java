package com.lec.jeju.service;

import java.util.List;

import com.lec.jeju.vo.MapHotel;
import com.lec.jeju.vo.MapRestaurant;
import com.lec.jeju.vo.MapSpot;

public interface MapService {
	public List<MapSpot> mapSpotList();
	public List<MapSpot> spotList(MapSpot spot);
	public List<MapSpot> spotPlaceSchList(String lname, MapSpot spot);
	
	public List<MapRestaurant> mapRestaurantList();
	public List<MapRestaurant> restaurantList(MapRestaurant restaurant);
	public List<MapRestaurant> resPlaceSchList(String lname, MapRestaurant restaurant);
	
	public List<MapHotel> mapHotelList();
	public List<MapHotel> hotelList(MapHotel hotel);
	public List<MapHotel> hotelPlaceSchList(String lname, MapHotel hotel);
	
}
