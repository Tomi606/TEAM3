package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
	BCryptPasswordEncoder passwordEncoder;
	
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

	//아이디 중복 체크
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

	@Override
	public SiteManagement login(HospitalVO hospital) {
		//매개변수 null 처리
		if( hospital == null || 
			hospital.getHo_id() == null || 
			hospital.getHo_pw() == null)
			return null;
		//아이디 확인
		HospitalVO user = hospitalDao.selectHospital(hospital.getHo_id());
		if(user == null) {
			return null;
		}
		//사업자번호 확인
		if(!hospital.getHo_num().equals(user.getHo_num())) {
			return null;
		}
		
		//비번 확인
		//맞으면 site 정보 return
		if(passwordEncoder.matches(hospital.getHo_pw(), user.getHo_pw())) {
			hospitalDao.updateLoginFailZero(user.getHo_id());
			
			return hospitalDao.selectSite(user.getHo_id());
		}
		return null;
	}

	@Override
	public HospitalVO getHospital(SiteManagement user) {
		if(user == null ||
			user.getSite_id() == null) {
			return null;
		}
		return hospitalDao.selectHospital(user.getSite_id());
	}

	@Override
	public void setLoginFail(String ho_id) {
		hospitalDao.updateLoginFail(ho_id);
	}
	
	@Override
	public HospitalVO getHospitalId(HospitalVO hospital) {
		if( hospital == null || 
			hospital.getHo_id() == null)
			return null;
		return hospitalDao.selectHospital(hospital.getHo_id());
	}

}
