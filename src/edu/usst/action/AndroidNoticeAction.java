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


public class AndroidNoticeAction {

	public AndroidListResult responseJson;
	
	@Resource(name="androidInterfaceService")
	private AndroidInterfaceService androidInterfaceService;
	/**
	 * 登录
	 */
	
	public String getNoticeList(){
		AndroidListResult baseResult = new AndroidListResult();
		 try {
			 List<Map<String, Object>> noticeList=androidInterfaceService.getNoticeList();
			 if(null!=noticeList&&noticeList.size()>0){
				 baseResult.setReturnCode(ErrorConstants.SUCCESS);
					baseResult.setReturnDescipt("获取公告信息成功！");
					baseResult.setList(noticeList);
			 }
			 else{
				 baseResult.setReturnCode(ErrorConstants.ERROR_SELECT_DATA);
					baseResult.setReturnDescipt("暂无公告信息！");
			 }
		 } catch (Exception e) {
        	 baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
			 baseResult.setReturnDescipt(e.toString());
        }
		 
		this.setResponseJson(baseResult);
		  return Action.SUCCESS;
	}
	
	public String getNoticeDetail(){
		AndroidListResult baseResult = new AndroidListResult();
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject data = StreamUtils.getString(request);
				 
		 try {
			 String noticeId = data.optString("noticeId");
			 Map<String, Object> noticeDeail=androidInterfaceService.getNoticeDetail(noticeId);
			 if(null!=noticeDeail&&noticeDeail.size()>0){
				 baseResult.setReturnCode(ErrorConstants.SUCCESS);
					baseResult.setReturnDescipt("获取公告信息成功！");
					baseResult.setDetail(noticeDeail);
			 }
			 else{
				 baseResult.setReturnCode(ErrorConstants.ERROR_SELECT_DATA);
					baseResult.setReturnDescipt("暂无公告信息！");
			 }
		 } catch (Exception e) {
       	 baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
			 baseResult.setReturnDescipt(e.toString());
       }
		 
		this.setResponseJson(baseResult);
		  return Action.SUCCESS;
	}
	
	public String getAuditList(){
		AndroidListResult baseResult = new AndroidListResult();
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject data = StreamUtils.getString(request);
		 try {
			 String userId = data.optString("userId");
			 List<Map<String, Object>> auditList=androidInterfaceService.getAuditList(userId);
			 if(null!=auditList&&auditList.size()>0){
				 baseResult.setReturnCode(ErrorConstants.SUCCESS);
					baseResult.setReturnDescipt("获取审核信息成功！");
					baseResult.setList(auditList);
			 }
			 else{
				 baseResult.setReturnCode(ErrorConstants.ERROR_SELECT_DATA);
					baseResult.setReturnDescipt("暂无审核信息！");
			 }
		 } catch (Exception e) {
        	 baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
			 baseResult.setReturnDescipt(e.toString());
        }
		 
		this.setResponseJson(baseResult);
		  return Action.SUCCESS;
	}
	
	public String getAuditDetail(){
		AndroidListResult baseResult = new AndroidListResult();
		HttpServletRequest request = ServletActionContext.getRequest();
		JSONObject data = StreamUtils.getString(request);
		 try {
			 String auditId = data.optString("auditId");
			 Map<String, Object> auditDetail=androidInterfaceService.getAuditDetail(auditId);
			 if(null!=auditDetail&&auditDetail.size()>0){
				 baseResult.setReturnCode(ErrorConstants.SUCCESS);
					baseResult.setReturnDescipt("获取审核信息成功！");
					baseResult.setDetail(auditDetail);
			 }
			 else{
				 baseResult.setReturnCode(ErrorConstants.ERROR_SELECT_DATA);
					baseResult.setReturnDescipt("暂审核信息！");
			 }
		 } catch (Exception e) {
       	 baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
			 baseResult.setReturnDescipt(e.toString());
       }
		 
		this.setResponseJson(baseResult);
		  return Action.SUCCESS;
	}
	
	public AndroidListResult getResponseJson() {
		return responseJson;
	}

	public void setResponseJson(AndroidListResult responseJson) {
		this.responseJson = responseJson;
	}



}
