package kr.kh.team3.dao;


import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.MemberVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface MemberDAO {


	boolean insertMember(@Param("me")MemberVO member);

	boolean insertSiteMember(@Param("si")SiteManagement site);

	MemberVO selectMember(@Param("me_id")String me_id);
	
	SiteManagement selectSite(@Param("me_id")String me_id);

}