package edu.usst.service;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;

import edu.usst.dao.PersonInfoUpdateDao;
import edu.usst.model.Person;
@Service
public class PersonInfoUpdateService {
	@Resource(name="personInfoUpdateDao")
	private PersonInfoUpdateDao personInfoUpdateDao;
//	Person person;
//	String TEL_HOME=ServletActionContext.getRequest().getParameter("TEL_HOME");
	
	public String getStr(String username,String userid,String usersex,String userduty,String usertitle,String usertele,String userpostal,String useraddr,String usersubject,String userresearch){
//		System.out.println(TEL_HOME);
//		person.setTEL_HOME(TEL_HOME);
		System.out.println("到了service");
		String str=personInfoUpdateDao.update(username,userid,usersex,userduty,usertitle,usertele,userpostal,useraddr,usersubject,userresearch);
		System.out.println("出去service");
		return str;		
	}
	
	public String getStr_2(String username_2,String usersex_2,String userbirth,String usernation,String useredudegree,String userexp,String usermobile,String userschool,String useraddr_2,String useremail,String selfeva,String workexp,String eduexp,String proskill,String eelse){
		System.out.println("到了service2");
		String str=personInfoUpdateDao.update_2(username_2, usersex_2, userbirth, usernation, useredudegree, userexp, usermobile, userschool, useraddr_2, useremail,selfeva,workexp,eduexp,proskill,eelse);
		System.out.println("出去service2");
		return str;	
		
	}
}
