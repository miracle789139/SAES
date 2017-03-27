package edu.usst.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import edu.usst.dao.ProManageDao;
import edu.usst.model.InsertInfo;
import edu.usst.model.ProManageModel;

@Service
public class ProManageService {
	@Resource(name="proManageDao")
	private ProManageDao proManageDao;
	
	/**
	 * 项目一览信息
	 * @return
	 */
	public List<Map<String, Object>> getManageList(String personName){
		List<Map<String, Object>> datalist= proManageDao.getProBasicInfo(personName);
		
		return datalist;
	}
	
	public List<Map<String, Object>> getProApplyInfo(){
		List<Map<String, Object>> datalist= proManageDao.getProApplyInfo();
		
		return datalist;
	}
	
	public int manage_insert(ProManageModel proManageModel){
		int flag = proManageDao.manage_add(proManageModel);
		return flag;
	}
	
	public Map<String, Object> manage_check(String UNIQUE_CODE){
		Map<String, Object> proManageCheck = proManageDao.manage_check(UNIQUE_CODE);
		return proManageCheck;
	}
	
	public int manage_edit(String UNIQUE_CODE,String PROJECT_TYPE,String PROJECT_NAME,String CHARGER_NAME,int UNIT_ID,int APPLIER_ID){
		int flag = proManageDao.manage_edit(UNIQUE_CODE,PROJECT_TYPE,PROJECT_NAME,CHARGER_NAME,UNIT_ID,APPLIER_ID);
		return flag;
	}
	
	public int pro_manage_delete(String[] UNIQUE_CODE){
		int flag = proManageDao.pro_manage_delete(UNIQUE_CODE);
		return flag;
	}
	
	public Map<String, Object> getproject_number(){
		Map<String, Object> project_number = proManageDao.getproject_number();
		return project_number;
	}
	
}
