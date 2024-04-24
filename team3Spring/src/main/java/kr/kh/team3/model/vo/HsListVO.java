package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class HsListVO {

	private int hsl_num;
	private int hsl_hs_num; //과목리스트의 과목 번호(FK)
	private String hsl_ho_id;
}