package kr.kh.team3.service;

import java.util.ArrayList;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.kh.team3.dao.BoardDAO;
import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.model.vo.FileVO;
import kr.kh.team3.model.vo.PostVO;
import kr.kh.team3.model.vo.SiteManagement;
import kr.kh.team3.utils.UploadFileUtils;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Component
public class BoardServiceImp implements BoardService{
	
	@Autowired
	BoardDAO boardDao;
	
	@Resource
	String uploadPath;
	
	private boolean checkString(String str) {
	    return str != null && str.length() != 0;
	}
	
	private void uploadFile(int po_num, MultipartFile file) {
	    if(file == null || file.getOriginalFilename().length() == 0) {
	      return;
	    }
	    try {
	      String fileOriName = file.getOriginalFilename();
	      //첨부파일 업로드 후 경로를 가져옴
	      String fileName =
	        UploadFileUtils.uploadFile(
	            uploadPath,
	            fileOriName,
	            file.getBytes());
	      FileVO fileVO = new FileVO(po_num, fileName, fileOriName);
	      //DB에 첨부파일 정보를 추가
	      boardDao.insertFile(fileVO);
	    } catch (Exception e) {
	      e.printStackTrace();
	    }
	    
	  }
	//커뮤니티 메인에 게시판 리스트를 가져오기 위한 메서드
	@Override
	public ArrayList<BoardVO> getBoardList() {
		return boardDao.selectBooardList();
	}
	
	@Override
	public ArrayList<BoardVO> getAllBoardList() {
		return boardDao.selectAllBoardList();
	}

	
	//커뮤니티 메인에 게시글을 가져오기 위한 메서드
	@Override
	public ArrayList<PostVO> getAllPostList() {
		return boardDao.selectAllPostList();
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
		return boardDao.selectAllBoardList();
	}

	@Override
	public ArrayList<PostVO> getPostList(int bo_num) {
		return boardDao.selectPostList(bo_num);
	}

	@Override
	public String getBoardName(int bo_num) {
		return boardDao.selectBoardName(bo_num);
	}

	@Override
	public boolean insertPost(SiteManagement user, PostVO post, MultipartFile[] files) {
		if(post == null || user == null) {
		      return false;
		    }
		    if( !checkString(post.getPo_title()) ||
		      !checkString(post.getPo_content())) {
		      return false;
		    }
		    post.setPo_mg_num(user.getSite_num());
		    boolean res = boardDao.insertPost(post);
		    //게시글 등록 실패 => 파일 서버에 업로드할 필요 없음
		    if(!res) {
		      return false;
		    }
		    if(files == null || files.length == 0) {
		      return true;
		    }
		    for(MultipartFile file : files) {
		      uploadFile(post.getPo_num(), file);
		    }
		    
		    return true;
	}

}
