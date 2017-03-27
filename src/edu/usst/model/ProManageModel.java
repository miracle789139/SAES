package edu.usst.model;

import java.util.Date;

public class ProManageModel {
	
	/**
	 * s_project_basic_info表中数据
	 * 项目基本信息表（项目一览）
	 */
	private String UNIQUE_CODE;
	private String PROJECT_CODE;
	private String PROJECT_TYPE;
	private String PROJECT_NAME;
	private String CHARGER_NAME;
	private int UNIT_ID;
	private int APPLIER_ID;
	private Date CREATE_TIME;
	private int SUO_CHECK_STATE;
	private int YUAN_CHECK_STATE;
	
	public String getUNIQUE_CODE() {
		return UNIQUE_CODE;
	}
	public void setUNIQUE_CODE(String uNIQUE_CODE) {
		UNIQUE_CODE = uNIQUE_CODE;
	}
	public String getPROJECT_CODE() {
		return PROJECT_CODE;
	}
	public void setPROJECT_CODE(String pROJECT_CODE) {
		PROJECT_CODE = pROJECT_CODE;
	}
	public String getPROJECT_TYPE() {
		return PROJECT_TYPE;
	}
	public void setPROJECT_TYPE(String pROJECT_TYPE) {
		PROJECT_TYPE = pROJECT_TYPE;
	}
	public String getPROJECT_NAME() {
		return PROJECT_NAME;
	}
	public void setPROJECT_NAME(String pROJECT_NAME) {
		PROJECT_NAME = pROJECT_NAME;
	}
	public String getCHARGER_NAME() {
		return CHARGER_NAME;
	}
	public void setCHARGER_NAME(String cHARGER_NAME) {
		CHARGER_NAME = cHARGER_NAME;
	}
	public int getUNIT_ID() {
		return UNIT_ID;
	}
	public void setUNIT_ID(int uNIT_ID) {
		UNIT_ID = uNIT_ID;
	}
	public int getAPPLIER_ID() {
		return APPLIER_ID;
	}
	public void setAPPLIER_ID(int aPPLIER_ID) {
		APPLIER_ID = aPPLIER_ID;
	}
	public Date getCREATE_TIME() {
		return CREATE_TIME;
	}
	public void setCREATE_TIME(Date cREATE_TIME) {
		CREATE_TIME = cREATE_TIME;
	}
	public int getSUO_CHECK_STATE() {
		return SUO_CHECK_STATE;
	}
	public void setSUO_CHECK_STATE(int sUO_CHECK_STATE) {
		SUO_CHECK_STATE = sUO_CHECK_STATE;
	}
	public int getYUAN_CHECK_STATE() {
		return YUAN_CHECK_STATE;
	}
	public void setYUAN_CHECK_STATE(int yUAN_CHECK_STATE) {
		YUAN_CHECK_STATE = yUAN_CHECK_STATE;
	}
	
	
	
	
	public ProManageModel() {
		// TODO Auto-generated constructor stub
	}
	public ProManageModel(String uNIQUE_CODE, String pROJECT_CODE,
			String pROJECT_TYPE, String pROJECT_NAME, String cHARGER_NAME,
			int uNIT_ID, int aPPLIER_ID, Date cREATE_TIME, int sUO_CHECK_STATE,
			int yUAN_CHECK_STATE) {
		super();
		UNIQUE_CODE = uNIQUE_CODE;
		PROJECT_CODE = pROJECT_CODE;
		PROJECT_TYPE = pROJECT_TYPE;
		PROJECT_NAME = pROJECT_NAME;
		CHARGER_NAME = cHARGER_NAME;
		UNIT_ID = uNIT_ID;
		APPLIER_ID = aPPLIER_ID;
		CREATE_TIME = cREATE_TIME;
		SUO_CHECK_STATE = sUO_CHECK_STATE;
		YUAN_CHECK_STATE = yUAN_CHECK_STATE;
	}
	

	

}
