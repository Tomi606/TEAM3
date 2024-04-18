package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.LandVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.ReportVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface MemberService {

	boolean memberSignup(MemberVO member, LandVO getLand);

	boolean siteSignup(SiteManagement site, LandVO getLand);

	SiteManagement login(MemberVO member);

	ArrayList<SiDoVO> getSiDo();

	ArrayList<SiGoonGuVO> getSgg(int sd_num);

	ArrayList<EupMyeonDongVO> getEmd(int sgg_num);

	void setLoginFail(String me_id);

	MemberVO getMember(MemberVO member);

    //아이디 중복확인 ajax
	SiteManagement getMemberId(SiteManagement site);
	//이메일 중복확인 ajax
	SiteManagement getMemberEmail(SiteManagement site);
	//폰번호 중복확인 ajax
	SiteManagement getMemberPhone(SiteManagement site);

	//관리자 페이지 - 회원 관리(양선진)
	ArrayList<MemberVO> getMemberList(Criteria cri);

	int getMemberTotalCount(Criteria cri);

	boolean deleteMember(MemberVO member);

	ArrayList<MemberVO> getReportMemberList(Criteria cri);

	int getReportMemberTotalCount(Criteria cri);

	boolean stopMember(ReportVO report);

	MemberVO getMemberInfo(SiteManagement user);

	boolean updateName(SiteManagement user, MemberVO member);

	boolean updatePhone(SiteManagement user, MemberVO member);

	boolean updateEmail(SiteManagement user, MemberVO member);

	boolean updateJob(SiteManagement user, MemberVO member);

	boolean updatePw(SiteManagement user, String me_id, String oldPw, String newPw);


	MemberVO getMemberPassword(MemberVO member, SiteManagement user);

	MemberVO getMeId(String me_id);

	boolean insertLand(LandVO land);

	LandVO getLand(LandVO land);

	LandVO getMyLand(MemberVO muser);

	String getSdName(LandVO land);

	String getSggName(LandVO land);

	String getEmdName(LandVO land);


}
