package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import kr.kh.team3.dao.PostDAO;
import kr.kh.team3.model.vo.PostVO;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@Component
public class PostServiceImp implements PostService{
	
	@Autowired
	PostDAO postDao;

	@Override
	public ArrayList<PostVO> getPostList(int bo_num) {
		return postDao.selectPostList(bo_num);
	}
}
