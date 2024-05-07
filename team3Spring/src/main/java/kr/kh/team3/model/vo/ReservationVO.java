package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReservationVO {

	private int rv_num;
	private String rv_rvs_name;
	private int rv_rs_num;
	private String rv_me_id;
	private ReservationScheduleVO ReservationScheduleVO;
	private MemberVO MemberVO;
}
