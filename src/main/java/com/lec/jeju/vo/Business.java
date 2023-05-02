package com.lec.jeju.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class Business {
	private String bid; // 아이디
	private String bpw; // 비밀번호
	private String bname; // 이름
	private String btel; // 전화번호
	private String bemail; // 이메일
	private String baddr; // 주소
	private String bdeaddr; // 상세주소
	private String bpost; // 우편번호
	private String bphoto; // 회원사진
	private Date brdate; // 가입일
}