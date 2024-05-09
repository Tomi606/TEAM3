package kr.kh.team3.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.HsListVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReservationVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.service.HospitalService;
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
	@Autowired
	HospitalService hospitalService;
	
	//스케줄 수정 메서드
	@GetMapping("/schedule")
	public String ScheduleUpdate(HttpSession session, Model model, String ho_id) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		SiteManagement ho = new SiteManagement();
		ho.setSite_id(ho_id);
		ArrayList<HsListVO> subjectList = programService.getSubjectList(ho);
		ArrayList<HospitalSubjectVO> list = new ArrayList<HospitalSubjectVO>();
		System.out.println("ddddddddddddddd"+list);
		 ArrayList<HospitalProgramVO> programList = programService.getProgramList(user); 
		for(HsListVO tmp : subjectList) {
			try {
				HospitalSubjectVO subject = programService.getSubject(tmp.getHsl_hs_num(), ho);				
				System.out.println(subject);
				list.add(subject);
			} catch (Exception e) {
				
			}
		}
		HospitalVO hospital = hospitalService.getHoId(ho_id);
		model.addAttribute("hospital",hospital);
		model.addAttribute("list",list);
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
	
	//프로그램을를 선택하면 여러 정보가 나옴
	@ResponseBody
	@PostMapping("/getdate")
	public Map<String, Object> updateProgramScheduleCheck(@RequestParam("hp_num") int hp_num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		HospitalProgramVO hp = hospitalService.getHospitalProgram(hp_num);
		//해당 과와아이디를 이용해 번호를 가져오는 메서드
		ArrayList<ReservationScheduleVO> RSlist = programService.getRsList(hp_num);
		map.put("hp", hp);
		map.put("RSlist", RSlist);
		return map;
    }
	
	
	
	//프로그램을를 선택하면 여러 정보가 나옴
	@ResponseBody
	@PostMapping("/gettime")
	public Map<String, Object> getTime(@RequestParam("rs_num") int rs_num, HttpSession session,
			@RequestParam("hp_num") int hp_num) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		//해당 과와아이디를 이용해 번호를 가져오는 메서드
		ReservationScheduleVO time = reservationScheduleService.getRsTime(rs_num);
		ArrayList<ReservationScheduleVO> RSTimeList = reservationScheduleService.getRsList(time.getRsDate2(), time.getRs_hp_num());
		map.put("timeList", RSTimeList);
		map.put("time", time);
		return map;
    }
	
//	예약된 회원을 관리하는 페이지 get
	@GetMapping("/hospital/schedule/change")
	public String ScheduleMemberCheck(HttpSession session, Model model) {
		SiteManagement user = (SiteManagement) session.getAttribute("user");
		ArrayList<HsListVO> subjectList = programService.getSubjectList(user);
		ArrayList<HospitalSubjectVO> list = new ArrayList<HospitalSubjectVO>();
		for(HsListVO tmp : subjectList) {
			try {
				HospitalSubjectVO subject = programService.getSubject(tmp.getHsl_hs_num(), user);				
				System.out.println(subject);
				list.add(subject);
			} catch (Exception e) {
				
			}
		}
		
		model.addAttribute("list",list);
		 ArrayList<HospitalProgramVO> programList = programService.getProgramList(user); 
		 model.addAttribute("programList", programList);
		 model.addAttribute("ho", user);
		 return "/schedule/schedulechange";
	}
	
	//프로그램을를 선택하면 여러 정보가 나옴
	@ResponseBody
	@PostMapping("/schedule/check")
	public Map<String, Object> scheduleCheck(@RequestParam("hp_num") int hp_num, HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<ReservationScheduleVO> RSlist = programService.getRsList(hp_num);
		HospitalProgramVO HP = reservationScheduleService.getHospitalProgram(hp_num);
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
		for(ReservationScheduleVO tmp : RSlist) {
			ReservationVO reservation = reservationScheduleService.getReservationList(tmp.getRs_num());	
			try {
				list.add(reservation);				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		map.put("list", list);
		map.put("HP", HP);
		return map;
    }
	
	@GetMapping("/delete/schedule")
	public String deleteUserSchedule(Model model, int rv_num) throws Exception{
		boolean res = reservationScheduleService.deleteUserSchedule(rv_num);
		if(res) {
			model.addAttribute("msg", "삭제에 성공하였습니다.");
			model.addAttribute("url", "/hospital/schedule/change");
		}else {
			model.addAttribute("msg", "삭제에 실패하였습니다.");
			model.addAttribute("url", "/hospital/schedule/change");
		}
		return "message";
	}
	
	@GetMapping("/update/userschedule")
	public String updateUserSchedule(Model model, int rv_num, String date, 
			String time2, int hp_num) throws Exception{
		
		date = date.replaceAll("/", "-");
		time2 = time2.replaceAll(" ", "");
		time2 = time2.replace("시", ":");		
		time2 = time2.replace("분", ":");		
		time2 = time2+"00";		
		boolean res = reservationScheduleService.updateUserSchedule(rv_num, date, time2, hp_num);
		if(res) {
			model.addAttribute("msg", "예약 변경에 성공하였습니다.");
			model.addAttribute("url", "/hospital/schedule/change");
		}else {
			model.addAttribute("msg", "예약 변경에 실패하였습니다.");
			model.addAttribute("url", "/hospital/schedule/change");
		}
		return "message";
	}
	
	
	//rufwp
	@GetMapping("/bookingPay")
	@ResponseBody
	public void bookPay(int amount,String imp_uid, String merchant_uid) throws Exception{

		System.out.println("결제 성공");
		System.out.println("결제 금액 : " + amount);
		System.out.println("imp_uid : " + imp_uid);
		System.out.println("merchant_uid : " + merchant_uid);
	}
	
	private IamportClient iamportClient = new IamportClient("", "");

    @ResponseBody
    @PostMapping("/verify")
    public IamportResponse<Payment> paymentByImpUid(@RequestParam("imp_uid") String imp_uid)
            throws IamportResponseException, IOException {
    	System.out.println(imp_uid + "nnnnn");
    	System.out.println("nnnn" + iamportClient.paymentByImpUid(imp_uid));
        return iamportClient.paymentByImpUid(imp_uid);
    }
    
    
}
