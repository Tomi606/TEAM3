package kr.kh.team3.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.MemberService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	 
	@GetMapping("/")
	public String home() {
		log.info("팀3 정경호");
		return "/main/home";
	}
	//회원가입 메인페이지
	@GetMapping("/main/signup")
	public String mainSignup() {
		log.info("팀3 정경호");
		return "/main/signup";
	}
	//개인 회원가입 페이지
	@GetMapping("/member/signup")
	public String memberSignup(MemberVO member,Model model) {
		log.info("개인 회원가입");
		log.info(member);
	
		model.addAttribute("member",member);
		return "/member/signup";
	}
	//개인 회원가입 페이지
	@PostMapping("/member/signup")
	public String postPemberSignup(MemberVO member,SiteManagement site) {
		log.info("개인 회원가입");
		log.info(member);
		log.info(site);
		boolean memberRes = memberService.memberSignup(member);
		boolean siteRes = memberService.siteSignup(site);
		if (!memberRes||!siteRes) {
			return "/";
		}
		
		return "/member/signup";
	}
	
	//사업자 회원가입 페이지
	@GetMapping("/hospital/signup")
	public String hospitalSignup() {
		log.info("병원 회원가입");
		return "/hospital/signup";
	}
	
	//로그인 메인 페이지
	@GetMapping("/main/login")
	public String mainLogin() {
		log.info("메인 로그인");
		return "/main/login";
	}
	//개인 로그인 페이지
	@GetMapping("/member/login")
	public String memberLogin() {
		log.info("개인 로그인");
		return "/member/login";
	}
	//사업자 로그인 페이지
	@GetMapping("/hospital/login")
	public String hospitalLogin() {
		log.info("사업자 로그인");
		return "/hospital/login";
	}
	//로그아웃 기능
	@GetMapping("/logout")
	public String logout(Model model, HttpSession session) {
		session.removeAttribute("user");
		model.addAttribute("msg", "로그아웃 했습니다.");
		model.addAttribute("url", "/");
		return "message";
	}
}
