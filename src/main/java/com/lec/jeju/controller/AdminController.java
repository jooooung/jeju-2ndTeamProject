package com.lec.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.lec.jeju.service.AdminService;
import com.lec.jeju.vo.Admin;
import com.lec.jeju.vo.Hotel;
import com.lec.jeju.vo.Restaurant;

@Controller
@RequestMapping("/admin")
public class AdminController {
    
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "admin/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute("admin") Admin admin, Model model) {
        boolean result = adminService.login(admin.getAid(), admin.getApw());
        if (result) {
            return "main/main";
        } else {
            model.addAttribute("errorMsg", "아이디 또는 비밀번호를 확인하세요.");
            return "admin/login";
        }
    }
    
    @RequestMapping(params="method=hotelApproval", method=RequestMethod.GET)
    public String hotelApproval(Model model) {
        model.addAttribute("approvalList", adminService.getHotelApprovalList());
        return "admin/hotelApproval";
    }
    
    @RequestMapping(params="method=approveHotel", method=RequestMethod.GET)
    public String approveHotel(String hname) {
        adminService.updateHotelApproval(hname, "A");
        return "redirect:admin.do?method=hotelApproval";
    }
    
    @RequestMapping(params="method=rejectHotel", method=RequestMethod.GET)
    public String rejectHotel(String hname) {
        adminService.updateHotelApproval(hname, "R");
        return "redirect:admin.do?method=hotelApproval";
    }
    
    @RequestMapping(params="method=restaurantApproval", method=RequestMethod.GET)
    public String restaurantApproval(Model model) {
        model.addAttribute("approvalList", adminService.getRestaurantApprovalList());
        return "admin/restaurantApproval";
    }
    
    @RequestMapping(params="method=approveRestaurant", method=RequestMethod.GET)
    public String approveRestaurant(String rname) {
        adminService.updateRestaurantApproval(rname, "A");
        return "redirect:admin.do?method=restaurantApproval";
    }
    
    @RequestMapping(params="method=rejectRestaurant", method=RequestMethod.GET)
    public String rejectRestaurant(String rname) {
        adminService.updateRestaurantApproval(rname, "R");
        return "redirect:admin.do?method=restaurantApproval";
    }
    
    @RequestMapping(params="method=approvedHotels", method=RequestMethod.GET)
    public String approvedHotels(Model model) {
        model.addAttribute("approvedList", adminService.getApprovedHotels());
        return "admin/approvedHotels";
    }
    
    @RequestMapping(params="method=approvedRestaurants", method=RequestMethod.GET)
    public String approvedRestaurants(Model model) {
        model.addAttribute("approvedList", adminService.getApprovedRestaurants());
        return "admin/approvedRestaurants";
    }
    
    @RequestMapping(params="method=rejectedHotels", method=RequestMethod.GET)
    public String rejectedHotels(Model model) {
        model.addAttribute("rejectedList", adminService.getRejectedHotels());
        return "admin/rejectedHotels";
    }
    
    @RequestMapping(params="method=rejectedRestaurants", method=RequestMethod.GET)
    public String rejectedRestaurants(Model model) {
        model.addAttribute("rejectedList", adminService.getRejectedRestaurants());
        return "admin/rejectedRestaurants";
    }
}
