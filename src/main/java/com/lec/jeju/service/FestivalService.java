package com.lec.jeju.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.lec.jeju.vo.FestivalBoard;

public interface FestivalService {
	public List<FestivalBoard> FestivalList(String pageNum);

	public int totCntFestival();

	public int writeFestival(FestivalBoard festivalBoard, HttpServletRequest request);

	public FestivalBoard contentFestival(int festivalno);

	public int modifiyFestival(FestivalBoard festivalBoard);

	public FestivalBoard modifiyFestivalView(int festivalno);

	public int deleteFestival(int festivalno);
}
