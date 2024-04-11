package kr.kh.team3.dao;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.pagination.Criteria;

public interface MemberDAO {


	boolean insertMember(@Param("me")MemberVO member, @Param("adress")String adress);

	boolean insertSiteMember(@Param("si")SiteManagement site);
	//ajax로도 사용함
	MemberVO selectMember(@Param("me_id")String me_id);

	ArrayList<SiDoVO> selectSiDo();

	ArrayList<SiGoonGuVO> selectSgg(@Param("sd_num") int sd_num);

	ArrayList<EupMyeonDongVO> selectEmd(@Param("sgg_num")int sggNum);
	
	SiteManagement selectSite(@Param("me_id")String me_id);

	void updateLoginFail(@Param("me_id")String me_id);

	void updateLoginFailZero(@Param("me_id")String me_id);
	//ajax용 이메일
	MemberVO selectMemberEmail(@Param("me_email")String me_email);
	//ajax용 폰번호 
	MemberVO selectMemberPhone(@Param("me_phone")String me_phone);
	
	//관리자 - 회원 관리
	ArrayList<MemberVO> selectMemberList(@Param("cri") Criteria cri);

	int selectMemberTotalCount(@Param("cri") Criteria cri);

	boolean deleteMember(@Param("me_id") MemberVO me_id);

}