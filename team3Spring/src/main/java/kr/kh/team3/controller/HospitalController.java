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

import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.HospitalService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HospitalController {
	
	@Autowired
	HospitalService hospitalService;

	@GetMapping("/hospital/mypage")//병원 마이페이지
	public String hospitalMypage(Model model, HospitalVO hospital, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		log.info(user);
		HospitalVO huser = hospitalService.getHospital(user);
		log.info(huser);
		model.addAttribute("huser",huser);
		return "/hospital/mypage";
	}

	//상세 페이지 조회
	@GetMapping("/hospital/detail2")
	public String hospitalDetail2(Model model) {
		//대표 진료 과목
		ArrayList<HospitalSubjectVO> hsList = hospitalService.getHospitalSubjectList();
		model.addAttribute("hsList", hsList);
		return "/hospital/detail2";
	}
	
	//병원 상세 페이지 조회(detail2, spring3 : /post/detail)
//	@GetMapping("/post/detail")
//	public String postDetail(Model model, int num) {
//		log.info(num);
//		//조회수 증가
//		boardService.updateView(num);
//		//상세 페이지 조회
//		BoardVO board = boardService.getPostDetail(num);
//		//첨부파일
//		ArrayList<FileVO> list = boardService.getFileList(num);
//		//화면에 게시글, 첨부파일 전송
//		model.addAttribute("board", board);
//		model.addAttribute("list", list);
//		return "/post/detail";
//	}
	
	//병원 상세 페이지 등록(insert)
	@ResponseBody
	@PostMapping("/hospital/detail/insert")
	public String hospitalDetailPost(Model model, HospitalDetailVO detail, HttpSession session) {
		
		ArrayList<HospitalSubjectVO> hsList = hospitalService.getHospitalSubjectList();
		model.addAttribute("hsList", hsList);
		
		HospitalVO hospital = (HospitalVO)session.getAttribute("hospital");
		boolean res = hospitalService.insertDetail(detail, hospital);
		
		log.info(hospital);
		log.info(res);
		if(res) {
			model.addAttribute("msg", "게시글 등록 완료");
			model.addAttribute("url", "/hospital/mypage");
		}else {
			model.addAttribute("msg", "게시글 등록 실패");
			model.addAttribute("url", "/hospital/info");
		}
		return "message";
	}
	
	//병원 상세 페이지 등록(spring3 : /post/insert)
//	@GetMapping("/post/insert")
//	public String postInsert(Model model) {
//		ArrayList<CommunityVO> list = boardService.getCommunityList();
//		log.info(list);
//		model.addAttribute("list", list);
//		model.addAttribute("title", "게시글 등록");
//		return "/post/insert";
//	}
//	
//	@PostMapping("/post/insert")
//	public String postInsertPost(Model model, BoardVO board, HttpSession session, MultipartFile [] files) {
//		MemberVO user = (MemberVO)session.getAttribute("user");
//		boolean res = boardService.insertBoard(board, user, files);
//		log.info(user);
//		log.info(board);
//		log.info(files);
//		if(res) {
//			model.addAttribute("msg", "게시글 등록 완료");
//			model.addAttribute("url", "/post/list");
//		}else {
//			model.addAttribute("msg", "게시글 등록 실패");
//			model.addAttribute("url", "/post/insert");
//		}
//		
//		return "message";
//	}
	
	
	
	//병원 리스트
	@GetMapping("/hospital/list")
	public String hospitalList(Model model) {
		
		return "/hospital/list";
	}
	
}
