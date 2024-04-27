package kr.kh.team3.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
	
	
	@GetMapping("/board/all")
	public String boardAll(Model model) {
		return "/board/all";
	}
	@GetMapping("/board/list")
	public String boardList(Model model) {
		return "/board/list";
	}
	
}
