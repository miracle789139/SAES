package edu.usst.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import edu.usst.model.ProManageModel;

@Repository
public class ProMidexamDao extends AbstractBaseDao  {

	/**
	 * 项目中检
	 * @return
	 */
	public List<Map<String, Object>> getMidexamInfo() {
		List<Map<String, Object>> dataList = null;;
		String sql= "select b.UNIQUE_CODE,b.PROJECT_CODE,b.PROJECT_TYPE,b.PROJECT_NAME,b.CHARGER_NAME,b.UNIT_ID,b.APPLIER_ID,a.* from s_project_basic_info b inner join"+
		" s_project_midexam a on b.UNIQUE_CODE=a.UNIQUE_CODE where b.SUO_CHECK_STATE=1 and b.YUAN_CHECK_STATE=1 and b.IF_DELETE=0";
		try {dataList=getJdbcTemplate().queryForList(sql);
		if(dataList!=null&&!dataList.isEmpty()){
			return dataList;
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//项目中检查看
	public Map<String, Object> midexam_check(String UNIQUE_CODE){
		List<Map<String, Object>> dataList = null;
		String sql= "select b.UNIQUE_CODE,b.PROJECT_CODE,b.PROJECT_TYPE,b.PROJECT_NAME,b.CHARGER_NAME,b.UNIT_ID,b.APPLIER_ID,a.* from s_project_basic_info b inner join"+
				" s_project_midexam a on b.UNIQUE_CODE=a.UNIQUE_CODE where b.SUO_CHECK_STATE=1 and b.YUAN_CHECK_STATE=1 and a.UNIQUE_CODE=? ";
		try {
			dataList=getJdbcTemplate().queryForList(sql,new Object[]{UNIQUE_CODE});
			if(dataList!=null&&!dataList.isEmpty()){
				return dataList.get(0);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	//项目中检编辑提交
	public int midexam_edit1(String UNIQUE_CODE,String YUAN_SUGGEST){
		String sql="update s_project_midexam set YUAN_SUGGEST=? where UNIQUE_CODE=? ";
		Object[] params = new Object[]{YUAN_SUGGEST,UNIQUE_CODE};
		int flag = getJdbcTemplate().update(sql, params);
		return flag;
	}
}
