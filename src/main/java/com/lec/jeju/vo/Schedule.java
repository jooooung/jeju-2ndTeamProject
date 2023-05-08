package com.lec.jeju.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Schedule {
	  private int scheduleno;
	  private String mid;
	  private String scheduletitle;
	  private Date startdate;
	  private Date enddate;
	  private String schedulecontent;
}
