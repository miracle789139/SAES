package edu.usst.dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.jdbc.core.RowCallbackHandler;
import org.springframework.stereotype.Repository;

import edu.usst.model.InsertInfo;
import edu.usst.model.Title;

@Repository
public class ProApplyInfoDao extends AbstractBaseDao {
	/**
	 * 得到项目申报信息
	 * @return
	 */
	public List<Map<String,Object>> getProApplyInfo() {
		List<Map<String,Object>> dataList = null;//定义一个列表，用于接受SQL查询结果
		String sql= "SELECT APPLYID,s_project_apply_info.NAME as proName,create_time,suo_check_state,yuan_check_state,s_person.NAME as applierName FROM s_project_apply_info inner join s_person where s_project_apply_info.APPLIER_ID=s_person.ID ";
		try {
			dataList=getJdbcTemplate().queryForList(sql);//执行SQL查询
		    return dataList;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	/**
	 * 根据申报类型获取申报列表
	 * @param apply_class
	 * @return
	 */
	public List<Map<String,Object>> getApplyInfoByApplyClass(int apply_class){
		List<Map<String,Object>> dataList = null;//定义一个列表，用于接受SQL查询结果
		String sql= "SELECT APPLYID,NAME,create_time,suo_check_state,yuan_check_state FROM s_project_apply_info where apply_class="+apply_class;
		try {
			dataList=getJdbcTemplate().queryForList(sql);//执行SQL查询
		    return dataList;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	/**
	 * 添加院外项目
	 * @param insertInfo
	 * @return
	 */
	
	public int saveProApplyInfo(InsertInfo insertInfo ){
		String sql = "select TITLE_ID from dm_title_define where NAME = ?";
		String sql1 =
				"Insert into s_person(ID,NAME,SEXID,ID_CARD,DUTY,TITLE_ID,RESEARCH_FIELD,School,EMAIL,ADDRESS,POSTAL_CODE,MOBILE,TEL_OFFICE,TEL_HOME) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		String sql2 = 
				"Insert into s_project_apply_info(APPLYID,NAME,PROJECT_LOCATION,PROJECT_SOURCE_UNIT,PROJECT_CLASS,PROJECT_TYPE,APPLIER_ID,CREATE_TIME,SUO_CHECK_STATE,YUAN_CHECK_STATE) VALUES(?,?,?,?,?,?,?,?,?,?) ";
		Object[] params = new Object[]{insertInfo.getTitle()}; 
		Map<String,Object> titles= getJdbcTemplate().queryForMap(sql,params);
		String titleId = (String) titles.get("TITLE_ID");
		Object[] params1 = new Object[]{
				insertInfo.getApplierID(),insertInfo.getApplierName(),insertInfo.getSex(),
				insertInfo.getIdCard(),insertInfo.getDuty(),titleId,
				insertInfo.getResearchField(),insertInfo.getSchool(),insertInfo.getEmail(),
				insertInfo.getAdress(),insertInfo.getPostalCode(),insertInfo.getMobile(),
				insertInfo.getTelOffice(),insertInfo.getTelHome()
		};
		
		Object[] params2 = new Object[]{
				insertInfo.getApplyId(),insertInfo.getApplyName(),insertInfo.getProjectLocation(),insertInfo.getProjectSourceUnit(),insertInfo.getProjectClass(),
				insertInfo.getProjectType(),insertInfo.getApplierID(),insertInfo.getDate(),insertInfo.getSUO_CHECK_STATE(),
				insertInfo.getYUAN_CHECK_STATE()
		};
		int flag1 = getJdbcTemplate().update(sql1, params1);
		System.out.println("sssssssssss");

		int flag2 = getJdbcTemplate().update(sql2,params2);
		return flag2;
	} 
	
	//查找数据
	public InsertInfo finInsertInfoById(String id){
		String sql ="select s_project_apply_info.APPLYID,s_project_apply_info.NAME,PROJECT_LOCATION,PROJECT_SOURCE_UNIT"+
	                   ",PROJECT_CLASS,PROJECT_TYPE,s_person.ID,s_person.NAME,SEXID,ID_CARD,DUTY,"+
				       "TITLE_ID,RESEARCH_FIELD,School,EMAIL,ADDRESS,POSTAL_CODE,MOBILE,TEL_OFFICE,TEL_HOME from s_project_apply_info inner join s_person where s_project_apply_info.APPLIER_ID=s_person.ID AND s_project_apply_info.APPLYID=?";
		final InsertInfo insertInfo = new InsertInfo();
		final Object[] params = new Object[]{id};
		getJdbcTemplate().query(sql, params, new RowCallbackHandler() {
			public void processRow(ResultSet rs) throws SQLException {
				String sql1 = "select NAME from dm_title_define where TITLE_ID = ?";
				Object[] params = new Object[]{rs.getString("TITLE_ID")}; 
				Map<String,Object> titles= getJdbcTemplate().queryForMap(sql1,params);
				String title = (String) titles.get("NAME");
				//向insertInfo中添加各个属性
				insertInfo.setApplyId(rs.getString("s_project_apply_info.APPLYID"));
				insertInfo.setApplyName(rs.getString("s_project_apply_info.NAME"));
				insertInfo.setProjectSourceUnit(rs.getString("PROJECT_SOURCE_UNIT"));
				insertInfo.setProjectLocation(rs.getString("PROJECT_LOCATION"));
				insertInfo.setProjectClass(rs.getString("PROJECT_CLASS"));
				insertInfo.setProjectType(rs.getString("PROJECT_TYPE"));
				insertInfo.setApplierID(rs.getInt("s_person.ID"));
				insertInfo.setApplierName(rs.getString("s_person.NAME"));
				insertInfo.setSex(rs.getString("SEXID"));
				insertInfo.setIdCard(rs.getString("ID_CARD"));
				insertInfo.setDuty(rs.getString("DUTY"));
				insertInfo.setTitle(title);
				insertInfo.setResearchField(rs.getString("RESEARCH_FIELD"));
				insertInfo.setSchool(rs.getString("School"));
				insertInfo.setEmail(rs.getString("EMAIL"));
				insertInfo.setAdress(rs.getString("ADDRESS"));
				insertInfo.setPostalCode(rs.getString("POSTAL_CODE"));
				insertInfo.setMobile(rs.getString("MOBILE"));
				insertInfo.setTelOffice(rs.getString("TEL_OFFICE"));
				insertInfo.setTelHome(rs.getString("TEL_HOME"));				
			}
		});
		return insertInfo;
	}
	
	//更新数据
	public int updateInsertInfo(InsertInfo insertInfo){
		System.out.println(insertInfo);
		String sql = "select TITLE_ID from dm_title_define where NAME = ?";
		String sql1 =
				"update s_person set NAME=?,SEXID=?,ID_CARD=?,DUTY=?,TITLE_ID=?,RESEARCH_FIELD=?,School=?,EMAIL=?,ADDRESS=?,POSTAL_CODE=?,MOBILE=?,TEL_OFFICE=?,TEL_HOME=? where ID=?";
		String sql2 = 
				"update s_project_apply_info set NAME=?,PROJECT_SOURCE_UNIT=?,PROJECT_CLASS=?,PROJECT_TYPE=? where APPLYID=?";
		Object[] params = new Object[]{insertInfo.getTitle()}; 
		Map<String,Object> titles= getJdbcTemplate().queryForMap(sql,params);
		String titleId = (String) titles.get("TITLE_ID");
		Object[] params1 = new Object[]{
				insertInfo.getApplierName(),insertInfo.getSex(),
				insertInfo.getIdCard(),insertInfo.getDuty(),titleId,
				insertInfo.getResearchField(),insertInfo.getSchool(),insertInfo.getEmail(),
				insertInfo.getAdress(),insertInfo.getPostalCode(),insertInfo.getMobile(),
				insertInfo.getTelOffice(),insertInfo.getTelHome(),insertInfo.getApplierID()
		};
		
		Object[] params2 = new Object[]{
				insertInfo.getApplyName(),insertInfo.getProjectSourceUnit(),insertInfo.getProjectClass(),
				insertInfo.getProjectType(),insertInfo.getApplyId()
		};
		int flag1 = getJdbcTemplate().update(sql1, params1);
		System.out.println("sssssssssss");

		int flag2 = getJdbcTemplate().update(sql2,params2);
		return flag2;
	}
	
	//删除数据
	public int deleInfoById(String[] id){
		int flag=0;
		String sql = "delete from s_project_apply_info where APPLYID=?";
		for(int i=0;i<id.length;i++){
			Object[] params = new Object[]{id[i]};
			flag =getJdbcTemplate().update(sql,params);	
		}
		return flag;
	}
	
	public Map<String, Object> getDeclare_number(){
		List<Map<String, Object>> dataList = null;
		String sql= "select * from code_generation where id=1";
		String sql1="update code_generation set declare_number=declare_number+1 where id=1 ";
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
	
	//查询职称信息
	
	
	
	

}
