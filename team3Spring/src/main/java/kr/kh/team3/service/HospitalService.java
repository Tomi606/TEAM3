package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface HospitalService {

	boolean signup(HospitalVO hospital);

	boolean signup(SiteManagement site);

	ArrayList<HospitalSubjectVO> getHospitalSubjectList();

	HospitalVO idCheck(String ho_id);

	ArrayList<SiDoVO> getSiDoList();

	ArrayList<SiGoonGuVO> getSggList();

	ArrayList<EupMyeonDongVO> getEmdList();

	SiteManagement login(HospitalVO hospital);

	HospitalVO getHospital(String site_id);

}
