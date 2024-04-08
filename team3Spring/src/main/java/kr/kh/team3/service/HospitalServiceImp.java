package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.HospitalDAO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class HospitalServiceImp implements HospitalService {

	@Autowired
	private HospitalDAO hospitalDao;
	
	//회원가입
	public boolean signup(HospitalVO hospital) {
		if(hospital == null || hospital.getHo_id().length() == 0) {
			return false;
		}
		
		//아이디 중복 체크
//		String dbHospitalId = hospitalDao.selectHospitalId(hospital);
//		if(hospital.getHo_id().equals(dbHospitalId)) {
//			System.out.println("중복된 병원 아이디");
//			return false;
//		}
		
		return hospitalDao.insertHospital(hospital);
	}

	//사이트 회원관리 아이디
	public boolean signup(SiteManagement site) {
		if(site == null || site.getSite_id().length() == 0) {
			return false;
		}
		
		return hospitalDao.insertSiteHospital(site);
	}

	public ArrayList<HospitalSubjectVO> getHospitalSubjectList() {
		return hospitalDao.selectHospitalSubjectList();
	}

	//아이디 중복 체크(안됨)
	public HospitalVO idCheck(String ho_id) {
		return hospitalDao.selectHospitalId(ho_id);
	}

	@Override
	public ArrayList<SiDoVO> getSiDoList() {
		return hospitalDao.selectSiDoList();
	}

	@Override
	public ArrayList<SiGoonGuVO> getSggList() {
		return hospitalDao.selectSggList();
	}

	@Override
	public ArrayList<EupMyeonDongVO> getEmdList() {
		return hospitalDao.selectEmdList();
	}

}
