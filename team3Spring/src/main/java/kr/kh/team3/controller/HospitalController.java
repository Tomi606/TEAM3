package kr.kh.team3.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.BookmarkVO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.HsListVO;
import kr.kh.team3.model.vo.ItemListVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.ReviewVO;
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
public class HospitalController {

	@Autowired
	MemberService memberService;

	@Autowired
	private HospitalService hospitalService;

	@Autowired
	ProgramService programService;

	//병원 마이페이지
	@GetMapping("/hospital/mypage")
	public String myPage(Model model, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		ArrayList<HospitalSubjectVO> hsList = hospitalService.selectSubject();
		ArrayList<SiDoVO> sidoList = memberService.getSiDo();

		model.addAttribute("hospital", hospital);
		model.addAttribute("hsList", hsList);
		model.addAttribute("sidoList", sidoList);
		return "/hospital/mypage";
	}
	
	//병원 마이페이지 비동기
	@ResponseBody
	@PostMapping("/hospital/list")
	public HashMap<String, Object> myPagePost(HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		HospitalSubjectVO hs = hospitalService.getSubject(hospital);
		LandVO land = hospitalService.getMyLand(hospital);
		String sd_name = hospitalService.getSdName(land);
		String sgg_name = hospitalService.getSggName(land);
		String emd_name = hospitalService.getEmdName(land);
		
		map.put("hospital", hospital);
		map.put("hs", hs);
		map.put("land", land);
		map.put("sd_name", sd_name);
		map.put("sgg_name", sgg_name);
		map.put("emd_name", emd_name);
		return map;
	}
	
	//상호명 수정
	@ResponseBody
	@PostMapping("/hospital/name")
	public HashMap<String, Object> nameUpdate(@RequestBody HospitalVO hospital, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = hospitalService.updateName(user, hospital);
		HospitalVO ho = hospitalService.getHo(hospital);
		
		map.put("res", res);
		map.put("ho", ho);
		return map;
	}
	
