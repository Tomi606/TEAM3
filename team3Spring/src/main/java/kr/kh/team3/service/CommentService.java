package kr.kh.team3.service;

import kr.kh.team3.pagination.Criteria;

public interface CommentService {

	int getCommentCount(Criteria cri, int po_num);

}
