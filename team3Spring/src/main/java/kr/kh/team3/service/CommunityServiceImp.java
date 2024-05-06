package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.CommunityDAO;
import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class CommunityServiceImp implements CommunityService {
	
	@Autowired
	private CommunityDAO communityDao;

	@Override
	public ArrayList<PostVO> getPostList(SiteManagement user) {
		if(user == null || user.getSite_id() == null) {
			return null;
		}
		return communityDao.selectPostList(user.getSite_num());
	}

	@Override
	public ArrayList<CommentVO> getCommentList(SiteManagement user) {
		if(user == null || user.getSite_id() == null) {
			return null;
		}
		return communityDao.selectCommentList(user.getSite_num());
	}

	@Override
	public ArrayList<RecommendVO> getRecommendList(SiteManagement user) {
		if(user == null || user.getSite_id() == null) {
			return null;
		}
		return communityDao.selectRecommendList(user.getSite_num());
	}
	
	@Override
	public ArrayList<PostVO> getCriPostList(Criteria cri, String site_id) {
		if(cri == null) {
			return null;
		}
		return communityDao.selectCriPostList(cri, site_id);
	}

	@Override
	public int getPostTotalCount(Criteria cri, String site_id) {
		if(cri == null) {
			return 0;
		}
		return communityDao.selectPostTotalCount(site_id);
	}

	@Override
	public ArrayList<CommentVO> getCriCommentList(Criteria cri, String site_id) {
		if(cri == null) {
			return null;
		}
		return communityDao.selectCriCommentList(cri, site_id);
	}

	@Override
	public int getCommentTotalCount(Criteria cri, String site_id) {
		if(cri == null) {
			return 0;
		}
		return communityDao.selectCommentTotalCount(site_id);
	}

	@Override
	public ArrayList<PostVO> getCriRecommendList(Criteria cri, String site_id) {
		if(cri == null) {
			return null;
		}
		
		return communityDao.selectCriRecommendList(cri, site_id);
	}

	@Override
	public int getRecommendTotalCount(Criteria cri, String site_id) {
		if(cri == null) {
			return 0;
		}
		return communityDao.selectRecommendTotalCount(site_id);
	}

}
