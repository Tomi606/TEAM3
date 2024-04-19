package kr.kh.team3.service;

import java.util.ArrayList;

<<<<<<< Updated upstream
import kr.kh.team3.model.vo.HospitalProgramVO;
=======
>>>>>>> Stashed changes
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface ProgramService {
	
	ArrayList<ItemVO> getItemList(SiteManagement user);

	boolean insertItem(ItemVO item, SiteManagement user);
<<<<<<< Updated upstream

	ArrayList<HospitalProgramVO> getProgramList(SiteManagement user);

	boolean insertProgram(HospitalProgramVO program, SiteManagement user);

	boolean updateItem(ItemVO item, SiteManagement user, int it_num, ArrayList<ItemVO> itemList);

	boolean deleteItem(ArrayList<Integer> intList);
=======
>>>>>>> Stashed changes


}
