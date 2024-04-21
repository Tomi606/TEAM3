package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.ItemVO;

public interface ProgramService {
	
	ArrayList<ItemVO> getItemList();

	boolean insertItem(ItemVO item, HospitalVO user);


}
