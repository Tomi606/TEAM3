package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.PostVO;

public interface PostDAO {

	ArrayList<PostVO> selectPostList(@Param("bo_num")int bo_num);

}
