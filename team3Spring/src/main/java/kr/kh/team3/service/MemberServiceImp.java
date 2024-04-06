package kr.kh.team3.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.MemberDAO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiteManagement;

@Service
public class MemberServiceImp implements MemberService {
	
	

	@Autowired
	MemberDAO memberDao;

	public boolean memberSignup(MemberVO member) {
//		if(member==null ||member.getMe_id()==null)
//			return false;
		
		return memberDao.insertMember(member);
	}

	public boolean siteSignup(SiteManagement site) {
		return memberDao.insertSiteMember(site);
	}
}
