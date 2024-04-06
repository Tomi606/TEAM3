package kr.kh.team3.service;

import kr.kh.team3.model.vo.HospitalVO;
import kr.kh.team3.model.vo.SiteManagement;

public interface HospitalService {

	boolean signup(HospitalVO hospital);

	boolean signup(SiteManagement site);

}
