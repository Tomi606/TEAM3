package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.CommentDAO;
import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.pagination.Criteria;

@Service
@Component
public class CommentServiceImp implements CommentService {
	
	@Autowired
	CommentDAO commentDao;
	
	@Override
	public ArrayList<CommentVO> getCommentByPostList(Criteria cri, int po_num) {
		if(cri == null) {
			cri = new Criteria();
		}
		return commentDao.selectCommentList(cri, po_num);
	}
	
	@Override
	public int getCommentCount(Criteria cri, int po_num) {
		if(cri == null) {
			cri = new Criteria();
		}
		return commentDao.selectCommentTotalCount(cri, po_num);
	}

	@Override
	public boolean deleteComment(CommentVO comment) {
		
		if(comment == null) {
			return false;
		}
		return commentDao.deleteComment(comment);
	}

	@Override
	public int getCommentNoCount(Criteria cri, int po_num) {
		if(cri == null) {
			cri = new Criteria();
		}
		return commentDao.selectCommentNoTotalCount(cri, po_num);
	}

	@Override
	public ArrayList<CommentVO> getCommentNoByPostList(Criteria cri, int po_num) {
		if(cri == null) {
			cri = new Criteria();
		}
		return commentDao.selectCommentNoList(cri, po_num);
	}


}
