package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface MemberService {

	boolean memberSignup(MemberVO member);

	boolean siteSignup(SiteManagement site);

	ArrayList<SiDoVO> getSiDo();

	ArrayList<SiDoVO> getSgg();

	ArrayList<SiDoVO> getEmd();

}
