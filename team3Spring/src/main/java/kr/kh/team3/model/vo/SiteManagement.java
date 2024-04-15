package kr.kh.team3.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SiteManagement {
	private int site_num; //PK
	private int site_la_num; //land FK
	private String site_id;
	private String site_phone;
	private String site_email;
	private String site_authority;
}
