package edu.usst.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import edu.usst.dao.ProActualizeDao;
import edu.usst.dao.ProApprovalDao;
import edu.usst.dao.ProEnditemDao;
import edu.usst.dao.ProManageDao;
import edu.usst.dao.ProMidexamDao;
import edu.usst.model.ProManageModel;

@Service
public class ProEnditemService {

	@Resource(name="proEnditemDao")
	private ProEnditemDao proEnditemDao;
	
	/**
	 * 项目结项信息
	 * @return
	 */
	public List<Map<String, Object>> getEnditemList(){
		List<Map<String, Object>> datalist= proEnditemDao.getEnditemInfo();
		return datalist;
	}
	
	public Map<String, Object> enditem_check(String UNIQUE_CODE){
		Map<String, Object> datalist= proEnditemDao.enditem_check(UNIQUE_CODE);
		return datalist;
	}
	
	public int enditem_edit1(String UNIQUE_CODE,String FINISH_NOTE){
		int flag = proEnditemDao.enditem_edit1(UNIQUE_CODE,FINISH_NOTE);
		return flag;
	}

	
}
