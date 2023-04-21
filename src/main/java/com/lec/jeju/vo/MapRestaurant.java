package com.lec.jeju.vo;

import lombok.Data;

@Data
public class MapRestaurant {
	private String rname;
	private String bid;
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
	private double rlatitude;
	private double rlongitude;
	private String rprice;
	@Override
	public String toString() {
		return "{'rname':'" + rname + "', 'bid':'" + bid + "', 'locationno':" + locationno + ", 'restauranttypeno':"
				+ restauranttypeno + ", 'raddr':'" + raddr + "', 'rtel':'" + rtel + "', 'rlink':'" + rlink + "', 'rinfo':'" + rinfo + "', 'rmenu':'" + rmenu
				+ "', 'rmainimg':'" + rmainimg + "', 'rsubimg_1':'" + rsubimg_1 + "', 'rsubimg_2':'" + rsubimg_2 + "', 'rsubimg_3':'"
				+ rsubimg_3 + "', 'rlatitude':" + rlatitude + ", 'rlongitude':" + rlongitude + ", 'rprice':'" + rprice + "'}";
	}
}
