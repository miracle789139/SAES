package edu.usst.service;



import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.ws.rs.FormParam;
import javax.ws.rs.core.MediaType;

import org.apache.commons.io.IOUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import edu.usst.core.BusinessException;
import edu.usst.core.ErrorConstants;
import edu.usst.dao.AuthDao;
import edu.usst.dao.ManageReferDao;
import edu.usst.pojo.BaseListResult;
import edu.usst.pojo.BaseResult;
import edu.usst.service.AuthService;
import edu.usst.utils.HthTools;
import edu.usst.utils.MD5;
import edu.usst.utils.Page;

@Service
public class ManageReferService {

	@Resource(name="manageReferDao")
	private ManageReferDao manageReferDao;
	/**
	 * 获取用户列表
	 */
	public BaseListResult getUserListService(@RequestParam("pageNo") long pageNo,
								         @RequestParam("rowNum") long rowNum,
								         @RequestParam("filters") String filters) {
		BaseListResult baseListResult = new BaseListResult();
		 try {
			 if (pageNo < 1) {
	                pageNo = 0;
	            } else {
	                pageNo--;
	            }
	            if (rowNum <= 0) {
	                rowNum = Page.DEF_REC_NUM;
	            }
	            Page sqlPage = new Page(pageNo, rowNum);
	            String sqlCount="SELECT COUNT(ID)  FROM s_person";
	            String sql = "SELECT p.* ,u.name as UNIT_NAME" +
	                    " FROM s_person p left join s_unit u on p.UNIT_ID=u.id Where p.STATUS=0  ORDER BY p.ID desc" + " LIMIT " + sqlPage.getsPAGE_NO() * sqlPage.getsREC_NUM() + ", " + sqlPage.getsREC_NUM();
	            Integer totalCount = (Integer) manageReferDao.getListCount(sqlCount);
	            sqlPage.setTotalCount(totalCount);
		List<Map<String, Object>> userList=manageReferDao.getUserList(sql);
		if (null!= userList) {
			baseListResult.setReturnCode(ErrorConstants.SUCCESS);
			baseListResult.setReturnDescipt("获取用户列表成功");
            for(int i=0;i<userList.size();i++){
            	  if(null!=userList.get(i).get("BIRTHDAY")&&!userList.get(i).get("BIRTHDAY").equals("")){
            	  userList.get(i).put("BIRTHDAY", HthTools.timeStamp2Str(userList.get(i).get("BIRTHDAY"), null));}
			}
            String unitSql="SELECT ID, NAME  FROM s_unit";
            List<Map<String, Object>> unitList=manageReferDao.getUserList(unitSql);
            Map<String,String> unitSelectMap=new HashMap<String, String>();
            for(int i=0;i<unitList.size();i++){
            	unitSelectMap.put(unitList.get(i).get("ID").toString(), unitList.get(i).get("NAME").toString());
            }
            baseListResult.setSelectMap(unitSelectMap);
			baseListResult.setList(userList);
			baseListResult.setPageNo(sqlPage.getsPAGE_NO().intValue() + 1);
			baseListResult.setPageTotal((sqlPage.getTotalCount().intValue()  +  sqlPage.getsREC_NUM().intValue()  - 1) / sqlPage.getsREC_NUM().intValue());
			baseListResult.setRecordTotal(sqlPage.getTotalCount());
		} else {
			baseListResult.setReturnCode(ErrorConstants.ERROR_SELECT_DATA);
			baseListResult.setReturnDescipt("获取信息失败");
		}
	 }catch (Exception e) {
		 e.printStackTrace();
		 baseListResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
		 baseListResult.setReturnDescipt(e.toString());
    }
		return baseListResult;
	}
	public BaseListResult getUnitListService(@RequestParam("pageNo") long pageNo,
	         @RequestParam("rowNum") long rowNum,
	         @RequestParam("filters") String filters) {
		// TODO Auto-generated method stub
		BaseListResult baseListResult = new BaseListResult();
		 try {
			 if (pageNo < 1) {
	                pageNo = 0;
	            } else {
	                pageNo--;
	            }
	            if (rowNum <= 0) {
	                rowNum = Page.DEF_REC_NUM;
	            }
	            Page sqlPage = new Page(pageNo, rowNum);
	            String sqlCount="SELECT COUNT(ID)  FROM s_unit";
	            String sql = "SELECT * " +
	                    " FROM s_unit Where STATUS=0 ORDER BY ID desc " + " LIMIT " + sqlPage.getsPAGE_NO() * sqlPage.getsREC_NUM() + ", " + sqlPage.getsREC_NUM();
	            Integer totalCount = (Integer) manageReferDao.getListCount(sqlCount);
	            sqlPage.setTotalCount(totalCount);
		List<Map<String, Object>> unitList=manageReferDao.getUserList(sql);
		if (null!= unitList) {
			baseListResult.setReturnCode(ErrorConstants.SUCCESS);
			baseListResult.setReturnDescipt("获取科室列表成功");
			baseListResult.setList(unitList);
			baseListResult.setPageNo(sqlPage.getsPAGE_NO().intValue() + 1);
			baseListResult.setPageTotal((sqlPage.getTotalCount().intValue()  +  sqlPage.getsREC_NUM().intValue()  - 1) / sqlPage.getsREC_NUM().intValue());
			baseListResult.setRecordTotal(sqlPage.getTotalCount());
		} else {
			baseListResult.setReturnCode(ErrorConstants.ERROR_SELECT_DATA);
			baseListResult.setReturnDescipt("获取信息失败");
		}
	 }catch (Exception e) {
		 baseListResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
		 baseListResult.setReturnDescipt(e.toString());
   }
		return baseListResult;
	}
	public BaseResult delUser(@RequestParam("userId") Integer userId) {
		// TODO Auto-generated method stub
		  BaseResult baseResult = new BaseResult();
		 try {
			 String sql = "update s_person SET STATUS=1 " +
	                    " WHERE ID="+userId;
		   int res=manageReferDao.updateList(sql);
		   if(res>0){
			   baseResult.setReturnCode(ErrorConstants.SUCCESS);
			   baseResult.setReturnDescipt("用户删除成功");
		   }
		   else{
			   baseResult.setReturnCode(ErrorConstants.ERROR_UPDATE_DATA);
			   baseResult.setReturnDescipt("用户删除失败");
		   }
		 }
		 catch (BusinessException e) {
	            baseResult.setReturnCode(e.getBr().getReturnCode());
	            baseResult.setReturnDescipt(e.getBr().getReturnDescipt());
	        } catch (Exception e) {
	            baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
	            baseResult.setReturnDescipt(ErrorConstants.getErrorDescByCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION));
	            e.printStackTrace();
	        }
	        return baseResult;
	}
	public BaseResult delUnit(@RequestParam("userId") Integer  unitId) {
		// TODO Auto-generated method stub
		BaseResult baseResult = new BaseResult();
		 try {
			 String sql = "update s_unit SET STATUS=1 " +
	                    " WHERE ID="+unitId;
		   int res=manageReferDao.updateList(sql);
		   if(res>0){
			   baseResult.setReturnCode(ErrorConstants.SUCCESS);
			   baseResult.setReturnDescipt("科室删除成功");
		   }
		   else{
			   baseResult.setReturnCode(ErrorConstants.ERROR_UPDATE_DATA);
			   baseResult.setReturnDescipt("科室删除失败");
		   }
		 }
		 catch (BusinessException e) {
	            baseResult.setReturnCode(e.getBr().getReturnCode());
	            baseResult.setReturnDescipt(e.getBr().getReturnDescipt());
	        } catch (Exception e) {
	            baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
	            baseResult.setReturnDescipt(ErrorConstants.getErrorDescByCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION));
	            e.printStackTrace();
	        }
	        return baseResult;
	}
	public BaseResult updateUserService(@RequestParam("ID") Integer  ID,
			@RequestParam("PERSON_ID") String  PERSON_ID,
			@RequestParam("NAME") String  NAME,
			@RequestParam("UNIT_ID") Integer  UNIT_ID,
			@RequestParam("SEXID") String  SEXID,
			@RequestParam("ID_CARD") String  ID_CARD,
			@RequestParam("BIRTHDAY") String  BIRTHDAY,
			@RequestParam("TITLE") String  TITLE,
			@RequestParam("RESEARCH_FIELD") String  RESEARCH_FIELD,
			@RequestParam("MOBILE") String  MOBILE,
			@RequestParam("EMAIL") String  EMAIL,
			@RequestParam("ACCOUNT") String  ACCOUNT,
			@RequestParam("PASSWORD") String  PASSWORD,
			@RequestParam("opt") String  opt
			) {
		// TODO Auto-generated method stub
		BaseResult baseResult = new BaseResult();
		 try {
			 StringBuilder sql =new StringBuilder();
			 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			 if(opt.equals("add")){
				 sql.append(" INSERT into s_person(NAME,UNIT_ID,SEXID,PERSON_ID,ID_CARD,BIRTHDAY,TITLE,RESEARCH_FIELD,MOBILE,EMAIL,ACCOUNT,PASSWORD) VALUES('") ;
				 sql.append(null!=NAME&&!NAME.equals("")?NAME:"");
				 sql.append("'," );
				 sql.append(null!=UNIT_ID&&!UNIT_ID.equals("")?UNIT_ID:0);
				 sql.append("," );
				 sql.append(null!=SEXID&&!SEXID.equals("")?SEXID:0);
				 sql.append(",'" );
				 sql.append(null!=PERSON_ID&&!PERSON_ID.equals("")?PERSON_ID:"");
				 sql.append("','" );
				 sql.append(null!=ID_CARD&&!ID_CARD.equals("")?ID_CARD:"");
				 sql.append("','" );
				 sql.append(null!=BIRTHDAY&&!BIRTHDAY.equals("")?BIRTHDAY:df.format(new Date()));
				 sql.append("','" );
				 sql.append(null!=TITLE&&!TITLE.equals("")?TITLE:"");
				 sql.append("','" );
				 sql.append(null!=RESEARCH_FIELD&&!RESEARCH_FIELD.equals("")?RESEARCH_FIELD:"");
				 sql.append("','" );
				 sql.append(null!=MOBILE&&!MOBILE.equals("")?MOBILE:"");
				 sql.append("','" );
				 sql.append(null!=EMAIL&&!EMAIL.equals("")?EMAIL:"");
				 sql.append("','" );
				 sql.append(null!=ACCOUNT&&!ACCOUNT.equals("")?ACCOUNT:"");
				 sql.append("','" );
				 sql.append(null!=PASSWORD&&!PASSWORD.equals("")? MD5.GetMD5Code(PASSWORD):"");
				 sql.append("') ;" );
			 }else{
				 sql.append("UPDATE s_person SET");
				 sql.append(" NAME= '");
				 sql.append(null!=NAME&&!NAME.equals("")?NAME:"");
				 sql.append("', UNIT_ID= ");
				 sql.append(null!=UNIT_ID&&!UNIT_ID.equals("")?UNIT_ID:"");
				 sql.append(", SEXID= ");
				 sql.append(null!=SEXID&&!SEXID.equals("")?SEXID:"");
				 sql.append(", PERSON_ID= '");
				 sql.append(null!=PERSON_ID&&!PERSON_ID.equals("")?PERSON_ID:"");
				 sql.append("', ID_CARD= '");
				 sql.append(null!=ID_CARD&&!ID_CARD.equals("")?ID_CARD:"");
				 sql.append("' ,BIRTHDAY= '");
				 sql.append(null!=BIRTHDAY&&!BIRTHDAY.equals("")?BIRTHDAY:df.format(new Date()));
				 sql.append("',TITLE= '");
				 sql.append(null!=TITLE&&!TITLE.equals("")?TITLE:"");
				 sql.append("', RESEARCH_FIELD= '");
				 sql.append(null!=RESEARCH_FIELD&&!RESEARCH_FIELD.equals("")?RESEARCH_FIELD:"");
				 sql.append("' ,MOBILE= '");
				 sql.append(null!=MOBILE&&!MOBILE.equals("")?MOBILE:"");
				 sql.append("', EMAIL= '");
				 sql.append(null!=EMAIL&&!EMAIL.equals("")?EMAIL:"");
				 sql.append("', ACCOUNT= '");
				 sql.append(null!=ACCOUNT&&!ACCOUNT.equals("")?ACCOUNT:"");
				 sql.append("' WHERE ID=");
				 sql.append(ID); 
			 }
			/* String sql = "update s_person SET";
			 if(null!=NAME&&!NAME.equals("")){
				 sql += " NAME= '" +NAME+"'";
			 }
			 if(null!=SEXID&&!SEXID.equals("")){
				 sql += ", SEXID= '" +SEXID+"'";
			 }
			 if(null!=ID_CARD&&!ID_CARD.equals("")){
				 sql += ", ID_CARD= '" +ID_CARD+"'";
			 }
			 if(null!=BIRTHDAY&&!BIRTHDAY.equals("")){
           	 
				 sql += " ,BIRTHDAY= '" +BIRTHDAY+"'";
			 }
			 if(null!=TITLE&&!TITLE.equals("")){
				 sql += ",TITLE= '" +TITLE+"'";
			 }
			 if(null!=RESEARCH_FIELD&&!RESEARCH_FIELD.equals("")){
				 sql += ", RESEARCH_FIELD= '" +RESEARCH_FIELD+"'";
			 }
			 if(null!=MOBILE&&!MOBILE.equals("")){
				 sql += " ,MOBILE= '" +MOBILE+"'";
			 }
			 if(null!=EMAIL&&!EMAIL.equals("")){
				 sql += ", EMAIL= '" +EMAIL+"'";
			 }
			 sql +=  " WHERE ID="+ID;*/
		   int res=manageReferDao.updateList(sql.toString());
		   if(res>0){
			   baseResult.setReturnCode(ErrorConstants.SUCCESS);
			   baseResult.setReturnDescipt("用户更新成功");
		   }
		   else{
			   baseResult.setReturnCode(ErrorConstants.ERROR_UPDATE_DATA);
			   baseResult.setReturnDescipt("用户更新失败");
		   }
		 }
		 catch (BusinessException e) {
	            baseResult.setReturnCode(e.getBr().getReturnCode());
	            baseResult.setReturnDescipt(e.getBr().getReturnDescipt());
	        } catch (Exception e) {
	            baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
	            baseResult.setReturnDescipt(ErrorConstants.getErrorDescByCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION));
	            e.printStackTrace();
	        }
	        return baseResult;
	}
	public BaseResult updateUnitService(@RequestParam("ID") Integer  ID,
			@RequestParam("UNIT_ID") String  UNIT_ID,
			@RequestParam("NAME") String  NAME,
			@RequestParam("opt") String  opt
			) {
		// TODO Auto-generated method stub
		BaseResult baseResult = new BaseResult();
		 try {
			 StringBuilder sql =new StringBuilder();
			 if(opt.equals("add")){
				 sql.append(" INSERT into s_unit(NAME,UNIT_ID) VALUES('" );
				 sql.append(null!=NAME&&!NAME.equals("")?NAME:"");
				 sql.append("','" );
				 sql.append(null!=UNIT_ID&&!UNIT_ID.equals("")?UNIT_ID:"");
				 sql.append("'); ");
			 }
			 else{
				 sql.append(" UPDATE s_unit SET");
				 sql.append(" NAME= '");
				 sql.append(null!=NAME&&!NAME.equals("")?NAME:"");
				 sql.append("', UNIT_ID= '");
				 sql.append(null!=UNIT_ID&&!UNIT_ID.equals("")?UNIT_ID:"");
				 sql.append("' WHERE ID=");
				 sql.append(ID);
			 }
			  
		   int res=manageReferDao.updateList(sql.toString());
		   if(res>0){
			   baseResult.setReturnCode(ErrorConstants.SUCCESS);
			   baseResult.setReturnDescipt("科室更新成功");
		   }
		   else{
			   baseResult.setReturnCode(ErrorConstants.ERROR_UPDATE_DATA);
			   baseResult.setReturnDescipt("科室更新失败");
		   }
		 }
		 catch (BusinessException e) {
	            baseResult.setReturnCode(e.getBr().getReturnCode());
	            baseResult.setReturnDescipt(e.getBr().getReturnDescipt());
	        } catch (Exception e) {
	            baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
	            baseResult.setReturnDescipt(ErrorConstants.getErrorDescByCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION));
	            e.printStackTrace();
	        }
	        return baseResult;
	}
	
	public BaseListResult getNotifyService(@RequestParam("pageNo") long pageNo,
	         @RequestParam("rowNum") long rowNum,
	         @RequestParam("filters") String filters){
		BaseListResult baseListResult = new BaseListResult();
		 try {
			 if (pageNo < 1) {
	                pageNo = 0;
	            } else {
	                pageNo--;
	            }
	            if (rowNum <= 0) {
	                rowNum = Page.DEF_REC_NUM;
	            }
	            Page sqlPage = new Page(pageNo, rowNum);
	            String sqlCount="SELECT COUNT(ID)  FROM s_notify";
	            String sql = "SELECT p.* ,per.NAME AS SENDER_NAME " +
	                    " FROM s_notify p left join s_person per on p.SENDER_ID=per.ID  ORDER BY p.TITLE_TOP_FLAG asc, p.ID desc" + " LIMIT " + sqlPage.getsPAGE_NO() * sqlPage.getsREC_NUM() + ", " + sqlPage.getsREC_NUM();
	            Integer totalCount = (Integer) manageReferDao.getListCount(sqlCount);
	            sqlPage.setTotalCount(totalCount);
		List<Map<String, Object>> notifyList=manageReferDao.getUserList(sql);
		if (null!= notifyList) {
			baseListResult.setReturnCode(ErrorConstants.SUCCESS);
			baseListResult.setReturnDescipt("获取公告列表成功");
           for(int i=0;i<notifyList.size();i++){
           	  if(null!=notifyList.get(i).get("SEND_DATE")&&!notifyList.get(i).get("SEND_DATE").equals("")){
           		notifyList.get(i).put("SEND_DATE", HthTools.timeStamp2Str(notifyList.get(i).get("SEND_DATE"), null));}
           	  
           	 if(null!=notifyList.get(i).get("OPERATE_TIME")&&!notifyList.get(i).get("OPERATE_TIME").equals("")){
            		notifyList.get(i).put("OPERATE_TIME", HthTools.timeStamp2Str(notifyList.get(i).get("OPERATE_TIME"), null));}
			}
			/*
           String unitSql="SELECT ID, NAME  FROM s_unit";
           List<Map<String, Object>> unitList=manageReferDao.getUserList(unitSql);
           Map<String,String> unitSelectMap=new HashMap<String, String>();
           for(int i=0;i<unitList.size();i++){
           	unitSelectMap.put(unitList.get(i).get("ID").toString(), unitList.get(i).get("NAME").toString());
           }*/
			baseListResult.setList(notifyList);
			baseListResult.setPageNo(sqlPage.getsPAGE_NO().intValue() + 1);
			baseListResult.setPageTotal((sqlPage.getTotalCount().intValue()  +  sqlPage.getsREC_NUM().intValue()  - 1) / sqlPage.getsREC_NUM().intValue());
			baseListResult.setRecordTotal(sqlPage.getTotalCount());
		} else {
			baseListResult.setReturnCode(ErrorConstants.ERROR_SELECT_DATA);
			baseListResult.setReturnDescipt("获取信息失败");
		}
	 }catch (Exception e) {
		 e.printStackTrace();
		 baseListResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
		 baseListResult.setReturnDescipt(e.toString());
   }
		return baseListResult;
	}
	public BaseResult updateNotifyService(@RequestParam("ID") Integer  ID,
			@RequestParam("TITLE") String  TITLE,
			@RequestParam("CONTENT") String  CONTENT,
			@RequestParam("TITLE_TOP_FLAG") int  TITLE_TOP_FLAG,
			@RequestParam("NOTIFY_TYPE") String  NOTIFY_TYPE,
			@RequestParam("FILE_ID") File  FILE_ID,
			@RequestParam("SENDER_ID") String  SENDER_ID,
			@RequestParam("opt") String  opt
			) {
		// TODO Auto-generated method stub
		BaseResult baseResult = new BaseResult();
		 try {
			 SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
			 // new Date()为获取当前系统时间
			 StringBuilder sql =new StringBuilder();
			 int fileId=0;
			 if(null!=FILE_ID){
				 String fileName = new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(new Date()) + "." + HthTools.getExtensionName(FILE_ID.getName());
	                InputStream is = new FileInputStream(FILE_ID);
	                OutputStream os = new FileOutputStream("/file//notify" + "//" + fileName);
	                IOUtils.copy(is, os);
	                os.flush();
	                IOUtils.closeQuietly(is);
	                IOUtils.closeQuietly(os);
				 String inserFileSql=" INSERT into s_file(NAME,PUBLISH_DATE) VALUES('/file/notify/"+fileName+"','"+df.format(new Date())+"')" ;
				 fileId=manageReferDao.updateList(inserFileSql);
			 }
			 if(opt.equals("add")){
				 sql.append(" INSERT into s_notify(TITLE,CONTENT,TITLE_TOP_FLAG,NOTIFY_TYPE,FILE_ID,SENDER_ID,SEND_DATE) VALUES('" );
				 sql.append(null!=TITLE&&!TITLE.equals("")?TITLE:"");
				 sql.append("','" );
				 sql.append(null!=CONTENT&&!CONTENT.equals("")?CONTENT:"");
				 sql.append("'," );
				 sql.append(TITLE_TOP_FLAG);
				 sql.append(",'" );
				 sql.append(null!=NOTIFY_TYPE&&!NOTIFY_TYPE.equals("")?NOTIFY_TYPE:"");
				 sql.append("'," );
				 sql.append(fileId);
				 sql.append("," );
				 sql.append(Integer.parseInt(SENDER_ID));
				 sql.append(",'" );
				 sql.append(df.format(new Date()));
				 sql.append("'); ");
			 }
			 else{
				 sql.append(" UPDATE s_notify SET");
				 sql.append(" TITLE= '");
				 sql.append(null!=TITLE&&!TITLE.equals("")?TITLE:"");
				 sql.append("', CONTENT= '");
				 sql.append(null!=CONTENT&&!CONTENT.equals("")?CONTENT:"");
				 sql.append("', TITLE_TOP_FLAG= ");
				 sql.append(TITLE_TOP_FLAG);
				 sql.append(", NOTIFY_TYPE= '");
				 sql.append(null!=NOTIFY_TYPE&&!NOTIFY_TYPE.equals("")?NOTIFY_TYPE:"");
				 sql.append("', OPERATE_TIME= '");
				 sql.append(df.format(new Date()));
				 sql.append("', FILE_ID= ");
				 sql.append(fileId);
				 sql.append(" WHERE ID=");
				 sql.append(ID);
			 }
			  
		   int res=manageReferDao.updateList(sql.toString());
		   if(res>0){
			   baseResult.setReturnCode(ErrorConstants.SUCCESS);
			   baseResult.setReturnDescipt("公告更新成功");
		   }
		   else{
			   baseResult.setReturnCode(ErrorConstants.ERROR_UPDATE_DATA);
			   baseResult.setReturnDescipt("公告更新失败");
		   }
		 }
		 catch (BusinessException e) {
	            baseResult.setReturnCode(e.getBr().getReturnCode());
	            baseResult.setReturnDescipt(e.getBr().getReturnDescipt());
	        } catch (Exception e) {
	            baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
	            baseResult.setReturnDescipt(ErrorConstants.getErrorDescByCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION));
	            e.printStackTrace();
	        }
	        return baseResult;
	}

	public BaseResult delNotify(@RequestParam("ID") Integer  ID){
		BaseResult baseResult = new BaseResult();
		 try {
			 String sql = "delete from s_notify  " +
	                    " WHERE ID="+ID;
		   int res=manageReferDao.updateList(sql);
		   if(res>0){
			   baseResult.setReturnCode(ErrorConstants.SUCCESS);
			   baseResult.setReturnDescipt("公告删除成功");
		   }
		   else{
			   baseResult.setReturnCode(ErrorConstants.ERROR_UPDATE_DATA);
			   baseResult.setReturnDescipt("公告删除失败");
		   }
		 }
		 catch (BusinessException e) {
	            baseResult.setReturnCode(e.getBr().getReturnCode());
	            baseResult.setReturnDescipt(e.getBr().getReturnDescipt());
	        } catch (Exception e) {
	            baseResult.setReturnCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
	            baseResult.setReturnDescipt(ErrorConstants.getErrorDescByCode(ErrorConstants.ERROR_UNKNOWN_EXCEPTION));
	            e.printStackTrace();
	        }
	        return baseResult;
	}
}
