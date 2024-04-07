package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface HospitalDAO {

	String selectHospitalId(@Param("ho_id") HospitalVO ho_id);

	boolean insertHospital(@Param("ho") HospitalVO hospital);

	boolean insertSiteHospital(@Param("st") SiteManagement site);

	ArrayList<HospitalSubjectVO> selectHospitalSubjectList();

}
