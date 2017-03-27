package edu.usst.action;


import edu.usst.core.ErrorConstants;
import edu.usst.pojo.BaseResult;
import edu.usst.service.AuthService;
import edu.usst.utils.HthTools;
import edu.usst.utils.MD5;
import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;
import java.util.Map;


public class AuthAction {

	@Resource(name="authService")
	private AuthService authService;
	/**
	 * 登录
	 */
	public String getLoginView(){
		String retString="SUCCESS";
		
		return retString;
	}
	public String login() {
		BaseResult baseResult = new BaseResult();
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String retString="FAIL";

		try {
			Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
			 if (null != reqParams) {
				String userId = HthTools.<String>checkParam(String.class, reqParams.get("userId"), null);
				String password = HthTools.<String>checkParam(String.class, reqParams.get("password"), null);
				Map<String, Object> user=authService.login(userId,  MD5.GetMD5Code(password));
				if (null!= user) {
					baseResult.setReturnCode(ErrorConstants.SUCCESS);
					baseResult.setReturnDescipt("登陆成功！");
					servletRequest.getSession(true).setAttribute("userSession", user);
					if(null!=user.get("ROLE_LEVEL")&&user.get("ROLE_LEVEL").equals("1")){
						baseResult.setReturnCode(ErrorConstants.MANAGE);
					}
					retString="SUCCESS";
				} else {
					baseResult.setReturnCode(ErrorConstants.ERROR_SELECT_DATA);
					baseResult.setReturnDescipt("用户名或者密码不存在！");
					retString="FAIL";
				}
			 }
			 else{
				 baseResult.setReturnCode(ErrorConstants.ERROR_GET_POSTDATA);
				 baseResult.setReturnDescipt("网络异常，获取用户信息失败！");
				 retString="FAIL";
			 }
		    HthTools.httpResponseByType(baseResult, MediaType.APPLICATION_JSON);
		  } catch (Exception e) {
	        	 baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
				 baseResult.setReturnDescipt(e.toString());
				 retString="FAIL";
	        }
		 System.out.println("######## "+retString+"  "+baseResult.getReturnDescipt());
		return retString;
	}

	public String logoutAction(){
		String retString="FAIL";
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		servletRequest.getSession(true).removeAttribute("userSession");
		retString="SUCCESS";
		return retString;
	}
	
	public String getHomeViewAction(){
		String retString="SUCCESS";
		
		return retString;
	}


}
