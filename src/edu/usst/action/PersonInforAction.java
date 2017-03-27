package edu.usst.action;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import org.apache.struts2.ServletActionContext;

import edu.usst.core.ErrorConstants;
import edu.usst.model.Person;
import edu.usst.pojo.BaseResult;
import edu.usst.service.PersonInfoService;
import edu.usst.utils.FileUtils;
import edu.usst.utils.HthTools;

public class PersonInforAction {
	@Resource(name="personInfoService")
	/**
	 * 个人信息管理
	 */
	private PersonInfoService personInfoService;
	
	
	public String queryperson(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String TEL_HOME=ServletActionContext.getRequest().getParameter("TEL_HOME");
		String retString="FAIL";
		Person person=new Person();
		person.setTEL_HOME(TEL_HOME);
		  try {
			Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
			 if (null != reqParams) {
				 System.out.println("aaaaaaaaaaaaaaaaaa");
				 Map<String, Object> user = (Map<String, Object>) servletRequest.getSession(true).getAttribute("userSession");
				if(null==user||null==user.get("ACCOUNT")){
					return "NOLOGIN";
				}
				 String userId=user.get("ACCOUNT").toString();
				  
				Map<String, Object> applyList = personInfoService.getApplyList(userId);
				if (null!= applyList) {
					
					servletRequest.setAttribute("PersonList", applyList);
					retString="SUCCESS";
				} else {
					retString="FAIL";
					
				}
			 }
			 else{
				 retString="FAIL";
			 }
		  } catch (Exception e) {
			 
	        }
		return retString;
	}
	private File headImg;
	
	public File getHeadImg() {
		return headImg;
	}
	public void setHeadImg(File headImg) {
		this.headImg = headImg;
	}
	

	  public String ModifyImg(){
		    System.out.println("000000000");
		    BaseResult baseResult = new BaseResult();
		    	HttpServletRequest servletRequest = ServletActionContext.getRequest();
		    	try {
		    		Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
					 if (null != reqParams) {
			    		String middle="file/photo/";
			    		String middlesave="file\\photo\\";
			    		String extName=".jpg";
			    		String fileName=HthTools.<String>checkParam(String.class, reqParams.get("savepic"), null);
						String extraName= fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
			    		String filepath = FileUtils.getFilepathSave(middle,middlesave,headImg,extraName);
						 if (null != filepath) {
						int userId=HthTools.<Integer>checkParam(Integer.class, reqParams.get("userId"), null);
						 System.out.println("文件路径："+filepath+"，用户："+userId);
						 personInfoService.updateImg(userId,filepath);
						 System.out.println("修改成功！"); 
						 baseResult.setReturnCode(ErrorConstants.SUCCESS);
						 baseResult.setReturnDescipt(filepath);
						 HthTools.httpResponseByType(baseResult, MediaType.APPLICATION_JSON);
						 return "SUCCESS";
					 }
					 }
					else {
						HthTools.httpResponseByType(baseResult, MediaType.APPLICATION_JSON);
						return "FAIL";
				    }
				  } catch (Exception e) {
					  
					  System.out.println("Exception e"+e); 
					  baseResult.setReturnCode(ErrorConstants.ERROR_SELECT_DATA);
					  baseResult.setReturnDescipt("网络异常，修改数据库失败！");
					  try {
						HthTools.httpResponseByType(baseResult, MediaType.APPLICATION_JSON);
					} catch (IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					 return "FAIL";
			        }
				return null;
		    }
	
}
