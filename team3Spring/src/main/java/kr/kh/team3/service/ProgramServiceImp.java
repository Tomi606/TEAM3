package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.kh.team3.dao.ProgramDAO;
import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.SiteManagement;

@Controller
public class ProgramServiceImp implements ProgramService{
	
	@Autowired
	ProgramDAO programDao;

	@Override
	public boolean insertItem(ItemVO item, SiteManagement user) {
		if(item.getIt_name() == "" || item.getIt_explanation() == ""
				|| user.getSite_id() == "") {
			return false;
		}
		ArrayList<ItemVO> itemList = programDao.selectItemList(user);
		for(ItemVO tmp : itemList) {
			if(tmp.getIt_name().equals(item)) {
				System.out.println("중복값 있음");
				return false;
			}
		}

		if(user.getSite_authority().contains("USER")) {			
			return programDao.insertItem(item, user);	
		}
		return false;
	}

	@Override
	public ArrayList<ItemVO> getItemList(SiteManagement user) {
		
		return programDao.selectItemList(user);
	}

	
	
	@Override
	public ArrayList<HospitalProgramVO> getProgramList(SiteManagement user) {
		return programDao.selectProgramList(user);
	}

	@Override
	public boolean insertProgram(HospitalProgramVO program, SiteManagement user) {
		if(program.getHp_payment() == 0 || program.getHp_ho_id() == ""
				|| user.getSite_id() == null) {
			return false;
		}
		ArrayList<HospitalProgramVO> ProgramList = programDao.selectProgramList(user);
		for(HospitalProgramVO tmp : ProgramList) {
			if(tmp.getHp_title().equals(program.getHp_title())) {
				System.out.println("중복값 있음");
				return false;
			}
		}

		if(user.getSite_authority().contains("USER")) {			
			return programDao.insertProgram(program, user);	
		}
		return false;
	}

	@Override
	public boolean updateItem(ItemVO item, SiteManagement user, int it_num, ArrayList<ItemVO> itemList) {
		if(!itemList.get(1).getIt_ho_id().equals(user.getSite_id())) {
			System.out.println("11111111");
			return false;
		}
		for(ItemVO tmp : itemList) {
			System.out.println(tmp.getIt_name().equals(item.getIt_name()));
			if(tmp.getIt_name().equals(item.getIt_name())) {
				System.out.println("22222222222");
				return false;
			}
		}
		return programDao.updateItem(item, it_num);
	}

	@Override
	public boolean deleteItem(ArrayList<Integer> intList) {
		
		for(int tmp : intList) {
			programDao.deleteItem(tmp);
		}		
		return true;
	}


}
