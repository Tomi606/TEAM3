package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LandVO {

	private int la_num;
	private int la_sd_num;
	private int la_sgg_num;
	private int la_emd_num;
	public LandVO(int la_sd_num, int la_sgg_num, int la_emd_num) {
	
		this.la_sd_num = la_sd_num;
		this.la_sgg_num = la_sgg_num;
		this.la_emd_num = la_emd_num;
	}
	
	
	 
}
