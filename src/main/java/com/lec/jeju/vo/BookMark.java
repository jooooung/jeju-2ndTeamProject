package com.lec.jeju.vo;

import lombok.Data;

@Data
public class BookMark {
	private int bookmarkno;
	private String mid;
	private String hname;
	private String rname;
	private String sname;
	private String imgPath; // 각 대표이미지
}
