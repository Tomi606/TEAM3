package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.model.vo.FileVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.RecommendVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface BoardService {

	//커뮤니티 메인에 게시판 리스트를 가져오기 위한 메서드
	ArrayList<BoardVO> getBoardList();
	
	//게시판을 추가하기 위한 메서드
	boolean insertBoard(ArrayList<BoardVO> list, String board);

	//선택한 게시판이 무슨 게시판인지 확인하기 위한 메서드
	BoardVO getBoard(int bo_num);

	boolean updateBoard(BoardVO boardVO, String new_BoardName);

	boolean deleteBoard(int bo_num);

	ArrayList<BoardVO> selectBoard();

	ArrayList<PostVO> getPostList(int bo_num);

	ArrayList<PostVO> getAllPostList();

	ArrayList<BoardVO> getAllBoardList();

	String getBoardName(int bo_num);

	boolean insertPost(SiteManagement user, PostVO post, MultipartFile[] files);

	PostVO getPost(int po_num);

	void updateView(int po_num);

	int recommend(RecommendVO recommend, SiteManagement user);

	int getUserRecommend(int num, SiteManagement user);

	PostVO getPostDetail(int po_num);

	ArrayList<FileVO> getFileList(int po_num);
	
}
