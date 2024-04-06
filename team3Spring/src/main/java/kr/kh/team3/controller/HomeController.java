package kr.kh.team3.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.HospitalService;
import kr.kh.team3.service.MemberService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HomeController {
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	private HospitalService hospitalService;
	 
	@GetMapping("/")
	public String home() {
		log.info("홈화면");
		return "/main/home";
	}
	
	//회원가입 메인페이지
	@GetMapping("/main/signup")
	public String mainSignup() {
		log.info("회원가입 화면");
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
	public String hospitalSignup(HospitalVO hospital, Model model) {
		log.info("사업자 회원가입");
		
		model.addAttribute("hospital", hospital);
		return "/hospital/signup";
	}
	
	//사업자 회원가입 페이지(post)
	@PostMapping("/hospital/signup")
	public String hospitalSignupPost(HospitalVO hospital, SiteManagement site) {
		log.info("사업자 회원가입 post");
		
		boolean hospitalRes = hospitalService.signup(hospital);
		boolean siteRes = hospitalService.signup(site);
		if(!hospitalRes || !siteRes) {
			log.info(hospital);
			log.info(site);
			System.out.println("회원가입 실패");
			return "/hospital/signup";
		}
		System.out.println("회원가입 성공");
		return "/main/home";
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
	public String hospitalLogin(HospitalVO hospital) {
		log.info("사업자 로그인");
		log.info(hospital.getHo_id());
		log.info(hospital.getHo_pw());
		log.info(hospital.getHo_num());
		return "/hospital/login";
	}
	
}
