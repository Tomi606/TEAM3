package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.BoardDAO;
import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.model.vo.PostVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Component
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDAO boardDao;
	
	
	//커뮤니티 메인에 게시판 리스트를 가져오기 위한 메서드
	@Override
	public ArrayList<BoardVO> getBoardList() {
		return boardDao.selectBooardList();
	}
	
	//게시판을 추가하기 위한 메서드
	@Override
	public boolean insertBoard(ArrayList<BoardVO> list, String board) {
		if(board == null) {
			return false;
		}
		for(BoardVO tmp : list) {
			if(tmp.getBo_title().equals(board)) {
				return false;
			}
		}
		return boardDao.insertBoard(board);
	}

	
	//선택한 게시판이 무슨 게시판인지 확인하기 위한 메서드
	@Override
	public BoardVO getBoard(int bo_num) {
		return boardDao.selectBooard(bo_num);
	}

	@Override
	public boolean updateBoard(BoardVO boardVO, String new_BoardNames) {
		if(new_BoardNames == null) {
			return false;
		}
		ArrayList<BoardVO> boardList = boardDao.selectBooardList();
		for(BoardVO tmp : boardList) {
			if(tmp.getBo_title().equals(new_BoardNames)) {
				return false;
			}
		}
		return boardDao.updateBoard(boardVO, new_BoardNames);
	}

	@Override
	public boolean deleteBoard(int bo_num) {
		return boardDao.deleteBoard(bo_num);
	}

	@Override
	public ArrayList<BoardVO> selectBoard() {
		return boardDao.selectBooardList();
	}

	@Override
	public ArrayList<PostVO> getPostList(int bo_num) {
		return boardDao.selectPostList(bo_num);
	}

}
