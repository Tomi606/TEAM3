package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RecommendVO {

	private int re_num;
	private int re_state;
	private int re_po_num;
	private int re_mg_num;
	private PostVO post;
	private SiteManagement sitemanagement;
	
	public RecommendVO(int num, int site_num) {
		re_po_num =num;
		re_mg_num=site_num;
		
	}

}
