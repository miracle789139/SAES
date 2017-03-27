package edu.usst.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.usst.model.Person;
import edu.usst.service.PersonInfoUpdateService;
import edu.usst.utils.HthTools;

public class PersonInfoUpdateAction{
	@Resource(name="personInfoUpdateService")
	private PersonInfoUpdateService personInfoUpdateService;
	PersonInforAction pifa=new PersonInforAction();
	public String personInfoUpdate(){
		String username=ServletActionContext.getRequest().getParameter("username");
		String userid=ServletActionContext.getRequest().getParameter("userid");
		String usersex=ServletActionContext.getRequest().getParameter("usersex");
		String userduty=ServletActionContext.getRequest().getParameter("userduty");
		String usertitle=ServletActionContext.getRequest().getParameter("usertitle");
		String usertele=ServletActionContext.getRequest().getParameter("usertele");
		String userpostal=ServletActionContext.getRequest().getParameter("userpostal");
		String useraddr=ServletActionContext.getRequest().getParameter("useraddr");
		String usersubject=ServletActionContext.getRequest().getParameter("usersubject");
		String userresearch=ServletActionContext.getRequest().getParameter("userresearch");
//		Person person=new Person();
//		person.setTEL_HOME(TEL_HOME);
		String retString="error";
		try{
			System.out.println("action开始");
			System.out.println(userresearch);
			String str=personInfoUpdateService.getStr(username,userid,usersex,userduty,usertitle,usertele,userpostal,useraddr,usersubject,userresearch);
			System.out.println(str);
			if(str=="success"){
			//	retString="success";
//				return pifa.queryperson();
				retString="SUCCESS";
				return retString;
			}else{
				retString="error";
			}
			System.out.println("action结束");
		}catch(Exception e){
			
		}
		return retString;
	}
	
	public String personInfoUpdate_2(){
		String username_2=ServletActionContext.getRequest().getParameter("username_2");
		String usersex_2=ServletActionContext.getRequest().getParameter("usersex_2");
		String userbirth=ServletActionContext.getRequest().getParameter("userbirth");
		String usernation=ServletActionContext.getRequest().getParameter("usernation");
		String useredudegree=ServletActionContext.getRequest().getParameter("useredudegree");
		String userexp=ServletActionContext.getRequest().getParameter("userexp");
		String usermobile=ServletActionContext.getRequest().getParameter("usermobile");
		String userschool=ServletActionContext.getRequest().getParameter("userschool");
		String useraddr_2=ServletActionContext.getRequest().getParameter("useraddr_2");
		String useremail=ServletActionContext.getRequest().getParameter("useremail");
		String selfeva=ServletActionContext.getRequest().getParameter("selfeva");
		String workexp=ServletActionContext.getRequest().getParameter("workexp");
		String eduexp=ServletActionContext.getRequest().getParameter("eduexp");
		String proskill=ServletActionContext.getRequest().getParameter("proskill");
		String eelse=ServletActionContext.getRequest().getParameter("eelse");
		String retString="error";
		try{
			System.out.println("action2开始");
			String str=personInfoUpdateService.getStr_2(username_2, usersex_2, userbirth, usernation, useredudegree, userexp, usermobile, userschool, useraddr_2, useremail,selfeva,workexp,eduexp,proskill,eelse);
			if(str=="success"){
					retString="success";
					return retString;
				}else{
					retString="error";
					return retString;
				}
			
		}catch(Exception e){
			
		}
		System.out.println("action2结束");
		return retString;
	}
	
}
