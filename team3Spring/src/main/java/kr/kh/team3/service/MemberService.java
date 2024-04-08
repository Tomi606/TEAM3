package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface MemberService {

	boolean memberSignup(MemberVO member);

	boolean siteSignup(SiteManagement site);

	SiteManagement login(MemberVO member);

	ArrayList<SiDoVO> getSiDo();

	ArrayList<SiGoonGuVO> getSgg(int sd_num);

	ArrayList<EupMyeonDongVO> getEmd(int sgg_num);

	void setLoginFail(String me_id);

	MemberVO getMember(MemberVO member);

}
