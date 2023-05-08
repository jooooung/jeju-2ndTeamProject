package com.lec.jeju.vo;

import lombok.Data;

@Data
public class Restaurant {
	private String rname;
	private String bid;
	private String mid;    // 즐겨찾기용
	private int bookmarkok; // 즐겨찾기용
	private int locationno;
	private int restauranttypeno;
	private String raddr;
	private String rtel;
	private String rlink;
	private String rinfo;
	private String rmenu;
	private String rmainimg;
	private String rsubimg_1;
	private String rsubimg_2;
	private String rsubimg_3;
	private int rlatitude;
	private int rlongitude;
	private String rprice;
	private String requeststatus;
	private int bcnt;
	private String lname;

	private int startRow;
	private int endRow;

	private String schitem;
	private String schword;
}