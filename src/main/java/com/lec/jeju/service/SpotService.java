package com.lec.jeju.service;

import java.util.List;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.jeju.vo.Spot;

public interface SpotService {
	public List<Spot> spotList(String pageNum, Spot spot);
	public List<Spot> spotSchList(String pageNum, Spot spot);
	public int insertSpot(Spot spot, MultipartHttpServletRequest mRequest);
	public int modifySpot(Spot spot, MultipartHttpServletRequest mRequest);
	public int totCntSpot(Spot spot);
	public Spot detailSpot(String sname);
	public int deleteSpot(String sname);
}
