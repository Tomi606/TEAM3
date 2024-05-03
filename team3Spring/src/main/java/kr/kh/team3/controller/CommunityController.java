package kr.kh.team3.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.CommunityService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommunityController {

	/* 마이페이지 커뮤니티 관리 컨트롤러 */
	
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("/hospital/community")
	public String hospitalCommunity(Model model, HttpSession session) {
		log.info("병원 커뮤니티 관리 화면");
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		//해당 병원 회원이 쓴 게시글(post)
		ArrayList<PostVO> pList = communityService.getPostList(user);
		//해당 병원 회원이 쓴 댓글(comment)
		ArrayList<CommentVO> cList = communityService.getCommentList(user);
		//해당 병원 회원 좋아요(recommend)
		ArrayList<RecommendVO> rList = communityService.getRecommendList(user);
		
		model.addAttribute("pList", pList);
		model.addAttribute("cList", cList);
		model.addAttribute("rList", rList);
		return "/hospital/community";
	}
}
