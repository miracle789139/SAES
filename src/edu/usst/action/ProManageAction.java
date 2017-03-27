package edu.usst.action;

import edu.usst.model.ProManageModel;
import edu.usst.service.ProApprovalService;
import edu.usst.service.ProManageService;
import edu.usst.utils.HthTools;

import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 项目一览管理
 * @author Administrator
 *
 */
public class ProManageAction {
	HttpServletRequest servletRequest = ServletActionContext.getRequest();//获取request参数
    HttpServletResponse servletResponse = ServletActionContext.getResponse();//返回json
	@Resource (name="proManageService")
	private ProManageService proManageService;
	@Resource (name="proApprovalService")
	private ProApprovalService proApprovalService;
	
	/**	
	 * 项目一览初始化
	 * @return
	 */
	//判断返回首页的个人项目还是项目管理的个人项目
	String is=ServletActionContext.getRequest().getParameter("is");
	Map<String, Object> user = (Map<String, Object>) servletRequest.getSession(true).getAttribute("userSession");
	String personId = user.get("PERSON_ID").toString();//工号
    String personName = user.get("name").toString();
    
	public String manage(){
     System.out.println(is);
		//客户端请求
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String retString ="FAIL";//定义返回值
		List<ProManageModel> proManageModels = new ArrayList<ProManageModel>();//定义一个集合，用于装ProManageModel对象
		try {
			Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
			if (null != reqParams) {
				List<Map<String,Object>> promanageLists = proManageService.getManageList(personName);//得到查询结果
				
					/*
					 * 如果查询结果不为空，则迭代出MAp类，并从而得到ProApplyInfo对象，并将对象放入List集合中
					 */
					for(Map<String,Object> promanage:promanageLists)
					{
						String UNIQUE_CODE = (String)promanage.get("UNIQUE_CODE");//唯一编号
						System.out.print(UNIQUE_CODE);
						String PROJECT_CODE = (String)promanage.get("PROJECT_CODE");//项目编号
						String PROJECT_TYPE = (String)promanage.get("PROJECT_TYPE");//项目类型
						String PROJECT_NAME = (String)promanage.get("PROJECT_NAME");//项目名称
						String CHARGER_NAME = (String)promanage.get("CHARGER_NAME");//负责人姓名
						int UNIT_ID = (Integer)promanage.get("UNIT_ID");//所属部门编号－对应代码表　S_UNIT
						int APPLIER_ID = (Integer)promanage.get("APPLIER_ID");//所属科室编号-对应S_UNIT
						Date createTime = (Date)promanage.get("CREATE_TIME");//项目创建时间
						int SUO_CHECK_STATE = (Integer)promanage.get("SUO_CHECK_STATE");//所审核状态,0：不通过，1：通过
						int YUAN_CHECK_STATE = (Integer)promanage.get("YUAN_CHECK_STATE");//院审核状态,0：不通过，1：通过
						ProManageModel proManageModel = new ProManageModel(UNIQUE_CODE,PROJECT_CODE, PROJECT_TYPE,PROJECT_NAME, CHARGER_NAME,UNIT_ID,APPLIER_ID,createTime,SUO_CHECK_STATE,YUAN_CHECK_STATE);
						proManageModels.add(proManageModel);
					}
					servletRequest.setAttribute("proManageModels", proManageModels);//向页面发送数据信息				
					servletRequest.setAttribute("promanageLists", promanageLists);//向页面发送数据信息				
					
					retString="SUCCESS";//操作成功返回值为manage
				
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
	 * 项目一览中项目添加
	 */
	public String manage_insert(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		Map<String, Object> project_number=proManageService.getproject_number();
		int pro_number = (Integer)project_number.get("project_number");//获取项目编号当前的记录数
		Date date=new Date();
		SimpleDateFormat df=new SimpleDateFormat("yyyyMMdd");
		String str=df.format(date);
		String UNIQUE_CODE ="P"+str+pro_number;//项目生成唯一编号
		
		String PROJECT_CODE = servletRequest.getParameter("PROJECT_CODE");
		String PROJECT_TYPE = servletRequest.getParameter("PROJECT_TYPE");
		String PROJECT_NAME = servletRequest.getParameter("PROJECT_NAME");
//		String CHARGER_NAME = servletRequest.getParameter("CHARGER_NAME");
		String CHARGER_NAME = personName;
		int UNIT_ID = Integer.parseInt(servletRequest.getParameter("UNIT_ID"));
		int APPLIER_ID = Integer.parseInt(servletRequest.getParameter("APPLIER_ID"));
		Date CREATE_TIME = new Date();
		int SUO_CHECK_STATE = 0;//所审核状态,0：不通过，1：通过
		int YUAN_CHECK_STATE = 0;
		ProManageModel proManageModel = new ProManageModel(UNIQUE_CODE,PROJECT_CODE, PROJECT_TYPE,PROJECT_NAME, CHARGER_NAME,UNIT_ID,APPLIER_ID,CREATE_TIME,SUO_CHECK_STATE,YUAN_CHECK_STATE);
		int flag=proManageService.manage_insert(proManageModel);
		if(flag==1){
			return "SUCCESS";
		}
		return "FAIL";
	}
	
	/**
	 * 项目管理从申报项目中添加
	 * @return
	 */
	public String manage_applyinsert(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
		System.out.println(UNIQUE_CODE);
		String PROJECT_CODE = servletRequest.getParameter("PROJECT_CODE");
		String PROJECT_TYPE = servletRequest.getParameter("PROJECT_TYPE");
		String PROJECT_NAME = servletRequest.getParameter("PROJECT_NAME");
		String CHARGER_NAME = servletRequest.getParameter("CHARGER_NAME");
		int UNIT_ID = 1;
		int APPLIER_ID = 1;
		Date CREATE_TIME = new Date();
		int SUO_CHECK_STATE = 0;//所审核状态,0：不通过，1：通过
		int YUAN_CHECK_STATE = 0;
		ProManageModel proManageModel = new ProManageModel(UNIQUE_CODE,PROJECT_CODE, PROJECT_TYPE,PROJECT_NAME, CHARGER_NAME,UNIT_ID,APPLIER_ID,CREATE_TIME,SUO_CHECK_STATE,YUAN_CHECK_STATE);
		int flag=proManageService.manage_insert(proManageModel);
		if(flag==1){
			return "SUCCESS";
		}
		return "FAIL";
	}

	/**
	 * 加载添加项目页面
	 * @return
	 */
	public String manage_add(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String fromapply = servletRequest.getParameter("fromapply");
		//判断从前端传递的是否从申请表中加载的项目
		if(fromapply!=null){
			List<Map<String, Object>> apply_pros=proManageService.getProApplyInfo() ;
			servletRequest.setAttribute("apply_pros", apply_pros);//向页面发送数据信息
			servletRequest.setAttribute("fromapply", fromapply);//向页面发送数据信息
		}
		return "SUCCESS";
	}

	/**
	 * 项目查看
	 * @return
	 */
	public String manage_check(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
//		System.out.print(UNIQUE_CODE);
		Map<String, Object> proManageCheck=proManageService.manage_check(UNIQUE_CODE);
		if (null!= proManageCheck){
			String PROJECT_CODE = (String)proManageCheck.get("PROJECT_CODE");//项目类型
			String PROJECT_TYPE = (String)proManageCheck.get("PROJECT_TYPE");//项目类型
			String PROJECT_NAME = (String)proManageCheck.get("PROJECT_NAME");//项目名称
			String CHARGER_NAME = (String)proManageCheck.get("CHARGER_NAME");//负责人姓名
			int UNIT_ID = (Integer)proManageCheck.get("UNIT_ID");//所属部门编号－对应代码表　S_UNIT
			int APPLIER_ID = (Integer)proManageCheck.get("APPLIER_ID");//所属科室编号-对应S_UNIT
			Date createTime = (Date)proManageCheck.get("CREATE_TIME");//项目创建时间
			int SUO_CHECK_STATE = (Integer)proManageCheck.get("SUO_CHECK_STATE");//所审核状态,0：不通过，1：通过
			int YUAN_CHECK_STATE = (Integer)proManageCheck.get("YUAN_CHECK_STATE");//院审核状态,0：不通过，1：通过
			ProManageModel proManageModel = new ProManageModel(UNIQUE_CODE,PROJECT_CODE, PROJECT_TYPE,PROJECT_NAME, CHARGER_NAME,UNIT_ID,APPLIER_ID,createTime,SUO_CHECK_STATE,YUAN_CHECK_STATE);
			servletRequest.setAttribute("proManageModel", proManageModel);//向页面发送数据信息
			return "SUCCESS";
			
		}else {
			return "FAIL";		
		}
	}

	/**
	 * 编辑项目
	 * @return
	 */
	public String pro_manage_edit(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODE = servletRequest.getParameter("UNIQUE_CODE");
		System.out.print(UNIQUE_CODE);
		String PROJECT_TYPE = servletRequest.getParameter("PROJECT_TYPE");
		String PROJECT_NAME = servletRequest.getParameter("PROJECT_NAME");
		String CHARGER_NAME = servletRequest.getParameter("CHARGER_NAME");
		int UNIT_ID = Integer.parseInt(servletRequest.getParameter("UNIT_ID"));
		int APPLIER_ID = Integer.parseInt(servletRequest.getParameter("APPLIER_ID"));
		int flag=proManageService.manage_edit(UNIQUE_CODE,PROJECT_TYPE,PROJECT_NAME,CHARGER_NAME,UNIT_ID,APPLIER_ID);
		if(flag==1){
			return "SUCCESS";
		}
		return "FAIL";
	}
	
	/**
	 * 删除项目
	 * @return
	 */
	
	public String pro_manage_delete(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		String UNIQUE_CODES = servletRequest.getParameter("delitems");
		String[] UNIQUE_CODE = UNIQUE_CODES.split(",");
		String[] PRO_UNIQUE_CODE = new String[UNIQUE_CODE.length];
		for(int i=0;i<PRO_UNIQUE_CODE.length;i++){
			PRO_UNIQUE_CODE[i] = UNIQUE_CODE[i];
	        System.out.println(PRO_UNIQUE_CODE[i]);
		}
		proManageService.pro_manage_delete(PRO_UNIQUE_CODE);
		return "SUCCESS";
	}
	
}
