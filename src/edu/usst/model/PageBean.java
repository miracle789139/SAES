package edu.usst.model;

import java.util.List;
import java.util.Map;

public class PageBean {
	public static final int NUMPERPAGE = 10; // 每页多少条
	private int pNum; // 当前第几页
	private int totalPageNum; // 总页数
	private int totalRecordNum; // 总记录数，总数
	private List<Map<String, Object>> kyxxList; // 结果数据


	public static int getNumperpage() {
		return NUMPERPAGE;
	}

	public int getpNum() {
		return pNum;
	}

	public void setpNum(int pNum) {
		this.pNum = pNum;
	}

	public int getTotalPageNum() {
		return totalPageNum;
	}

	public void setTotalPageNum(int totalPageNum) {
		this.totalPageNum = totalPageNum;
	}

	public int getTotalRecordNum() {
		return totalRecordNum;
	}

	public void setTotalRecordNum(int totalRecordNum) {
		this.totalRecordNum = totalRecordNum;
	}

	public List<Map<String, Object>> getKyxxList() {
		return kyxxList;
	}

	public void setKyxxList(List<Map<String, Object>> kyxxList) {
		this.kyxxList = kyxxList;
	}


}