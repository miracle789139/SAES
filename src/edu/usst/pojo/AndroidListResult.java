/**
 *
 */
package edu.usst.pojo;

import java.util.List;
import java.util.Map;



public class AndroidListResult {
	private String returnCode;
    private String returnDescipt;
    private List<Map<String, Object>> list;
    private Map<String, Object> detail;

    
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

	public List<Map<String, Object>> getList() {
		return list;
	}

	public void setList(List<Map<String, Object>> list) {
		this.list = list;
	}

	public Map<String, Object> getDetail() {
		return detail;
	}

	public void setDetail(Map<String, Object> detail) {
		this.detail = detail;
	}

	
	
   
}
