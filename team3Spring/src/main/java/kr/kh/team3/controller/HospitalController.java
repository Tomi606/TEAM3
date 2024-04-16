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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.HospitalService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class HospitalController {
	
	@Autowired
	HospitalService hospitalService;

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
		return "/hospital/detail2";
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
	
}
