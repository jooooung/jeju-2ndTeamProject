package com.lec.jeju.service;

import java.util.List;

import org.springframework.ui.Model;

import com.lec.jeju.vo.SpotComment;

public interface SpotCommentService {
	// 특정 숙소 댓글 목록
	public List<SpotComment> sCommentList(SpotComment sComment, String CpageNum, Model model);	
	
	// 특정 숙소 댓글수
	public int totCntScomment(String sname, SpotComment sComment);
	
	// 원 댓글 달기
	public int insertScomment(SpotComment sComment);
	
	// 답 댓글 달기
	public int replyScomment(SpotComment sComment);
	
	// 댓글 수정
	public int modifyScomment(SpotComment sComment);
	
	// 댓글 삭제
	public int deleteScomment(int scommentno);	
}
