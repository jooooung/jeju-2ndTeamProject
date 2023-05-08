package com.lec.jeju.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class ResComment {
	private int rcommentno;
	private String rname;
	private String mid;
	private String rcontent;
	private int rgroup;
	private int rindent;
	private int rstep;
	private Timestamp rcrdate;
	private String mphoto;

	private int startRow;
	private int endRow;
}
