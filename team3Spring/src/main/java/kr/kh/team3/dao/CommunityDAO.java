package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.pagination.Criteria;

public interface CommunityDAO {

	ArrayList<PostVO> selectPostList(@Param("site_num") int site_num);

	int selectPostTotalCount(@Param("cri") Criteria cri);

	ArrayList<CommentVO> selectCommentList(@Param("site_num") int site_num);

	ArrayList<RecommendVO> selectRecommendList(@Param("site_num") int site_num);

	ArrayList<PostVO> selectCriPostList(@Param("cri") Criteria cri);


}
