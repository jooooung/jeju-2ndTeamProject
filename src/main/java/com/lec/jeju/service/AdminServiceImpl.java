package com.lec.jeju.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lec.jeju.dao.AdminDao;
import com.lec.jeju.dao.HotelDao;
import com.lec.jeju.vo.Admin;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Restaurant;

@Service
public class AdminServiceImpl implements AdminService {
	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private HotelDao hotelDao;
	
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
	    }
	    return result;
	}

	public void logout(HttpSession httpSession) {
	    httpSession.invalidate();
	}

	@Override
	public Admin getDetailAdmin(String aid) {
	    return adminDao.getDetailAdmin(aid);
	}

	@Override
	public List<Hotel> hotelApproval(String requeststatus, int startRow, int endRow) {
	    return adminDao.hotelApproval(requeststatus, startRow, endRow);
	}

	@Override
	public void approveHotel(String hname, String approval, String requeststatus, double hlatitude, double hlongitude) {
	    adminDao.approveHotel(hname, approval, requeststatus, hlatitude, hlongitude);
	}
	
	@Override
	public List<Hotel> approvedHotels(String requeststatus, int startRow, int endRow) {
	    return adminDao.approvedHotels("A", startRow, endRow);
	}

	@Override
	public void rejectHotel(String hname, String approval, String requeststatus) {
	    adminDao.rejectHotel(hname, approval, requeststatus);
	}
	
	@Override
	public List<Hotel> rejectedHotels(String requeststatus, int startRow, int endRow) {
	    return adminDao.rejectedHotels("R", startRow, endRow);
	}
	
	@Override
	public List<Restaurant> restaurantApproval(String requeststatus, int startRow, int endRow) {
		return adminDao.restaurantApproval(requeststatus, startRow, endRow);
	}

	@Override
	public void approveRestaurant(String rname, String approval, String requeststatus, double rlatitude, double rlongitude) {
		adminDao.approveRestaurant(rname, approval, requeststatus, rlatitude, rlongitude);
	}

	@Override
	public List<Restaurant> approvedRestaurants(String requeststatus, int startRow, int endRow) {
	    return adminDao.approvedRestaurants("A", startRow, endRow);
	}

	@Override
	public void rejectRestaurant(String rname, String approval, String requeststatus) {
		adminDao.rejectRestaurant(rname, approval, requeststatus);
	}

	@Override
	public List<Restaurant> rejectedRestaurants(String requeststatus, int startRow, int endRow) {
	    return adminDao.rejectedRestaurants("R", startRow, endRow);
	}
	
	@Override
	public Hotel getHotelByName(String hname) {
	    return adminDao.selectHotelByName(hname);
	}

	@Override
	public Restaurant getRestaurantByName(String rname) {
	    return adminDao.selectRestaurantByName(rname);
	}
	
	@Override
	public int hotelTotalCount(String requeststatus) {
	    return adminDao.hotelTotalCount(requeststatus);
	}
	
	@Override
	public int restaurantTotalCount(String requeststatus) {
	    return adminDao.restaurantTotalCount(requeststatus);
	}
    
}