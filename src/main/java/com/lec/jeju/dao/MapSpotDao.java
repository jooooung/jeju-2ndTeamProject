package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.MapSpot;

@Mapper
public interface MapSpotDao {
	public List<MapSpot> mapSpotList(); 
	public List<MapSpot> spotList(MapSpot spot);
	public List<MapSpot> spotPlaceSchList(MapSpot spot);
}
