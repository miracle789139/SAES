package edu.usst.action;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.Action;

import edu.usst.core.ErrorConstants;
import edu.usst.pojo.AndroidListResult;
import edu.usst.pojo.AndroidLoginResult;
import edu.usst.pojo.BaseResult;
import edu.usst.service.AndroidInterfaceService;
import edu.usst.service.AuthService;
import edu.usst.utils.HthTools;
import edu.usst.utils.StreamUtils;


public class AndroidLoginAction {

	public AndroidLoginResult responseJson;
	
	@Resource(name="authService")
	private AuthService authService;
	/**
	 * 登录
	 */
	public String login() {
		AndroidLoginResult baseResult = new AndroidLoginResult();
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject data = StreamUtils.getString(request);
		  try {
			 if (null != data) {
				 String userId = data.optString("userId");
				 String password = data.optString("password");
				Map<String, Object> user=authService.login(userId, password);
				if (null!= user) {
					baseResult.setReturnCode(ErrorConstants.SUCCESS);
					baseResult.setReturnDescipt("登陆成功！");
					baseResult.setUserInfo(user);
				} else {
					baseResult.setReturnCode(ErrorConstants.ERROR_SELECT_DATA);
					baseResult.setReturnDescipt("用户名或者密码不存在！");
				}
			 }
			 else{
				 baseResult.setReturnCode(ErrorConstants.ERROR_GET_POSTDATA);
				 baseResult.setReturnDescipt("网络异常，获取用户信息失败！");
			 }
		  } catch (Exception e) {
	        	 baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
				 baseResult.setReturnDescipt(e.toString());
	        }
		  this.setResponseJson(baseResult);
		  return Action.SUCCESS;
	}

	public AndroidLoginResult getResponseJson() {
		return responseJson;
	}

	public void setResponseJson(AndroidLoginResult responseJson) {
		this.responseJson = responseJson;
	}



}
