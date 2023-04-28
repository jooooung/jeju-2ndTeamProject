package com.lec.jeju.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ReviewBoard {
	private int reviewno;
	private String mid;
	private String rtitle;
	private String rcontent;
	private Timestamp rrdate;
	private int rhit;
	private String mname;
	
	private int startRow;
	private int endRow;
}
