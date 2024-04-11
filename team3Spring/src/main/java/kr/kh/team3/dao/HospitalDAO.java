package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;

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

	HospitalVO selectHospitalEmail(@Param("ho_email") String ho_email);


}
