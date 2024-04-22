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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.ReviewVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import kr.kh.team3.pagination.PageMaker;
import kr.kh.team3.service.HospitalService;
import kr.kh.team3.service.MemberService;
import kr.kh.team3.service.ProgramService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HospitalController {
	@Autowired
	MemberService memberService;
  
	@Autowired
	private HospitalService hospitalService;

	@Autowired
	ProgramService programService;
  
	//병원 마이페이지
	@GetMapping("/hospital/mypage")
	public String hospitalMypage(Model model, HospitalVO hospital, HttpSession session) {
		//로그인한 회원 정보(SiteManagement에서 로그인 session 가져오고 -> HospitalVO로 가져오기)
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO huser = hospitalService.getHospital(user);

		model.addAttribute("huser",huser);
		return "/hospital/mypage";
	}
  
	//병원 상세 페이지 조회
	@GetMapping("/hospital/detail/detail")
	public String hospitalDetail(Model model, HttpSession session, HospitalDetailVO detail, HospitalVO hospital) {
		//로그인한 병원 세션
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		//그 병원의 정보
		hospital = hospitalService.getHospital(user);
		//병원과목 리스트
		ArrayList<HospitalSubjectVO> hsList = hospitalService.getHospitalSubjectList();
		//그 병원의 상세 페이지 정보
		detail = hospitalService.getHoDetail(detail, hospital);
		
		model.addAttribute("hospital", hospital);
		model.addAttribute("hsList", hsList);
		model.addAttribute("detail", detail);

		return "/hospital/detail/detail";
	}
	
	//리뷰 리스트
	@ResponseBody
	@PostMapping("/hospital/review/list")
	public Map<String, Object> reviewList(@RequestBody Criteria cri) {
		Map<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(3); //1페이지 당 댓글 3개
		//한 페이지(cri)를 주면서 리뷰 리스트를 가져오라고 시킴
		ArrayList<ReviewVO> reviewList = hospitalService.getReviewList(cri);
		int reviewTotalCount = hospitalService.getTotalReviewCount(cri);
		PageMaker pm = new PageMaker(3, cri, reviewTotalCount);
		
		map.put("reviewList", reviewList);
		map.put("pm", pm);
		return map;
	}
	
	//리뷰 달기
//	@ResponseBody
//	@PostMapping("/hospital/review/insert")
//	public Map<String, Object> reviewInsert(@RequestBody CommentVO comment, HttpSession session){
//		Map<String, Object> map = new HashMap<String, Object>();
//		MemberVO user = (MemberVO) session.getAttribute("user");
//		//확인용
//		//System.out.println(comment);
//		//System.out.println(user);
//		boolean res = commentService.insertComment(comment, user);
//		//success의 console.log(data.result);에서 사용
//		map.put("result", res);
//		return map;
//	}
	
	//리뷰 지우기
//	@ResponseBody
//	@PostMapping("/hospital/review/delete")
//	public Map<String, Object> reviewDelete(@RequestBody CommentVO comment, HttpSession session){
//		Map<String, Object> map = new HashMap<String, Object>();
//		MemberVO user = (MemberVO) session.getAttribute("user");
//		//확인용
//		//System.out.println(comment);
//		//System.out.println(user);
//		boolean res = commentService.deleteComment(comment, user);
//		map.put("result", res);
//		return map;
//	}
	
	//리뷰 수정
//	@ResponseBody
//	@PostMapping("/hospital/review/update")
//	public Map<String, Object> reviewUpdate(@RequestBody CommentVO comment, HttpSession session){
//		Map<String, Object> map = new HashMap<String, Object>();
//		MemberVO user = (MemberVO) session.getAttribute("user");
//		//확인용
////		System.out.println(comment);
////		System.out.println(user);
//		boolean res = commentService.updateComment(comment, user);
//		map.put("result", res);
//		return map;
//	}
	
	//병원 상세 페이지 등록/수정
	@GetMapping("/hospital/detail/insert")
	public  String detailInsert(Model model, HospitalDetailVO detail, HttpSession session) {
		//현재 로그인한 병원
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		//병원과목 리스트
		ArrayList<HospitalSubjectVO> hsList = hospitalService.getHospitalSubjectList();
		//현재 로그인한 병원이 선택했던 병원과목 가져오기
		HospitalSubjectVO selectedSubject = hospitalService.getSelectedSubject(detail, hospital);
		//전에 입력했던 페이지 들고오기
		HospitalDetailVO hoDetail = hospitalService.getHoDetail(detail, hospital);
		
		model.addAttribute("hospital", hospital);
		model.addAttribute("hsList", hsList);
		model.addAttribute("selectedSubject", selectedSubject);
		model.addAttribute("hoDetail", hoDetail);
		return "/hospital/detail/insert";
	}
	//병원 상세 페이지 등록/수정
	@PostMapping("/hospital/detail/insert")
	public String hospitalDetailPost(Model model, HospitalDetailVO detail, HttpSession session) {
		//현재 로그인한 병원
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		//병원 페이지 등록
		boolean res = hospitalService.insertOrUpdateHospitalDetail(detail, hospital);

		if(res) {
			model.addAttribute("msg", "상세 페이지 수정 완료");
			model.addAttribute("url", "/hospital/mypage");
		}else {
			model.addAttribute("msg", "상세 페이지 등록 완료");
			model.addAttribute("url", "/hospital/mypage");
		}
		return "message";

	}
  
	// 병원 프로그램 등록 페이지 이동
	@GetMapping("/hospital/program/insert")
	public String hospitalProgramInsertPage(Model model) {
		
		return "/hospital/detail/programinsert";
	}
  
	// 세부 항목을 추가하는 메서드
	@ResponseBody
	@PostMapping("/item/insert")
	public Map<String, Object> insertItem(ItemVO item, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ItemVO> itemList = programService.getItemList();
		HospitalVO user = (HospitalVO) session.getAttribute("user");
		System.out.println(item);
		boolean res =  programService.insertItem(item, user);
		return map;
	}
	
	
	
	/*병원 리스트 출력 정경호,권기은*/
	@GetMapping("/hospital/list")
	public String hospitalList(HttpSession session,Model model,SiDoVO sido, SiGoonGuVO sgg, EupMyeonDongVO emd) {
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		
		ArrayList<SiDoVO> sidoList = memberService.getSiDo();
		ArrayList<HospitalVO> hoList = hospitalService.getArrHospital(user);
		ArrayList<HospitalSubjectVO> subList = hospitalService.getHospitalSubjectList();
		model.addAttribute("hoList", hoList);
		model.addAttribute("sidoList", sidoList);
		model.addAttribute("subList", subList);
		
		return "/hospital/list";
	}
	
	@ResponseBody
	@PostMapping("/hospital/emd/list")
	public ArrayList<HospitalVO> postHospital(@RequestParam("emd_num") int emd_num) {
		LandVO land = hospitalService.getLand(emd_num);
		ArrayList<HospitalVO> hoList = hospitalService.getHospital(land);
		log.info(hoList+"asdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsd");
		return hoList;
		
	}
//	@ResponseBody
//	@PostMapping("/member/signup/eupmyeondong")
//	public ArrayList<EupMyeonDongVO> postEupMyeonDong(int sgg_num) {
//		ArrayList<EupMyeonDongVO> emdList = memberService.getEmd(sgg_num);
//		return emdList;
//	}

}
