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
	private ReservationScheduleVO schedule;
	private MemberVO MemberVO;
	
	public ReservationVO(String rv_rvs_name, int rv_rs_num, String rv_me_id) {
		this.rv_rvs_name = rv_rvs_name;
		this.rv_rs_num = rv_rs_num;
		this.rv_me_id = rv_me_id;
	}


}
