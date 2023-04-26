package com.lec.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jeju.dao.HreservationDao;
import com.lec.jeju.vo.Hreservation;
@Service
public class HreservationServiceImpl implements HreservationService {
	@Autowired
	private HreservationDao hreservationDao;
	
	@Override
	public List<Hreservation> hreservationList_Hotel(String hname) {
		return hreservationDao.hreservationList_Hotel(hname);
	}

	@Override
	public List<Hreservation> hreservationList_Member(String mid) {
		return hreservationDao.hreservationList_Member(mid);
	}

	@Override
	public int deleteHreservation(Hreservation hreservation) {
		return hreservationDao.deleteHreservation(hreservation);
	}

}
