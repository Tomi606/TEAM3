package kr.kh.team3.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.dao.ProgramDAO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import kr.kh.team3.pagination.PageMaker;
import kr.kh.team3.service.HospitalService;
import kr.kh.team3.service.MemberService;
import kr.kh.team3.service.ProgramService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class MemberController {
	@Autowired
	private HospitalService hospitalService;
	@Autowired
	MemberService memberService;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	ProgramService programService;

	/*
	 * 관리자 전용 컨트롤러 회원 관리용 게시판 리스트 부터 추가 삭제 수정 순으로 기능 구현 전부다 비동기로 진행 수업때 댓글 비동기 한거
	 * 참고하기
	 * 
	 * 메서드 위에 주석으로 무슨 기능인지 쓰기
	 */
	// 마이페이지 GET
	@GetMapping("/member/mypage")
	public String myPageGet(Model model, MemberVO member, HttpSession session,  SiDoVO sido, SiGoonGuVO sgg, EupMyeonDongVO emd) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<HospitalSubjectVO> hslist = hospitalService.selectSubject();
		ArrayList<SiDoVO> sidoList = memberService.getSiDo();
		MemberVO muser = memberService.getMemberInfo(user);

		model.addAttribute("hslist", hslist);
		model.addAttribute("member", muser);
		model.addAttribute("sidoList", sidoList);
		return "/member/mypage";
	}
	// 실명 수정 메서드 비동기
	@ResponseBody
	@PostMapping("/member/name")
	public HashMap<String, Object> nameUpdate(@RequestBody MemberVO member, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = memberService.updateName(user, member);
		MemberVO me = memberService.getMember(member);
		map.put("me", me);
		map.put("res", res);
		return map;
	}
	// 폰번호 수정 메서드 비동기
	@ResponseBody
	@PostMapping("/member/phone")
	public HashMap<String, Object> phoneUpdate(@RequestBody MemberVO member, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = memberService.updatePhone(user, member);
		MemberVO me = memberService.getMember(member);
		map.put("me", me);
		map.put("res", res);
		return map;
	}
	// 이메일 수정 메서드 비동기
	@ResponseBody
	@PostMapping("/member/email")
	public HashMap<String, Object> emailUpdate(@RequestBody MemberVO member, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = memberService.updateEmail(user, member);
		MemberVO me = memberService.getMember(member);
		map.put("me", me);
		map.put("res", res);
		return map;
	}
	// 직업 수정 메서드 비동기
	@ResponseBody
	@PostMapping("/member/job")
	public HashMap<String, Object> jobUpdate(@RequestBody MemberVO member, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO me = memberService.getMember(member);
		boolean res = memberService.updateJob(user, member);
		map.put("me", me);
		map.put("res", res);
		return map;
	}
	// 비번 수정 메서드 비동기
	@ResponseBody
	@PostMapping("/member/pw")
	public HashMap<String, Object> pwUpdate(@RequestParam("me_id") String me_id, HttpSession session,
			@RequestParam("oldPw") String oldPw, @RequestParam("newPw") String newPw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO me = memberService.getMeId(me_id);
		boolean res = memberService.updatePw(user, me_id, oldPw, newPw);
		map.put("me", me);
		map.put("res", res);
		return map;
	}
	// 주소 수정 메서드 비동기
	@ResponseBody
	@PostMapping("/member/address")
	public HashMap<String, Object> addressUpdate(@RequestParam("me_id") String me_id, HttpSession session,
			@RequestParam("la_sd_num")int la_sd_num,@RequestParam("la_sgg_num")int la_sgg_num,
			@RequestParam("la_emd_num")int la_emd_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		LandVO land = new LandVO(0,la_sd_num, la_sgg_num, la_emd_num);
		MemberVO me = memberService.getMeId(me_id);
		LandVO la = memberService.getLand(land);
		boolean res = memberService.updateAddress(user,me, la);
		user.setSite_la_num(la.getLa_num());
		session.setAttribute("user", user);
		String sd_name = memberService.getSdName(la);
		String sgg_name = memberService.getSggName(la);
		String emd_name = memberService.getEmdName(la);
		
		map.put("sd_name", sd_name);
		map.put("sgg_name", sgg_name);
		map.put("emd_name", emd_name);
		map.put("me", me);
		map.put("res", res);
		return map;
	}
	@ResponseBody
	@PostMapping("/member/subject")
	public HashMap<String, Object> subjectUpdate(@RequestParam("me_id") String me_id, HttpSession session,
			@RequestParam("me_hs_num") int hs_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO me = memberService.getMeId(me_id);
		boolean res = memberService.updateSubject(user,me,hs_num);
		MemberVO meSub = memberService.getMeId(me_id);
		HospitalSubjectVO sub = memberService.getSubject(meSub);
		map.put("sub", sub);
		map.put("me", me);
		map.put("res", res);
		return map;
	}

	// 회원 마이페이지 비동기
	@ResponseBody
	@PostMapping("/member/list")
	public HashMap<String, Object> nameList(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO muser = memberService.getMemberInfo(user);
		LandVO land = memberService.getMyLand(muser);
		HospitalSubjectVO subject = memberService.getSubject(muser);
		String sd_name = memberService.getSdName(land);
		String sgg_name = memberService.getSggName(land);
		String emd_name = memberService.getEmdName(land);
		map.put("sub", subject);
		map.put("member", muser);
		map.put("land", land);
		map.put("sd_name", sd_name);
		map.put("sgg_name", sgg_name);
		map.put("emd_name", emd_name);
		return map;
	}
	
	
	@ResponseBody
	@PostMapping("/member/gungoo")
	public ArrayList<SiGoonGuVO> postgoongoo(int sd_num) {
		ArrayList<SiGoonGuVO> sggList = memberService.getSgg(sd_num);
		return sggList;
	}

	// 시군구 번호를 읍면동한테 넘겨줘서 시군구에 있는 읍면동들을 가져오는 메서드
	@ResponseBody
	@PostMapping("/member/eupmyeondong")
	public ArrayList<EupMyeonDongVO> postEupMyeonDong(int sgg_num) {
		ArrayList<EupMyeonDongVO> emdList = memberService.getEmd(sgg_num);
		return emdList;
	}
	// 북마크 페이지
	@GetMapping("/member/bookmark")
	public String bookmark(Model model, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");

		model.addAttribute("user", user);
		return "/member/bookmark";
	}
	
	// 북마크 리스트
	@ResponseBody
	@PostMapping("/member/bookmark")
	public HashMap<String, Object> postBookmark(@RequestParam("page")int page, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page);
		cri.setPerPageNum(12);
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		
		//북마크 리스트 출력하려면
		//1. 회원 아이디 필요
		//2. 리저트맵 사용..
		ArrayList<HospitalVO> hoBmkList = hospitalService.getBmkList(user, cri);
		System.out.println("fdas;kf h6546532 " + hoBmkList);
		int totalCount = hospitalService.getBmkListCount(user, cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		map.put("pm", pm);
		map.put("list", hoBmkList);
		return map;
	}
	@GetMapping("/user/delete")
	public String userDelete(Model model, HttpSession session,MemberVO member) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = memberService.deleteMyInfo(member,user);
		if (res) {
			session.invalidate();
			model.addAttribute("url", "/");
			model.addAttribute("msg", "회원탈퇴 했습니다.");
		} else {
			model.addAttribute("url", "/member/mypage");
			model.addAttribute("msg", "회원탈퇴 실패했습니다.");
		}

		return "message";
	}
	
	
	//회원 - 예약 관리
	@GetMapping("/member/reservemgr")
	public String memberReservemgr(Model model, HttpSession session, String site_id) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		
		
		
		return "/member/reservemgr";
	}
	
	
	@ResponseBody
	@PostMapping("/member/reservemgr")
	public Map<String, Object> memberReservemgrPost(@RequestParam("page") int page, @RequestParam("type") String type, @RequestParam("search") String search, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		Criteria cri = new Criteria(page, 2, type, search);
		ArrayList<PostVO> bookList = programService.getBookList(user, cri);
		int totalCount = programService.getBookListCount(user, cri);
		PageMaker pm = new PageMaker(3, cri, totalCount);
		map.put("bookList", bookList);
		map.put("pm", pm);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/member/bookcancel")
	public boolean memberBookCancelPost(@RequestParam("rv_num") int rv_num) {
		
		boolean cancel = programService.updateRvRvsName(rv_num);
		
		return cancel;
	}

}
