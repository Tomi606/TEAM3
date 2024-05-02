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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HsListVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.ProgramService;
import kr.kh.team3.service.ReservationScheduleService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class ReservationScheduleController {
	
	@Autowired
	ReservationScheduleService reservationScheduleService;
	
	@Autowired
	ProgramService programService;
	
	//스케줄 수정 메서드
	@GetMapping("/schedule")
	public String ScheduleUpdate(HttpSession session, Model model, String ho_id) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		SiteManagement ho = new SiteManagement();
		ho.setSite_id(ho_id);
		ArrayList<HsListVO> subjectList = programService.getSubjectList(ho);
		ArrayList<HospitalSubjectVO> list = new ArrayList<HospitalSubjectVO>();
		for(HsListVO tmp : subjectList) {
			try {
				HospitalSubjectVO subject = programService.getSubject(tmp.getHsl_hs_num(), ho);				
				System.out.println(subject);
				list.add(subject);
			} catch (Exception e) {
				
			}
		}
		
		model.addAttribute("list",list);
		 ArrayList<HospitalProgramVO> programList = programService.getProgramList(user); 
		 model.addAttribute("programList", programList);
		 model.addAttribute("ho", ho);
		 return "/schedule/schedule";
	}
	
	//과를 선택하면 여러 정보가 나옴
	@ResponseBody
	@PostMapping("/program/updatecheck2")
	public Map<String, Object> updateProgramCheck(@RequestParam("hs_num") int hs_num,@RequestParam("ho") String  ho) {
		Map<String, Object> map = new HashMap<String, Object>();
		SiteManagement user = new SiteManagement();
		user.setSite_id(ho);
		//해당 과와아이디를 이용해 번호를 가져오는 메서드
		HsListVO hslist = programService.getHsList(hs_num, user);
		//과를 선택할 때마다 프로그램을 가져오는 메서드
		ArrayList<HospitalProgramVO> hpList = programService.getHpList(hslist.getHsl_num(), user);
		ArrayList<ItemVO> itemList = programService.getItemList(user, hslist);
		map.put("hpList", hpList);
		map.put("itemList", itemList);
		return map;
    }
	
	//스케줄 수정 메서드
	//프로그램을를 선택하면 여러 정보가 나옴
	@ResponseBody
	@PostMapping("/getdate")
	public Map<String, Object> updateProgramScheduleCheck(@RequestParam("hp_num") int hp_num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		//해당 과와아이디를 이용해 번호를 가져오는 메서드
		ArrayList<ReservationScheduleVO> RSlist = programService.getRsList(hp_num);
		map.put("RSlist", RSlist);
		return map;
    }
	
}
