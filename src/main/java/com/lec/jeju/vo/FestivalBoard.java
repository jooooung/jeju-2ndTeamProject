package com.lec.jeju.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class FestivalBoard {
	private int festivalno; // 글번호
	private String aid; // 관리자 아이디
	private String ftitle; // 글제목
	private String fcontent; // 글본문
	private int fhit; // 조회수
	private Timestamp frdate; // 작성시점
	// 페이징
	private int startRow;
	private int endRow;

}
