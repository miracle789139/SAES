package edu.usst.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;
@Repository
public class keyanxinxiDAO extends AbstractBaseDao{

	public List<Map<String, Object>> findByPage(String biaoname, int start, int numperpage, String isread) {
		List<Map<String, Object>> dataList = null;
		String sql="";
		String is="";
		if(isread.equals("0")){
			is="未阅读";
			sql= "select * from "+ biaoname+" where ISREAD=? limit ?,? ";
		}
		else if(isread.equals("1"))
		{is="已阅读"; 
		sql= "select * from "+ biaoname+" where ISREAD=? limit ?,? ";}
		else{ 
			is="2";
			sql= "select * from "+ biaoname+" where "+is+"=? limit ?,? ";}
		try {
			System.out.println(sql);
			dataList=getJdbcTemplate().queryForList(sql, new Object[]{is,start,numperpage});
	        return dataList;
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public int findTotalRecordNum(String biaoname, String isread) {
		String sql="";
		if(isread.equals("2")){
		 sql= "select count(*) from "+biaoname;}
		else if(isread.equals("0")){
			sql= "select count(*) from "+biaoname+" where ISREAD='未阅读'";
		}
		else{
			sql= "select count(*) from "+biaoname+" where ISREAD='已阅读'";
			}
		try {
			int  num=getJdbcTemplate().queryForInt(sql);
	        return num;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public Map<String, Object> findByid(String biaoname, int parseInt) {
	String sql= "select * from "+ biaoname+" where id=? ";
	try {
		
		Map<String, Object>	dataList=getJdbcTemplate().queryForList(sql, new Object[]{parseInt}).get(0);
        return dataList;
		
	} catch (Exception e) {
		e.printStackTrace();
	}

	return null;

	}

}
