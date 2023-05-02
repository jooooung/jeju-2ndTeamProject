package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.MapHotel;

@Mapper
public interface MapHotelDao {
	public List<MapHotel> mapHotelList();
	public List<MapHotel> schHotelList(String schName);
	public List<MapHotel> hotelPlaceSchList(MapHotel hotel);
}
