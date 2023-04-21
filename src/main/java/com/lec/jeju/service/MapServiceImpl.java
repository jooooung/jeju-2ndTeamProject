package com.lec.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jeju.dao.MapHotelDao;
import com.lec.jeju.dao.MapRestaurantDao;
import com.lec.jeju.dao.MapSpotDao;
import com.lec.jeju.vo.MapHotel;
import com.lec.jeju.vo.MapRestaurant;
import com.lec.jeju.vo.MapSpot;
@Service
public class MapServiceImpl implements MapService {
	@Autowired
	private MapSpotDao spotDao;
	@Autowired
	private MapRestaurantDao resDao;
	@Autowired
	private MapHotelDao hotelDao;
	
	// spot
	@Override
	public List<MapSpot> mapSpotList() {
		return spotDao.mapSpotList();
	}

	@Override
	public List<MapSpot> spotList(MapSpot spot) {
		return null;
	}

	@Override
	public List<MapSpot> spotPlaceSchList(String lname, MapSpot spot) {
		return null;
	}
	
	// restaurant
	@Override
	public List<MapRestaurant> mapRestaurantList() {
		return resDao.mapRestaurantList();
	}

	@Override
	public List<MapRestaurant> restaurantList(MapRestaurant restaurant) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MapRestaurant> resPlaceSchList(String lname, MapRestaurant restaurant) {
		// TODO Auto-generated method stub
		return null;
	}
	
	// hotel
	@Override
	public List<MapHotel> mapHotelList() {
		return hotelDao.mapHotelList();
	}

	@Override
	public List<MapHotel> hotelList(MapHotel hotel) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MapHotel> hotelPlaceSchList(String lname, MapHotel hotel) {
		// TODO Auto-generated method stub
		return null;
	}

}
