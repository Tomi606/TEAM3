package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;

public interface CommunityDAO {

	ArrayList<PostVO> selectPostList(@Param("site_num") int site_num);

	ArrayList<CommentVO> selectCommentList(@Param("site_num") int site_num);

	ArrayList<RecommendVO> selectRecommendList(@Param("site_num") int site_num);

}
