package com.lec.jeju.service;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.lec.jeju.vo.Member;

public interface MemberService {
	public int idConfirm(String mid);

	public int emailConfirm(String memail);

	public int joinMember(Member member, HttpSession httpSession, MultipartHttpServletRequest mRequest);

	public String loginCheck(String mid, String mpw, HttpSession httpSession);

	public Member getDetailMember(String mid);

	public int modifyMember(Member member, HttpSession httpSession, MultipartHttpServletRequest mRequest);

	public int deleteMember(String mid);

	public void logout(HttpSession httpSession);

}
