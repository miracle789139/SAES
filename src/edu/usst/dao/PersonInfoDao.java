package edu.usst.dao;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Repository;

import edu.usst.model.Person;
import edu.usst.utils.HthTools;
@Repository
public class PersonInfoDao extends AbstractBaseDao {
	public Map<String, Object> getProApplyInfo(String userId) {
		
		List<Map<String, Object>> dataList = null;
		String sql="select * from s_person p where p.ACCOUNT=?";
		try {
			dataList=getJdbcTemplate().queryForList(sql, new Object[]{userId});
		
			if(dataList!=null&&!dataList.isEmpty()){
			Map<String, Object> item = dataList.get(0);

			System.out.println(item);
			return item;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
	
	public void updateImg(int userId,String savepic) {
		// TODO Auto-generated method stub
		String sql= "update s_person set PhOTO_ID = ? WHERE ID= ? ";
		getJdbcTemplate().update(sql, new Object[]{savepic,userId});
	}

	

}
