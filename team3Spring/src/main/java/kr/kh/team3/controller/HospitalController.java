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
		//로그인한 회원 정보(SiteManagement에서 로그인 session 가져오고 -> HospitalVO로 가져오기)
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO huser = hospitalService.getHospital(user);

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
	
	//병원 상세 페이지 등록
	@GetMapping("/hospital/detail/insert")
	public  String detailInsert(Model model, HttpSession session) {
		//현재 로그인한 병원
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		//병원과목 리스트
		ArrayList<HospitalSubjectVO> hsList = hospitalService.getHospitalSubjectList();
		//현재 로그인한 병원이 선택했던 병원과목 가져오기
		HospitalSubjectVO selectedSubject = hospitalService.getSelectedSubject(hospital);
		
		model.addAttribute("hospital", hospital);
		model.addAttribute("hsList", hsList);
		model.addAttribute("selectedSubject", selectedSubject);
		return "/hospital/detail/insert";
	}

	//병원 상세 페이지 등록(insert)
	@PostMapping("/hospital/detail/insert")
	public String hospitalDetailPost(Model model, HospitalDetailVO detail, HttpSession session) {
		//현재 로그인한 병원
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		//병원 페이지 등록
		boolean res = hospitalService.insertHospitalDetail(detail, hospital);

		if(res) {
			model.addAttribute("msg", "게시글 등록 완료");
			model.addAttribute("url", "/hospital/mypage");
		}else {
			model.addAttribute("msg", "게시글 등록 실패");
			model.addAttribute("url", "/hospital/detail/insert");
		}
		return "message";
	}
	
	
	
	
	
	
	
	
	//병원 리스트
	@GetMapping("/hospital/list")
	public String hospitalList(Model model) {
		
		return "/hospital/list";
	}
	
}
