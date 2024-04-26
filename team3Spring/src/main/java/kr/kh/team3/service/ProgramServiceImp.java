package kr.kh.team3.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import kr.kh.team3.dao.ProgramDAO;
import kr.kh.team3.model.vo.HospitalProgramVO;
import kr.kh.team3.model.vo.ItemListVO;
import kr.kh.team3.model.vo.ItemVO;
import kr.kh.team3.model.vo.SiteManagement;

@Controller
public class ProgramServiceImp implements ProgramService{
	
	@Autowired
	ProgramDAO programDao;

	@Override
	public boolean insertItem(ItemVO item, SiteManagement user) {
		/* 회원가입 수정 후 나중에 주석 제거해야함
		 * if(item.getIt_name() == "" || item.getIt_explanation() == "" ||
		 * user.getSite_id() == "") { return false; }
		 */
		ArrayList<ItemVO> itemList = programDao.selectItemList(user);
		for(ItemVO tmp : itemList) {
			if(tmp.getIt_name().equals(item)) {
				System.out.println("중복값 있음");
				return false;
			}
		}

		//회원가입 수정 후 나중에 주석 제거해야함
		 if(user.getSite_authority().equals("MANAGER")) { 		 
			 return programDao.insertItem(item, user);	
		 }
		return false;
	}

	@Override
	public ArrayList<ItemVO> getItemList(SiteManagement user) {
		
		return programDao.selectItemList(user);
	}

	@Override
	public boolean updateItem(ItemVO item, SiteManagement user, int it_num, ArrayList<ItemVO> itemList) {
		for(ItemVO tmp : itemList) {
			System.out.println(tmp.getIt_name().equals(item.getIt_name()));
			if(tmp.getIt_name().equals(item.getIt_name())) {
				return false;
			}
		}
		return programDao.updateItem(item, it_num);
	}

	@Override
	public boolean deleteItem(ArrayList<Integer> intList) {
		
		for(int tmp : intList) {
			boolean res = programDao.deleteItem(tmp);
			if(!res) {
				return false;
			}
		}
		return true;
	}
	//==================================아이템 기능 끝=====================================
	
	//==================================프로그램 기능 시작=====================================
	
	@Override
	public boolean insertProgram(HospitalProgramVO program
			, SiteManagement user, ArrayList<Integer> list) {
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
		
		boolean programRes = false;
		boolean listRes = false;
		if(user.getSite_authority().equals("MANAGER")) {	
			//항목 리스트, 항목 리스트 제목, 병원 프로그램 명(번호) 가져와서 itemList에 넣기
			programRes =  programDao.insertProgram(program, user);	
		}
		if(programRes) {
			HospitalProgramVO pr = programDao.selectProgram(program);
			if(pr == null) {
				return false;
			}
			for(int tmp : list) {
				listRes = programDao.insertItemList(pr, tmp);
				if(!listRes) {
					return false;
				}
			}
		}
		return true;
	}
	
	@Override
	public ArrayList<HospitalProgramVO> getProgramList(SiteManagement user) {
		if(user == null) {
			return null;
		}
		return programDao.selectProgramList(user);
	}


	@Override
	public boolean deleteProgram(int hp_num) {
		boolean res = programDao.deleteItemList(hp_num);
		if(res) {			
			return programDao.deleteProgram(hp_num);
		}
		return false;
	}


	@Override
	public ArrayList<ItemListVO> getItemListList(SiteManagement user, int hp_num) {
		return programDao.selectItemListList(user, hp_num);
	}

	@Override
	public ArrayList<ItemVO> getItemListByItem(int il_num) {
		return programDao.selectItemListByItem(il_num);
	}


}