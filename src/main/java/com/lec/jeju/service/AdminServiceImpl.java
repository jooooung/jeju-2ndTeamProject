package com.lec.jeju.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;

    @Override
    public void registerAdmin(Admin admin) {
        adminMapper.insertAdmin(admin);
    }
}
