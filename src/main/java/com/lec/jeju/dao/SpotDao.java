package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.lec.jeju.vo.Spot;

@Mapper
public interface SpotDao {
	public List<Spot> spotList(Spot spot);
	public List<Spot> spotSchList(Spot spot);
	public int totCntSpot(Spot spot);
	public Spot detailSpot(@Param("sname") String sname, @Param("mid")String mid);
	public int insertSpot(Spot spot);
	public int modifySpot(Spot spot);
	public int deleteSpot(String sname);
}
