package kr.kh.team3.service;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import kr.kh.team3.pagination.Criteria;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Component
public class CommentServiceImp implements CommentService {
	
	@Override
	public int getCommentCount(Criteria cri, int po_num) {
		
		return 0;
	}

}
