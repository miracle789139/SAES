package edu.usst.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.alibaba.druid.sql.visitor.functions.Insert;

import edu.usst.dao.ProApplyInfoDao;
import edu.usst.model.InsertInfo;

@Service
public class ProApplyInfoService {

	
	@Resource(name="proApplyInfoDao")
	private ProApplyInfoDao proApplyInfoDao;
	/**
	 * 获得申报列表信息
	 */
	public List<Map<String,Object>> getApplyList(){
		List<Map<String,Object>> apply= proApplyInfoDao.getProApplyInfo();
		return apply;
	}
	
	/**
	 * 根据申报类型获取申报列表
	 * @param apply_class
	 * @return
	 */
	
	public List<Map<String,Object>> getApplyListByClass(int apply_class){
		List<Map<String,Object>> apply = proApplyInfoDao.getApplyInfoByApplyClass(apply_class);
		return apply;
	}
	/**
	 * 添加院外项目
	 * @param insertInfo
	 * @return
	 */
	public int saveApply(InsertInfo insertInfo){
		int flag = proApplyInfoDao.saveProApplyInfo(insertInfo);
		return flag;
	}
	
	/**
	 * 通过id查询院外项目
	 * @param id
	 * @return
	 */
	public InsertInfo findApplyById(String id){
		InsertInfo insertInfo =proApplyInfoDao.finInsertInfoById(id);
		return insertInfo;	
	}
	
	/**
	 * 通过id更新院外项目
	 * @param insertInfo
	 * @return
	 */
	public int updateApply(InsertInfo insertInfo){
		int flag = proApplyInfoDao.updateInsertInfo(insertInfo);
		return flag;
		
	}
	
	/**
	 * 通过id删除项目
	 * @param id
	 * @return
	 */
	public int deleApply(String[] id){
		int flag = proApplyInfoDao.deleInfoById(id);
		return flag;
	}
	
	public Map<String, Object> getDeclare_number(){
		Map<String,Object> declareNumber = proApplyInfoDao.getDeclare_number();
		return declareNumber;
	}

}
