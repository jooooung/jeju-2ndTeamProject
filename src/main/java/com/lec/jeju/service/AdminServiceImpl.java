package com.lec.jeju.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.lec.jeju.dao.AdminDao;
import com.lec.jeju.vo.Admin;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Restaurant;

@Repository
@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;
	
	@Override
	public String loginCheck(String aid, String apw, HttpSession httpSessioin) {
		String result = "로그인 성공";
		Admin admin = adminDao.getDetailAdmin(aid);
		if(admin == null) {
			result = "유효하지 않은 아이디 입니다.";
		} else if(!admin.getApw().equals(apw)) {
			result = "비밀번호가 일치하지 않습니다.";
		} else {
			// 로그인 성공
			httpSessioin.setAttribute("admin", admin);
			httpSessioin.setAttribute("aid", aid);
		}
		return result;
	}
	
	@Override
	public Admin getDetailAdmin(String aid) {
		return adminDao.getDetailAdmin(aid);
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