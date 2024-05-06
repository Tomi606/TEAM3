package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReservationVO;

public interface ReservationScheduleDAO {

	ReservationScheduleVO selectRSTime(@Param("rs_num")int rs_num);

	ArrayList<ReservationScheduleVO> selectRSTimeList(@Param("date") String date, 
			@Param ("hp_num") int hp_num);

	ReservationVO selectReservationList(@Param("rs_num")int rs_num);

}
