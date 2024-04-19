package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface ProgramDAO {

	ArrayList<ItemVO> selectItemList(@Param("user") SiteManagement user);

	boolean insertItem(@Param("item")ItemVO item,@Param("user") SiteManagement user);
<<<<<<< Updated upstream

	ArrayList<HospitalProgramVO> selectProgramList(@Param("user")SiteManagement user);

	boolean insertProgram(@Param("program")HospitalProgramVO program,@Param("user") SiteManagement user);

	boolean updateItem(@Param("item")ItemVO item,@Param("it_num") int it_num);

	void deleteItem(@Param("it_num")int tmp);
=======
>>>>>>> Stashed changes

}
