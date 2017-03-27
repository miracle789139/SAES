package edu.usst.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import edu.usst.model.InsertInfo;
import edu.usst.model.ProManageModel;

@Repository
public class ProManageDao extends AbstractBaseDao {

	//	private ProApplyInfo proApplyInfo; 
	public List<Map<String, Object>> getProBasicInfo(String personName) {
		List<Map<String, Object>> dataList = null;;
		String sql= "select * from s_project_basic_info where IF_DELETE=0 and CHARGER_NAME=?";
		try {dataList=getJdbcTemplate().queryForList(sql,new Object[]{personName});
		if(dataList!=null&&!dataList.isEmpty()){

			return dataList;
		}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	/**
	 * 获得申报列表信息
	 */
	public List<Map<String,Object>> getProApplyInfo() {
		List<Map<String,Object>> dataList = null;//定义一个列表，用于接受SQL查询结果
		String sql= "SELECT * FROM s_project_apply_info";
		try {
			dataList=getJdbcTemplate().queryForList(sql);//执行SQL查询
			return dataList;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public int manage_add(ProManageModel proManageModel){

		String sql = 
				"Insert into s_project_basic_info(UNIQUE_CODE,PROJECT_CODE,PROJECT_TYPE,PROJECT_NAME,CHARGER_NAME,UNIT_ID,APPLIER_ID,CREATE_TIME) VALUES(?,?,?,?,?,?,?,?) ";
		Object[] params = new Object[]{proManageModel.getUNIQUE_CODE(),
				proManageModel.getPROJECT_CODE(),proManageModel.getPROJECT_TYPE(),proManageModel.getPROJECT_NAME(),
				proManageModel.getCHARGER_NAME(),proManageModel.getUNIT_ID(),proManageModel.getAPPLIER_ID(),
				proManageModel.getCREATE_TIME()
		};

		int flag = getJdbcTemplate().update(sql, params);

		return flag;
	} 

	public Map<String, Object> manage_check(String UNIQUE_CODE){
		List<Map<String, Object>> dataList = null;;
		String sql= "select * from s_project_basic_info where UNIQUE_CODE=? ";
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


	public int manage_edit(String UNIQUE_CODE,String PROJECT_TYPE,String PROJECT_NAME,String CHARGER_NAME,int UNIT_ID,int APPLIER_ID){
		String sql="update s_project_basic_info set PROJECT_NAME=?,CHARGER_NAME=?,PROJECT_TYPE=?,UNIT_ID=?,APPLIER_ID=? where UNIQUE_CODE=? ";
		Object[] params = new Object[]{PROJECT_NAME,CHARGER_NAME,PROJECT_TYPE,UNIT_ID,APPLIER_ID,UNIQUE_CODE};
		int flag = getJdbcTemplate().update(sql, params);
		return flag;
	}

	//删除数据，逻辑删除，保存原始数据
	public int pro_manage_delete(String[] UNIQUE_CODE){
		int flag=0;
//		String sql = "delete from s_project_basic_info where UNIQUE_CODE=?";
		String sql = "update s_project_basic_info set IF_DELETE=1 where UNIQUE_CODE=?";
		for(int i=0;i<UNIQUE_CODE.length;i++){
			Object[] params = new Object[]{UNIQUE_CODE[i]};
			flag =getJdbcTemplate().update(sql,params);	
		}
		return flag;
	}


	/**
	 * 获取项目管理自动生成唯一编号记录，生成编号并自动+1
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
}
