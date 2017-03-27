package edu.usst.utils;

public class Page {
	private Long sPAGE_NO;
	private Long sREC_NUM;
	private Integer totalCount;

    public static long DEF_REC_NUM = 10;

    public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Page(Long sPAGE_NO,Long sREC_NUM)
	{
		this.sPAGE_NO = sPAGE_NO;
		this.sREC_NUM = sREC_NUM;
	}
	public Long getsPAGE_NO() {
		return sPAGE_NO;
	}
	public void setsPAGE_NO(Long sPAGE_NO) {
		this.sPAGE_NO = sPAGE_NO;
	}
	public Long getsREC_NUM() {
		return sREC_NUM;
	}
	public void setsREC_NUM(Long sREC_NUM) {
		this.sREC_NUM = sREC_NUM;
	}
	
}
