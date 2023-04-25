package com.lec.jeju.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.AdminService;
import com.lec.jeju.vo.Admin;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Restaurant;

@Controller
@RequestMapping(value="admin")
public class AdminController {
    
	@Autowired
	private AdminService adminService;

	@RequestMapping(params = "method=login", method = RequestMethod.GET) // 로그인 뷰
	public String login() {
	    return "admin/login";
	}

	@RequestMapping(params = "method=logout", method = RequestMethod.GET) // 로그아웃 처리
	public String logout(HttpSession httpSession) {
	    adminService.logout(httpSession);
	    return "redirect:/main.do";
	}

	@RequestMapping(params = "method=login", method = RequestMethod.POST) // 로그인 처리
	public String login(String aid, String apw, String after, HttpSession httpSession, Model model) {
	    String loginResult  = adminService.loginCheck(aid, apw, httpSession);
	    if (loginResult.equals("로그인 성공")) {
	        return "redirect:" + after;
	    } else {
	        model.addAttribute("errorMsg", "아이디 또는 비밀번호를 확인하세요.");
	        model.addAttribute("loginResult", loginResult);
	        model.addAttribute("aid", aid);
	        model.addAttribute("apw", apw);
	        return "admin/login";
	    }
	}

	@RequestMapping(value = "/hotelApproval", method = RequestMethod.GET)
	public String hotelApproval(Model model) {
	    model.addAttribute("approvalList", adminService.hotelApproval("P"));
	    return "admin/hotelApproval";
	}

	@RequestMapping(value = "/approveHotel", method = RequestMethod.GET)
	public String approveHotel(String hname, Model model) {
	    adminService.approveHotel(hname, "A", "P");
	    model.addAttribute("approvedList", adminService.approvedHotels("A"));
	    model.addAttribute("approvalList", adminService.hotelApproval("P"));
	    return "admin/approvedHotels";
	}

	@RequestMapping(value = "/rejectHotel", method = RequestMethod.GET)
	public String rejectHotel(String hname, Model model) {
	    adminService.rejectHotel(hname, "R", "P");
	    model.addAttribute("rejectedList", adminService.rejectedHotels("R"));
	    model.addAttribute("approvalList", adminService.hotelApproval("P"));
	    return "admin/rejectedHotels";
	}

	@RequestMapping(value = "/restaurantApproval", method = RequestMethod.GET)
	public String restaurantApproval(Model model) {
	    model.addAttribute("approvalList", adminService.restaurantApproval("P"));
	    return "admin/restaurantApproval";
	}
	
	@RequestMapping(value = "/approveRestaurant", method = RequestMethod.GET)
	public String approveRestaurant(String rname, Model model) {
	    adminService.approveRestaurant(rname, "A", "P");
	    model.addAttribute("approvedList", adminService.approvedRestaurants("A"));
	    model.addAttribute("approvalList", adminService.restaurantApproval("P"));
	    return "admin/approvedRestaurants";
	}

	@RequestMapping(value = "/rejectRestaurant", method = RequestMethod.GET)
	public String rejectRestaurant(String rname, Model model) {
	    adminService.rejectRestaurant(rname, "R", "P");
	    model.addAttribute("rejectedList", adminService.rejectedRestaurants("R"));
	    model.addAttribute("approvalList", adminService.restaurantApproval("P"));
	    return "admin/rejectedRestaurants";
	}
	
	@RequestMapping(value = "/approvedHotels", method = RequestMethod.GET)
	public String approvedHotels(Model model) {
	    List<Hotel> approvedList = adminService.approvedHotels("A");
	    model.addAttribute("approvedList", approvedList);
	    return "admin/approvedHotels";
	}

	@RequestMapping(value = "/approvedRestaurants", method = RequestMethod.GET)
	public String approvedRestaurants(Model model) {
	    List<Restaurant> approvedList = adminService.approvedRestaurants("A");
	    model.addAttribute("approvedList", approvedList);
	    return "admin/approvedRestaurants";
	}


	@RequestMapping(value = "/rejectedHotels", method = RequestMethod.GET)
	public String rejectedHotels(Model model) {
	    List<Hotel> rejectedList = adminService.rejectedHotels("R");
	    model.addAttribute("rejectedList", rejectedList);
	    return "admin/rejectedHotels";
	}

	@RequestMapping(value = "/rejectedRestaurants", method = RequestMethod.GET)
	public String rejectedRestaurants(Model model) {
	    List<Restaurant> rejectedList = adminService.rejectedRestaurants("R");
	    model.addAttribute("rejectedList", rejectedList);
	    return "admin/rejectedRestaurants";
	}
	
    // 승인 및 거절 요청의 상세 내용 보기
	@RequestMapping(value = "/hotelDetail", method = RequestMethod.GET)
	public String hotelDetail(String hname, Model model) {
	    Hotel hotel = adminService.getHotelByName(hname);
	    model.addAttribute("hotel", hotel);
	    return "admin/hotelDetail";
	}

	@RequestMapping(value = "/restaurantDetail", method = RequestMethod.GET)
	public String restaurantDetail(String rname, Model model) {
	    Restaurant restaurant = adminService.getRestaurantByName(rname);
	    model.addAttribute("restaurant", restaurant);
	    return "admin/restaurantDetail";
	}
    
}