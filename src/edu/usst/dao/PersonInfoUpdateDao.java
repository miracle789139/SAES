package edu.usst.dao;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.jdbc.core.PreparedStatementSetter;
import org.springframework.stereotype.Repository;

import edu.usst.model.Person;
import edu.usst.utils.HthTools;


@Repository
public class PersonInfoUpdateDao extends AbstractBaseDao{
//	String TEL_HOME=ServletActionContext.getRequest().getParameter("TEL_HOME");

	String c;
	//System.out.println("l");
	public String update(String username,String userid,String usersex,String userduty,String usertitle,String usertele,String userpostal,String useraddr,String usersubject,String userresearch){
		System.out.println("到了Dao");
//		System.out.println(TEL_HOME);
		//int dataList = null;
//		final String getTel=person.getTEL_HOME();
		String sql="update s_person set NAME=?,PERSON_ID=?,SEXID=?,DUTY=?,TITLE_ID=?,TEL_HOME=?,POSTAL_CODE=?,ADDRESS=?,SUBJECT_CLASS_ID=?,RESEARCH_FIELD=? where ID=1";
		try{
			/*int data=getJdbcTemplate().update(sql,new PreparedStatementSetter() {         
				@Override
				public void setValues(PreparedStatement ps)
						throws SQLException {
					// TODO Auto-generated method stub
					ps.setString(1,"qwer"); 
				}  
            }  );*/
			int data=getJdbcTemplate().update(sql,new Object[]{username,userid,usersex,userduty,usertitle,usertele,userpostal,useraddr,usersubject,userresearch});
			System.out.println(data);
			System.out.println("33333333333333333333");
			if(data>0){
				c="success";
				return c;
			}else{
				c="error";
				return c;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("出去Dao");
		return null;	
	}
	
	public String update_2(String username_2,String usersex_2,String userbirth,String usernation,String useredudegree,String userexp,String usermobile,String userschool,String useraddr_2,String useremail,String selfeva,String workexp,String eduexp,String proskill,String eelse){
		System.out.println("到了Dao2");
		String sql="update s_person set NAME=?,SEXID=?,BIRTHDAY=?,NATION_ID=?,EDU_DEGREE_ID=?,EXPERT_FLAG=?,MOBILE=?,GRADUATE_SCHOOL=?,ADDRESS=?,EMAIL=?,SELF_EVA=?,WORK_EXP=?,EDU_EXP=?,PRO_SKILL=?,EELSE=? where ID=1";
		try{
			int data=getJdbcTemplate().update(sql,new Object[]{username_2,usersex_2,userbirth,usernation,useredudegree,userexp,usermobile,userschool,useraddr_2,useremail,selfeva,workexp,eduexp,proskill,eelse});
			if(data>0){
				c="success";
				return c;
			}else{
				c="error";
				return c;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		System.out.println("出去Dao2");
		return null;
	}

}
