package edu.usst.action;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import edu.usst.service.ProActualizeService;
import edu.usst.service.ProMidexamService;
import edu.usst.utils.HthTools;

/**
 * 项目中检
 */
public class ProMidexamAction {
	@Resource (name="proActualizeService")
	private ProActualizeService proActualizeService;
	@Resource (name="proMidexamService")
	private ProMidexamService proMidexamService;
	
	/**
	 * 项目中检初始化
	 * @return
	 */
	//判断返回首页的个人项目还是项目管理的个人项目
	String is=ServletActionContext.getRequest().getParameter("is");
	
	public String midexam(){
     System.out.println(is);
		//客户端请求
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String retString ="FAIL";//定义返回值
		try {
			Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
			if (null != reqParams) {
				List<Map<String,Object>> midexamList = proMidexamService.getMidexamList();//得到查询结果

				if (null!= midexamList) {	
					
					servletRequest.setAttribute("midexamList", midexamList);//向页面发送数据信息				
					
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
	
	//项目中检查看
	public String midexam_check(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
		Map<String, Object> midexamList=proMidexamService.midexam_check(UNIQUE_CODE);
		servletRequest.setAttribute("midexamList", midexamList);
		return "SUCCESS";
	}
	
	//项目中检编辑
	public String midexam_edit(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
		Map<String, Object> midexamList=proMidexamService.midexam_check(UNIQUE_CODE);
		servletRequest.setAttribute("midexamList", midexamList);
		return "SUCCESS";
	}
	
	//项目中检编辑（提交信息）
	public String midexam_edit1(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
		String YUAN_SUGGEST = servletRequest.getParameter("YUAN_SUGGEST");
		int flag=proMidexamService.midexam_edit1(UNIQUE_CODE,YUAN_SUGGEST);
		if(flag==1){
			return "SUCCESS";
		}
		return "FAIL";
		
	}
	
}
