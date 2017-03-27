package edu.usst.model;

public class Magazine {
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getLEVEL() {
		return LEVEL;
	}
	public void setLEVEL(String lEVEL) {
		LEVEL = lEVEL;
	}
	public String getISSN() {
		return ISSN;
	}
	public void setISSN(String iSSN) {
		ISSN = iSSN;
	}
	public String getCN() {
		return CN;
	}
	public void setCN(String cN) {
		CN = cN;
	}
	public String getPAPER_TYPE_ID() {
		return PAPER_TYPE_ID;
	}
	public void setPAPER_TYPE_ID(String pAPERTYPEID) {
		PAPER_TYPE_ID = pAPERTYPEID;
	}
	private String ID;
	private String NAME;
	private String LEVEL;
	private String ISSN;
	private String CN;
	private String PAPER_TYPE_ID;
}
