package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReviewVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface HospitalDAO {

	HospitalVO selectHospitalId(@Param("ho_id") String ho_id);
	
	LandVO selectLand(@Param("la") LandVO land);

	boolean insertHospital(@Param("ho") HospitalVO hospital, @Param("la") LandVO land);

	boolean insertSiteHospital(@Param("si") SiteManagement site,@Param("la") LandVO getLand);

	ArrayList<HospitalSubjectVO> selectHospitalSubjectList();

	ArrayList<SiDoVO> selectSiDoList();

	ArrayList<SiGoonGuVO> selectSggList();

	ArrayList<EupMyeonDongVO> selectEmdList();

	HospitalVO selectHospital(@Param("ho_id")String ho_id);

	SiteManagement selectSite(@Param("ho_id")String ho_id);

	void updateLoginFail(@Param("ho_id")String ho_id);

	void updateLoginFailZero(@Param("ho_id")String ho_id);
	
	//회원가입 아이디, 이메일, 폰 사이트 매니지먼트 중복 체크
	SiteManagement selectSiteId(@Param("site_id") String site_id);
	
	SiteManagement selectHospitalEmail(@Param("site_email") String st_email);

	SiteManagement selectHospitalPhone(@Param("site_phone") String site_phone);

	// ======================== 병원 관리 ==========================
	//이용중인 병원만 호출
	ArrayList<HospitalVO> hospitalList(@Param("cri")Criteria cri);
	//정경호 
	int selectHospitalCount(@Param("cri")Criteria cri);
	
	ArrayList<HospitalVO> selectWaitHospitalList(@Param("cri")Criteria cri);

	int selectWHTotalCount(@Param("cri")Criteria cri);

	boolean updateWaitOk(@Param("ho_id")String ho_id);

	boolean updateWaitNo(@Param("ho_id")String ho_id);

	ArrayList<HospitalVO> selectReportHospitalList(@Param("cri")Criteria cri);

	int selectRHTotalCount(@Param("cri")Criteria cri);

	boolean deleteHospital(@Param("ho_id")String ho_id);

	boolean deleteSite(@Param("ho_id")String ho_id);
	
	boolean updateHospitalStop(@Param("ho_id")String ho_id, @Param("rp_rs_name")String rp_rs_name);

	void updateHoStopCancel(@Param("ho_id")String ho_id);

	boolean updateHospitalStopPlus(@Param("ho_id")String ho_id, @Param("rp_rs_name")String rp_rs_name);

	//============================= 병원 페이지 ===============================
	
	ArrayList<HospitalSubjectVO> selectHospitalSubjectList(@Param("ho_id") String ho_id);

	boolean insertOrUpdateHospitalDetail(@Param("hd") HospitalDetailVO detail);

	HospitalVO selectHospitalInfo();

	HospitalSubjectVO selectSelectedSubject(@Param("detail") HospitalDetailVO detail);

	HospitalDetailVO selectHoDetail(@Param("hospital") HospitalVO hospital);

	boolean deleteHospitalDetail(@Param("hd_ho_id") String hd_ho_id);

	ArrayList<ReviewVO> selectReviewList(@Param("cri") Criteria cri, @Param("detail") HospitalDetailVO detail);

	int selectTotalReviewCount(@Param("cri") Criteria cri);
	
	ArrayList<HospitalVO> getArrHospital(@Param("us")SiteManagement user);

	LandVO getLand(@Param("num")int emd_num);

	HospitalVO getHospital(@Param("ho_id")String hd_ho_id, @Param("la_num")int me_la_num);
  
	HospitalDetailVO selectDetail(@Param("hd_num") int hdNum);

	boolean insertReview(@Param("vw") ReviewVO review);

	boolean insertLand(@Param("la") LandVO land);
	
	ArrayList<HospitalVO> getHospitalList(@Param("la")LandVO land,@Param("cri") Criteria cri);

	int getHospitalListCount(@Param("la")LandVO land,@Param("cri") Criteria cri);

	ArrayList<ReviewVO> selectCriReviewList(@Param("cri") Criteria cri);

	ReviewVO selectReview(@Param("vw_num") int vw_num);

	boolean deleteReview(@Param("vw_num") int vw_num);

	boolean updateReview(@Param("vw") ReviewVO review);

}
