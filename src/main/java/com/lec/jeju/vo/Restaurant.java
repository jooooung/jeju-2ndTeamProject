package com.lec.jeju.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Restaurant {
    private String rname;
    private String bid;
    private Integer locationno;
    private Integer Restauranttypeno;
    private String raddr;
    private String rtel;
    private String rlink;
    private String rinfo;
    private String rmenu;
    private String rmainimg;
    private String rsubimg_1;
    private String rsubimg_2;
    private String rsubimg_3;
    private Double rlatitude;
    private Double rlongitude;
    private String rprice;
    private String requeststatus;
}