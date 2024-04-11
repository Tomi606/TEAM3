package kr.kh.team3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class AdminController {
	
	/* 관리자 페이지 
	 * 메서드 위에 주석으로 무슨 기능인지 쓰기
	 */
 

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
