package com.lec.jeju.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.lec.jeju.vo.SpotComment;


@Mapper
public interface SpotCommentDao {
	public List<SpotComment> sCommentList(SpotComment sComment);
	
	public int totCntScomment(SpotComment sComment);
	
	public int insertScomment(SpotComment sComment);
	
	public int preReplyScomment(SpotComment sComment);
	
	public int replyScomment(SpotComment sComment);
	
	public int modifysScmment(SpotComment sComment);
	
	public int deleteScomment(int scommentno);
}
