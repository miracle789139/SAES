package edu.usst.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class AuthDao extends AbstractBaseDao{

	public Map<String, Object> getUser(String userId,String password) {
		List<Map<String, Object>> dataList = null;
		String sql= "select p.*,r.GROUP_ID,r.NOTE,r.ROLE_LEVEL from s_person  p left join dm_role r on p.GROUP_ID=r.GROUP_ID where p.account=? and  p.password=? ";
//		String sql= "select * from s_person  p  where p.account=? and  p.password=? ";
		try {
			dataList=getJdbcTemplate().queryForList(sql, new Object[]{userId, password});
			if(dataList!=null&&!dataList.isEmpty()){

				Map<String, Object> item = dataList.get(0);
				return item;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	


}
