package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.ResComment;

@Mapper
public interface ResCommentDao {
	public List<ResComment> rCommentList(ResComment rComment);

	public int totCntRcomment(ResComment rComment);

	public int insertRcomment(ResComment rComment);

	public int preReplyRcomment(ResComment rComment);

	public int replyRcomment(ResComment rComment);

	public int modifysRcmment(ResComment rComment);

	public int deleteRcomment(int rcommentno);
}
