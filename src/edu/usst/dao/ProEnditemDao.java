package edu.usst.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import edu.usst.model.ProManageModel;

@Repository
public class ProEnditemDao extends AbstractBaseDao  {

	/**
	 * 项目结项
	 * @return
	 */
	public List<Map<String, Object>> getEnditemInfo() {
		List<Map<String, Object>> dataList = null;;
		String sql= "select b.UNIQUE_CODE,b.PROJECT_CODE,b.PROJECT_TYPE,b.PROJECT_NAME,b.CHARGER_NAME,b.UNIT_ID,b.APPLIER_ID,a.* from s_project_basic_info b inner join"+
		" s_project_enditem a on b.UNIQUE_CODE=a.UNIQUE_CODE where b.SUO_CHECK_STATE=1 and b.YUAN_CHECK_STATE=1 and b.IF_DELETE=0";
		try {dataList=getJdbcTemplate().queryForList(sql);
		if(dataList!=null&&!dataList.isEmpty()){
			return dataList;
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	//项目结项查看
	public Map<String, Object> enditem_check(String UNIQUE_CODE){
		List<Map<String, Object>> dataList = null;
		String sql= "select b.UNIQUE_CODE,b.PROJECT_CODE,b.PROJECT_TYPE,b.PROJECT_NAME,b.CHARGER_NAME,b.UNIT_ID,b.APPLIER_ID,a.* from s_project_basic_info b inner join"+
				" s_project_enditem a on b.UNIQUE_CODE=a.UNIQUE_CODE where b.SUO_CHECK_STATE=1 and b.YUAN_CHECK_STATE=1 and a.UNIQUE_CODE=? ";
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

	//项目结项编辑提交
	public int enditem_edit1(String UNIQUE_CODE,String FINISH_NOTE){
		String sql="update s_project_enditem set FINISH_NOTE=? where UNIQUE_CODE=? ";
		Object[] params = new Object[]{FINISH_NOTE,UNIQUE_CODE};
		int flag = getJdbcTemplate().update(sql, params);
		return flag;
	}
}
