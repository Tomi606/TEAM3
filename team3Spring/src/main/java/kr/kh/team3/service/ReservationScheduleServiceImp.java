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
		// TODO Auto-generated method stub
		return RSDao.selectRSTimeList(date, hp_num);
	}

	@Override
	public ReservationVO getReservationList(int rs_num) {
		
		return RSDao.selectReservationList(rs_num);
	}

	@Override
	public HospitalProgramVO getHospitalProgram(int hp_num) {
		// TODO Auto-generated method stub
		return RSDao.selectHospitalProgram(hp_num);
	}

	@Override
	public boolean deleteSchedule(int rv_num) {
		// TODO Auto-generated method stub
		return RSDao.deleteScheule(rv_num);
	}

}
