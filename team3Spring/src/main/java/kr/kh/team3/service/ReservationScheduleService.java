package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReservationVO;

public interface ReservationScheduleService {

	ReservationScheduleVO getRsTime(int rs_num);

	ArrayList<ReservationScheduleVO> getRsList(String date);

	ReservationVO getReservationList(int rs_num);

}
