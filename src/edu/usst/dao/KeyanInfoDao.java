package edu.usst.dao;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import edu.usst.model.Magazine;
import edu.usst.model.Paper;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Repository;

import edu.usst.model.Paper;

@Repository
public class KeyanInfoDao extends AbstractBaseDao{
	private List<Paper> pl=new ArrayList<Paper>();
	private List<Magazine> ml=new ArrayList<Magazine>();
	private Connection conn=null;
	private ResultSet rs=null;
	private Statement ps=null;
	public List<Paper> keyaninfo(){
//		List<Map<String, Object>> dataList = null;
		String sql="select * from s_paper";
		pl.clear();
		try{
			conn=getJdbcTemplate().getDataSource().getConnection();
			ps=conn.createStatement();
			rs=ps.executeQuery(sql);
				while(rs.next()){
					Paper paper=new Paper();
					paper.setID(rs.getString("ID"));
					paper.setNAME(rs.getString("NAME"));
					paper.setPUBLISH_UNIT(rs.getString("PUBLISH_UNIT"));
					paper.setFIRST_AUTHOR_NAME(rs.getString("FIRST_AUTHOR_NAME"));
					paper.setOTHER_AUTHOR_NAME(rs.getString("OTHER_AUTHOR_NAME"));
					paper.setPUBLISH_DATE(rs.getString("PUBLISH_DATE"));
					paper.setWORD_NUMBER(rs.getString("WORD_NUMBER"));
					paper.setCHECK_STATUS_ID(rs.getString("CHECK_STATUS_ID"));
					pl.add(paper);
				}
			
			rs.close();
			ps.close();
			conn.close();	
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return pl;
		
	}
	
	private String c;

	
	public String keyaninfodele(String userId, String biaoname){
//		String[] id=userId.split(",");
		String sql="delete from " +biaoname+" where id in('"+userId+"')";
		System.out.println(sql);
		try{
			conn=getJdbcTemplate().getDataSource().getConnection();
			ps=conn.createStatement();
			int b=ps.executeUpdate(sql);
			System.out.println(b);
			if(b==0){
				c="FAIL";
			}else{
				c="SUCCESS";
			}	
			ps.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return c;
	}
	
	public List<Magazine> magezine(){
		String sql="select * from s_magazine";
		ml.clear();
		try{
			conn=getJdbcTemplate().getDataSource().getConnection();
			ps=conn.createStatement();
			rs=ps.executeQuery(sql);
			while(rs.next()){
				Magazine magazine=new Magazine();
				magazine.setID(rs.getString("ID"));
				magazine.setNAME(rs.getString("NAME"));
				magazine.setLEVEL(rs.getString("LEVEL"));
				magazine.setISSN(rs.getString("ISSN"));
				magazine.setCN(rs.getString("CN"));
				magazine.setPAPER_TYPE_ID(rs.getString("PAPER_TYPE_ID"));
				ml.add(magazine);
			}
			rs.close();
			ps.close();
			conn.close();	
		}catch(Exception e){
			e.printStackTrace();
		}
		return ml;
	}
	
	public String magazineadd(String name,String level,String issn,String cn,String type){
		String sql="insert into s_magazine(NAME,LEVEL,ISSN,CN,PAPER_TYPE_ID) values ('"+name+"','"+level+"','"+issn+"','"+cn+"','"+type+"')";
		try{
			conn=getJdbcTemplate().getDataSource().getConnection();
			ps=conn.createStatement();
			int b=ps.executeUpdate(sql);
			if(b==0){
				c="SUCCESS";
			}else{
				c="FAIL";
			}	
			ps.close();
			conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return c;
	}
	//paper
		public String keyaninfoupdate(String pROJECT_SOURCE_ID, String nAME,
				String pAPER_MODE_ID, String pUBLISH_UNIT,
				String fIRST_AUTHOR_NAME, String oTHER_AUTHOR_NAME,
				String pUBLISH_DATE, String wORD_NUMBER, String cHECK_STATUS_ID,
				int id,String fILE_IDS) {
			String sql="update s_paper set PROJECT_SOURCE_ID='"+pROJECT_SOURCE_ID+"',NAME='"+nAME+"',PAPER_MODE_ID='"+pAPER_MODE_ID+"',PUBLISH_UNIT='"+pUBLISH_UNIT+"',FIRST_AUTHOR_NAME='"+fIRST_AUTHOR_NAME+"',OTHER_AUTHOR_NAME='"+oTHER_AUTHOR_NAME+"',PUBLISH_DATE='"+pUBLISH_DATE+"',WORD_NUMBER='"+wORD_NUMBER+"',CHECK_STATUS_ID='"+cHECK_STATUS_ID;
			if(null!=fILE_IDS&&!fILE_IDS.equals("")){
				sql+="', fILE_IDS='"+fILE_IDS;
			}
			sql+="' where id='"+id+"'";
			System.out.println(sql);
			try{
				conn=getJdbcTemplate().getDataSource().getConnection();
				ps=conn.createStatement();
				int b=ps.executeUpdate(sql);
				if(b==1){
					c="SUCCESS";
				}else{
					c="FAIL";
				}	
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return c;
		}
	//s-book
		public String keyaninfoadd(String pROJECT_SOURCE_ID, String nAME,
				String fIRST_AUTHOR_NAME, String oTHER_AUTHOR_NAME,
				String pUBLISH_UNIT, String pUBLISH_DATE, String wORD_NUMBER,
				String rEMARK, String eDITOR, String string) {
			
			String sql="insert into s_book(PROJECT_SOURCE_ID,NAME,FIRST_AUTHOR_NAME,OTHER_AUTHOR_NAME,PUBLISH_UNIT,PUBLISH_DATE,WORD_NUMBER,REMARK,EDITOR,ISREAD) values ('"+pROJECT_SOURCE_ID+"','"+nAME+"','"+fIRST_AUTHOR_NAME+"','"+oTHER_AUTHOR_NAME+"','"+pUBLISH_UNIT+"','"+pUBLISH_DATE+"','"+wORD_NUMBER+"','"+rEMARK+"','"+eDITOR+"','"+string+"')";
			System.out.println(sql);
			try{
				conn=getJdbcTemplate().getDataSource().getConnection();
				ps=conn.createStatement();
				int b=ps.executeUpdate(sql);
				if(b==0){
					c="SUCCESS";
				}else{
					c="FAIL";
				}	
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return c;
		}
	//s_book
		public String keyaninfoupdate(int parseInt,
				String pROJECT_SOURCE_ID, String nAME, String fIRST_AUTHOR_NAME,
				String oTHER_AUTHOR_NAME, String pUBLISH_UNIT, String pUBLISH_DATE,
				String wORD_NUMBER, String rEMARK, String eDITOR, String string) {
			String sql="update s_book set PROJECT_SOURCE_ID='"+pROJECT_SOURCE_ID+"',NAME='"+nAME+"',REMARK='"+rEMARK+"',PUBLISH_UNIT='"+pUBLISH_UNIT+"',FIRST_AUTHOR_NAME='"+fIRST_AUTHOR_NAME+"',OTHER_AUTHOR_NAME='"+oTHER_AUTHOR_NAME+"',PUBLISH_DATE='"+pUBLISH_DATE+"',WORD_NUMBER='"+wORD_NUMBER+"',EDITOR='"+eDITOR+"',ISREAD='"+string+"' where id='"+parseInt+"'";
			System.out.println(sql);
			try{
				conn=getJdbcTemplate().getDataSource().getConnection();
				ps=conn.createStatement();
				int b=ps.executeUpdate(sql);
				if(b==1){
					c="SUCCESS";
				}else{
					c="FAIL";
				}	
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return c;
		}

		public String keyaninfoadd(String pROJECT_SOURCE_ID, String nAME,
				String uNIT, String fIRST_AUTHOR_NAME, String oTHER_AUTHOR_NAME,
				String pRIZE_DATE, String lEVEL) {
			String sql="insert into s_prize(PROJECT_SOURCE_ID,NAME,FIRST_PRIZE_NAME,OTHER_PRIZE_NAME,UNIT,PRIZE_DATE,LEVEL) values ('"+pROJECT_SOURCE_ID+"','"+nAME+"','"+fIRST_AUTHOR_NAME+"','"+oTHER_AUTHOR_NAME+"','"+uNIT+"','"+pRIZE_DATE+"','"+lEVEL+"')";
			System.out.println(sql);
			try{
				conn=getJdbcTemplate().getDataSource().getConnection();
				ps=conn.createStatement();
				int b=ps.executeUpdate(sql);
				if(b==0){
					c="SUCCESS";
				}else{
					c="FAIL";
				}	
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return c;
		}

		public String keyaninfoupdate(int parseInt, String pROJECT_SOURCE_ID,
				String nAME, String fIRST_AUTHOR_NAME, String oTHER_AUTHOR_NAME,
				String uNIT, String pRIZE_DATE, String lEVEL) {
			String sql="update s_prize set PROJECT_SOURCE_ID='"+pROJECT_SOURCE_ID+"',NAME='"+nAME+"',LEVEL='"+lEVEL+"',UNIT='"+uNIT+"',FIRST_PRIZE_NAME='"+fIRST_AUTHOR_NAME+"',OTHER_PRIZE_NAME='"+oTHER_AUTHOR_NAME+"',PRIZE_DATE='"+pRIZE_DATE+"' where id='"+parseInt+"'";
			System.out.println(sql);
			try{
				conn=getJdbcTemplate().getDataSource().getConnection();
				ps=conn.createStatement();
				int b=ps.executeUpdate(sql);
				if(b==1){
					c="SUCCESS";
				}else{
					c="FAIL";
				}	
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return c;
		}

		public String keyaninfoadd(String nAME, String uNIT, String dATE,
				String cONTENT, String rEMARK) {
			String sql="insert into s_train(NAME,UNIT,DATE,CONTENT,RAMARK) values ('"+nAME+"','"+uNIT+"','"+dATE+"','"+cONTENT+"','"+rEMARK+"')";
			System.out.println(sql);
			try{
				conn=getJdbcTemplate().getDataSource().getConnection();
				ps=conn.createStatement();
				int b=ps.executeUpdate(sql);
				if(b==0){
					c="SUCCESS";
				}else{
					c="FAIL";
				}	
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return c;
		}

		public String keyaninfoupdate(int parseInt, String nAME, String uNIT,
				String dATE, String cONTENT, String rEMARK) {
			String sql="update s_train set NAME='"+nAME+"',UNIT='"+uNIT+"',DATE='"+dATE+"',RAMARK='"+rEMARK+"',CONTENT='"+cONTENT+"' where id='"+parseInt+"'";
			System.out.println(sql);
			try{
				conn=getJdbcTemplate().getDataSource().getConnection();
				ps=conn.createStatement();
				int b=ps.executeUpdate(sql);
				if(b==1){
					c="SUCCESS";
				}else{
					c="FAIL";
				}	
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return c;
		}
	//project
		public String keyaninfoadd(String nAME, String uNIT, String dATE,
				String tYPE, String fROM, String rOLE, String aCHIEVE,
				String cHARGE, String mONEY, int i) {
			String sql="insert into s_project(NAME,UNIT,DATE,TYPE,FROMTO,ROLE,ACHIEVE,CHARGE,MONEY) values ('"+nAME+"','"+uNIT+"','"+dATE+"','"+tYPE+"','"+fROM+"','"+rOLE+"','"+aCHIEVE+"','"+cHARGE+"','"+mONEY+"')";
			System.out.println(sql);
			try{
				conn=getJdbcTemplate().getDataSource().getConnection();
				ps=conn.createStatement();
				int b=ps.executeUpdate(sql);
				if(b==0){
					c="SUCCESS";
				}else{
					c="FAIL";
				}	
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return c;
		}

		public String keyaninfoupdate(String nAME, String uNIT, String dATE,
				String tYPE, String fROM, String rOLE, String aCHIEVE,
				String cHARGE, String mONEY, String id) {
			String sql="update s_project set NAME='"+nAME+"',UNIT='"+uNIT+"',DATE='"+dATE+"',TYPE='"+tYPE+"',FROMTO='"+fROM+"' ,ROLE='"+rOLE+"',ACHIEVE='"+aCHIEVE+"',CHARGE='"+cHARGE+"',MONEY='"+mONEY+"'where id='"+id+"'";
			System.out.println(sql);
			try{
				conn=getJdbcTemplate().getDataSource().getConnection();
				ps=conn.createStatement();
				int b=ps.executeUpdate(sql);
				if(b==1){
					c="SUCCESS";
				}else{
					c="FAIL";
				}	
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return c;
		}
	//paper
		

		public String keyaninfoadd(String pROJECT_SOURCE_ID, String nAME,
				String pAPER_MODE_ID, String pUBLISH_UNIT,
				String fIRST_AUTHOR_NAME, String oTHER_AUTHOR_NAME,
				String pUBLISH_DATE, String wORD_NUMBER, String cHECK_STATUS_ID,
				String fILE_IDS, int i) {
			String sql="insert into s_paper(PROJECT_SOURCE_ID,NAME,PAPER_MODE_ID,PUBLISH_UNIT,FIRST_AUTHOR_NAME,OTHER_AUTHOR_NAME,PUBLISH_DATE,WORD_NUMBER,CHECK_STATUS_ID,FILE_IDS) values ('"+pROJECT_SOURCE_ID+"','"+nAME+"','"+pAPER_MODE_ID+"','"+pUBLISH_UNIT+"','"+fIRST_AUTHOR_NAME+"','"+oTHER_AUTHOR_NAME+"','"+pUBLISH_DATE+"','"+wORD_NUMBER+"','"+cHECK_STATUS_ID+"','"+fILE_IDS+"')";
			System.out.println(sql);
			try{
				conn=getJdbcTemplate().getDataSource().getConnection();
				ps=conn.createStatement();
				int b=ps.executeUpdate(sql);
				if(b==0){
					c="SUCCESS";
				}else{
					c="FAIL";
				}	
				ps.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
			return c;
		}
		
	}