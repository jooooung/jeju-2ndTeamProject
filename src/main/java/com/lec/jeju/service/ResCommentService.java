package com.lec.jeju.service;

import java.util.List;

import org.springframework.ui.Model;

import com.lec.jeju.vo.ResComment;
import com.lec.jeju.vo.SpotComment;

public interface ResCommentService {
	// 특정 식당 댓글 목록
	public List<ResComment> rCommentList(ResComment rComment, String RpageNum, Model model);

	// 특정 식당 댓글수
	public int totCntRcomment(String rname, ResComment rComment);

	// 원 댓글 달기
	public int insertRcomment(ResComment rComment);

	// 답 댓글 달기
	public int replyRcomment(ResComment rComment);

	// 댓글 수정
	public int modifyRcomment(ResComment rComment);

	// 댓글 삭제
	public int deleteRcomment(int rcommentno);
}
