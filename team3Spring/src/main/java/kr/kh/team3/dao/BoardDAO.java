package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.BoardVO;

public interface BoardDAO {

	ArrayList<BoardVO> selectBooardList();

	boolean insertBoard(@Param("board")String board);

	BoardVO selectBooard(@Param("bo_num")int bo_num);

	boolean updateBoard(@Param("board")BoardVO boardVO, @Param("name")String new_BoardNames);

	boolean deleteBoard(@Param("bo_num")int bo_num);

}
