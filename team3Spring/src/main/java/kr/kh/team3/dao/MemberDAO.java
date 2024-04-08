package kr.kh.team3.dao;


import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.EupMyeonDongVO;
import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiDoVO;
import kr.kh.team3.model.vo.SiGoonGuVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface MemberDAO {


	boolean insertMember(@Param("me")MemberVO member);

	boolean insertSiteMember(@Param("si")SiteManagement site);

	MemberVO selectMember(@Param("me_id")String me_id);

	ArrayList<SiDoVO> selectSiDo();

	ArrayList<SiDoVO> selectSgg();

	ArrayList<SiDoVO> selectEmd();
	
	SiteManagement selectSite(@Param("me_id")String me_id);

	void updateLoginFail(@Param("me_id")String me_id);

	void updateLoginFailZero(@Param("me_id")String me_id);

}