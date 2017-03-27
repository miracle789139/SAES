package edu.usst.action;
import edu.usst.model.Magazine;
import edu.usst.model.Paper;
import edu.usst.service.KeyanInfoService;
import edu.usst.utils.FileUtils;
import edu.usst.utils.HthTools;
import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.List;
import java.util.Map;

public class KeyanInfoAction {
	public List<Paper> pl;
	public List<Magazine>ml;
	public List<Magazine> getMl() {
		return ml;
	}
	public void setMl(List<Magazine> ml) {
		this.ml = ml;
	}
	public List<Paper> getPl() {
		return pl;
	}
	public void setPl(List<Paper> pl) {
		this.pl = pl;
	}
	Paper paper=new Paper();
	HttpServletRequest servletRequest = ServletActionContext.getRequest();
	@Resource(name="keyanInfoService")
	private KeyanInfoService keyanInfoService;
	public String keyaninfo() throws Exception{
		System.out.println(paper.getID());
		servletRequest.setAttribute("ID",paper.getID());
		String retString="FAIL";
		pl=keyanInfoService.getKeyaninfo();
		servletRequest.setAttribute("pl", pl);
		this.setPl(pl);
		retString="SUCCESS";
		return retString;
	}

	//	HttpServletRequest request=ServletActionContext.getRequest();
	String c="";
	String PROJECT_SOURCE_ID=ServletActionContext.getRequest().getParameter("PROJECT_SOURCE_ID");
	String NAME=ServletActionContext.getRequest().getParameter("NAME");
	String PAPER_MODE_ID=ServletActionContext.getRequest().getParameter("PAPER_MODE_ID");
	String PUBLISH_UNIT=ServletActionContext.getRequest().getParameter("PUBLISH_UNIT");
	String FIRST_AUTHOR_NAME=ServletActionContext.getRequest().getParameter("FIRST_AUTHOR_NAME");
	String OTHER_AUTHOR_NAME=ServletActionContext.getRequest().getParameter("OTHER_AUTHOR_NAME");
	String PUBLISH_DATE=ServletActionContext.getRequest().getParameter("PUBLISH_DATE");
	String WORD_NUMBER=ServletActionContext.getRequest().getParameter("WORD_NUMBER");
	String CHECK_STATUS_ID=ServletActionContext.getRequest().getParameter("CHECK_STATUS_ID");
	String EDITOR=ServletActionContext.getRequest().getParameter("EDITOR");
	String REMARK=ServletActionContext.getRequest().getParameter("REMARK");
	String UNIT=ServletActionContext.getRequest().getParameter("UNIT");
	String PRIZE_DATE=ServletActionContext.getRequest().getParameter("PRIZE_DATE");
	String LEVEL=ServletActionContext.getRequest().getParameter("LEVEL");
	String DATE=ServletActionContext.getRequest().getParameter("DATE");
	String CONTENT=ServletActionContext.getRequest().getParameter("CONTENT");
	String FILE_IDS=ServletActionContext.getRequest().getParameter("FILE_IDS");
	String fileName=ServletActionContext.getRequest().getParameter("fileName");
	private File fileupload;
	public String keyaninfoadd() throws Exception{
//		HttpServletResponse response = null;
//		response = ServletActionContext.getResponse();
//		request.setCharacterEncoding("utf-8");
//		response.setContentType("text/html;charset=utf-8");
		System.out.println(biaoname+"111111111111111111");
		Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
		String fileName=HthTools.<String>checkParam(String.class, reqParams.get("fileName"), null);
		if(biaoname.equals("s_paper")){
			String filepath="";
			if(fileupload!=null){
				String middle="file/paper/";
				String middlesave="file\\paper\\";
				String extraName= fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
				filepath = FileUtils.getFilepathSave(middle,middlesave,fileupload,extraName);
			}
			c=keyanInfoService.keyaninfoadd(PROJECT_SOURCE_ID,NAME,PAPER_MODE_ID,PUBLISH_UNIT,FIRST_AUTHOR_NAME,OTHER_AUTHOR_NAME,PUBLISH_DATE,WORD_NUMBER,CHECK_STATUS_ID,filepath,0);
		}
		else if(biaoname.equals("s_book")){
			System.out.println(EDITOR);
			c=keyanInfoService.keyaninfoadd(PROJECT_SOURCE_ID, NAME, FIRST_AUTHOR_NAME, OTHER_AUTHOR_NAME,PUBLISH_UNIT, PUBLISH_DATE, WORD_NUMBER,REMARK,EDITOR,"未阅读");
		}
		else if(biaoname.equals("s_prize")){
			//System.out.println(EDITOR);
			c=keyanInfoService.keyaninfoadd(PROJECT_SOURCE_ID, NAME, FIRST_AUTHOR_NAME, OTHER_AUTHOR_NAME,UNIT, PRIZE_DATE, LEVEL);
		}
		else if(biaoname.equals("s_train")){
			//System.out.println(EDITOR);
			c=keyanInfoService.keyaninfoadd( NAME, UNIT, DATE, CONTENT,REMARK);
		}
		else{
			c=keyanInfoService.keyaninfoadd( NAME, UNIT, DATE,TYPE,FROM,ROLE,ACHIEVE,CHARGE,MONEY,1);


		}
		return keyaninfo();
	}
	String id=ServletActionContext.getRequest().getParameter("id");
	String TYPE=ServletActionContext.getRequest().getParameter("TYPE");
	String FROM=ServletActionContext.getRequest().getParameter("FROM");
	String ROLE=ServletActionContext.getRequest().getParameter("ROLE");
	String ACHIEVE=ServletActionContext.getRequest().getParameter("ACHIEVE");
	String CHARGE=ServletActionContext.getRequest().getParameter("CHARGE");
	String MONEY=ServletActionContext.getRequest().getParameter("MONEY");

