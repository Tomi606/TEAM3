package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.PostVO;

public interface PostService {

	ArrayList<PostVO> getPostList(int bo_num);

}
