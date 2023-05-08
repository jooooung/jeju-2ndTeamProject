package com.lec.jeju.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.lec.jeju.dao.ResCommentDao;
import com.lec.jeju.util.Paging;
import com.lec.jeju.vo.ResComment;
import com.lec.jeju.vo.SpotComment;

@Service
public class ResCommentServiceImpl implements ResCommentService {
	@Autowired
	private ResCommentDao rCommentDao;

	@Override
	public List<ResComment> rCommentList(ResComment rComment, String RpageNum, Model model) {
		Paging paging = new Paging(rCommentDao.totCntRcomment(rComment), RpageNum, 5, 5);
		rComment.setStartRow(paging.getStartRow());
		rComment.setEndRow(paging.getEndRow());
		return rCommentDao.rCommentList(rComment);
	}

	@Override
	public int totCntRcomment(String rname, ResComment rComment) {
		return rCommentDao.totCntRcomment(rComment);
	}

	@Override
	public int insertRcomment(ResComment rComment) {
		return rCommentDao.insertRcomment(rComment);
	}

	@Override
	public int replyRcomment(ResComment rComment) {
		rCommentDao.preReplyRcomment(rComment);
		return rCommentDao.replyRcomment(rComment);
	}

	@Override
	public ResComment modifyRcommentView(int rcommentno) {
		return rCommentDao.modifyRcommentView(rcommentno);
	}

	@Override
	public int modifyRcomment(ResComment rComment) {
		return rCommentDao.modifysRcmment(rComment);
	}

	@Override
	public int deleteRcomment(int rcommentno) {
		return rCommentDao.deleteRcomment(rcommentno); //dd
	}

}
