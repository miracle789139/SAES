/**
 *
 */
package edu.usst.pojo;

import java.util.HashMap;
import java.util.Map;

import javax.xml.bind.annotation.XmlRootElement;

public class BaseResult {


    private String returnCode;
    private String returnDescipt;
    private Map<String, String> data;

    public String getReturnCode() {
        return returnCode;
    }
    
    public Map<String, String> getData() {
		return data;
	}

	public void setData(Map<String, String> data) {
		this.data = data;
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
    
	public void putData(String key,String value) {
		if(this.data == null){
			this.data = new HashMap<String,String>();
		}
		this.data.put(key, value);
	}
	
}
