package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.kh.team3.dao.ProgramDAO;
import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.ItemVO;

@Controller
public class ProgramServiceImp implements ProgramService{
	
	@Autowired
	ProgramDAO programDao;

	@Override
	public boolean insertItem(ItemVO item, HospitalVO user) {
		if(item == null) {
			return false;
		}
		ArrayList<ItemVO> itemList = programDao.selectItemList();
		for(ItemVO tmp : itemList) {
			if(tmp.getIt_name().equals(item)) {
				System.out.println("중복값 있음");
				return false;
			}
		}
		if(user.getHo_authority() == "MANAGER") {			
			return programDao.insertItem(item);	
		}
		return false;
	}

	@Override
	public ArrayList<ItemVO> getItemList() {
		
		return programDao.selectItemList();
	}


}
