package kr.kh.team3.model.vo;

import lombok.NoArgsConstructor;

import lombok.Data;

@Data
@NoArgsConstructor
public class HospitalDetailVO {

	private int hd_num;
	private String hd_ho_id;
	private String hd_info;
	private String hd_detail;
}
