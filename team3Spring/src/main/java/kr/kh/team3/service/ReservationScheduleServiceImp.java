package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.kh.team3.dao.ReservationScheduleDAO;
import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReservationVO;

@Controller
public class ReservationScheduleServiceImp implements ReservationScheduleService{
	
	@Autowired
	ReservationScheduleDAO RSDao;

	@Override
	public ReservationScheduleVO getRsTime(int rs_num) {
		// TODO Auto-generated method stub
		return RSDao.selectRSTime(rs_num);
	}

	@Override
	public ArrayList<ReservationScheduleVO> getRsList(String date, int hp_num) {
		return RSDao.selectRSTimeList(date, hp_num);
	}

	@Override
	public ArrayList<ReservationVO> getReservationList(int rs_num) {
		
		return RSDao.selectReservationList(rs_num);
	}

	@Override
	public HospitalProgramVO getHospitalProgram(int hp_num) {
		// TODO Auto-generated method stub
		return RSDao.selectHospitalProgram(hp_num);
	}

	@Override
	public boolean deleteUserSchedule(int rv_num) {
		// TODO Auto-generated method stub
		return RSDao.deleteUserSchedule(rv_num);
	}

	@Override
	public boolean updateUserSchedule(int rv_num, String date, String time, int hp_num) {
		//1. 새로 입력 받은 날짜와 시간에 스케줄 번호를 가져옴
		ReservationScheduleVO rs = RSDao.programByMaxPerson(time, date);
		if(rs == null) {
			System.out.println("11111111111");
			return false;
		}
		//2. 새로 입력받은 스케줄 번호로 예약인원 체크
		int reservationCount = RSDao.reservationCount(rs.getRs_num());

		//3. 예약 총인원이 예약 스케줄에 최대인원보다 같거나 많으면 false 리턴
		if(rs.getRs_max_person() <= reservationCount) {
			System.out.println("333333333333333333");
			return false;
		}
		return RSDao.updateUserChedule(rs.getRs_num(), rv_num);
	}

	@Override
	public boolean MaxPersonCheck(int rs_num) {
		ReservationScheduleVO max =  RSDao.selectRSTime(rs_num);
		int reservationCount = RSDao.reservationCount(rs_num);
		System.out.println("aaaaaaaaaa");
		System.out.println(max);
		System.out.println(reservationCount);
		
		 
		return max.getRs_max_person() <= reservationCount ? false : true;
	}

	@Override
	public ReservationVO getReservationUpdateList(int rs_num) {
		// TODO Auto-generated method stub
		return RSDao.selectReservationUpadateList(rs_num);
	}

	@Override
	public ArrayList<ReservationVO> getAllReservationScheduleList() {
		
		//모든 예약자를 가져오는 메서드
		ArrayList<ReservationVO> list = RSDao.selectReservationList2();
		
		ArrayList<ReservationVO> arr = new ArrayList<ReservationVO>();
		for(ReservationVO tmp : list) {
			arr.add(RSDao.selectReservationUpadateList(tmp.getRv_rs_num())); 
		}

		return arr;
	}

}
