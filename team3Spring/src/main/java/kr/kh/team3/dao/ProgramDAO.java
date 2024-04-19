package kr.kh.team3.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.model.vo.ItemVO;

public interface ProgramDAO {

	ArrayList<ItemVO> selectItemList();

	boolean insertItem(@Param("item")ItemVO item);

}
