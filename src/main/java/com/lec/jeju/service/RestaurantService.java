package com.lec.jeju.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.jeju.vo.Restaurant;

public interface RestaurantService {
	public List<Restaurant> ResList(String pageNum, Restaurant res, String mid);

	public List<Restaurant> ResSchList(String pageNum, Restaurant res);

	public int insertRes(Restaurant res, MultipartHttpServletRequest mRequest);

	public int modifyRes(Restaurant res, MultipartHttpServletRequest mRequest);

	public int totCntRes(Restaurant res);

	public Restaurant detailRes(String rname, String mid);

	public int deleteRes(String rname);

}
