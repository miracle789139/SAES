package edu.usst.model;

import java.util.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProApplyInfo {
	private String applyId;
	private String proName;
	//private APPLIER applier;
	private Date createTime;
	private  String suoCheckState;
	private String yuanCheckState;
	private String applierName;
	
	
	
	public ProApplyInfo(String applyId, String proName, Date createTime,
			String suoCheckState,String yuanCheckState,String applierName) {
		super();
		this.applyId = applyId;
		this.proName = proName;
		this.createTime = createTime;
		this.suoCheckState = suoCheckState;
		this.yuanCheckState = yuanCheckState;
		this.applierName = applierName;
	}
	
	public ProApplyInfo() {
		// TODO Auto-generated constructor stub
	}
	
	public String getApplyId() {
		return applyId;
	}

	public void setApplyId(String applyId) {
		this.applyId = applyId;
	}
    
	
	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getApplierName() {
		return applierName;
	}

	public void setApplierName(String applierName) {
		this.applierName = applierName;
	}

	/*public APPLIER getApplier() {
		return applier;
	}
	public void setApplier(APPLIER applier) {
		this.applier = applier;
	}*/
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getSuoCheckState() {
		return suoCheckState;
	}
	public void setSuoCheckState(String suoCheckState) {
		this.suoCheckState = suoCheckState;
	}

	public String getYuanCheckState() {
		return yuanCheckState;
	}

	public void setYuanCheckState(String yuanCheckState) {
		this.yuanCheckState = yuanCheckState;
	}
    
	
	
	

}
