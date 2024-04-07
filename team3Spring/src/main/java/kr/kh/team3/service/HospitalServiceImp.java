package kr.kh.team3.service;

import java.util.ArrayList;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.HospitalDAO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
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
		
		//아이디 중복
		String dbHospitalId = hospitalDao.selectHospitalId(hospital);
		if(hospital.getHo_id().equals(dbHospitalId)) {
			log.info(dbHospitalId);
			System.out.println("중복된 병원 아이디");
			return false;
		}

		//정규표현식
		//아이디
		if(!checkIdRegex(hospital.getHo_id())) {
			System.out.println("아이디");
			return false;
		}
		
		//비번
		if(!checkPwRegex(hospital.getHo_pw())) {
			System.out.println("비번");
			return false;
		}
		//이메일
		if(!checkEmailRegex(hospital.getHo_email())) {
			System.out.println("이메일");
			return false;
		}
		
		//상호명
		if(!checkNameRegex(hospital.getHo_name())) {
			System.out.println("상호명");
			return false;
		}
		
		//대표자명
		if(!checkCeoRegex(hospital.getHo_ceo())) {
			System.out.println("대표자명");
			return false;
		}
		
		//사업자번호
		if(!checkNumRegex(hospital.getHo_num())) {
			System.out.println("사업자번호");
			return false;
		}
		
		//소재지 상세주소
		if(!checkAddressRegex(hospital.getHo_address())) {
			System.out.println("소재지");
			return false;
		}
		
		//대표전화번호
		if(!checkPhoneRegex(hospital.getHo_phone())) {
			System.out.println("대표전화번화");
			return false;
		}
		
		return hospitalDao.insertHospital(hospital);
	}

	private boolean checkIdRegex(String ho_id) {
		String idRegex = "^[a-zA-Z0-9]{8,15}$";
		if(ho_id == null) {
			return false;
		}
		return Pattern.matches(idRegex, ho_id);
	}

	private boolean checkPwRegex(String ho_pw) {
		String pwRegex = "^[a-zA-Z0-9!@#$]{8,18}$";
		if(ho_pw == null) {
			return false;
		}
		return Pattern.matches(pwRegex, ho_pw);
	}

	private boolean checkEmailRegex(String ho_email) {
		String emailRegex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
		if(ho_email == null) {
			return false;
		}
		return Pattern.matches(emailRegex, ho_email);
	}

	private boolean checkNameRegex(String ho_name) {
		String nameRegex = "^[a-zA-Zㄱ-힣0-9]{1,50}$";
		if(ho_name == null) {
			return false;
		}
		return Pattern.matches(nameRegex, ho_name);
	}

	private boolean checkCeoRegex(String ho_ceo) {
		String ceoRegex = "^[ㄱ-힣]{2,5}$";
		if(ho_ceo == null) {
			return false;
		}
		return Pattern.matches(ceoRegex, ho_ceo);
	}

	private boolean checkNumRegex(String ho_num) {
		String numRegex = "^[0-9]{10}$";
		if(ho_num == null) {
			return false;
		}
		return Pattern.matches(numRegex, ho_num);
	}

	private boolean checkAddressRegex(String ho_address) {
		String addressRegex = "^[a-zA-Zㄱ-힣0-9]{1,100}$";
		if(ho_address == null) {
			return false;
		}
		return Pattern.matches(addressRegex, ho_address);
	}

	private boolean checkPhoneRegex(String ho_phone) {
		String phoneRegex = "^[0-9]{1,11}$";
		if(ho_phone == null) {
			return false;
		}
		return Pattern.matches(phoneRegex, ho_phone);
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

}
