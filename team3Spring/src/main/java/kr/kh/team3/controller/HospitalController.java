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

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.HsListVO;
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
	public String hospitalMypage(Model model, HospitalVO hospital, HttpSession session) {
		// 로그인한 회원 정보(SiteManagement에서 로그인 session 가져오고 -> HospitalVO로 가져오기)
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO huser = hospitalService.getHospital(user);

		model.addAttribute("huser", huser);
		return "/hospital/mypage";
	}

	//회원 입장에서 상페 페이지 조회시
	@GetMapping("/hospital/detail/detail")
	public String hospitalDetail(Model model, Integer hdNum, Integer vwNum) {
		//상세 페이지를 가져옴(임시)
		hdNum = 22;
		HospitalDetailVO detail = hospitalService.getDetail(hdNum);

		//병원과목 리스트
		ArrayList<HospitalSubjectVO> hsList = hospitalService.getHospitalSubjectList();
		model.addAttribute("detail", detail);
		model.addAttribute("hsList", hsList);
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
		HospitalVO fisrtSubject = hospitalService.getHsNum(hospital);
		//전에 선택했던 병원 과목 리스트
		ArrayList<HsListVO> subjects = hospitalService.getSubjects(hospital);
		//이미 전에 등록한 병원 과목 리스트(hs_list)가 있으면 그것을 불러오기 -> jsp에서
		//전에 입력했던 페이지 들고오기
		HospitalDetailVO hoDetail = hospitalService.getHoDetail(detail, hospital);

		model.addAttribute("hospital", hospital);
		model.addAttribute("hsList", hsList);
		model.addAttribute("fisrtSubject", fisrtSubject);
		model.addAttribute("subjects", subjects);
		model.addAttribute("hoDetail", hoDetail);
		return "/hospital/detail/insert";
	}

	// 병원 상세 페이지 등록/수정
	@PostMapping("/hospital/detail/insert")
	public String detailInsertPost(Model model, HospitalDetailVO detail, HttpSession session) {
		// 현재 로그인한 병원
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		// 병원 페이지 등록
		boolean res = hospitalService.insertOrUpdateHospitalDetail(detail, hospital);

		if (res) {
			model.addAttribute("msg", "상세 페이지 수정 완료");
			model.addAttribute("url", "/hospital/mypage");
		} else {
			model.addAttribute("msg", "상세 페이지 등록 완료");
			model.addAttribute("url", "/hospital/mypage");
		}
		return "message";

	}
	
  //================================================ 조민석 ====================================================
	// 병원 프로그램 등록 페이지 이동
	@GetMapping("/hospital/item/insert")
	public String hospitalProgramInsertPage(Model model, HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<ItemVO> itemList = programService.getItemList(user);
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
		 //boolean res =programService.insertItem(item, user);
		 model.addAttribute("itemList", itemList);
		
		return "/hospital/detail/itemupdate";
	}
	
	//세부항목 수정 메서드
	@PostMapping("/item/update")
	public String updateItemPost(ItemVO item, HttpSession session, Model model, @RequestParam("type") int it_num) {
		System.out.println("asfasfdas" + item);
		System.out.println("asfqwef" + it_num);
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
	 public Map<String, Object> deleteItem(@RequestParam(value="li_list", required=true) ArrayList<Integer> li_list){
		Map<String, Object> map = new HashMap<String, Object>();
        
        boolean res = programService.deleteItem(li_list);
        if (res) {
            map.put("msg", "삭제에 성공했습니다.");
        } else {
            map.put("msg", "삭제에 실패했습니다.");
        }
        return map;
    }
	
	// 프로그램을 추가하는 메서드
	@ResponseBody
	@PostMapping("/program/insert")
	public Map<String, Object> insertProgram(HospitalProgramVO program, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<HospitalProgramVO> programList = programService.getProgramList(user);
		boolean res =  programService.insertProgram(program, user);
		if(res) {
			map.put("programList", programList);
		}else {
			map.put("msg", "추가에 실패했습니다.");
		}
		return map;
	}
	//============================================= 조민석 ===================================================
	/*병원 리스트 출력 정경호,권기은*/
	@GetMapping("/hospital/list")
	public String hospitalList(HttpSession session, Model model, SiDoVO sido, SiGoonGuVO sgg, EupMyeonDongVO emd) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		if (user == null) {
			model.addAttribute("msg", "로그인이 필요한 서비스입니다.");
			model.addAttribute("url", "/main/login");
			return "message";
		}
		ArrayList<SiDoVO> sidoList = memberService.getSiDo();
		ArrayList<HospitalVO> hoList = hospitalService.getArrHospital(user);
		MemberVO me = memberService.getMeId(user.getSite_id());
		ArrayList<HospitalVO> likeSubList = memberService.getMySubject(me);
		LandVO la = memberService.getMyLand(user);
		model.addAttribute("like", likeSubList);
		model.addAttribute("hoList", hoList);
		model.addAttribute("sidoList", sidoList);
		model.addAttribute("la", la);
		return "/hospital/list";
	}

	@ResponseBody
	@PostMapping("/hospital/emd/list")
	public Map<String, Object> postHospital(@RequestParam("emd_num") int emd_num,@RequestParam("page")int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		Criteria cri = new Criteria(page);
		LandVO land = hospitalService.getLand(emd_num);
		cri.setPerPageNum(12);
		ArrayList<HospitalVO> hoList = hospitalService.getHospital(land,cri);
		log.info(hoList+"hoListhoListhoListhoListhoListhoListhoListhoListhoListhoListhoListhoListhoListhoListhoList");
		int totalCount = hospitalService.getHospitalCount(land,cri);
		log.info(totalCount+"토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카토카");
		PageMaker pm = new PageMaker(5, cri, totalCount);
		log.info(pm+"피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠피엠");
		map.put("pm", pm);
		map.put("hoList", hoList);
		return map;

	}

	@ResponseBody
	@PostMapping("/hospital/like/list")
	public ArrayList<HospitalVO> postLiHospital(@RequestParam("emd_num") int emd_num,HttpSession session) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		MemberVO me = memberService.getMeId(user.getSite_id());
		LandVO land = hospitalService.getLand(emd_num);
		ArrayList<HospitalVO> hoSubList = memberService.getSubHoList(me, land);
		log.info(hoSubList + "hoSubListhoSubListhoSubListhoSubListhoSubListhoSubListhoSubListhoSubListhoSubListhoSubListhoSubList");
		return hoSubList;

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

//	@ResponseBody
//	@PostMapping("/member/signup/eupmyeondong")
//	public ArrayList<EupMyeonDongVO> postEupMyeonDong(int sgg_num) {
//		ArrayList<EupMyeonDongVO> emdList = memberService.getEmd(sgg_num);
//		return emdList;
//	}

}
