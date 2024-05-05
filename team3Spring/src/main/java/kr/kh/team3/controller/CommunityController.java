package kr.kh.team3.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.CommentVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import kr.kh.team3.pagination.PageMaker;
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
		log.info(pList+"/hospital/community/hospital/community/hospital/community/hospital/community/hospital/community/hospital/community/hospital/community");
		//해당 병원 회원이 쓴 댓글(comment)
		ArrayList<CommentVO> cList = communityService.getCommentList(user);
		//해당 병원 회원 좋아요(recommend)
		ArrayList<RecommendVO> rList = communityService.getRecommendList(user);
		
		model.addAttribute("pList", pList);
		model.addAttribute("cList", cList);
		model.addAttribute("rList", rList);
		return "/hospital/community";
	}
	
	//한 페이지에 3개의 페이지네이션이 필요하기 때문에 @RequestParam으로 각각 보내준다.
	@ResponseBody
	@PostMapping("/hospital/community/post")
	public Map<String, Object> commentList(@RequestParam("page") int page, @RequestParam("site_id") String site_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		log.info(site_id+"site_numsite_numsite_numsite_numsite_numsite_numsite_numsite_numsite_numsite_numsite_numsite_numsite_numsite_numsite_num");
		log.info(page+"pagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepagepage");
		Criteria cri = new Criteria(page);
		cri.setPerPageNum(3);
		ArrayList<PostVO> pList = communityService.getCriPostList(cri, site_id);
		log.info(pList+"pListpListpListpListpListpListpListpListpListpListpList");
		int totalCount = communityService.getPostTotalCount(cri,site_id);
		log.info(totalCount+"pList1231231234123123123123123123123123123");
		PageMaker pm = new PageMaker(3, cri, totalCount);
		
		map.put("pList", pList);
		map.put("pm", pm);
		return map;
	}
}
