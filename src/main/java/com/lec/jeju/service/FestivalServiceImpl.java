package com.lec.jeju.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jeju.dao.FestivalDao;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.FestivalBoard;

@Service
public class FestivalServiceImpl implements FestivalService {
	@Autowired
	private FestivalDao festivalDao;

	@Override
	public List<FestivalBoard> FestivalList(String pageNum) {
		Paging paging = new Paging(festivalDao.totCntFestival(), pageNum, 5, 5);
		FestivalBoard festivalBoard = new FestivalBoard();
		festivalBoard.setStartRow(paging.getStartRow());
		festivalBoard.setEndRow(paging.getEndRow());
		return festivalDao.FestivalList(festivalBoard);

	}

	@Override
	public int totCntFestival() {
		return festivalDao.totCntFestival();
	}

	@Override
	public int writeFestival(FestivalBoard festivalBoard, HttpServletRequest request) {
		return festivalDao.writeFestival(festivalBoard);
	}

	@Override
	public FestivalBoard contentFestival(int festivalno) {
		festivalDao.hitupFestival(festivalno);
		return festivalDao.contentFestival(festivalno);
	}

	@Override
	public FestivalBoard modifiyFestivalView(int festivalno) {
		return festivalDao.contentFestival(festivalno);
	}

	@Override
	public int modifiyFestival(FestivalBoard festivalBoard) {
		return festivalDao.modifiyFestival(festivalBoard);
	}

	@Override
	public int deleteFestival(int festivalno) {
		return festivalDao.deleteFestival(festivalno);
	}
}