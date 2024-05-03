package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface CommunityService {

	ArrayList<PostVO> getPostList(SiteManagement user);

	ArrayList<CommentVO> getCommentList(SiteManagement user);

	ArrayList<RecommendVO> getRecommendList(SiteManagement user);

}
