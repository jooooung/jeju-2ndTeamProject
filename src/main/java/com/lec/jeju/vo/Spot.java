package com.lec.jeju.vo;

import lombok.Data;

@Data
public class Spot {
	private String sname;
	private String aid;
	private int locationno;
	private String saddr;
	private String stel;
	private String slink;
	private String sinfo;
	private String stime;
	private String smainimg;
	private String ssubimg_1;
	private String ssubimg_2;
	private String ssubimg_3;
	private int slatitude;
	private int slongitude;
	private String sprice;
	private int bcnt;
	private String lname;
	
	private int startRow;
	private int endRow;
	
	private String schitem;
	private String schword;
}