package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.Restaurant;

@Mapper
public interface RestaurantDao {
	public List<Restaurant> ResList(Restaurant res);

	public List<Restaurant> ResSchList(Restaurant res);

	public int totCntRes(Restaurant res);

	public int insertRes(Restaurant res);

	public int modifyRes(Restaurant res);

	public int deleteRes(Restaurant res);

	public Restaurant detailRes(String rname);
}
