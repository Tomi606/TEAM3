package kr.kh.team3.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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

import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.HospitalService;
import kr.kh.team3.service.ProgramService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HospitalController {
	
	@Autowired
	HospitalService hospitalService;
	
	@Autowired
	ProgramService programService;

	
	@GetMapping("/hospital/mypage")//병원 마이페이지
	public String hospitalMypage(Model model, HospitalVO hospital, HttpSession session) {
		//로그인한 회원 정보(SiteManagement에서 로그인 session 가져오고 -> HospitalVO로 가져오기)
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		HospitalVO huser = hospitalService.getHospital(user);

		model.addAttribute("huser",huser);
		return "/hospital/mypage";
	}


	@GetMapping("/hospital/detail2")
	public String hospitalDetail2(Model model) {
		//대표 진료 과목
		ArrayList<HospitalSubjectVO> hsList = hospitalService.getHospitalSubjectList();
		model.addAttribute("hsList", hsList);
		
		//예약 날짜와 시간 보내기 
		ArrayList<ReservationScheduleVO> reservationScheduleList = hospitalService.getReservationScheduleList();
		int i = reservationScheduleList.size();
		model.addAttribute("dateList", reservationScheduleList);
		model.addAttribute("dateListnum", i);
		return "/hospital/detail2";
	}
	

	@PostMapping("/detail2")
	@ResponseBody
	public Map<String, Object> detail2Post(Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		//대표 진료 과목
		ArrayList<HospitalSubjectVO> hsList = hospitalService.getHospitalSubjectList();
		map.put("hsList", hsList);
		
		//예약 날짜가져와서 보내기 
		ArrayList<ReservationScheduleVO> reservationScheduleList = hospitalService.getReservationScheduleList();
		map.put("dateList", reservationScheduleList);
		return map;
	}
	
	@GetMapping("/detail/date")
	@ResponseBody
	public Map<String, Object> hospitalDate(Model model, @RequestParam("str") String str) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//예약 날짜가져와서 보내기 
		ArrayList<ReservationScheduleVO> reservationScheduleTimeList = hospitalService.getReservationScheduleTimeList(str);
		log.info(reservationScheduleTimeList);
		map.put("timeList", reservationScheduleTimeList);
		return map;
	}
	
	//2. 병원 과목
	@ResponseBody
	@PostMapping("/hospital/subject")
	public Map<String, Object> memberStop(@RequestBody HospitalVO hospital) {
		Map<String, Object> map = new HashMap<String, Object>();
//		boolean hsUpdate = hospitalService.updateHospitalSubject(hospital.getHo_hs_num());
//		boolean detailUpdate = hospitalService.updateHospitalDetail();
//		map.put("hsUpdate", hsUpdate);
//		map.put("detailUpdate", detailUpdate);
		return map;
	}

	//병원 상세 페이지 등록
	@GetMapping("/hospital/detail/insert")
	public  String detailInsert(Model model, HospitalDetailVO detail, HttpSession session) {
		//현재 로그인한 병원
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		//병원과목 리스트
		ArrayList<HospitalSubjectVO> hsList = hospitalService.getHospitalSubjectList();
		//현재 로그인한 병원이 선택했던 병원과목 가져오기
		HospitalSubjectVO selectedSubject = hospitalService.getSelectedSubject(detail, hospital);
		//전에 입력했던 페이지 들고오기
		HospitalDetailVO hoDetail = hospitalService.getHoDetail(detail, hospital);
		
		model.addAttribute("hospital", hospital);
		model.addAttribute("hsList", hsList);
		model.addAttribute("selectedSubject", selectedSubject);
		model.addAttribute("hoDetail", hoDetail);
		return "/hospital/detail/insert";
	}

	//병원 상세 페이지 등록(insert)
	@PostMapping("/hospital/detail/insert")
	public String hospitalDetailPost(Model model, HospitalDetailVO detail, HttpSession session) {
		//현재 로그인한 병원
		SiteManagement user = (SiteManagement)session.getAttribute("user");
		HospitalVO hospital = hospitalService.getHospital(user);
		//병원 페이지 등록
		boolean res = hospitalService.insertOrUpdateHospitalDetail(detail, hospital);

		if(res) {
			model.addAttribute("msg", "상세 페이지 수정 완료");
			model.addAttribute("url", "/hospital/mypage");
		}else {
			model.addAttribute("msg", "상세 페이지 등록 완료");
			model.addAttribute("url", "/hospital/mypage");
		}
		return "message";
	}
	

	//병원 리스트
	@GetMapping("/hospital/list")
	public String hospitalList(Model model) {
		
		return "/hospital/list";
	}
	
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
	
	
	
	
	
}
