package kr.kh.team3.controller;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
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
	public String memberSignup(Model model, SiDoVO sido,SiGoonGuVO sgg,EupMyeonDongVO emd) {
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
	public String hospitalSignup(HospitalVO hospital, Model model, String ho_id) {
		log.info("사업자 회원가입");
		
		//병원 진료과목 리스트
		ArrayList<HospitalSubjectVO> list = hospitalService.getHospitalSubjectList();
		model.addAttribute("hospital", hospital);
		model.addAttribute("list", list);
		return "/hospital/signup";
	}
	
	//사업자 회원가입 페이지(post)
	@PostMapping("/hospital/signup")
	public String hospitalSignupPost(HospitalVO hospital, SiteManagement site) {
		log.info("사업자 회원가입 post");
		
		boolean hospitalRes = hospitalService.signup(hospital);
		boolean siteRes = hospitalService.signup(site);
		if(!hospitalRes || !siteRes) {
			System.out.println("회원가입 실패");
			return "/hospital/signup";
		}
		System.out.println("회원가입 성공");
		return "/main/home";
	}
	
	//사업자 회원가입 아이디 중복 체크
	@ResponseBody
	@GetMapping("/id/check/dup")
	public Map<String, Object> idCheckDup(@RequestParam("id") String ho_id){
		Map<String, Object> map = new HashMap<String, Object>();
		HospitalVO res = hospitalService.idCheck(ho_id);
		map.put("result", res);
		return map;
	}
	
	//로그인 메인 페이지
	@GetMapping("/main/login")
	public String mainLogin() {
		log.info("메인 로그인");
		return "/main/login";
	}

	@PostMapping("/member/login")
	public String memberLoginPost(Model model, MemberVO member) {
		//member정보를 주고 아이디 비번 맞는지 확인 후
		SiteManagement user = memberService.login(member);
		log.info(user);
		model.addAttribute("user", user);//user라는 이름으로 전송
		if(user != null) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "로그인이 완료되었습니다.");
		}else {
			model.addAttribute("url", "/main/login");
			model.addAttribute("msg", "로그인에 실패했습니다.");
		}
		return "message";
	}
	
	@PostMapping("/hospital/login")
	public String hospitalLoginPost(Model model, MemberVO member) {

		/*
		//member정보를 주고 아이디 비번 맞는지 확인 후
		SiteManagement user = memberService.login(member);
		log.info(user);
		model.addAttribute("user", user);//user라는 이름으로 전송
		if(user != null) {
			model.addAttribute("url", "/");
			model.addAttribute("msg", "로그인이 완료되었습니다.");
		}else {
			model.addAttribute("url", "/main/login");
			model.addAttribute("msg", "로그인에 실패했습니다.");
		}
		*/
		return "message";
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