	//비번 수정
	@ResponseBody
	@PostMapping("/hospital/pw")
	public HashMap<String, Object> pwUpdate(@RequestParam("ho_id") String ho_id, HttpSession session,
			@RequestParam("oldPw") String oldPw, @RequestParam("newPw") String newPw) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO ho = hospitalService.getHoId(ho_id);
		boolean res = hospitalService.updatePw(user, ho_id, oldPw, newPw);
		map.put("ho", ho);
		map.put("res", res);
		return map;
	}
	
	//대표자명 수정
	@ResponseBody
	@PostMapping("/hospital/ceo")
	public HashMap<String, Object> ceoUpdate(@RequestBody HospitalVO hospital, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = hospitalService.updateCEO(user, hospital);
		HospitalVO ho = hospitalService.getHo(hospital);
		
		map.put("res", res);
		map.put("ho", ho);
		return map;
	}
	
	//대표 전화번호 수정
	@ResponseBody
	@PostMapping("/hospital/phone")
	public HashMap<String, Object> phoneUpdate(@RequestBody HospitalVO hospital, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = hospitalService.updatePhone(user, hospital);
		HospitalVO ho = hospitalService.getHo(hospital);
		
		map.put("res", res);
		map.put("ho", ho);
		return map;
	}
	
	//이메일 수정
	@ResponseBody
	@PostMapping("/hospital/email")
	public HashMap<String, Object> emailUpdate(@RequestBody HospitalVO hospital, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = hospitalService.updateEmail(user, hospital);
		HospitalVO ho = hospitalService.getHo(hospital);
		
		map.put("res", res);
		map.put("ho", ho);
		return map;
	}
	
	//상세주소 수정
	@ResponseBody
	@PostMapping("/hospital/detail/address")
	public HashMap<String, Object> detailAddressUpdate(@RequestBody HospitalVO hospital, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res = hospitalService.updateDetailAddress(user, hospital);
		HospitalVO ho = hospitalService.getHo(hospital);
		
		map.put("res", res);
		map.put("ho", ho);
		return map;
	}
	
	//대표 진료과목 수정
	@ResponseBody
	@PostMapping("/hospital/subject")
	public HashMap<String, Object> subjectUpdate(@RequestParam("ho_id") String ho_id, HttpSession session,
			@RequestParam("ho_hs_num") int hs_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO ho = hospitalService.getHoId(ho_id);
		boolean res = hospitalService.updateSubject(user, ho, hs_num);
		HospitalVO hoSub = hospitalService.getHoId(ho_id);
		HospitalSubjectVO sub = hospitalService.getSubject(hoSub);
		
		map.put("ho", ho);
		map.put("sub", sub);
		map.put("res", res);
		return map;
	}
	
	//주소 수정
	@ResponseBody
	@PostMapping("/hospital/address")
	public HashMap<String, Object> addressUpdate(@RequestParam("ho_id") String ho_id, HttpSession session,
			@RequestParam("la_sd_num")int la_sd_num, @RequestParam("la_sgg_num") int la_sgg_num,
			@RequestParam("la_emd_num")int la_emd_num) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		LandVO land = new LandVO(0,la_sd_num, la_sgg_num, la_emd_num);
		HospitalVO ho = hospitalService.getHoId(ho_id);
		LandVO la = hospitalService.getWholeLand(land);
		boolean res = hospitalService.updateAddress(user, ho, la);
		user.setSite_la_num(la.getLa_num());
		session.setAttribute("user", user);
		String sd_name = hospitalService.getSdName(la);
		String sgg_name = hospitalService.getSggName(la);
		String emd_name = hospitalService.getEmdName(la);
		
		map.put("sd_name", sd_name);
		map.put("sgg_name", sgg_name);
		map.put("emd_name", emd_name);
		map.put("ho", ho);
		map.put("res", res);
		return map;
	}
	
	@ResponseBody
	@PostMapping("/hospital/gungoo")
	public ArrayList<SiGoonGuVO> postgoongoo(int sd_num) {
		ArrayList<SiGoonGuVO> sggList = hospitalService.getSgg(sd_num);
		return sggList;
	}

	//시군구 번호를 읍면동한테 넘겨줘서 시군구에 있는 읍면동들을 가져오는 메서드
	@ResponseBody
	@PostMapping("/hospital/eupmyeondong")
	public ArrayList<EupMyeonDongVO> postEupMyeonDong(int sgg_num) {
		ArrayList<EupMyeonDongVO> emdList = hospitalService.getEmd(sgg_num);
		return emdList;
	}

	//회원 입장에서 상페 페이지 조회시
	@GetMapping("/hospital/detail/detail")
	public String hospitalDetail(Model model, Integer hdNum, HospitalVO ho) {
		//상세 페이지를 가져옴(임시!!!!!!!!!!!!!!!!!!!!!!!!!)
//		hdNum = 1;
		hdNum = 2;
		HospitalDetailVO detail = hospitalService.getDetail(hdNum);
		//병원과목 리스트
		ArrayList<HospitalSubjectVO> sub = hospitalService.getDetailSubject(detail.getHd_ho_id());
		
		model.addAttribute("detail", detail);
		model.addAttribute("sub", sub);
		return "/hospital/detail/detail";
	}

	//리뷰 리스트
	@ResponseBody
	@PostMapping("/hospital/review/list")
	public Map<String, Object> reviewList(@RequestBody Criteria cri, Integer hdNum) {
		Map<String, Object> map = new HashMap<String, Object>();
		cri.setPerPageNum(3); //1페이지 당 댓글 3개
		//병원 상세 페이지 번호를 주면서 상세 페이지 들고오라 시킴
		HospitalDetailVO detail = hospitalService.getDetail(hdNum);
		//한 페이지(cri)를 주면서 리뷰 리스트를 가져오라고 시킴
		ArrayList<ReviewVO> reviewList = hospitalService.getCriReviewList(cri);
		//페이지네이션
		int reviewTotalCount = hospitalService.getTotalReviewCount(cri);
		PageMaker pm = new PageMaker(3, cri, reviewTotalCount);
		
		map.put("detail", detail);
		map.put("reviewList", reviewList);
		map.put("pm", pm);
		return map;
	}
	
	//리뷰 등록
	@ResponseBody
	@PostMapping("/hospital/review/insert")
	public Map<String, Object> reviewInsert(@RequestBody ReviewVO review, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO member = memberService.getSiteMember(user);
		boolean res = hospitalService.insertReview(review, member);
		
		map.put("result", res);
		return map;
	}
	
	//리뷰 삭제
	@ResponseBody
	@PostMapping("/hospital/review/delete")
	public Map<String, Object> reviewDelete(@RequestBody ReviewVO review, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO member = memberService.getSiteMember(user);

		boolean res = hospitalService.deleteReview(review, member);
		map.put("result", res);
		return map;
	}

	//리뷰 수정
	@ResponseBody
	@PostMapping("/hospital/review/update")
	public Map<String, Object> reviewUpdate(@RequestBody ReviewVO review, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO member = memberService.getSiteMember(user);

		boolean res = hospitalService.updateReview(review, member);
		map.put("result", res);
		return map;
	}
	
	//병원 상세 페이지 등록/수정
	@GetMapping("/hospital/detail/insert")
	public String detailInsert(Model model, HospitalDetailVO detail, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		//병원과목 리스트
		ArrayList<HospitalSubjectVO> hsList = hospitalService.getHospitalSubjectList();
		//현재 로그인한 병원이 회원가입 시 선택했던 과목
		HospitalVO firstSubject = hospitalService.getHsNum(hospital);
		//상세 페이지에서 선택했던 병원 과목 리스트
		ArrayList<HsListVO> subjects = hospitalService.getSubjects(hospital);
		//전에 입력했던 페이지 들고오기
		HospitalDetailVO hoDetail = hospitalService.getHoDetail(detail, hospital);

		model.addAttribute("hospital", hospital);
		model.addAttribute("hsList", hsList);
		model.addAttribute("firstSubject", firstSubject);
		model.addAttribute("subjects", subjects);
		model.addAttribute("hoDetail", hoDetail);
		return "/hospital/detail/insert";
	}

	//병원 상세 페이지 등록/수정
	@ResponseBody
	@PostMapping("/hospital/detail/insert")
	public Map<String, Object> detailInsertPost(HttpSession session, @RequestBody HospitalDetailVO detail) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		//병원 페이지 등록
		boolean res = hospitalService.insertDetail(detail, hospital);
		if(res) {
			map.put("msg", "상세 페이지 수정 완료");
			map.put("url", "/hospital/mypage");
		} else {
			map.put("msg", "상세 페이지 등록 완료");
			map.put("url", "/hospital/mypage");
		}
		return map;
	}
	
	//회원 입장에서 북마크 추가
	//RecommendVO == BookmarkVO
	@ResponseBody
	@PostMapping("/bookmark/insert")
	public Map<String, Object> bookmarkInsert(@RequestBody BookmarkVO bookmark, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		//로그인 세션 확인
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO member = memberService.getMemberInfo(user);
		//북마크할 병원 페이지 번호(임시!!!!!!!!!!!!!)
//		int hdNum = 1;
		int hdNum = 2;
		//페이지 번호로 병원 아이디 들고오기
		HospitalDetailVO detail = hospitalService.getDetailId(hdNum);
		//북마크 하기(회원)
		boolean result = memberService.insertBookmark(bookmark, member, detail.getHd_ho_id());
		//이미 북마크함(남기기 위함)
		BookmarkVO already = memberService.selectBookmark(bookmark, member, detail);
		
		map.put("user", user);
		map.put("detail", detail);
		map.put("result", result);
		map.put("already", already);
		return map;
	}
	
	//북마크 해제 -> delete from bookmark where bmk_me_id = #{me_id}
	@ResponseBody
	@PostMapping("/bookmark/delete")
	public Map<String, Object> bookmarkDelete(@RequestBody BookmarkVO bookmark, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		//로그인 세션 확인
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO member = memberService.getMemberInfo(user);
		//북마크할 병원 페이지 번호(임시!!!!!!!!!!!!!)
//		int hdNum = 1;
		int hdNum = 2;
		//페이지 번호로 병원 아이디 들고오기
		HospitalDetailVO detail = hospitalService.getDetailId(hdNum);
		boolean result = memberService.deleteBookmark(bookmark, member, detail);
		
		map.put("user", user);
		map.put("detail", detail);
		map.put("result", result);
		return map;
	}
	
  //================================================ 조민석 ====================================================
	// 병원 프로그램 등록 페이지 이동
	@GetMapping("/hospital/item/insert")
	public String hospitalProgramInsertPage(Model model, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<ItemVO> itemList = programService.getItemList(user);
		ArrayList<HospitalProgramVO> programList = programService.getProgramList(user); 
		model.addAttribute("programList",programList);
		model.addAttribute("itemList", itemList);
		return "/hospital/detail/iteminsert";
	}
	// 세부 항목을 추가하는 메서드
	@ResponseBody
	@PostMapping("/item/insert")
	public Map<String, Object> insertItem(ItemVO item, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<ItemVO> itemList = programService.getItemList(user);
		boolean res =  programService.insertItem(item, user);
		if(res) {
			map.put("itemList", itemList);
		}else {
			map.put("msg", "추가에 실패했습니다.");
		}
		return map;
	}
	
	//세부항목 수정 메서드
	@GetMapping("/item/update")
	public String updateItem(ItemVO item, HttpSession session, Model model) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		 ArrayList<ItemVO> itemList = programService.getItemList(user); 
		 model.addAttribute("itemList", itemList);
		
		return "/hospital/detail/itemupdate";
	}
	
	//세부항목 수정 메서드
	@PostMapping("/item/update")
	public String updateItemPost(ItemVO item, HttpSession session, Model model, @RequestParam("type") int it_num) {

		SiteManagement user = (SiteManagement) session.getAttribute("user");
		 ArrayList<ItemVO> itemList = programService.getItemList(user); 
		 boolean res =programService.updateItem(item, user, it_num, itemList);
		 if (res) {
				model.addAttribute("msg","상세 항목 수정을 완료했습니다.");
				model.addAttribute("url","/hospital/item/insert");
			}else {
				model.addAttribute("msg","상세 항목 수정에 실패 했습니다.");
				model.addAttribute("url","/item/update");
			}
			return "message";
	}
	
	//세부 항목 삭제 메서드
	@ResponseBody
	@PostMapping("/item/delete")
	 public Map<String, Object> deleteItem(@RequestParam("checkedValues[]") ArrayList<Integer> list){
		Map<String, Object> map = new HashMap<String, Object>();
      
        boolean res = programService.deleteItem(list);
		
		if (res) { 
		 map.put("msg", "삭제에 성공했습니다."); 
		} else { 
			map.put("msg","삭제에 실패했습니다."); 
		} 
		 return map;
    }
	
	// 프로그램을 추가하는 메서드
	@ResponseBody
	@PostMapping("/program/insert")
	public Map<String, Object> insertProgram(HospitalProgramVO program, HttpSession session,
			@RequestParam("list[]") ArrayList<Integer> list) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		boolean res =  programService.insertProgram(program, user, list);
		if(res) {
			map.put("msg", "추가에 성공했습니다.");
		}else {
			map.put("msg", "추가에 실패했습니다.");
		}
		return map;
	}
	

	
	//프로그램 수정 메서드
	@GetMapping("/program/update")
	public String updateUpdate(HospitalProgramVO program, HttpSession session, Model model) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		 ArrayList<HospitalProgramVO> programList = programService.getProgramList(user); 
		 ArrayList<ItemVO> itemList = programService.getItemList(user); 
		 model.addAttribute("programList", programList);
		 model.addAttribute("itemList", itemList);
		return "/hospital/detail/programupdate";
	}
	
	//프로그램 수정 메서드
	@ResponseBody
	@PostMapping("/program/update")
	public String updateUpdatePost(HospitalProgramVO program, HttpSession session,
			@RequestParam("list[]") ArrayList<Integer> list, Model model) {
		
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		
		boolean resDle = programService.deleteProgram(program.getHp_num());; 
		if(resDle) {
			boolean resIns = programService.insertProgram(program, user, list);
			 if (resIns) {
					model.addAttribute("msg","프로그램 수정을 완료했습니다.");
					model.addAttribute("url","/hospital/item/insert");
					return "message";
			 }
		}
		model.addAttribute("msg","프로그램 수정에 실패 했습니다.");
		model.addAttribute("url","/program/update");
		return "message";
	}
	
	//프로그램 삭제 메서드
	@GetMapping("/program/delete")
	public String deleteprogram(Model model, int hp_num) {
		boolean res = programService.deleteProgram(hp_num);
		
		if (res) {
			model.addAttribute("msg","프로그램 삭제를 완료했습니다.");
			model.addAttribute("url","/hospital/item/insert");
		}else {
			model.addAttribute("msg","프로그램 삭제를 실패 했습니다.");
			model.addAttribute("url","/program/update");
		}
		return "message";
	}
	
	//프로그램 조회 메서드
	@GetMapping("/program/check")
	public String checkprogram(Model model, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<ItemVO> itemList = programService.getItemList(user);
		ArrayList<HospitalProgramVO> programList = programService.getProgramList(user);
		
		model.addAttribute("programList",programList);
		model.addAttribute("itemList", itemList);
		return "/hospital/programcheck";
	}
	
	// 프로그램에 속한 리스트를 조회하는 메서드
	@ResponseBody
	@PostMapping("/itemlist/check")
	public Map<String, Object> selectItemList(@RequestParam("hp_num") int hp_num, HttpSession session ) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<ItemListVO> itemListList = programService.getProgramItemList(user, hp_num);
		map.put("itemListList", itemListList);
		return map;
	}

	@PostMapping("/itemlist/check2")
	public String selectItemList2(Model model, @RequestParam("hp_num") int hp_num, HttpSession session ) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<ItemListVO> itemListList = programService.getProgramItemList(user, hp_num);
		model.addAttribute("itemListList", itemListList);
		return "itemforeach";
	}
	// 프로그램 리스트 속한 아이템을 조회하는 메서드
	@ResponseBody
	@PostMapping("/item/check")
	public Map<String, Object> selectItem(@RequestParam("il_num") int il_num, HttpSession session ) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<ItemVO> itemList = programService.getItemListByItem(il_num);
		map.put("itemList", itemList);
		return map;
	}
	//============================================= 조민석 ===================================================
	/*병원 리스트 출력 정경호,권기은*/
	@GetMapping("/hospital/list")
	public String hospitalList(HttpSession session, Model model, int hs_num) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}
		ArrayList<HospitalSubjectVO> list = hospitalService.selectSubject();
		model.addAttribute("list", list);
		ArrayList<SiDoVO> sidoList = memberService.getSiDo();
		LandVO la = memberService.getMyLand(user);
		model.addAttribute("sidoList", sidoList);
		model.addAttribute("la", la);
		model.addAttribute("hs_num", hs_num);
		
		return "/hospital/list";
	}

	@ResponseBody
	@PostMapping("/hospital/emd/list")
	public Map<String, Object> postHospital(@RequestParam("emd_num") int emd_num, int hs_num, String search, @RequestParam("page")int page) {
		//log.info(search + "    검색어검색어검색어검색어검색어검색어검색어검색어검색어검색어검색어검색어검색어검색어검색어검색어검색어");
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page, 12, null, search);
		//cri.setPerPageNum(12);
		LandVO land = hospitalService.getLand(emd_num);
		ArrayList<HospitalVO> hoList;
		int totalCount;
		if(hs_num == 0) {
			hoList = hospitalService.getHospitalSubAll(land,cri);
			totalCount = hospitalService.getHospitalSubAllCount(land,cri);
		}else {
			hoList = hospitalService.getHospitalEmd(land, hs_num, cri);
			totalCount = hospitalService.getHospitalCountEmd(land, hs_num, cri);
		}
		log.info(hoList + "hoListhoListhoListhoListhoListhoListhoListhoListhoListhoListhoListhoListhoList");
		PageMaker pm = new PageMaker(5, cri, totalCount);
		map.put("pm", pm);
		map.put("hoList", hoList);
		return map;

	}
	@ResponseBody
	@PostMapping("/hospital/like/list")
	public  Map<String, Object> postLiHospital(@RequestParam("emd_num") int emd_num,HttpSession session,@RequestParam("page")int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page);
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO me = memberService.getMeId(user.getSite_id());
		LandVO land = hospitalService.getLand(emd_num);
		cri.setPerPageNum(8);
		int totalCount = hospitalService.getLikeSub(me,land,cri);
		ArrayList<HospitalVO> hoSubList = hospitalService.getSubHoList(me, land,cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		log.info(hoSubList + "hoSubListhoSubListhoSubListhoSubListhoSubListhoSubListhoSubListhoSubListhoSubListhoSubListhoSubListhoSubList");
		map.put("pm", pm);
		map.put("hoSubList",hoSubList);
		return map;

	}
	
	@ResponseBody
	@PostMapping("/hospital/area/name")
	public Map<String, Object> areaName(@RequestParam("sd_num") int sd_num, @RequestParam("sgg_num") int sgg_num, @RequestParam("emd_num") int emd_num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		LandVO land = new LandVO(0, sd_num, sgg_num, emd_num);
		String sd_name = memberService.getSdName(land);
		String sgg_name = memberService.getSggName(land);
		String emd_name = memberService.getEmdName(land);
		
		map.put("sd_name", sd_name);
		map.put("sgg_name", sgg_name);
		map.put("emd_name", emd_name);
		return map;

	}

}
