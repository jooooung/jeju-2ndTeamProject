package com.lec.jeju.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Hreservation {
	private String mid;
	private String hname;
	private Date indate;
	private Date outdate;
}
