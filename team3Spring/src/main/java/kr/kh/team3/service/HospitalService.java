package kr.kh.team3.service;

import java.util.ArrayList;


import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.HsListVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReviewVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface HospitalService {

	boolean signup(HospitalVO hospital, LandVO getLand);

	boolean siteSignup(SiteManagement site, LandVO getLand);

	ArrayList<HospitalSubjectVO> getHospitalSubjectList();

	HospitalVO idCheck(String ho_id);

	ArrayList<SiDoVO> getSiDoList();

	ArrayList<SiGoonGuVO> getSggList();

	ArrayList<EupMyeonDongVO> getEmdList();

	SiteManagement login(HospitalVO hospital);

	HospitalVO getHospital(SiteManagement user);

	HospitalVO getHospitalId(HospitalVO hospital);

	void setLoginFail(String ho_id);

	SiteManagement ajaxHospitalId(String site_id);

	SiteManagement ajaxHospitalEmail(String site_email);

	SiteManagement ajaxHospitalPhone(String site_phone);
	
	String ctfEmail(String email);

	//정경호 이용중인 회원만 가져오는 메서드
	ArrayList<HospitalVO> hospitalList(Criteria cri);
	//관리자 병원 관리 =========================================================
	ArrayList<HospitalVO> getWaitHospitalList(Criteria cri);

	int getWHTotalCount(Criteria cri);

	int getHospitalCount(Criteria cri);

	boolean hospitalWaitOk(HospitalVO hospital);

	boolean hospitalWaitNo(HospitalVO hospital);

	ArrayList<HospitalVO> getReportHospitalList(Criteria cri);

	int getRHTotalCount(Criteria cri);

	boolean hospitalOut(HospitalVO hospital);

	boolean hospitalStop(ReportVO report);

	String hoStopCancel(HospitalVO ho);
	
	ArrayList<HospitalSubjectVO> selectSubject();

	//병원 상세 페이지==========================================
	boolean insertOrUpdateHospitalDetail(HospitalDetailVO detail, HospitalVO hospital);

	HospitalVO getHospitalInfo();

	HospitalSubjectVO getSelectedSubject(HospitalDetailVO detail, HospitalVO hospital);

	HospitalDetailVO getHoDetail(HospitalDetailVO detail, HospitalVO hospital);

	ArrayList<ReviewVO> getReviewList(Criteria cri, HospitalDetailVO detail);

	int getTotalReviewCount(Criteria cri);

	ArrayList<HospitalVO> getArrHospital(SiteManagement user);

	LandVO getLand(int emd_num);

	ArrayList<HospitalVO> getHospital(LandVO land, Criteria cri);

	boolean insertReview(ReviewVO review, MemberVO member);

	HospitalDetailVO getDetail(Integer hdNum);

	boolean insertLand(LandVO land);

	LandVO getLandLand(LandVO land);

	int getHospitalCount(LandVO land, Criteria cri);

	ArrayList<ReviewVO> getCriReviewList(Criteria cri);

	boolean deleteReview(ReviewVO review, MemberVO member);

	boolean updateReview(ReviewVO review, MemberVO member);

	HospitalVO getHsNum(HospitalVO hospital);

	ArrayList<HsListVO> getSubjects(HospitalVO hospital);

}
