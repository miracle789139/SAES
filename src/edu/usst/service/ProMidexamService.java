package edu.usst.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import edu.usst.dao.ProActualizeDao;
import edu.usst.dao.ProApprovalDao;
import edu.usst.dao.ProManageDao;
import edu.usst.dao.ProMidexamDao;
import edu.usst.model.ProManageModel;

@Service
public class ProMidexamService {

	@Resource(name="proMidexamDao")
	private ProMidexamDao proMidexamDao;
	
	/**
	 * 项目实施信息
	 * @return
	 */
	public List<Map<String, Object>> getMidexamList(){
		List<Map<String, Object>> datalist= proMidexamDao.getMidexamInfo();
		return datalist;
	}
	
	/*项目实施中检*/
//	public int midexam_apply(String UNIQUE_CODE){
//		int flag= proActualizeDao.midexam_apply(UNIQUE_CODE);
//		return flag;
//	}
	
	public Map<String, Object> midexam_check(String UNIQUE_CODE){
		Map<String, Object> datalist= proMidexamDao.midexam_check(UNIQUE_CODE);
		return datalist;
	}
	
	public int midexam_edit1(String UNIQUE_CODE,String YUAN_SUGGEST){
		int flag = proMidexamDao.midexam_edit1(UNIQUE_CODE,YUAN_SUGGEST);
		return flag;
	}

	
}
