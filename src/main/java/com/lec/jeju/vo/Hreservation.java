package com.lec.jeju.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Hreservation {
	private String mid;
	private String hname;
	private Date indate;
	private Date outdate;
	
	private Hotel Hotel;
}
