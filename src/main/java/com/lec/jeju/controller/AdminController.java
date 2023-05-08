package com.lec.jeju.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.lec.jeju.service.AdminService;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.HotelComment;
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

	@RequestMapping(value = "/logout", method = RequestMethod.GET) // 로그아웃 처리
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
	public String hotelApproval(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		int hotelTotalCount = adminService.hotelTotalCount("P"); // 등록 대기 중인 호텔
		Paging paging = new Paging(hotelTotalCount, String.valueOf(pageNum), 5, 5); // 페이징
		List<Hotel> approvalList = adminService.hotelApproval("P", paging.getStartRow(), paging.getEndRow()); // 등록 대기 중인 호텔 목록을 조회
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("paging", paging);
		return "admin/hotelApproval";
	}
	
	@RequestMapping(value = "/approveHotel", method = RequestMethod.GET)
	public String approveHotel(String hname, String haddr, Model model) {
		model.addAttribute("haddr", haddr);
		model.addAttribute("hname", hname);
	    return "admin/addHotelLatLng";
	}
	
	@RequestMapping(value = "/approveHotel", method = RequestMethod.POST)
	public String approveHotel(String hname, double hlatitude, double hlongitude, Model model, @RequestParam(defaultValue = "1") int pageNum) {
	    adminService.approveHotel(hname, "A", "P", hlatitude, hlongitude);
	    Paging paging = new Paging(adminService.hotelTotalCount("A"), String.valueOf(pageNum), 5, 5);
	    model.addAttribute("approvedList", adminService.approvedHotels("A", paging.getStartRow(), paging.getEndRow()));
	    model.addAttribute("approvalList", adminService.hotelApproval("P", paging.getStartRow(), paging.getEndRow()));
	    model.addAttribute("paging", paging);
	    return "admin/approvedHotels";
	}
	
	@RequestMapping(value = "/approvedHotels", method = RequestMethod.GET)
	public String approvedHotels(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		int hotelTotalCount = adminService.hotelTotalCount("A"); // 승인 된 호텔
		Paging paging = new Paging(hotelTotalCount, String.valueOf(pageNum), 5, 5); // 페이징
		List<Hotel> approvedList = adminService.approvedHotels("A", paging.getStartRow(), paging.getEndRow()); // 승인된 호텔 목록을 조회
	    model.addAttribute("approvedList", approvedList);
	    model.addAttribute("paging", paging);
	    return "admin/approvedHotels";
	}

	@RequestMapping(value = "/rejectHotel", method = RequestMethod.GET)
	public String rejectHotel(String hname, Model model, @RequestParam(defaultValue = "1") int pageNum) {
	    adminService.rejectHotel(hname, "R", "P");
	    Paging paging = new Paging(adminService.hotelTotalCount("R"), String.valueOf(pageNum), 5, 5);
	    model.addAttribute("rejectedList", adminService.rejectedHotels("R", paging.getStartRow(), paging.getEndRow()));
	    model.addAttribute("paging", paging);
	    return "admin/rejectedHotels";
	}
	
	@RequestMapping(value = "/rejectedHotels", method = RequestMethod.GET)
	public String rejectedHotels(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		int hotelTotalCount = adminService.hotelTotalCount("R"); // 거절 된 호텔
		Paging paging = new Paging(hotelTotalCount, String.valueOf(pageNum), 5, 5); // 페이징
		List<Hotel> rejectedList = adminService.rejectedHotels("R", paging.getStartRow(), paging.getEndRow()); // 거절된 호텔 목록을 조회
	    model.addAttribute("rejectedList", rejectedList);
	    model.addAttribute("paging", paging);
	    return "admin/rejectedHotels";
	}

	@RequestMapping(value = "/restaurantApproval", method = RequestMethod.GET)
	public String restaurantApproval(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		int restaurantTotalCount = adminService.restaurantTotalCount("P"); // 등록 대기 중인 식당
		Paging paging = new Paging(restaurantTotalCount, String.valueOf(pageNum), 5, 5); // 페이징
		List<Restaurant> approvalList = adminService.restaurantApproval("P", paging.getStartRow(), paging.getEndRow()); // 등록 대기 중인 식당 목록을 조회
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("paging", paging);
		return "admin/restaurantApproval";
	}
	
	@RequestMapping(value = "/approveRestaurant", method = RequestMethod.GET)
	public String approveRestaurant(String rname, String raddr, Model model) {
		model.addAttribute("raddr", raddr);
		model.addAttribute("rname", rname);
	    return "admin/addResLatLng";
	}
	
	@RequestMapping(value = "/approveRestaurant", method = RequestMethod.POST)
	public String approveRestaurnat(String rname, double rlatitude, double rlongitude, Model model, @RequestParam(defaultValue = "1") int pageNum) {
	    adminService.approveRestaurant(rname, "A", "P", rlatitude, rlongitude);
	    Paging paging = new Paging(adminService.restaurantTotalCount("A"), String.valueOf(pageNum), 5, 5);
	    model.addAttribute("approvedList", adminService.approvedRestaurants("A", paging.getStartRow(), paging.getEndRow()));
	    model.addAttribute("approvalList", adminService.restaurantApproval("P", paging.getStartRow(), paging.getEndRow()));
	    model.addAttribute("paging", paging);
	    return "admin/approvedRestaurants";
	}
	
	@RequestMapping(value = "/approvedRestaurants", method = RequestMethod.GET)
	public String approvedRestaurants(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		int restaurantTotalCount = adminService.restaurantTotalCount("A"); // 승인 된 호텔
		Paging paging = new Paging(restaurantTotalCount, String.valueOf(pageNum), 5, 5); // 페이징
		List<Restaurant> approvedList = adminService.approvedRestaurants("A", paging.getStartRow(), paging.getEndRow()); // 승인된 식당 목록을 조회
	    model.addAttribute("approvedList", approvedList);
	    model.addAttribute("paging", paging);
	    return "admin/approvedRestaurants";
	}

	@RequestMapping(value = "/rejectRestaurant", method = RequestMethod.GET)
	public String rejectRestaurant(String rname, Model model, @RequestParam(defaultValue = "1") int pageNum) {
	    adminService.rejectRestaurant(rname, "R", "P");
	    Paging paging = new Paging(adminService.restaurantTotalCount("R"), String.valueOf(pageNum), 5, 5);
	    model.addAttribute("rejectedList", adminService.rejectedRestaurants("R", paging.getStartRow(), paging.getEndRow()));
	    model.addAttribute("paging", paging);
	    return "admin/rejectedRestaurants";
	}

	@RequestMapping(value = "/rejectedRestaurants", method = RequestMethod.GET)
	public String rejectedRestaurants(Model model, @RequestParam(defaultValue = "1") int pageNum) {
		int restaurantTotalCount = adminService.restaurantTotalCount("R"); // 거절 된 호텔
		Paging paging = new Paging(restaurantTotalCount, String.valueOf(pageNum), 5, 5); // 페이징
		List<Restaurant> rejectedList = adminService.rejectedRestaurants("R", paging.getStartRow(), paging.getEndRow()); // 거절된 호텔 목록을 조회
	    model.addAttribute("rejectedList", rejectedList);
	    model.addAttribute("paging", paging);
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