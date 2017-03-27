package edu.usst.model;

public class Paper {
	private String NAME;
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getPUBLISH_UNIT() {
		return PUBLISH_UNIT;
	}
	public void setPUBLISH_UNIT(String pUBLISHUNIT) {
		PUBLISH_UNIT = pUBLISHUNIT;
	}
	public String getFIRST_AUTHOR_NAME() {
		return FIRST_AUTHOR_NAME;
	}
	public void setFIRST_AUTHOR_NAME(String fIRSTAUTHORNAME) {
		FIRST_AUTHOR_NAME = fIRSTAUTHORNAME;
	}
	public String getOTHER_AUTHOR_NAME() {
		return OTHER_AUTHOR_NAME;
	}
	public void setOTHER_AUTHOR_NAME(String oTHERAUTHORNAME) {
		OTHER_AUTHOR_NAME = oTHERAUTHORNAME;
	}
	public String getPUBLISH_DATE() {
		return PUBLISH_DATE;
	}
	public void setPUBLISH_DATE(String pUBLISHDATE) {
		PUBLISH_DATE = pUBLISHDATE;
	}
	public String getWORD_NUMBER() {
		return WORD_NUMBER;
	}
	public void setWORD_NUMBER(String wORDNUMBER) {
		WORD_NUMBER = wORDNUMBER;
	}
	public String getCHECK_STATUS_ID() {
		return CHECK_STATUS_ID;
	}
	public void setCHECK_STATUS_ID(String cHECKSTATUSID) {
		CHECK_STATUS_ID = cHECKSTATUSID;
	}
	private String PUBLISH_UNIT;
	private String FIRST_AUTHOR_NAME;
	private String OTHER_AUTHOR_NAME;
	private String PUBLISH_DATE;
	private String WORD_NUMBER;
	private String CHECK_STATUS_ID;
	private String ID;
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
}
