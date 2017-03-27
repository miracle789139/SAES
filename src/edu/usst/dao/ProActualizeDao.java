package edu.usst.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import edu.usst.model.ProManageModel;

@Repository
public class ProActualizeDao extends AbstractBaseDao  {

	/**
	 * 项目实施
	 * @return
	 */
	public List<Map<String, Object>> getActualizeInfo() {
		List<Map<String, Object>> dataList = null;;
		String sql= "select b.UNIQUE_CODE,b.PROJECT_CODE,b.PROJECT_TYPE,b.PROJECT_NAME,b.CHARGER_NAME,b.UNIT_ID,b.APPLIER_ID,a.* ,c.ACTUALIZE_STATUS,c.MIDEXAM_APPLY from s_project_basic_info b inner join"+
		" s_project_approval_info a on b.UNIQUE_CODE=a.UNIQUE_CODE inner join s_project_actualize_info c on c.UNIQUE_CODE=a.UNIQUE_CODE  where b.SUO_CHECK_STATE=1 and b.YUAN_CHECK_STATE=1 and b.IF_DELETE=0";
		try {dataList=getJdbcTemplate().queryForList(sql);
		if(dataList!=null&&!dataList.isEmpty()){
			return dataList;
		}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 项目实施中检申请
	 * @return
	 */
	public int midexam_apply(String UNIQUE_CODE){
		//申请状态改变
		String sql="update s_project_actualize_info set MIDEXAM_APPLY=1 where UNIQUE_CODE=? ";
		//提交申请，在“项目中检”栏目中自动加载当前项目
		String sqlexam="Insert into s_project_midexam(UNIQUE_CODE)VALUES(?) ";
		Object[] params = new Object[]{UNIQUE_CODE};
		int flag = getJdbcTemplate().update(sql, params);
		int flagexam = getJdbcTemplate().update(sqlexam, params);
		return flag;
	}
}
