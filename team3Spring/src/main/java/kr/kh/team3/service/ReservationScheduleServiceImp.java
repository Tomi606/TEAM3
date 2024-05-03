package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.kh.team3.dao.ReservationScheduleDAO;
import kr.kh.team3.model.vo.ReservationScheduleVO;

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
	public ArrayList<ReservationScheduleVO> getRsList(String date) {
		// TODO Auto-generated method stub
		return RSDao.selectRSTimeList(date);
	}

}
