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
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		log.info(user);
		HospitalVO huser = hospitalService.getHospital(user);
		log.info(huser);
		model.addAttribute("huser",huser);
		return "/hospital/mypage";
	}

	
	@GetMapping("/hospital/detail1")
	public String hospitalDetail1(Model model) {
		
		return "/hospital/detail1";
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
	
	//병원 리스트
	@GetMapping("/hospital/list")
	public String hospitalList(Model model) {
		
		return "/hospital/list";
	}
	
	// 병원 프로그램 등록 페이지 이동
	@GetMapping("/hospital/program/insert")
	public String hospitalProgramInsertPage(Model model) {
		
		return "/hospital/porograminsert";
	}
	
	// 세부 항목을 추가하는 메서드
	@ResponseBody
	@PostMapping("/item/insert")
	public Map<String, Object> insertItem(ItemVO item, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ItemVO> itemList = programService.getItemList();
		HospitalVO user = (HospitalVO) session.getAttribute("user");
		System.out.println(item);
		boolean res =  programService.insertItem(item, user);
		return map;
	}
	
}
