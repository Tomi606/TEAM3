package kr.kh.team3.model.vo;

import java.util.Date;


import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	
	private String me_id;
	private int me_hs_num; //병원 과목 번호
	private String me_ms_state; //회원 상태명
	private int me_bmk_num; //북마크 번호
	private int me_la_num; //주소 번호
	private String me_pw;
	private String me_name;
	private String me_gender;
	private String me_job;
	private String me_phone;
	private String me_email;
	private String me_address;
	private String me_authority;
	private int me_fail; //로그인 실패 횟수
	private String me_cookie; //쿠키(자동로그인)
	private String me_cookie_limit;
	private Date me_stop; //정지 기간
	private int me_report_count; //신고 누적 횟수
	private int me_stop_count; //정지 누적 횟수
	private HospitalSubjectVO hospitalSubject;
	private ReportVO report;
	private SiteManagement siteManagement;

	 
}
