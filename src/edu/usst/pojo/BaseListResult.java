/**
 *
 */
package edu.usst.pojo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class BaseListResult extends PageResult{


	private Map<String,String> selectMap ;
    private List<Map<String, Object>> list;

	public List<Map<String, Object>> getList() {
		return list;
	}

	public void setList(List<Map<String, Object>> list) {
		this.list = list;
	}

	public Map<String, String> getSelectMap() {
		return selectMap;
	}

	public void setSelectMap(Map<String, String> selectMap) {
		this.selectMap = selectMap;
	}
	
}
