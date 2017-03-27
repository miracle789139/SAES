/**
 *
 */
package edu.usst.pojo;

import java.util.Map;



public class AndroidLoginResult {
	private String returnCode;
    private String returnDescipt;
    private Map<String, Object> userInfo;

    
	public String getReturnCode() {
		return returnCode;
	}

	public void setReturnCode(String returnCode) {
		this.returnCode = returnCode;
	}

	public String getReturnDescipt() {
		return returnDescipt;
	}

	public void setReturnDescipt(String returnDescipt) {
		this.returnDescipt = returnDescipt;
	}

	public Map<String, Object> getUserInfo() {
		return userInfo;
	}

	public void setUserInfo(Map<String, Object> userInfo) {
		this.userInfo = userInfo;
	}
   
}
