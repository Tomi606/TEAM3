package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReservationVO;

public interface ReservationScheduleService {

	ReservationScheduleVO getRsTime(int rs_num);

	ArrayList<ReservationScheduleVO> getRsList(String date, int hp_num);

	ReservationVO getReservationList(int rs_num);

	HospitalProgramVO getHospitalProgram(int hp_num);

	boolean deleteUserSchedule(int rv_num);

	boolean updateUserSchedule(int rv_num, String date, String time, int hp_num);

}
