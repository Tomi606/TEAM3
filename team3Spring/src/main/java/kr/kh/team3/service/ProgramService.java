package kr.kh.team3.service;

import java.util.ArrayList;

import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.ItemListVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface ProgramService {
	
	ArrayList<ItemVO> getItemList(SiteManagement user);

	boolean insertItem(ItemVO item, SiteManagement user);

	ArrayList<HospitalProgramVO> getProgramList(SiteManagement user);

	boolean insertProgram(HospitalProgramVO program, SiteManagement user);

	boolean updateItem(ItemVO item, SiteManagement user, int it_num, ArrayList<ItemVO> itemList);

	boolean deleteItem(ArrayList<Integer> intList);

	boolean updateProgram(HospitalProgramVO program, SiteManagement user, ArrayList<HospitalProgramVO> programList);

	boolean deleteProgram(int hp_num);

	boolean insertItemList(HospitalProgramVO program, ArrayList<Integer> list, SiteManagement user);

	ArrayList<ItemListVO> getItemListList(SiteManagement user, int hp_num);

	ArrayList<ItemVO> getItemListByItem(int il_num);


}