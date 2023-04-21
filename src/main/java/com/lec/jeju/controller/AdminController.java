package com.lec.jeju.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.lec.jeju.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private AdminService adminService;

    @GetMapping("/register")
    public String showAdminRegisterForm(Model model) {
        model.addAttribute("admin", new Admin());
        return "admin-register-form";
    }

    @PostMapping("/register")
    public String registerAdmin(@ModelAttribute("admin") Admin admin) {
        adminService.registerAdmin(admin);
        return "redirect:/admin/register?success";
    }
}
