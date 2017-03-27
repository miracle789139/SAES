package edu.usst.action;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.core.MediaType;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;

import edu.usst.core.ErrorConstants;
import edu.usst.model.InsertInfo;
import edu.usst.model.ProApplyInfo;
import edu.usst.pojo.BaseResult;
import edu.usst.service.ProApplyInfoService;
import edu.usst.utils.HthTools;
import edu.usst.utils.MD5;
/**
 * 项目申报管理
 */
public class ApplicationManageAction {
	@Resource(name="proApplyInfoService")
	
	private ProApplyInfoService proApplyInfoService;
    /*
     * 初始化申报管理信息
     */
	public String index(){
		String suoCheckState=null;
		String yuanCheckState=null;
		//客户端请求
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String retString ="FAIL";//定义返回值
		List<ProApplyInfo>applyInfos = new ArrayList<ProApplyInfo>();//定义一个集合，用于装ProApplyInfo对象
		  try {
			Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
			 if (null != reqParams) {
				 List<Map<String,Object>> applyLists = proApplyInfoService.getApplyList();//得到查询结果
		
				if (null!= applyLists) {	
					/*
					 * 如果查询结果不为空，则迭代出MAp类，并从而得到ProApplyInfo对象，并将对象放入List集合中
					 */
					for(Map<String,Object> proApp:applyLists)
  				    {
  				    	//System.out.println(proApp);
  				    	String id = (String) proApp.get("applyId");//项目ID
  				    	String name = (String)proApp.get("proName");//项目名称
  				    	Date createTime = (Date)proApp.get("create_time");//项目创建时间
  				    	Integer suoCheckStateFlag = (Integer)proApp.get("suo_check_state");//所审核状态
  				    	if(suoCheckStateFlag==0){
  				    		suoCheckState = "未通过";
  				    	}else{
  				    		suoCheckState = "通过";
  				    	}
  				    	Integer yuanCheckStateFlag = (Integer)proApp.get("yuan_check_state");//院审核状态
  				    	if(yuanCheckStateFlag==0){
  				    		yuanCheckState = "未通过";
  				    	}else{
  				    		yuanCheckState = "通过";
  				    	}
  				    	String applierName = (String)proApp.get("applierName");
  				    	ProApplyInfo applyInfo = new ProApplyInfo(id, name,createTime, suoCheckState,yuanCheckState,applierName);
  				    	applyInfos.add(applyInfo);
  				    }
				   servletRequest.setAttribute("applyInfos", applyInfos);//向页面发送数据信息				
					retString="index";//操作成功返回值为index
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
	
//	/**
//	 * 获取申报列表
//	 */
//	public String getApplyList(String result,int apply_class){
//		String suoCheckState=null;
//		String yuanCheckState=null;
//		//客户端请求
//		HttpServletRequest servletRequest = ServletActionContext.getRequest();
//		String retString ="FAIL";//定义返回值
//		List<ProApplyInfo>applyInfos = new ArrayList<ProApplyInfo>();//定义一个集合，用于装ProApplyInfo对象
//		  try {
//			Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
//			 if (null != reqParams) {
//				 List<Map<String,Object>> applyLists = proApplyInfoService.getApplyListByClass(apply_class);//得到查询结果
//		
//				if (null!= applyLists) {	
//					/*
//					 * 如果查询结果不为空，则迭代出MAp类，并从而得到ProApplyInfo对象，并将对象放入List集合中
//					 */
//					for(Map<String,Object> proApp:applyLists)
//  				    {
//  				    	//System.out.println(proApp);
//  				    	String id = (String)proApp.get("applyid");//项目ID
//  				    	String name = (String)proApp.get("name");//项目名称
//  				    	Date createTime = (Date)proApp.get("create_time");//项目创建时间
//  				    	Integer suoCheckStateFlag = (Integer)proApp.get("suo_check_state");//所审核状态
//  				    	if(suoCheckStateFlag==0){
//  				    		suoCheckState = "未通过";
//  				    	}else{
//  				    		suoCheckState = "通过";
//  				    	}
//  				    	Integer yuanCheckStateFlag = (Integer)proApp.get("yuan_check_state");//院审核状态
//  				    	if(yuanCheckStateFlag==0){
//  				    		yuanCheckState = "未通过";
//  				    	}else{
//  				    		yuanCheckState = "通过";
//  				    	}
//  				    	ProApplyInfo applyInfo = new ProApplyInfo(id, name,createTime, suoCheckState,yuanCheckState);
//  				    	applyInfos.add(applyInfo);
//  				    }
//				   servletRequest.setAttribute("applyInfos", applyInfos);//向页面发送数据信息				
//					retString=result;//操作成功返回值为index
//				} else {
//					retString="FAIL";		
//				}
//			 }
//			 else{
//				 retString="FAIL";
//			 }
//		  } catch (Exception e) {
//			 
//	      }
//		  return retString;
//	}
	
	
	/**
	 * 添加院外项目
	 * @return
	 */
	
	public String addApply(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String retString ="FAIL";//定义返回值
		String proName = servletRequest.getParameter("proName");
		String proLocation = servletRequest.getParameter("proLocation");
		String proClass = servletRequest.getParameter("proClass");
		String proType = servletRequest.getParameter("proType");
		String applierName = servletRequest.getParameter("applierName");
		String sex = servletRequest.getParameter("sex");
		String idCard = servletRequest.getParameter("idCard");
		String xingzheng = servletRequest.getParameter("xingzheng");
		String zhicheng = servletRequest.getParameter("zhicheng");
		String search = servletRequest.getParameter("search");
		String unit = servletRequest.getParameter("unit");
		String email = servletRequest.getParameter("email");
		String address = servletRequest.getParameter("address");
		String postal = servletRequest.getParameter("postal");		
		String mobile = servletRequest.getParameter("mobile");
		String telHome = servletRequest.getParameter("telHome");
		String telUnit = servletRequest.getParameter("telUnit");	
		String projectLocation = "院外";
		Random rand = new Random();
		int i = rand.nextInt(); //int范围类的随机数
		i = rand.nextInt(100); //生成0-100以内的随机数
		Map<String,Object> declare_number = proApplyInfoService.getDeclare_number();
		Integer dec_number = (Integer) declare_number.get("declare_number");//获取项目编号当前的记录数
		Date now = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		String tablename = dateFormat.format(now);
		String applyId = "D"+tablename+dec_number;
		Integer applierId = i+1;
		Date date = new Date();
		Integer SUO_CHECK_STATE = 0;
		Integer YUAN_CHECK_STATE = 0;
		InsertInfo insertInfo = new InsertInfo(applyId, proName,projectLocation,proClass, proType, proLocation, applierId, applierName, sex, idCard, xingzheng, zhicheng, search, unit, email, address, postal, mobile, telUnit, telHome,date,SUO_CHECK_STATE,YUAN_CHECK_STATE);
		System.out.println(insertInfo);
		proApplyInfoService.saveApply(insertInfo);
		System.out.println(proName);		
		return "SUCCESS";
	}
	
	/**
	 * 查看院外项目
	 * @return
	 */
	public String appmanaCheck(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String applyId = servletRequest.getParameter("applyId");
		InsertInfo insertInfo = proApplyInfoService.findApplyById(applyId);
		
		servletRequest.setAttribute("insertInfo",insertInfo);

		System.out.println(insertInfo);//?
		return "SUCCESS";
	}
	
	/**
	 * 删除院外项目
	 * @return
	 */
	
	public String applyInfoDele(){
		System.out.println("hahahahahahaah111111");
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String ids = servletRequest.getParameter("delitems");
		String[] id = ids.split(",");
		proApplyInfoService.deleApply(id);
		return "SUCCESS";
	}
	
	
	/**
	 * 实现回显
	 * @return
	 */
	public String editPro(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String applyId = servletRequest.getParameter("proId");
		InsertInfo insertInfo = proApplyInfoService.findApplyById(applyId);
		servletRequest.setAttribute("insertInfo",insertInfo);
		System.out.println(insertInfo);
		String proLocation = insertInfo.getProjectLocation();
		if(proLocation.equals("院外")){
			return "yuanwai";
		}else if(proLocation.equals("院内")){
			return "yuannei";		
		}else{
			return "FALL";
		}	
	}
	
	/**
	 * 编辑院外项目
	 * @return
	 */
	public String edit(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String applyId = servletRequest.getParameter("proId");
		String proName = servletRequest.getParameter("proName");
		String proLocation = servletRequest.getParameter("proLocation");
		String proClass = servletRequest.getParameter("proClass");
		String proType = servletRequest.getParameter("proType");
		String applierId = servletRequest.getParameter("applierId");
		Integer applierid = Integer.parseInt(applierId);
		String applierName = servletRequest.getParameter("applierName");
		String sex = servletRequest.getParameter("sex");
		String idCard = servletRequest.getParameter("idCard");
		String xingzheng = servletRequest.getParameter("xingzheng");
		String zhicheng = servletRequest.getParameter("zhicheng");
		String search = servletRequest.getParameter("search");
		String unit = servletRequest.getParameter("unit");
		String email = servletRequest.getParameter("email");
		String address = servletRequest.getParameter("address");
		String postal = servletRequest.getParameter("postal");		
		String mobile = servletRequest.getParameter("mobile");
		String telHome = servletRequest.getParameter("telHome");
		String telUnit = servletRequest.getParameter("telUnit");	
		InsertInfo insertInfo = new InsertInfo(applyId, proName,proClass, proType, proLocation, applierid, applierName, sex, idCard, xingzheng, zhicheng, search, unit, email, address, postal, mobile, telUnit, telHome);
		proApplyInfoService.updateApply(insertInfo);
	return "edit";
	}
	
	public String insertwai(){
		return "insertwai";
	}
	public String insert1(){
		return "insert1";
	}
	
	public String insert2(){
		return "insert2";
	}
	
	public String insert3(){
		return "insert3";
	}
	
}
