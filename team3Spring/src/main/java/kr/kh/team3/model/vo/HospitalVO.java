package kr.kh.team3.model.vo;

import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class HospitalVO implements Serializable{

	private static final long serialVersionUID = 5178450285865368295L;
	
	private String ho_id;
	private int ho_hs_num; //병원 검진과목 번호
	private String ho_pw;
	private String ho_email;
	private String ho_name;
	private String ho_ceo;
	private String ho_num;
	private String ho_address;
	private String ho_phone;
	private String ho_authority;
	private String ho_ms_state; //회원 상태명('이용중'), ('기간정지'), ('영구정지');
	//자동로그인 때 사용
	private String ho_cookie;
	private Date ho_cookie_limit;
	
}
