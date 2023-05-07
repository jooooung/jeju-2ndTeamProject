package com.lec.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.jeju.dao.SpotCommentDao;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.SpotComment;
@Service
public class SpotCommentServiceImpl implements SpotCommentService {
	@Autowired
	private SpotCommentDao sCommentDao;

	@Override
	public List<SpotComment> sCommentList(SpotComment sComment, String CpageNum, Model model) {
		Paging paging = new Paging(sCommentDao.totCntScomment(sComment), CpageNum, 5, 5);
		sComment.setStartRow(paging.getStartRow());
		sComment.setEndRow(paging.getEndRow());
		return sCommentDao.sCommentList(sComment);
	}

	@Override
	public int totCntScomment(String sname, SpotComment sComment) {
		return sCommentDao.totCntScomment(sComment);
	}

	@Override
	public int insertScomment(SpotComment sComment) {
		return sCommentDao.insertScomment(sComment);
	}

	@Override
	public int replyScomment(SpotComment sComment) {
		sCommentDao.preReplyScomment(sComment);
		return sCommentDao.replyScomment(sComment);
	}

	@Override
	public int modifyScomment(SpotComment sComment) {
		return sCommentDao.modifysScmment(sComment);
	}

	@Override
	public int deleteScomment(int scommentno) {
		return sCommentDao.deleteScomment(scommentno);
	}

}
