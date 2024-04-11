package kr.kh.team3.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.service.HospitalService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class AdminController {
	@Autowired
	HospitalService hospitalService;
	/* 관리자 페이지 
	 * 메서드 위에 주석으로 무슨 기능인지 쓰기
	 */
	
	// ======================== 병원 관리 ==========================
	//병원 관리 페이지
	@GetMapping("/admin/hospital")
	public String adminHospital(HospitalVO hospital,Model model) {
		//병원 전체 리스트 가져오기
		ArrayList<HospitalVO> hoList = hospitalService.hospitalList();
		log.info(hoList);
		//대기 병원 리스트 가져오기
		//신고 병원 리스트 가져오기
		model.addAttribute("hoList",hoList);
		return "/admin/hospital";
	}
	
	//대기 병원 관리 페이지
	@GetMapping("/admin/waitlist")
	public String adminWaitlist() {
		//대기 병원 리스트 가져오기
		return "/admin/waitlist";
	}
	
	
 
	// ======================== 병원 관리 끝 ==========================
	
	
	//회원가입 메인페이지
	@GetMapping("/admin/adminpage")
	public String adminpage() {
		log.info("관리자 화면");
		return "/admin/adminpage";
	}
		
	//회원 관리 페이지
	@GetMapping("/admin/member")
	public String adminMember() {
		log.info("관리자 - 회원 관리");
		return "/admin/member";
	}
}
