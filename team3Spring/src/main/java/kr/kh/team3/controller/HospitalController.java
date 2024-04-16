package kr.kh.team3.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.HospitalService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HospitalController {
	@Autowired
	HospitalService hospitalService;
	
	/* 관리자 전용 컨트롤러
	 * 병원 관리용 
	 * 
	 * 메서드 위에 주석으로 무슨 기능인지 쓰기
	 */
	
	@GetMapping("/hospital/mypage")//병원 마이페이지
	public String hospitalMypage(Model model,HospitalVO hospital,HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO huser = hospitalService.getHospital(user);
		model.addAttribute("huser",huser);
		return "/hospital/mypage";
	}
	
	
	@GetMapping("/hospital/list")//병원리스트
	public String hospitalList() {
		
		return "/hospital/list";
	}
	
	
}
