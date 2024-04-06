package kr.kh.team3.service;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface MemberService {

	boolean memberSignup(MemberVO member);

	boolean siteSignup(SiteManagement site);

	SiteManagement login(MemberVO member);

}
