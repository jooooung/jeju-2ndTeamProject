package com.lec.jeju.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Hotel {
	private String hname;
    private String bid;
    private Integer locationno;
    private String haddr;
    private String htel;
    private String hlink;
    private String hinfo;
    private String intime;
    private String outtime;
    private String hmainimg;
    private String hsubimg_1;
    private String hsubimg_2;
    private String hsubimg_3;
    private Double hlatitude;
    private Double hlongitude;
    private Integer hprice;
    private String requeststatus;
    
    private int startrow;
	private int endrow;
	
	private String schword;
}
