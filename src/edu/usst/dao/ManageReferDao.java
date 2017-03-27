package edu.usst.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ManageReferDao extends AbstractBaseDao{

	public List<Map<String, Object>> getUserList(String sql) {
		List<Map<String, Object>> dataList = null;
		try {
			dataList=getJdbcTemplate().queryForList(sql);
			if(dataList!=null&&!dataList.isEmpty()){

				return dataList;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	@SuppressWarnings("deprecation")
	public Integer getListCount(String sql) {
		// TODO Auto-generated method stub
		Integer count=0;
		try {
			count=getJdbcTemplate().queryForInt(sql);
				return count;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public int updateList(String sql) {
		// TODO Auto-generated method stub
		Integer count=0;
		try {
			count=getJdbcTemplate().update(sql);
				return count;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	


}
