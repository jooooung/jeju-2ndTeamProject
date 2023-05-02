package com.lec.jeju.service;

import java.util.List;

import com.lec.jeju.vo.MapHotel;
import com.lec.jeju.vo.MapRestaurant;
import com.lec.jeju.vo.MapSpot;

public interface MapService {
	public List<MapSpot> mapSpotList();
	public List<MapSpot> schSpotList(String schName);
	
	public List<MapRestaurant> mapRestaurantList();
	public List<MapRestaurant> schRestaurantList(String schName);
	
	public List<MapHotel> mapHotelList();
	public List<MapHotel> schHotelList(String schName);
}
