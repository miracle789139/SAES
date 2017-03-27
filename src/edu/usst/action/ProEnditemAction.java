package edu.usst.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import edu.usst.service.ProActualizeService;
import edu.usst.service.ProEnditemService;
import edu.usst.service.ProMidexamService;
import edu.usst.utils.HthTools;

/**
 * 项目结项
 */
public class ProEnditemAction {
	@Resource (name="proActualizeService")
	private ProActualizeService proActualizeService;
	@Resource (name="proEnditemService")
	private ProEnditemService proEnditemService;
	
	/**
	 * 项目结项初始化
	 * @return
	 */
	//判断返回首页的个人项目还是项目管理的个人项目
	String is=ServletActionContext.getRequest().getParameter("is");
	
	public String enditem(){
     System.out.println(is);
		//客户端请求
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String retString ="FAIL";//定义返回值
		try {
			Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
			if (null != reqParams) {
				List<Map<String,Object>> enditemList = proEnditemService.getEnditemList();//得到查询结果

				if (null!= enditemList) {	
					
					servletRequest.setAttribute("enditemList", enditemList);//向页面发送数据信息				
					
					retString="SUCCESS";//操作成功返回值
				} else {
					retString="FAIL";		
				}
			}
			else{
				retString="FAIL";
			}
		} catch (Exception e) {

		}
		if(is==null){ retString="SUCCESS";}
		else { retString="MAIN";}
		System.out.println(retString);
		return retString;
	}
	
	//项目结项查看
	public String enditem_check(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
		Map<String, Object> enditemList=proEnditemService.enditem_check(UNIQUE_CODE);
		servletRequest.setAttribute("enditemList", enditemList);
		return "SUCCESS";
	}
	
	//项目结项编辑
	public String enditem_edit(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
		Map<String, Object> enditemList=proEnditemService.enditem_check(UNIQUE_CODE);
		servletRequest.setAttribute("enditemList", enditemList);
		return "SUCCESS";
	}
	
	//项目结项编辑（提交信息）
	public String enditem_edit1(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
		String FINISH_NOTE = servletRequest.getParameter("FINISH_NOTE");
		int flag=proEnditemService.enditem_edit1(UNIQUE_CODE,FINISH_NOTE);
		if(flag==1){
			return "SUCCESS";
		}
		return "FAIL";
		
	}
	
}
