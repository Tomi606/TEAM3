package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

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
	SiteManagement getMemberId(SiteManagement site);
	//이메일 중복확인 ajax
	MemberVO getMemberEmail(MemberVO member);
	//폰번호 중복확인 ajax
	MemberVO getMemberPhone(MemberVO member);

	//관리자 페이지 - 회원 관리
	ArrayList<MemberVO> getMemberList(Criteria cri);

	int getMemberTotalCount(Criteria cri);

	boolean deleteMember(MemberVO me_id);

}
