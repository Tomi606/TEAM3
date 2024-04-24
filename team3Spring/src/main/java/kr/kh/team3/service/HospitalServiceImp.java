package kr.kh.team3.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.HospitalDAO;
import kr.kh.team3.dao.MemberDAO;
import kr.kh.team3.model.vo.BookmarkVO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalDetailVO;
import kr.kh.team3.model.vo.HospitalSubjectVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.HsListVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.ReservationScheduleVO;
import kr.kh.team3.model.vo.ReviewVO;
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
	public boolean signup(HospitalVO hospital, LandVO land) {
		if(hospital == null 
		|| hospital.getHo_id().length() == 0
		|| !checkStr(hospital.getHo_id()) 
		|| !checkStr(hospital.getHo_pw())) {
			return false;
		}
		
		//비번 암호화
		String endPw = passwordEncoder.encode(hospital.getHo_pw());
		hospital.setHo_pw(endPw);
		
		return hospitalDao.insertHospital(hospital, land);
	}

	//사이트 회원관리 아이디
	public boolean siteSignup(SiteManagement site, LandVO getLand) {
		if(site == null || site.getSite_id().length() == 0) {
			return false;
		}
		
		return hospitalDao.insertSiteHospital(site, getLand);
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
	public SiteManagement ajaxHospitalId(String site_id) {
		
		return hospitalDao.selectSiteId(site_id);
	}
	
	@Override
    public SiteManagement ajaxHospitalPhone(String site_phone) {

        return hospitalDao.selectHospitalPhone(site_phone);
    }
	
	@Override
	public SiteManagement ajaxHospitalEmail(String site_email) {

		return hospitalDao.selectHospitalEmail(site_email);
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

	@Override
	public ArrayList<HospitalVO> getReportHospitalList(Criteria cri) {
		if(cri == null) {
			return null;
		}
		return hospitalDao.selectReportHospitalList(cri);
	}

	@Override
	public int getRHTotalCount(Criteria cri) {
		if(cri == null) {
			return 0;
		}
		return hospitalDao.selectRHTotalCount(cri);
	}

	@Override
	public boolean hospitalOut(HospitalVO hospital) {
		if(hospital == null ||
			hospital.getHo_id() == null ||
			hospital.getHo_id().length() == 0) {
			return false;
		}
		boolean res1 = hospitalDao.deleteHospital(hospital.getHo_id());
		boolean res2 = hospitalDao.deleteSite(hospital.getHo_id());
		if(res1 && res2) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public boolean hospitalStop(ReportVO report) {
		LocalDate localdate = LocalDate.now();
		Date now = java.sql.Date.valueOf(localdate);
		
		if( report == null ||
			report.getRp_rs_name() == null ||
			report.getRp_rs_name().length() == 0) {
			return false;
		}
		//정지값이 null인지 확인해서
		HospitalVO ho = hospitalDao.selectHospital(report.getRp_target());
		//null 이면
		if(ho.getHo_stop() == null) {
			return hospitalDao.updateHospitalStop(report.getRp_target(), report.getRp_rs_name());
		}
		//아니면
		//1. ho_stop이 현재시간 이후이면 이미 있던 ho_stop + 정지일
		if(ho.getHo_stop().after(now)) {
			return hospitalDao.updateHospitalStopPlus(report.getRp_target(), report.getRp_rs_name());
		}
		//2. ho_stop이 현재시간 이전이면 데이터 새로 넣기.
		return hospitalDao.updateHospitalStop(report.getRp_target(), report.getRp_rs_name());
	}

	@Override
	public String hoStopCancel(HospitalVO ho) {
		LocalDate localdate = LocalDate.now();
		Date now = java.sql.Date.valueOf(localdate);
		if(ho.getHo_stop().before(now)) {
			hospitalDao.updateHoStopCancel(ho.getHo_id());
			return "cancel";
		}else {
			return "stop";
		}
	}

	public ArrayList<HospitalSubjectVO> selectSubject() {
		return hospitalDao.selectHospitalSubjectList();
	}
	//병원 상세 페이지 - 선진, 민석 ==============================================
	@Override
	public boolean insertOrUpdateHospitalDetail(
			HospitalDetailVO detail, HsListVO list, 
			HospitalVO hospital, HospitalSubjectVO subject) {
		if(detail.getHd_info() == null 
		|| detail.getHd_time() == null 
		|| detail.getHd_park() == null) {
			return false;
		}
		if(hospital == null || hospital.getHo_id() == null) {
			return false;
		}
		
		detail.setHd_ho_id(hospital.getHo_id());
		
		//delete문 : 기존의 DB를 삭제(상세 페이지 + hs_list)
		boolean delete = hospitalDao.deleteHospitalDetail(detail.getHd_ho_id());
//		boolean deleteSubjects = hospitalDao.deleteSubjects(list.getHsl_hs_num(), list.getHsl_ho_id());
		
		//insert + update문 : 상세 페이지 + hs_list
		boolean insertAndUpdate = hospitalDao.insertOrUpdateHospitalDetail(detail);
		boolean insertSubjects = hospitalDao.insertSubjects(list, hospital.getHo_id(), subject.getHs_num());

		return delete && deleteSubjects && insertAndUpdate && insertSubjects;
	}

	@Override
	public HospitalVO getHospitalInfo() {
		return hospitalDao.selectHospitalInfo();
	}

	public HospitalSubjectVO getSelectedSubject(HospitalDetailVO detail, HospitalVO hospital) {
		if(hospital == null || hospital.getHo_id() == null) {
			return null;
		}
		return hospitalDao.selectSelectedSubject(detail);
	}

	@Override
	public HospitalDetailVO getHoDetail(HospitalDetailVO detail, HospitalVO hospital) {
		if(hospital == null || hospital.getHo_id() == null) {
			return null;
		}
		if(detail == null) {
			return null;
		}
		return hospitalDao.selectHoDetail(hospital);
	}

	@Override
	public ArrayList<ReviewVO> getReviewList(Criteria cri, HospitalDetailVO detail) {
		if(cri == null) {
			return null;
		}
		return hospitalDao.selectReviewList(cri, detail);
	}

	@Override
	public int getTotalReviewCount(Criteria cri) {
		if(cri == null) {
			return 0;
		}
		return hospitalDao.selectTotalReviewCount(cri);
	}

	public ArrayList<HospitalVO> getArrHospital(SiteManagement user) {
		if(user == null||user.getSite_id() == null||user.getSite_id().length() == 0)
			return null;
		
		return  hospitalDao.getArrHospital(user);
	}


	@Override
	public LandVO getLand(int emd_num) {
		return hospitalDao.getLand(emd_num);
	}

	@Override
	public boolean insertReview(ReviewVO review, MemberVO member) {
		if(review == null || review.getVw_content().length() == 0) {
			return false;
		}
		
		if(member == null || member.getMe_id() == null) {
			return false;
		}
		
		review.setVw_me_id(member.getMe_id());
		return hospitalDao.insertReview(review);
	}

	@Override
	public HospitalDetailVO getDetail(Integer hdNum) {
		if(hdNum == null) {
			return null;
		}
		return hospitalDao.selectDetail(hdNum);
	}

	public boolean insertLand(LandVO land) {
		if (land == null)
			return false;
		if (hospitalDao.selectLand(land) == null)
			return hospitalDao.insertLand(land);
		return true;
	}

	@Override
	public LandVO getLandLand(LandVO land) {
		if (land == null)
			return null;
		if (hospitalDao.selectLand(land) == null) {
			hospitalDao.insertLand(land);
				return hospitalDao.selectLand(land);
		}
		return hospitalDao.selectLand(land);
	}

	@Override
	public ArrayList<HospitalVO> getHospital(LandVO land,Criteria cri) {
		if(land == null||cri==null)
			return null;
		return hospitalDao.getHospitalList(land,cri);
	}

	@Override
	public int getHospitalCount(LandVO land, Criteria cri) {
		if(land == null||cri==null)
			return -1;
		return hospitalDao.getHospitalListCount(land,cri);
	}

	@Override
	public ArrayList<ReviewVO> getCriReviewList(Criteria cri) {
		if(cri == null) {
			return null;
		}
		return hospitalDao.selectCriReviewList(cri);

	}

	@Override
	public ArrayList<BookmarkVO> getBmkList(SiteManagement user, Criteria cri) {
		if(user == null||user.getSite_id() == null||user.getSite_id().length() == 0)
			return null;
		return hospitalDao.selectBmkList(user, cri);
	}

	@Override
	public int getBmkListCount(SiteManagement user, Criteria cri) {
		if(user == null||user.getSite_id() == null||user.getSite_id().length() == 0)
			return -1;
		return hospitalDao.selectBmkListCount(user, cri);
	}

	public boolean deleteReview(ReviewVO review, MemberVO member) {
		if(review == null) {
			return false;
		}
		if(member == null || member.getMe_id() == null) {
			return false;
		}
		//작성자인지 DB와 확인
		ReviewVO dbReview = hospitalDao.selectReview(review.getVw_num());
		if(dbReview == null || !dbReview.getVw_me_id().equals(member.getMe_id()))  {
			return false;
		}

		//다 확인 되면 삭제
		return hospitalDao.deleteReview(review.getVw_num());
	}

	@Override
	public boolean updateReview(ReviewVO review, MemberVO member) {
		if(review == null || review.getVw_content() == null) {
			return false;
		}
		if(member == null || member.getMe_id() == null) {
			return false;
		}
		//작성자인지 확인
		ReviewVO dbReview = hospitalDao.selectReview(review.getVw_num());
		if(dbReview == null || !dbReview.getVw_me_id().equals(member.getMe_id())) {
			return false;
		}
		//다 확인되면 업데이트
		return hospitalDao.updateReview(review);
	}

	@Override
	public HospitalVO getHsNum(HospitalVO hospital) {
		if(hospital == null || hospital.getHo_id() == null) {
			return null;
		}
		return hospitalDao.selectHsNum(hospital);
	}

	@Override
	public ArrayList<HsListVO> getSubjects(HospitalVO hospital) {
		if(hospital == null || hospital.getHo_id() == null) {
			return null;
		}
		return hospitalDao.selectSubjects(hospital);
	}

}
