package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.pagination.Criteria;

public interface CommentService {

	int getCommentCount(Criteria cri, int po_num);

	ArrayList<CommentVO> getCommentByPostList(Criteria cri, int po_num);

	boolean deleteComment(CommentVO comment);

}
