package com.lec.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.lec.jeju.dao.AdminDao;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Restaurant;

@Repository
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;

	@Override
	public boolean login(String aid, String apw) {
	    return adminDao.login(aid, apw);
	}

	@Override
	public List<Hotel> getHotelApprovalList() {
	    return adminDao.selectHotelApprovalList();
	}

	@Override
	public void updateHotelApproval(String hname, String approval) {
	    adminDao.updateHotelApproval(hname, approval);
	}

	@Override
	public List<Restaurant> getRestaurantApprovalList() {
	    return adminDao.selectRestaurantApprovalList();
	}

	@Override
	public void updateRestaurantApproval(String rname, String approval) {
	    adminDao.updateRestaurantApproval(rname, approval);
	}

	@Override
	public List<Hotel> getApprovedHotels() {
	    return adminDao.selectApprovedHotels();
	}

	@Override
	public List<Restaurant> getApprovedRestaurants() {
	    return adminDao.selectApprovedRestaurants();
	}

	@Override
	public List<Hotel> getRejectedHotels() {
	    return adminDao.selectRejectedHotels();
	}

	@Override
	public List<Restaurant> getRejectedRestaurants() {
	    return adminDao.selectRejectedRestaurants();
	}
}