package com.lec.jeju.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class BookMark {
	private int bookmarkno;
	private String mid;
	private String hname;
	private String rname;
	private String sname;
	private String hmainimg; // 호텔 메인이미지
	private String rmainimg; // 식당 메인이미지
	private String smainimg; // 관광지 메인이미지
	private Date bookmarkdate; // 즐겨찾기한 순서출력용
}
