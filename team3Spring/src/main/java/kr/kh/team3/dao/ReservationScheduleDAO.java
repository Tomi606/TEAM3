package kr.kh.team3.dao;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestParam;

import kr.kh.team3.model.vo.ReservationScheduleVO;

public interface ReservationScheduleDAO {

	ReservationScheduleVO selectRSTime(@RequestParam("rs_num")int rs_num);

	ArrayList<ReservationScheduleVO> selectRSTimeList(@RequestParam("date") String date);

}
