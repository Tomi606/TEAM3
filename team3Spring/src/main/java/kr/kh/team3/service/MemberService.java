package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface MemberService {

	boolean memberSignup(MemberVO member, String str);

	boolean siteSignup(SiteManagement site);

	SiteManagement login(MemberVO member);

	ArrayList<SiDoVO> getSiDo();

	ArrayList<SiGoonGuVO> getSgg(int sd_num);

	ArrayList<EupMyeonDongVO> getEmd(int sgg_num);

	void setLoginFail(String me_id);

	MemberVO getMember(MemberVO member);

    //아이디 중복확인 ajax
	MemberVO getMemberId(MemberVO member);
	//이메일 중복확인 ajax
	MemberVO getMemberEmail(MemberVO member);
	//폰번호 중복확인 ajax
	MemberVO getMemberPhone(MemberVO member);

}
