package edu.usst.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import edu.usst.dao.ProApprovalDao;
import edu.usst.dao.ProManageDao;
import edu.usst.model.ProManageModel;

@Service
public class ProApprovalService {

	@Resource(name="proApprovalDao")
	private ProApprovalDao proApprovalDao;
	
	/**
	 * 项目立项信息
	 * @return
	 */
	public List<Map<String, Object>> getApprovalList(){
		List<Map<String, Object>> datalist= proApprovalDao.getApprovalInfo();
		return datalist;
	}
	
	public Map<String, Object> approval_check(String UNIQUE_CODE){
		Map<String, Object> datalist= proApprovalDao.approval_check(UNIQUE_CODE);
		return datalist;
	}
	
	public int approval_insert(String UNIQUE_CODE,String PLAN_END_DATE,int PROJECT_FEE,String EXPECT_RESULT){
		int flag = proApprovalDao.approval_insert(UNIQUE_CODE,PLAN_END_DATE,PROJECT_FEE,EXPECT_RESULT);
		return flag;
	}

	
}
