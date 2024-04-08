package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
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
	MemberDAO memberDao;

	public boolean memberSignup(MemberVO member) {
		if(member == null || member.getMe_id().length()==0)
			return false;
		
		return memberDao.insertMember(member);
	}

	public boolean siteSignup(SiteManagement site) {
		return memberDao.insertSiteMember(site);
	}

	@Override
	public SiteManagement login(MemberVO member) {
		//매개변수 null 처리
		if( member == null || 
			member.getMe_id() == null || 
			member.getMe_pw() == null)
			return null;
		//아이디 확인
		MemberVO user = memberDao.selectMember(member.getMe_id());
		if(user == null)
			return null;
		//비번 확인
		//맞으면 site 정보 return
		if(member.getMe_pw().equals(user.getMe_pw())) {
			
			return memberDao.selectSite(user.getMe_id());
		}
		return null;
	}
	@Override
	public ArrayList<SiDoVO> getSiDo() {
		return memberDao.selectSiDo();
	}

	@Override
	public ArrayList<SiDoVO> getSgg() {
		return  memberDao.selectSgg();
	}

	@Override
	public ArrayList<SiDoVO> getEmd() {
		return  memberDao.selectEmd();
	}
}
