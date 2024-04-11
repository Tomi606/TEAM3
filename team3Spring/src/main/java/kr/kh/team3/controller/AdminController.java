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
	
	@GetMapping("/admin/hospitallist")
	public String hospitalList() {
		
		return "/admin/hospitallist";
	}
 
}
