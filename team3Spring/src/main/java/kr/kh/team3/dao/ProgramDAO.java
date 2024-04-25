package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.ItemListVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface ProgramDAO {

	ArrayList<ItemVO> selectItemList(@Param("user") SiteManagement user);

	boolean insertItem(@Param("item")ItemVO item,@Param("user") SiteManagement user);

	ArrayList<HospitalProgramVO> selectProgramList(@Param("user") SiteManagement user);

	boolean insertProgram(@Param("pr")HospitalProgramVO program,@Param("user") SiteManagement user);

	boolean updateItem(@Param("item")ItemVO item, @Param("it_num") int it_num);

	boolean deleteItem(@Param("it_num")int tmp);

	boolean deleteProgram(@Param("hp_num")int hp_num);

	boolean insertItemList(@Param("pr")HospitalProgramVO program,@Param("il_it_num") int tmp);

	ArrayList<ItemListVO> selectItemListList(@Param("user")SiteManagement user,@Param("hp_num") int hp_num);

	ArrayList<ItemVO> selectItemListByItem(@Param("il_num")int il_num);

	HospitalProgramVO selectProgram(@Param("pr")HospitalProgramVO program);

	boolean deleteItemList(@Param("hp_num") int hp_num);

}