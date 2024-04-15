package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface HospitalDAO {

	HospitalVO selectHospitalId(@Param("ho_id") String ho_id);

	boolean insertHospital(@Param("ho") HospitalVO hospital, @Param("address") String address);

	boolean insertSiteHospital(@Param("st") SiteManagement site);

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

	boolean updateHospitalStop(@Param("ho_id")String ho_id, @Param("rp_rs_name")String rp_rs_name);

}
