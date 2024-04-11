package kr.kh.team3.service;

import java.util.ArrayList;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.MemberDAO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class MemberServiceImp implements MemberService {
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	private JavaMailSender mailSender;

	public boolean mailSend(String to, String title, String content) {

	    String setfrom = "gksrbqmffn@gmail.com";
	   try{
	        MimeMessage message = mailSender.createMimeMessage();
	        MimeMessageHelper messageHelper
	            = new MimeMessageHelper(message, true, "UTF-8");

	        messageHelper.setFrom(setfrom);// 보내는사람 생략하거나 하면 정상작동을 안함
	        messageHelper.setTo(to);// 받는사람 이메일
	        messageHelper.setSubject(title);// 메일제목은 생략이 가능하다
	        messageHelper.setText(content, true);// 메일 내용

	        mailSender.send(message);
	        return true;
	    } catch(Exception e){
	        e.printStackTrace();
	        return false;
	    }
	}
	

	public boolean memberSignup(MemberVO member, String adress) {
		if (member == null)
			return false;


		MemberVO user = memberDao.selectMember(member.getMe_id());
		if (user != null)
			return false;
		if (member.getMe_pw() == null || member.getMe_pw().length() == 0)
			return false;
		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);

		try {
			return memberDao.insertMember(member, adress);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean siteSignup(SiteManagement site) {
		return memberDao.insertSiteMember(site);
	}

	@Override
	public SiteManagement login(MemberVO member) {
		// 매개변수 null 처리
		if (member == null || member.getMe_id() == null || member.getMe_pw() == null)
			return null;
		// 아이디 확인
		MemberVO user = memberDao.selectMember(member.getMe_id());
		if (user == null) {
			return null;

		}
		// 비번 확인
		// 맞으면 site 정보 return
		if (passwordEncoder.matches(member.getMe_pw(), user.getMe_pw())) {
			memberDao.updateLoginFailZero(user.getMe_id());

			return memberDao.selectSite(user.getMe_id());
		}
		return null;
	}

	@Override
	public ArrayList<SiDoVO> getSiDo() {
		return memberDao.selectSiDo();
	}

	@Override
	public ArrayList<SiGoonGuVO> getSgg(int sd_num) {
		return memberDao.selectSgg(sd_num);
	}

	@Override
	public ArrayList<EupMyeonDongVO> getEmd(int sggNum) {
		return memberDao.selectEmd(sggNum);
	}

	@Override
	public void setLoginFail(String me_id) {
		memberDao.updateLoginFail(me_id);
	}

	@Override
	public MemberVO getMember(MemberVO member) {
		if (member == null || member.getMe_id() == null)
			return null;
		return memberDao.selectMember(member.getMe_id());
	}

	@Override
	public MemberVO getMemberId(MemberVO member) {
		if (member == null || member.getMe_id() == null || member.getMe_id().isEmpty()) {
			return null;
		}

		// 입력된 아이디로 회원 조회
		MemberVO user = memberDao.selectMember(member.getMe_id());

		// user가 null이 아니면 중복
		if (user != null) {
			return user;
		}

		return null;
	}

	@Override
	public MemberVO getMemberEmail(MemberVO member) {
		if (member == null || member.getMe_email() == null || member.getMe_email().isEmpty()) {
			return null;
		}
		// 입력된 이메일로 회원 조회
		MemberVO user = memberDao.selectMemberEmail(member.getMe_email());
		// user가 null이 아니면 중복
		if (user != null) {
			return user;
		}

		return null;
	}

	@Override
	public MemberVO getMemberPhone(MemberVO member) {
		if (member == null || member.getMe_phone() == null || member.getMe_phone().isEmpty()) {
			return null;
		}
		// 입력된 폰번호로 회원 조회
		MemberVO user = memberDao.selectMemberPhone(member.getMe_phone());
		// user가 null이 아니면 중복
		if (user != null) {
			return user;
		}

		return null;
	}


	@Override
	public ArrayList<MemberVO> getMemberList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return memberDao.selectMemberList(cri);
	}


	@Override
	public int getMemberTotalCount(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return memberDao.selectMemberTotalCount(cri);
	}


	@Override
	public boolean deleteMember(MemberVO me_id) {
		if(me_id == null) {
			return false;
		}
		return memberDao.deleteMember(me_id);
	}
}