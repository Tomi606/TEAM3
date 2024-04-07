package kr.kh.team3.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
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
	public String memberSignup(Model model, SiDoVO sido,SiGoonGuVO sgg,EupMyeonDongVO emd) {
		log.info("개인 회원가입");
		
		ArrayList<SiDoVO> sidoList = memberService.getSiDo();
		ArrayList<SiDoVO> sggList = memberService.getSgg();
		ArrayList<SiDoVO> emdList = memberService.getEmd();
		model.addAttribute("sidoList",sidoList);
		model.addAttribute("sggList",sggList);
		model.addAttribute("emdList",emdList);
		return "/member/signup";
	}
	//개인 회원가입 페이지
	@PostMapping("/member/signup")
	public String postPemberSignup(Model model,MemberVO member,SiteManagement site,SiDoVO sido,SiGoonGuVO sgg) {
		log.info("개인 회원가입");
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
	
}
