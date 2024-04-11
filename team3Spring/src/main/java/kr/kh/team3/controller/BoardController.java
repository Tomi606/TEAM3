package kr.kh.team3.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.kh.team3.model.vo.BoardVO;
import kr.kh.team3.service.BoardService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
//게시판 컨트롤러
public class BoardController {
	
	/* 관리자 전용 컨트롤러
	 * 게시판 관리용 
	 * 게시판 리스트 부터 추가 삭제 수정 순으로 기능 구현
	 * 전부다 비동기로 진행 수업때 댓글 비동기 한거 참고하기
	 * 
	 * 메서드 위에 주석으로 무슨 기능인지 쓰기
	 */
	
	@Autowired
	BoardService boardService;
	
	
	@GetMapping("/community")
	public String board(Model model) {
		ArrayList<BoardVO> list = boardService.getBoardList();
		model.addAttribute("list", list);
		return "/community/community";
	}
	

	@GetMapping("/community/insert")
	public String boardInsert(Model model) {
		ArrayList<BoardVO> list = boardService.getBoardList();
		model.addAttribute("list", list);
		return "/community/communityinsert";
	}
	
	@PostMapping("/community/insert")
	public String boardInsertPost(Model model, String board) {
		ArrayList<BoardVO> list = boardService.getBoardList();
		
		boolean res = boardService.insertBoard(list, board);
		if (res) {
			model.addAttribute("msg","게시판 등록을 완료했습니다.");
			model.addAttribute("url","/community");
		}else {
			model.addAttribute("msg","게시판 등록에 실패 했습니다.");
			model.addAttribute("url","/community/insert");
		}
		return "message";
	}
	
	@GetMapping("/community/update")
	public String boardUpdate(Model model, int bo_num) {
		BoardVO board = boardService.getBoard(bo_num);
		model.addAttribute("board", board);
		return "/community/communityupdate";
	}
	
	@PostMapping("/community/update")
	public String boardUpdatePost(Model model, BoardVO boardVO, String new_BoardName) {
		boolean res = boardService.updateBoard(boardVO, new_BoardName);
		if (res) {
			model.addAttribute("msg","게시판 수정을 완료했습니다.");
			model.addAttribute("url","/community");
		}else {
			model.addAttribute("msg","게시판 수정에 실패 했습니다.");
			model.addAttribute("url","/community/update");
		}
		return "message";
	}
	
	@GetMapping("/community/delete")
	public String boardDelete(Model model, int bo_num) {
		boolean res = boardService.deleteBoard(bo_num);
		if (res) {
			model.addAttribute("msg","게시판 삭제를 완료했습니다.");
			model.addAttribute("url","/community");
		}else {
			model.addAttribute("msg","게시판 삭제에 실패 했습니다.");
			model.addAttribute("url","/community");
		}
		return "message";
	}
}
