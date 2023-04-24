package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.FestivalBoard;

@Mapper
public interface FestivalDao {
	public List<FestivalBoard> FestivalList(FestivalBoard festivalBoard);

	public int totCntFestival();

	public int writeFestival(FestivalBoard festivalBoard);

	public FestivalBoard contentFestival(int festivalno);

	public int modifiyFestival(FestivalBoard festivalBoard);

	public int hitupFestival(int festivalno);

	public int deleteFestival(int festivalno);
}
