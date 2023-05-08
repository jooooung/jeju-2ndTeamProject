package com.lec.jeju.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class SpotComment {
	private int scommentno;
	private String sname;
	private String mid;
	private String scontent;
	private int sgroup;
	private int sindent;
	private int sstep;
	private Timestamp scrdate;
	private String mphoto;
	
	private int startRow;
	private int endRow;
}
