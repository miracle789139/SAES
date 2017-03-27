package edu.usst.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import edu.usst.model.ProManageModel;

@Repository
public class ProApprovalDao extends AbstractBaseDao  {

//	private ProApplyInfo proApplyInfo; 
	/**
	 * 项目立项
	 * @return
	 */
	public List<Map<String, Object>> getApprovalInfo() {
		List<Map<String, Object>> dataList = null;;
		String sql= "select b.UNIQUE_CODE,b.PROJECT_CODE,b.PROJECT_TYPE,b.PROJECT_NAME,b.CHARGER_NAME,b.UNIT_ID,b.APPLIER_ID,a.* from s_project_basic_info b inner join s_project_approval_info a on b.UNIQUE_CODE=a.UNIQUE_CODE where b.SUO_CHECK_STATE=1 and b.YUAN_CHECK_STATE=1 and b.IF_DELETE=0";
		try {dataList=getJdbcTemplate().queryForList(sql);
		if(dataList!=null&&!dataList.isEmpty()){

			return dataList;
		}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public Map<String, Object> approval_check(String UNIQUE_CODE){
		List<Map<String, Object>> dataList = null;;
		String sql= "select b.UNIQUE_CODE,b.PROJECT_CODE,b.PROJECT_TYPE,b.PROJECT_NAME,b.CHARGER_NAME,b.UNIT_ID,b.APPLIER_ID,a.* from s_project_basic_info b inner join s_project_approval_info a on b.UNIQUE_CODE=a.UNIQUE_CODE where b.SUO_CHECK_STATE=1 and b.YUAN_CHECK_STATE=1 and a.UNIQUE_CODE=? ";
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


	public int approval_insert(String UNIQUE_CODE,String PLAN_END_DATE,int PROJECT_FEE,String EXPECT_RESULT){
		String sql="update s_project_approval_info set PLAN_END_DATE=?,PROJECT_FEE=?,EXPECT_RESULT=? where UNIQUE_CODE=? ";
		Object[] params = new Object[]{PLAN_END_DATE,PROJECT_FEE,EXPECT_RESULT,UNIQUE_CODE};
		int flag = getJdbcTemplate().update(sql, params);
		return flag;
	}
	
	//删除数据
		public int pro_manage_delete(String[] UNIQUE_CODE){
			int flag=0;
			String sql = "delete from s_project_basic_info where UNIQUE_CODE=?";
			for(int i=0;i<UNIQUE_CODE.length;i++){
				Object[] params = new Object[]{UNIQUE_CODE[i]};
				flag =getJdbcTemplate().update(sql,params);	
			}
			return flag;
		}
		
	
	/**
	 * 获取项目管理自动生成唯一编号记录
	 * @return
	 */
	public Map<String, Object> getproject_number(){
		List<Map<String, Object>> dataList = null;
		String sql= "select * from code_generation where id=1";
		String sql1="update code_generation set project_number=project_number+1 where id=1 ";
		try {
			dataList=getJdbcTemplate().queryForList(sql);
			if(dataList!=null&&!dataList.isEmpty()){
				Map<String, Object> item = dataList.get(0);
				int flag = getJdbcTemplate().update(sql1);
				return item;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
//	public int approval_insert(){
//		
//	}
}
