package edu.usst.action;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.swing.Spring;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import edu.usst.core.ErrorConstants;
import edu.usst.model.PageBean;
import edu.usst.pojo.BaseResult;
import edu.usst.service.keyanxinxiService;
import edu.usst.utils.HthTools;

public class keyanXinxiAction extends ActionSupport  {
	private String pnum; //设置私有变量，用于接受Jsp页面Ajxa传参（get、set方法要写上）
	private String biaoname;
     private String bid;
     private String isread ;
	private JSONArray jarray; //创建JSONArray 用于向页面传递Json格式数据（get、set方法要写上）
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public JSONArray getJarray() {
	return jarray;
	}
	public void setJarray(JSONArray jarray) {
	this.jarray = jarray;
	}
@Resource(name="keyanxinxiService")
private keyanxinxiService keyanxinxiService;
	public String querykyxx() {
		System.out.println(biaoname+pnum);
		//BaseResult baseResult = new BaseResult();
		
		String retString="FAIL";
		 
				PageBean kyxxList =keyanxinxiService.querykyxx(biaoname, Integer.parseInt(pnum),isread);
				if (null!=kyxxList) {
					System.out.println(kyxxList);
					JSONArray json = new JSONArray().fromObject(kyxxList);//创建JSONArray 用fromObject方法装入list集合 
					jarray = json;
					System.out.println(json);
					retString="SUCCESS";
				} else {
					
					retString="FAIL";
				}

			
		return retString;
	}
	public String querykyxxxq() {
		System.out.println(biaoname+bid);
		//BaseResult baseResult = new BaseResult();
		
		String retString="FAIL";
		 
		Map<String, Object>  kyxxList =keyanxinxiService.querykyxxxq(biaoname, Integer.parseInt(bid));
				if (null!=kyxxList) {
					System.out.println(kyxxList);
					JSONArray json = new JSONArray().fromObject(kyxxList);//创建JSONArray 用fromObject方法装入list集合 
					jarray = json;
					System.out.println(json);
					retString="SUCCESS";
				} else {
					
					retString="FAIL";
				}

			
		return retString;
	}
	public String getBiaoname() {
		return biaoname;
	}

	public void setBiaoname(String biaoname) {
		this.biaoname = biaoname;
	}
	public String getBid() {
		return bid;
	}
	public void setBid(String bid) {
		this.bid = bid;
	}
	public String getIsread() {
		return isread;
	}
	public void setIsread(String isread) {
		this.isread = isread;
	}
	
}
