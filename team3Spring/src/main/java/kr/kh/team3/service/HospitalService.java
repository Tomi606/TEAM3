package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface HospitalService {

	boolean signup(HospitalVO hospital);

	boolean signup(SiteManagement site);

	ArrayList<HospitalSubjectVO> getHospitalSubjectList();

	HospitalVO idCheck(String ho_id);
}
