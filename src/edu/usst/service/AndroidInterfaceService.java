package edu.usst.service;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.usst.dao.AndroidInterfaceDao;
import edu.usst.dao.AuthDao;
import edu.usst.utils.MD5;
@Service
public class AndroidInterfaceService {

	/**
	 * 逻辑登录
	 * @param username
	 * @param password
	 * @return
	 */
	@Resource(name="androidInterfaceDao")
	private AndroidInterfaceDao androidInterfaceDao;

	public List<Map<String, Object>> getNoticeList(){
		List<Map<String, Object>> noticeList=androidInterfaceDao.getNoticeList();
		return noticeList;
	}

	public Map<String, Object> getNoticeDetail(String noticeId){
		Map<String, Object> noticeDetail=androidInterfaceDao.getNoticeDetail(noticeId);
		return noticeDetail;
	}

	public List<Map<String, Object>> getAuditList(String userId) {
		// TODO 获取审核信息列表
		List<Map<String, Object>> auditList=androidInterfaceDao.getAuditList(userId);
		return auditList;
	}

	public Map<String, Object> getAuditDetail(String auditId) {
		// TODO Auto-generated method stub
		Map<String, Object> auditDetail=androidInterfaceDao.getAuditDetail(auditId);
		return auditDetail;
	}

}