	public String keyanInfoupdate(){
		HttpServletRequest servletRequest = ServletActionContext.getRequest();
		id=ServletActionContext.getRequest().getParameter("id");
		PROJECT_SOURCE_ID=ServletActionContext.getRequest().getParameter("PROJECT_SOURCE_ID");
		NAME=ServletActionContext.getRequest().getParameter("NAME");
		PAPER_MODE_ID=ServletActionContext.getRequest().getParameter("PAPER_MODE_ID");
		PUBLISH_UNIT=ServletActionContext.getRequest().getParameter("PUBLISH_UNIT");
		FIRST_AUTHOR_NAME=ServletActionContext.getRequest().getParameter("FIRST_AUTHOR_NAME");
		OTHER_AUTHOR_NAME=ServletActionContext.getRequest().getParameter("OTHER_AUTHOR_NAME");
		PUBLISH_DATE=ServletActionContext.getRequest().getParameter("PUBLISH_DATE");
		WORD_NUMBER=ServletActionContext.getRequest().getParameter("WORD_NUMBER");
		CHECK_STATUS_ID=ServletActionContext.getRequest().getParameter("CHECK_STATUS_ID");
		PRIZE_DATE=ServletActionContext.getRequest().getParameter("PRIZE_DATE");
		LEVEL=ServletActionContext.getRequest().getParameter("LEVEL");
		REMARK=ServletActionContext.getRequest().getParameter("REMARK");
		CONTENT=ServletActionContext.getRequest().getParameter("CONTENT");
		EDITOR=ServletActionContext.getRequest().getParameter("EDITOR");
		UNIT=ServletActionContext.getRequest().getParameter("UNIT");
		DATE=ServletActionContext.getRequest().getParameter("DATE");
		TYPE=ServletActionContext.getRequest().getParameter("TYPE");
		FROM=ServletActionContext.getRequest().getParameter("FROM");
		ROLE=ServletActionContext.getRequest().getParameter("ROLE");
		ACHIEVE=ServletActionContext.getRequest().getParameter("ACHIEVE");
		CHARGE=ServletActionContext.getRequest().getParameter("CHARGE");
		MONEY=ServletActionContext.getRequest().getParameter("MONEY");
		Map reqParams = HthTools.getHttpRequestParams(servletRequest, true);
		if (null != reqParams) {
			biaoname=HthTools.<String>checkParam(String.class, reqParams.get("biaoname"), null);
			fileName=HthTools.<String>checkParam(String.class, reqParams.get("fileName"), null);
		}
		System.out.println("id:"+id+",biaoname:"+biaoname);
		if(biaoname.equals("s_paper")){
			String filepath = "";
			if(fileupload!=null){
				String middle="file/paper/";
				String middlesave="file\\paper\\";
				String extraName= fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
				filepath = FileUtils.getFilepathSave(middle,middlesave,fileupload,extraName);
			}
			if(id==null||id.equals("")||Integer.parseInt(id)<=0){
				c=keyanInfoService.keyaninfoadd(PROJECT_SOURCE_ID,NAME,PAPER_MODE_ID,PUBLISH_UNIT,FIRST_AUTHOR_NAME,OTHER_AUTHOR_NAME,PUBLISH_DATE,WORD_NUMBER,CHECK_STATUS_ID,filepath,0);
			}else
				c=keyanInfoService.keyaninfoupdate(PROJECT_SOURCE_ID,NAME,PAPER_MODE_ID,PUBLISH_UNIT,FIRST_AUTHOR_NAME,OTHER_AUTHOR_NAME,PUBLISH_DATE,WORD_NUMBER,CHECK_STATUS_ID,Integer.parseInt(id),filepath);
		}
		else if(biaoname.equals("s_book")){
			if(id==null||id.equals("")||Integer.parseInt(id)<=0){
				//新增一条记录
				c=keyanInfoService.keyaninfoadd(PROJECT_SOURCE_ID, NAME, FIRST_AUTHOR_NAME, OTHER_AUTHOR_NAME,PUBLISH_UNIT, PUBLISH_DATE, WORD_NUMBER,REMARK,EDITOR,"未阅读");
			}else
				c=keyanInfoService.keyaninfoupdate(Integer.parseInt(id),PROJECT_SOURCE_ID, NAME, FIRST_AUTHOR_NAME, OTHER_AUTHOR_NAME,PUBLISH_UNIT, PUBLISH_DATE, WORD_NUMBER,REMARK,EDITOR,"未阅读");
		}
		else	if(biaoname.equals("s_prize")){
			if(id==null||id.equals("")||Integer.parseInt(id)<=0){
				//新增一条记录
				c=keyanInfoService.keyaninfoadd(PROJECT_SOURCE_ID, NAME, FIRST_AUTHOR_NAME, OTHER_AUTHOR_NAME,UNIT, PRIZE_DATE, LEVEL);
			}else
				c=keyanInfoService.keyaninfoupdate(Integer.parseInt(id),PROJECT_SOURCE_ID, NAME, FIRST_AUTHOR_NAME, OTHER_AUTHOR_NAME,UNIT, PRIZE_DATE, LEVEL);
		}
		else if(biaoname.equals("s_train")){
			if(id==null||id.equals("")||Integer.parseInt(id)<=0){
				//新增一条记录
				c=keyanInfoService.keyaninfoadd( NAME, UNIT, DATE, CONTENT,REMARK);
			}else
				c=keyanInfoService.keyaninfoupdate(Integer.parseInt(id), NAME, UNIT, DATE, CONTENT,REMARK);
		}
		else{
			if(id==null||id.equals("")||Integer.parseInt(id)<=0){
				//新增一条记录
				c=keyanInfoService.keyaninfoadd( NAME, UNIT, DATE,TYPE,FROM,ROLE,ACHIEVE,CHARGE,MONEY,1);
			}else
				c=keyanInfoService.keyaninfoupdate( NAME, UNIT, DATE,TYPE,FROM,ROLE,ACHIEVE,CHARGE,MONEY,id);
		}
		return c;
	}

	String userId =ServletActionContext.getRequest().getParameter("userId");
	String biaoname =ServletActionContext.getRequest().getParameter("biaoname");

	public String keyanInfodele() throws  Exception{

		System.out.println("-----------");
		System.out.println(userId+biaoname);
		c=keyanInfoService.keyaninfodele(userId,biaoname);
		return keyaninfo();
	}

	public String magazine() throws  Exception{
		String retString="FAIL";
		ml=keyanInfoService.magazine();
		servletRequest.setAttribute("ml",ml);
		this.setMl(ml);
		retString="SUCCESS";
		return retString;
	}

	String name=ServletActionContext.getRequest().getParameter("name");
	String level=ServletActionContext.getRequest().getParameter("level");
	String issn=ServletActionContext.getRequest().getParameter("issn");
	String cn=ServletActionContext.getRequest().getParameter("cn");
	String type=ServletActionContext.getRequest().getParameter("type");
	public String magazineadd() throws Exception{
		System.out.println(name);
		c=keyanInfoService.magazineadd(name, level, issn, cn, type);
		return magazine();
	}
	public File getFileupload() {
		return fileupload;
	}
	public void setFileupload(File fileupload) {
		this.fileupload = fileupload;
	}

}
