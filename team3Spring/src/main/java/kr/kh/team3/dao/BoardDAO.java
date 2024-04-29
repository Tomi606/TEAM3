package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.model.vo.FileVO;
import kr.kh.team3.model.vo.PostVO;

public interface BoardDAO {

	ArrayList<BoardVO> selectBooardList();

	boolean insertBoard(@Param("board")String board);

	BoardVO selectBooard(@Param("bo_num")int bo_num);

	boolean updateBoard(@Param("board")BoardVO boardVO, @Param("name")String new_BoardNames);

	boolean deleteBoard(@Param("bo_num")int bo_num);

	ArrayList<PostVO> selectPostList(@Param("bo_num")int bo_num);

	ArrayList<PostVO> selectAllPostList();

	ArrayList<BoardVO> selectAllBoardList();

	String selectBoardName(@Param("num")int bo_num);

	void insertFile(@Param("file")FileVO fileVO);

	boolean insertPost(@Param("post")PostVO post);

}
