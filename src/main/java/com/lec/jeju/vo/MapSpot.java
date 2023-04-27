package com.lec.jeju.vo;

import lombok.Data;

@Data
public class MapSpot {
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
	private double slatitude;
	private double slongitude;
	private String sprice;
	private String schPlace;
	private int bcnt;
	private int startRow;
	private int endRow;
	private String schName;
	
	@Override
	public String toString() {
		return "{'sname':'" + sname + "', 'aid':'" + aid + "', 'locationno':" + locationno + ", 'saddr':'" + saddr + "', 'stel':'"
				+ stel + "', 'slink':'" + slink + "', 'sinfo':'" + sinfo + "', 'stime':'" + stime + "', 'smainimg':'" + smainimg
				+ "', 'ssubimg_1':'" + ssubimg_1 + "', 'ssubimg_2':'" + ssubimg_2 + "', 'ssubimg_3':'" + ssubimg_3 + "', 'slatitude':"
				+ slatitude + ", 'slongitude':" + slongitude + ", 'sprice':'" + sprice + "', 'bcnt':" + bcnt + "}";
	}
}
