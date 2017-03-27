package edu.usst.action;



import java.io.File;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import org.apache.struts2.ServletActionContext;


import edu.usst.core.ErrorConstants;
import edu.usst.pojo.BaseListResult;
import edu.usst.pojo.BaseResult;
import edu.usst.service.AuthService;
import edu.usst.service.ManageReferService;
import edu.usst.utils.HthTools;
import edu.usst.utils.MD5;


public class ManageReferAction {

	@Resource(name="manageReferService")
	private ManageReferService manageReferService;
	 private File FILE_ID;// 对应文件域的file，封装文件内容
	 
	public File getFile() {
		return FILE_ID;
	}
	public void setFile(File file) {
		this.FILE_ID = file;
	}
	/**
	 * 登录
	 */
	public String getManageViewAction(){
		String retString="SUCCESS";
		
		return retString;
	}
	public String getUnitViewAction(){
		String retString="SUCCESS";
		
		return retString;
	}
	
	//获取用户列表
	public void getUserListAction() {
		 HttpServletRequest servletRequest = ServletActionContext.getRequest();
	        try {
	            Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
	            BaseListResult outData = null;

	            if (null != reqParams) {
	                Long pageNo = HthTools.<Long>checkParam(Long.class, reqParams.get("page"), null);
	                Long rowNum = HthTools.<Long>checkParam(Long.class, reqParams.get("rows"), null);
	                String filters = HthTools.<String>checkParam(String.class, reqParams.get("filters"), null);
	                outData = manageReferService.getUserListService(pageNo.longValue(), rowNum.longValue(), filters);
	            }

	            HthTools.httpResponseByType(outData, MediaType.APPLICATION_JSON);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}
	//删除用户
	public void delUserAction(){
			HttpServletRequest servletRequest = ServletActionContext.getRequest();
	        try {
	            Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
	            BaseResult outData = null;

	            if (null != reqParams) {
	            	Integer userId= HthTools.<Integer>checkParam(Integer.class, reqParams.get("userId"), null);
	                outData = manageReferService.delUser(userId );
	            }

	            HthTools.httpResponseByType(outData, MediaType.APPLICATION_JSON);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		}
	//更新用户
	public void updateUserAction(){
			HttpServletRequest servletRequest = ServletActionContext.getRequest();
	        try {
	            Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
	            BaseResult outData = null;

	            if (null != reqParams) {
	                outData = manageReferService.updateUserService( 
	                		HthTools.<Integer>checkParam(Integer.class, reqParams.get("ID"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("PERSON_ID"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("NAME"), null),
	                        HthTools.<Integer>checkParam(Integer.class, reqParams.get("UNIT_ID"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("SEXID"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("ID_CARD"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("BIRTHDAY"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("TITLE"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("RESEARCH_FIELD"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("MOBILE"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("EMAIL"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("ACCOUNT"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("PASSWORD"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("opt"), null));
	            }

	            HthTools.httpResponseByType(outData, MediaType.APPLICATION_JSON);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		}
	//获取部门列表
    public void getUnitListAction(){
 		 HttpServletRequest servletRequest = ServletActionContext.getRequest();
	        try {
	            Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
	            BaseListResult outData = null;

	            if (null != reqParams) {
	                Long pageNo = HthTools.<Long>checkParam(Long.class, reqParams.get("page"), null);
	                Long rowNum = HthTools.<Long>checkParam(Long.class, reqParams.get("rows"), null);
	                String filters = HthTools.<String>checkParam(String.class, reqParams.get("filters"), null);
	                outData = manageReferService.getUnitListService(pageNo.longValue(), rowNum.longValue(), filters);
	            }

	            HthTools.httpResponseByType(outData, MediaType.APPLICATION_JSON);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
	//删除部门
	public void delUnitAction(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
        try {
            Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
            BaseResult outData = null;

            if (null != reqParams) {
            	Integer unitId=  HthTools.<Integer>checkParam(Integer.class, reqParams.get("unitId"), null);
                outData = manageReferService.delUnit(unitId);
            }

            HthTools.httpResponseByType(outData, MediaType.APPLICATION_JSON);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
	//更新部门
	public void updateUnitAction(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
        try {
            Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
            BaseResult outData = null;

            if (null != reqParams) {
                outData = manageReferService.updateUnitService(
                		HthTools.<Integer>checkParam(Integer.class, reqParams.get("ID"), null),
                		HthTools.<String>checkParam(String.class, reqParams.get("UNIT_ID"), null),
                        HthTools.<String>checkParam(String.class, reqParams.get("NAME"), null),
                        HthTools.<String>checkParam(String.class, reqParams.get("opt"), null));
            }

            HthTools.httpResponseByType(outData, MediaType.APPLICATION_JSON);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	public String getNotifyViewAction(){
		String retString="SUCCESS";
		
		return retString;
	}
	//获取公告信息
	public void getNotifyAction(){
		 HttpServletRequest servletRequest = ServletActionContext.getRequest();
	        try {
	            Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
	            BaseListResult outData = null;

	            if (null != reqParams) {
	                Long pageNo = HthTools.<Long>checkParam(Long.class, reqParams.get("page"), null);
	                Long rowNum = HthTools.<Long>checkParam(Long.class, reqParams.get("rows"), null);
	                String filters = HthTools.<String>checkParam(String.class, reqParams.get("filters"), null);
	                outData =  manageReferService.getNotifyService(pageNo.longValue(), rowNum.longValue(), filters);
	            }

	            HthTools.httpResponseByType(outData, MediaType.APPLICATION_JSON);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}
	//更新公告信息
	public void updateNotifyAction(){
			HttpServletRequest servletRequest = ServletActionContext.getRequest();
	        try {
	            Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
	            BaseResult outData = null;
	            Map<String, Object> user=(Map<String, Object>) servletRequest.getSession(true).getAttribute("userSession");
                String senderId=user.get("ID").toString();
	            if (null != reqParams) {
	                outData = manageReferService.updateNotifyService(
	                		HthTools.<Integer>checkParam(Integer.class, reqParams.get("ID"), null),
	                		HthTools.<String>checkParam(String.class, reqParams.get("TITLE"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("CONTENT"), null),
	                        HthTools.<Integer>checkParam(Integer.class, reqParams.get("TITLE_TOP_FLAG"), null),
	                        HthTools.<String>checkParam(String.class, reqParams.get("NOTIFY_TYPE"), null),
	                        FILE_ID,
	                        senderId,
	                        HthTools.<String>checkParam(String.class, reqParams.get("opt"), null));
	            }

	            HthTools.httpResponseByType(outData, MediaType.APPLICATION_JSON);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		}
	//	删除公告信息
	public void delNotifyAction(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
        try {
            Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
            BaseResult outData = null;

            if (null != reqParams) {
            	Integer ID= HthTools.<Integer>checkParam(Integer.class, reqParams.get("ID"), null);
                outData = manageReferService.delNotify(ID );
            }

            HthTools.httpResponseByType(outData, MediaType.APPLICATION_JSON);
        } catch (Exception e) {
            e.printStackTrace();
        }
	}
}
