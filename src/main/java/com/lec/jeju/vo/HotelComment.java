package com.lec.jeju.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class HotelComment {
	private int hcommentno;
	private String hname;
	private String mid;
	private String bid;
	private String hcontent;
	private int hgroup;
	private int hindent;
	private int hstep;
	private Timestamp hcrdate;
	
	private int startrow;
	private int endrow;
}
