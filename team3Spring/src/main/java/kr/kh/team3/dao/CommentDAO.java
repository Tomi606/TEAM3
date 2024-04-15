package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.pagination.Criteria;

public interface CommentDAO {

	ArrayList<CommentVO> selectCommentList(@Param("cri")Criteria cri, @Param("po_num")int po_num);

	int selectCommentTotalCount(@Param("cri")Criteria cri, @Param("po_num")int po_num);

	boolean deleteComment(@Param("comment")CommentVO comment);

}
