package kr.kh.team3.model.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@JsonFormat
public class HospitalVO {

	private String ho_id;
	private int ho_hs_num; // 병원 검진과목 번호
	private String ho_pw;
	private String ho_email;
	private String ho_name;// 병원명
	private String ho_ceo; // 병원 대표명
	private String ho_num;
	private String ho_address;
	private String ho_phone;
	private String ho_authority;
	private String ho_ms_state; // 회원 상태명('이용중'), ('기간정지'), ('영구정지');
	private int ho_fail; // 로그인 실패 횟수
	private Date ho_stop; // 정지기간
	private int ho_report_count; // 신고 누적 횟수
	private int ho_stop_count; // 정지 누적 횟수
	private int ho_la_num; // 병원 주소(land) 번호
	// 자동로그인 때 사용
	private String ho_cookie;
	private Date ho_cookie_limit;
	
	private HsListVO hsList;
	private HospitalDetailVO hospital_detail;
	private HospitalSubjectVO hospital_subject;

	public String getChangeDate() {
		if (this.ho_stop != null) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			return format.format(this.ho_stop);
		} else {
			return "없당ㅎㅎ";
		}
	}
}
