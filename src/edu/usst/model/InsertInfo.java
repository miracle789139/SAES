package edu.usst.model;

import java.util.Date;

public class InsertInfo {
	private String applyId;
	private String applyName;
	private String projectLocation;
	private String projectClass;
	private String projectType;
	private String projectSourceUnit;
	private Integer applierID;
	private String applierName;
	private String sex;
	private String idCard;
	private String duty;
	private String title;
	private String researchField;
    private String school;
    private String email;
    private String adress;
    private String postalCode;
    private String mobile;
    private String telOffice;
    private String telHome;
    private Date date;
    private int SUO_CHECK_STATE;
	private int YUAN_CHECK_STATE;
    
    public InsertInfo() {
		// TODO Auto-generated constructor stub
	}
    
    
	


	public InsertInfo(String applyId, String applyName, String projectClass,
			String projectType, String projectSourceUnit, Integer applierID,
			String applierName, String sex, String idCard, String duty,
			String title, String researchField, String school, String email,
			String adress, String postalCode, String mobile, String telOffice,
			String telHome) {
		super();
		this.applyId = applyId;
		this.applyName = applyName;
		this.projectClass = projectClass;
		this.projectType = projectType;
		this.projectSourceUnit = projectSourceUnit;
		this.applierID = applierID;
		this.applierName = applierName;
		this.sex = sex;
		this.idCard = idCard;
		this.duty = duty;
		this.title = title;
		this.researchField = researchField;
		this.school = school;
		this.email = email;
		this.adress = adress;
		this.postalCode = postalCode;
		this.mobile = mobile;
		this.telOffice = telOffice;
		this.telHome = telHome;
	}





	public InsertInfo(String applyId, String applyName, String projectLocation,
			String projectClass, String projectType, String projectSourceUnit,
			Integer applierID, String applierName, String sex, String idCard,
			String duty, String title, String researchField, String school,
			String email, String adress, String postalCode, String mobile,
			String telOffice, String telHome, Date date, int sUO_CHECK_STATE,
			int yUAN_CHECK_STATE) {
		super();
		this.applyId = applyId;
		this.applyName = applyName;
		this.projectLocation = projectLocation;
		this.projectClass = projectClass;
		this.projectType = projectType;
		this.projectSourceUnit = projectSourceUnit;
		this.applierID = applierID;
		this.applierName = applierName;
		this.sex = sex;
		this.idCard = idCard;
		this.duty = duty;
		this.title = title;
		this.researchField = researchField;
		this.school = school;
		this.email = email;
		this.adress = adress;
		this.postalCode = postalCode;
		this.mobile = mobile;
		this.telOffice = telOffice;
		this.telHome = telHome;
		this.date = date;
		SUO_CHECK_STATE = sUO_CHECK_STATE;
		YUAN_CHECK_STATE = yUAN_CHECK_STATE;
	}

	
	
	

	public String getApplyId() {
		return applyId;
	}


	public void setApplyId(String applyId) {
		this.applyId = applyId;
	}





	public String getProjectLocation() {
		return projectLocation;
	}
	public void setProjectLocation(String projectLocation) {
		this.projectLocation = projectLocation;
	}
	public String getApplyName() {
		return applyName;
	}

	public void setApplyName(String applyName) {
		this.applyName = applyName;
	}
	

	public String getProjectSourceUnit() {
		return projectSourceUnit;
	}

	public void setProjectSourceUnit(String projectSourceUnit) {
		this.projectSourceUnit = projectSourceUnit;
	}

	public String getProjectClass() {
		return projectClass;
	}

	public void setProjectClass(String projectClass) {
		this.projectClass = projectClass;
	}

	public String getProjectType() {
		return projectType;
	}

	public void setProjectType(String projectType) {
		this.projectType = projectType;
	}

	public Integer getApplierID() {
		return applierID;
	}

	public void setApplierID(Integer applierID) {
		this.applierID = applierID;
	}

	public String getApplierName() {
		return applierName;
	}

	public void setApplierName(String applierName) {
		this.applierName = applierName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getIdCard() {
		return idCard;
	}

	public void setIdCard(String idCard) {
		this.idCard = idCard;
	}

	public String getDuty() {
		return duty;
	}

	public void setDuty(String duty) {
		this.duty = duty;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getResearchField() {
		return researchField;
	}

	public void setResearchField(String researchField) {
		this.researchField = researchField;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getTelOffice() {
		return telOffice;
	}

	public void setTelOffice(String telOffice) {
		this.telOffice = telOffice;
	}

	public String getTelHome() {
		return telHome;
	}

	public void setTelHome(String telHome) {
		this.telHome = telHome;
	}
	

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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
	@Override
	public String toString() {
		return "InsertInfo [applyId=" + applyId + ", applyName=" + applyName
				+ ", projectLocation=" + projectLocation + ", projectClass="
				+ projectClass + ", projectType=" + projectType
				+ ", projectSourceUnit=" + projectSourceUnit + ", applierID="
				+ applierID + ", applierName=" + applierName + ", sex=" + sex
				+ ", idCard=" + idCard + ", duty=" + duty + ", title=" + title
				+ ", researchField=" + researchField + ", school=" + school
				+ ", email=" + email + ", adress=" + adress + ", postalCode="
				+ postalCode + ", mobile=" + mobile + ", telOffice="
				+ telOffice + ", telHome=" + telHome + ", date=" + date
				+ ", SUO_CHECK_STATE=" + SUO_CHECK_STATE
				+ ", YUAN_CHECK_STATE=" + YUAN_CHECK_STATE + "]";
	}

}
