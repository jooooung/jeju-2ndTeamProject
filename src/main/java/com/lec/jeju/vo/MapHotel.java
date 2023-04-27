package com.lec.jeju.vo;

import lombok.Data;

@Data
public class MapHotel {
	private String hname;
	private String bid;
	private int locationno;
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
	private double hlatitude;
	private double hlongitude;
	private String hprice;
	private String schName;
	@Override
	public String toString() {
		return "{'hname':'" + hname + "', 'bid':'" + bid + "', 'locationno':" + locationno + ", 'haddr':'" + haddr + "', 'htel':'" + htel + "', 'hlink':'"
				+ hlink + "', 'hinfo':'" + hinfo + "', 'intime':'" + intime + "', 'outtime':'" + outtime + "', 'hmainimg':'" + hmainimg
				+ "', 'hsubimg_1':'" + hsubimg_1 + "', 'hsubimg_2':'" + hsubimg_2 + "', 'hsubimg_3':'" + hsubimg_3 + "', 'hlatitude':"
				+ hlatitude + ", 'hlongitude':" + hlongitude + ", 'hprice':'" + hprice + "'}";
	}
}
