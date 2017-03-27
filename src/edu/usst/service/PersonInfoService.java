package edu.usst.service;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import edu.usst.dao.PersonInfoDao;
@Service
public class PersonInfoService {
	
	@Resource(name="personInfoDao")
	private PersonInfoDao personInfoDao;

	public Map<String, Object> getApplyList(String userId){
		
		Map<String, Object> apply= personInfoDao.getProApplyInfo(userId);
		return apply;
	}
	
	public void updateImg(int userId,String savepic) {
		
		personInfoDao.updateImg(userId,savepic);
	}
}
