package com.lec.jeju.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Member {
	private String mid; // 아이디
	private String mpw; // 비밀번호
	private String mname; // 이름
	private String mtel; // 전화번호
	private String memail; // 이메일
	private String maddr; // 주소
	private String mdeaddr; // 상세주소
	private String mpost; // 우편번호
	private Date mbirth; // 생년월일
	private String mphoto; // 회원사진
	private Date mrdate; // 가입일

	public Date getMbirth() {
		return mbirth;
	}
}
