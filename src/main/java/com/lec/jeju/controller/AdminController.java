package com.lec.jeju.controller;

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
@RequestMapping(value="/admin")
public class AdminController {
    
    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "admin/login";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
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
        model.addAttribute("approvalList", adminService.getHotelApprovalList());
        return "admin/hotelApproval";
    }
    
    @RequestMapping(value = "/approveHotel", method = RequestMethod.GET)
    public String approveHotel(String hname) {
        adminService.updateHotelApproval(hname, "A");
        return "redirect:/admin/hotelApproval";
    }
    
    @RequestMapping(value = "/rejectHotel", method = RequestMethod.GET)
    public String rejectHotel(String hname) {
        adminService.updateHotelApproval(hname, "R");
        return "redirect:/admin/hotelApproval";
    }
    
    @RequestMapping(value = "/restaurantApproval", method = RequestMethod.GET)
    public String restaurantApproval(Model model) {
        model.addAttribute("approvalList", adminService.getRestaurantApprovalList());
        return "admin/restaurantApproval";
    }
    
    @RequestMapping(value = "/approveRestaurant", method = RequestMethod.GET)
    public String approveRestaurant(String rname) {
        adminService.updateRestaurantApproval(rname, "A");
        return "redirect:/admin/restaurantApproval";
    }
    
    @RequestMapping(value = "/rejectRestaurant", method = RequestMethod.GET)
    public String rejectRestaurant(String rname) {
        adminService.updateRestaurantApproval(rname, "R");
        return "redirect:/admin/restaurantApproval";
    }
    
    @RequestMapping(value = "/approvedHotels", method = RequestMethod.GET)
    public String approvedHotels(Model model) {
        model.addAttribute("approvedList", adminService.getApprovedHotels());
        return "admin/approvedHotels";
    }
    
    @RequestMapping(value = "/approvedRestaurants", method = RequestMethod.GET)
    public String approvedRestaurants(Model model) {
        model.addAttribute("approvedList", adminService.getApprovedRestaurants());
        return "admin/approvedRestaurants";
    }
    
    @RequestMapping(value = "/rejectedHotels", method = RequestMethod.GET)
    public String rejectedHotels(Model model) {
        model.addAttribute("rejectedList", adminService.getRejectedHotels());
        return "admin/rejectedHotels";
    }
    
    @RequestMapping(value = "/rejectedRestaurants", method = RequestMethod.GET)
    public String rejectedRestaurants(Model model) {
        model.addAttribute("rejectedList", adminService.getRejectedRestaurants());
        return "admin/rejectedRestaurants";
    }
}
