package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface CommunityService {

	ArrayList<PostVO> getPostList(SiteManagement user);

	ArrayList<CommentVO> getCommentList(SiteManagement user);

	ArrayList<RecommendVO> getRecommendList(SiteManagement user);

	int getPostTotalCount(Criteria cri);

	ArrayList<PostVO> getCriPostList(Criteria cri);

}
