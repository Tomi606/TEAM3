package kr.kh.team3.service;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import kr.kh.team3.dao.HospitalDAO;
import kr.kh.team3.dao.MemberDAO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Component
public class HospitalServiceImp implements HospitalService {
	
	@Autowired
	private JavaMailSender mailSender;

	@Autowired
	MemberDAO memberDao;
	@Autowired
	private HospitalDAO hospitalDao;
	
	@Autowired 
	private PasswordEncoder passwordEncoder;

	//랜덤 문자열
	private String randomString(int size) {
		String strs = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
		String newCertification = "";
		int min = 0, max = strs.length() - 1;
		while(newCertification.length() < size) {
			int r = (int)(Math.random() * (max - min + 1) + min);
			newCertification += strs.charAt(r);
		}
		return newCertification;
	}
	
	private boolean checkStr(String str) {
		return str != null && str.length() != 0;
	}
	
	//회원가입
	public boolean signup(HospitalVO hospital, String address) {
		if(hospital == null 
		|| hospital.getHo_id().length() == 0
		|| !checkStr(hospital.getHo_id()) 
		|| !checkStr(hospital.getHo_pw())) {
			return false;
		}
		
		//비번 암호화
		String endPw = passwordEncoder.encode(hospital.getHo_pw());
		hospital.setHo_pw(endPw);
		
			return hospitalDao.insertHospital(hospital, address);
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

	@Override
	public HospitalVO ajaxHospitalId(HospitalVO hospital, MemberVO member) {
		if(hospital == null || hospital.getHo_id() == null || hospital.getHo_id().isEmpty()) {
			return null;
		}

		// 입력된 아이디로 회원 조회
		HospitalVO user = hospitalDao.selectHospital(hospital.getHo_id());
		MemberVO memberId = memberDao.selectMember(member.getMe_id());
		
		// user가 null이 아니면 중복
		if (user != null || user.equals(memberId)) {
			return user;
		}

		return null;
	}

	@Override
    public HospitalVO ajaxHospitalPhone(HospitalVO hospital, MemberVO member) {
        if (hospital == null || hospital.getHo_phone() == null || hospital.getHo_phone().isEmpty()) {
            return null;
        }

        // 입력된 아이디로 회원 조회
        HospitalVO user = hospitalDao.selectHospitalPhone(hospital.getHo_phone());
        MemberVO memberPhone = memberDao.selectMemberPhone(member.getMe_phone());

        // user가 null이 아니면 중복
        if(hospital.getHo_phone().equals(member.getMe_phone())){
            return user;
        }
        if (user != null || memberPhone != null) {
            return user;
        }

        return null;
    }
	
	@Override
	public HospitalVO ajaxHospitalEmail(HospitalVO hospital) {
		if (hospital == null || hospital.getHo_email() == null || hospital.getHo_email().isEmpty()) {
			return null;
		}

		// 입력된 아이디로 회원 조회
		HospitalVO user = hospitalDao.selectHospitalEmail(hospital.getHo_email());

		// user가 null이 아니면 중복
		if (user != null) {
			return user;
		}

		return null;
	}

	@Override
	public String ctfEmail(String email) {
		//임시 새 비밀번호를 생성
		String ctfEmail = randomString(10);
		
		//이메일을 전송
		String title = "이메일 인증 입니다.";
		String content = "인증 번호는 <b>"+ ctfEmail +"</b> 입니다.";
		boolean res = mailSend(email, title, content);
		if(res) {
			return ctfEmail;			
		}
		else {
			return null;
		}
	}
	
	public boolean mailSend(String email, String title, String content) {

	    String setfrom = "didtjswls98@gmail.com";
	   try{
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper
	            = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom(setfrom);// 보내는사람 생략하거나 하면 정상작동을 안함
	        messageHelper.setTo(email);// 받는사람 이메일
	        messageHelper.setSubject(title);// 메일제목은 생략이 가능하다
	        messageHelper.setText(content, true);// 메일 내용, (,true) : 내용에 html 코드가 들어가면 문자열이 아니라 html 코드로 들어간다

	        mailSender.send(message);
	        return true;
	    } catch(Exception e){
	        e.printStackTrace();
	        return false;
	    }

	}

	@Override //이용중인 병원들만 조회하는 메서드 : 정경호
	public ArrayList<HospitalVO> hospitalList(Criteria cri) {
		if(cri == null) {
			return null;
		}
		return hospitalDao.hospitalList(cri);
	}
	@Override//정경호 페이지네이션
	public int getHospitalCount(Criteria cri) {
		if(cri == null) {
			return 0;
		}
		return hospitalDao.selectHospitalCount(cri);
	}
	//관리자 병원 관리 =========================================================
	@Override
	public ArrayList<HospitalVO> getWaitHospitalList(Criteria cri) {
		if(cri == null) {
			return null;
		}
		return hospitalDao.selectWaitHospitalList(cri);
	}

	@Override
	public int getWHTotalCount(Criteria cri) {
		if(cri == null) {
			return 0;
		}
		return hospitalDao.selectWHTotalCount(cri);
	}

	@Override
	public boolean hospitalWaitOk(HospitalVO hospital) {
		if(hospital == null ||
			hospital.getHo_id() == null ||
			hospital.getHo_id().length() == 0) {
			return false;
		}
		return hospitalDao.updateWaitOk(hospital.getHo_id());
	}

	@Override
	public boolean hospitalWaitNo(HospitalVO hospital) {
		if(hospital == null ||
			hospital.getHo_id() == null ||
			hospital.getHo_id().length() == 0) {
			return false;
		}
		return hospitalDao.updateWaitNo(hospital.getHo_id());
	}


}
