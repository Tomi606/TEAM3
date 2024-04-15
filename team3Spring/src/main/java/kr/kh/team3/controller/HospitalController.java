package kr.kh.team3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HospitalController {

	
	/* 관리자 전용 컨트롤러
	 * 병원 관리용 
	 * 
	 * 메서드 위에 주석으로 무슨 기능인지 쓰기
	 */
	
	@GetMapping("/hospital/mypage")//병원 마이페이지
	public String hospitalMypage() {
		
		return "/hospital/mypage";
	}
	
	
	@GetMapping("/hospital/list")//병원리스트
	public String hospitalList() {
		
		return "/hospital/list";
	}
	
	
}
