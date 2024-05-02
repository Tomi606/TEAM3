package kr.kh.team3.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.kh.team3.service.CommunityService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class CommunityController {

	/* 마이페이지 커뮤니티 관리 컨트롤러 */
	
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("/hospital/community")
	public String hospitalCommunity(Model model) {
		log.info("병원 커뮤니티 관리 화면");
		return "/hospital/community";
	}
}
