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
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.BoardService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
//게시판 컨트롤러
public class BoardController {

	/*
	 * 관리자 전용 컨트롤러 게시판 관리용 게시판 리스트 부터 추가 삭제 수정 순으로 기능 구현 전부다 비동기로 진행 수업때 댓글 비동기 한거
	 * 참고하기
	 * 
	 * 메서드 위에 주석으로 무슨 기능인지 쓰기
	 */
	@Autowired
	private BoardService boardService;

	@GetMapping("/board/all")
	public String boardAll(Model model) {
		ArrayList<BoardVO> boList = boardService.getAllBoardList();
		ArrayList<PostVO> poList = boardService.getAllPostList();
		log.info(poList);
		model.addAttribute("boList", boList);
		model.addAttribute("poList", poList);
		return "/board/all";
	}

	@GetMapping("/board/list")
	public String boardList(Model model, int bo_num) {
		String bo_name = boardService.getBoardName(bo_num);
		ArrayList<PostVO> poList = boardService.getPostList(bo_num);
		model.addAttribute("bo_num", bo_num);
		model.addAttribute("bo_title", bo_name);
		model.addAttribute("poList", poList);
		return "/board/list";
	}

	@GetMapping("/board/insert")
	public String boardInsertGet(Model model,HttpSession session,int bo_num) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if(user == null) {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
			model.addAttribute("url","/main/login");
			return "message";
		}
		
		model.addAttribute("bo_num", bo_num);
		return "/board/insert";
	}

	@PostMapping("/board/insert")
	public String boardInsertPost(Model model, PostVO post, MultipartFile[] files, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = boardService.insertPost(user, post, files);
		if (!res) {
			model.addAttribute("msg", "게시글을 등록하지 못했습니다.");
			model.addAttribute("url", "/board/insert?bo_num="+post.getPo_bo_num());
		} else {
			model.addAttribute("msg", "게시글이 등록 되었습니다.");
			model.addAttribute("url", "/board/list?bo_num="+post.getPo_bo_num()); // 임시 구현 완료되면 디테일로 url변경
		}
		return "message";
	}
	
	@GetMapping("/board/detail")
	public String boardDetailGet(Model model,HttpSession session,int po_num) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if(user == null) {
			model.addAttribute("msg","로그인이 필요한 서비스입니다.");
			model.addAttribute("url","/main/login");
			return "message";
		}
		boardService.updateView(po_num);
		PostVO post = boardService.getPostDetail(po_num);
		model.addAttribute("post",post);
		
		return "/board/detail";
	}
	
	@ResponseBody
	  @PostMapping("/recommend/check")
	  public Map<String, Object> recommendCheck(@RequestBody RecommendVO recommend, HttpSession session){
	    Map<String, Object> map = new HashMap<String, Object>();
	    SiteManagement user = (SiteManagement) session.getAttribute("user");
	    int res = boardService.recommend(recommend, user);
	    map.put("result", res);
	    return map;
	  }
	  
	  @ResponseBody
	  @PostMapping("/recommend")
	  public Map<String, Object> recommend(@RequestParam("num") int num, HttpSession session){
	    Map<String, Object> map = new HashMap<String, Object>();
	    //로그인한 회원의 추천 정보
	    SiteManagement user = (SiteManagement) session.getAttribute("user");
	    int state = boardService.getUserRecommend(num, user);
	    //게시글의 추천/비추천수를 가져옴
	    PostVO post = boardService.getPost(num);
	    map.put("state", state);
	    map.put("post", post);
	    return map;
	  }
	
	
	
	
	
	
	
	
	
	
	
	

}
