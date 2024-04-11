package kr.kh.team3.model.vo;

import java.util.ArrayList;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PostVO {
	private int po_num;
	private String po_title;
	private String po_content; 
	private int po_bo_num; 
	private int po_mg_num;
	private SiteManagement sitemanagement;
}
