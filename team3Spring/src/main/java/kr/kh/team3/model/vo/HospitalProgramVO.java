package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class HospitalProgramVO {
	private int hp_num;
	private String hp_title;
	private int hp_payment;
	private String hp_ho_id;
	private int hp_hsl_num;
}
