package kr.kh.team3.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.MemberService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MemberController {
	@Autowired
	MemberService memberService;
	
	/* 관리자 전용 컨트롤러
	 * 회원 관리용 
	 * 게시판 리스트 부터 추가 삭제 수정 순으로 기능 구현
	 * 전부다 비동기로 진행 수업때 댓글 비동기 한거 참고하기
	 * 
	 * 메서드 위에 주석으로 무슨 기능인지 쓰기
	 */
	@GetMapping("/member/mypage")
	public String myPageGet(Model model,MemberVO member,HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<SiDoVO> sidoList = memberService.getSiDo();
		MemberVO muser = memberService.getMemberInfo(user);
		
		model.addAttribute("member",muser);
		model.addAttribute("sidoList",sidoList);
		return "/member/mypage";
	}
	
	//실명 수정 메서드 비동기
	@ResponseBody
	@PostMapping("/member/name")
	public HashMap<String, Object> nameUpdate(@RequestBody MemberVO member,HttpSession session){
		HashMap<String, Object> map= new HashMap<String, Object>();
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		boolean res = memberService.updateName(user,member);
		MemberVO me = memberService.getMember(member);
		map.put("me",me);
		map.put("res",res);
		return map;
	}
	//폰번호 수정 메서드 비동기
	@ResponseBody
	@PostMapping("/member/phone")
	public HashMap<String, Object> phoneUpdate(@RequestBody MemberVO member,HttpSession session){
		HashMap<String, Object> map= new HashMap<String, Object>();
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		boolean res = memberService.updatePhone(user,member);
		MemberVO me = memberService.getMember(member);
		map.put("me",me);
		map.put("res",res);
		return map;
	}
	
	//이메일 수정 메서드 비동기
/*	@ResponseBody
	@PostMapping("/member/email")
	public HashMap<String, Object> emailUpdate(@RequestBody MemberVO member,HttpSession session){
		HashMap<String, Object> map= new HashMap<String, Object>();
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		boolean res = memberService.updateEmail(user,member);
		MemberVO me = memberService.getMember(member);
		map.put("me",me);
		map.put("res",res);
		return map;
	}*/
	//직업 수정 메서드 비동기
/*	@ResponseBody
	@PostMapping("/member/phone")
	public HashMap<String, Object> jobUpdate(@RequestBody MemberVO member,HttpSession session){
		HashMap<String, Object> map= new HashMap<String, Object>();
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		boolean res = memberService.updateJob(user,member);
		MemberVO me = memberService.getMember(member);
		map.put("me",me);
		map.put("res",res);
		return map;
	}*/
	
	
	//회원 마이페이지 비동기 
	@ResponseBody
	@PostMapping("/member/list")
	public HashMap<String, Object> nameList(HttpSession session){
		HashMap<String, Object> map= new HashMap<String, Object>();
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		MemberVO muser = memberService.getMemberInfo(user);
		map.put("member",muser);
		return map;
	}

}
