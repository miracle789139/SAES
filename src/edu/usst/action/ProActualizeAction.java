package edu.usst.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import edu.usst.model.ProManageModel;
import edu.usst.service.ProActualizeService;
import edu.usst.service.ProApprovalService;
import edu.usst.service.ProManageService;
import edu.usst.utils.HthTools;

/**
 * 项目实施
 */
public class ProActualizeAction {
	@Resource (name="proManageService")
	private ProManageService proManageService;
	@Resource (name="proApprovalService")
	private ProApprovalService proApprovalService;
	@Resource (name="proActualizeService")
	private ProActualizeService proActualizeService;
	
	/**
	 * 项目实施初始化
	 * @return
	 */
	//判断返回首页的个人项目还是项目管理的个人项目
	String is=ServletActionContext.getRequest().getParameter("is");
	
	public String actualize(){
     System.out.println(is);
		//客户端请求
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String retString ="FAIL";//定义返回值
		try {
			Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
			if (null != reqParams) {
				List<Map<String,Object>> actualizeList = proActualizeService.getActualizeList();//得到查询结果

				if (null!= actualizeList) {	
					
					servletRequest.setAttribute("actualizeList", actualizeList);//向页面发送数据信息				
					
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
	
	/**
	 * 项目实施编辑
	 * @return
	 */
	public String actualize_edit(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
//		Map<String, Object> approvalList=proApprovalService.approval_check(UNIQUE_CODE);
//		servletRequest.setAttribute("approvalList", approvalList);
		return "SUCCESS";
	}
	
	/**
	 * 项目立项（提交信息）
	 * @return
	 */
	public String approval_edit1(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
		String PLAN_END_DATE = servletRequest.getParameter("PLAN_END_DATE");
		int PROJECT_FEE = Integer.parseInt(servletRequest.getParameter("PROJECT_FEE"));
		String EXPECT_RESULT = servletRequest.getParameter("EXPECT_RESULT");
		int flag=proApprovalService.approval_insert(UNIQUE_CODE,PLAN_END_DATE,PROJECT_FEE,EXPECT_RESULT);
		if(flag==1){
			return "SUCCESS";
		}
		return "FAIL";
		
	}
	
	/**
	 * 项目实施中中检申请
	 */
	public String midexam_apply(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
		int flag=proActualizeService.midexam_apply(UNIQUE_CODE);
		if(flag==1){
			return "SUCCESS";
		}
		return "FAIL";
	}

	
}
