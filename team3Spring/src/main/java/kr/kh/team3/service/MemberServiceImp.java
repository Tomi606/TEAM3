package kr.kh.team3.service;

import java.util.ArrayList;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.MemberDAO;
import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;

@Service
public class MemberServiceImp implements MemberService {
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Autowired
	MemberDAO memberDao;

	public boolean memberSignup(MemberVO member) {
		if (member == null)
			return false;

//		if(!checkPwRegex(member.getMe_pw())
//				||!checkAddressRegex(member.getMe_address())
//				||!checkPhoneRegex(member.getMe_phone())
//				||!checkbackNumRegex(member.getMe_backNum())
//				||!checkIdRegex(member.getMe_id())
//				||!checkfrontNumRegex(member.getMe_frontNum())
//				||!checkEmailRegex(member.getMe_email())
//				||!checkNameRegex(member.getMe_name()))
//			return false;

		MemberVO user = memberDao.selectMember(member.getMe_id());
		if (user != null)
			return false;
		if (member.getMe_pw() == null || member.getMe_pw().length() == 0)
			return false;
		String encPw = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPw);

		try {
			return memberDao.insertMember(member);
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
		if (member == null ||
			member.getMe_id() == null ||
			member.getMe_pw() == null)
			return null;
		// 아이디 확인
		MemberVO user = memberDao.selectMember(member.getMe_id());
		if (user == null)
			return null;

		// 비번 확인
		// 맞으면 site 정보 return
		if (member.getMe_pw().equals(user.getMe_pw())) {
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
}
//	private boolean checkIdRegex(String me_id) {
//		String idRegex = "^[a-zA-Z0-9]{8,15}$";
//		if(me_id == null) {
//			return false;
//		}
//		return Pattern.matches(idRegex, me_id);
//	}
//	private boolean checkPwRegex(String me_pw) {
//		String pwRegex = "^[a-zA-Z0-9!@#$]{8,18}$";
//		if(me_pw == null) {
//			return false;
//		}
//		return Pattern.matches(pwRegex, me_pw);
//	}
//
//	private boolean checkEmailRegex(String me_email) {
//		String emailRegex = "^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$";
//		if(me_email == null) {
//			return false;
//		}
//		return Pattern.matches(emailRegex, me_email);
//	}
//	private boolean checkNameRegex(String me_name) {
//		String ceoRegex = "^[ㄱ-힣]{2,5}$";
//		if(me_name == null) {
//			return false;
//		}
//		return Pattern.matches(ceoRegex, me_name);
//	}
//	private boolean checkfrontNumRegex(String me_frontNum) {
//		String numRegex = "^[0-9]{6}$";
//		if(me_frontNum == null) {
//			return false;
//		}
//		return Pattern.matches(numRegex, me_frontNum);
//	}
//	private boolean checkbackNumRegex(String me_backNum) {
//		String numRegex = "^[0-9]{7}$";
//		if(me_backNum == null) {
//			return false;
//		}
//		return Pattern.matches(numRegex, me_backNum);
//	}
//	private boolean checkAddressRegex(String me_address) {
//		String addressRegex = "^[a-zA-Zㄱ-힣0-9]{1,100}$";
//		if(me_address == null) {
//			return false;
//		}
//		return Pattern.matches(addressRegex, me_address);
//	}
//
//	private boolean checkPhoneRegex(String me_phone) {
//		String phoneRegex = "^[0-9]{11}$";
//		if(me_phone == null) {
//			return false;
//		}
//		return Pattern.matches(phoneRegex, me_phone);
//	}
