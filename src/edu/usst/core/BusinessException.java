package edu.usst.core;

import edu.usst.pojo.BaseResult;

public class BusinessException extends RuntimeException{
	
	/* ************************************************************
	 * 
	 * 系统消息处理
	 * 
	 * ************************************************************/
	private static final long serialVersionUID = 2618286650932026402L;
	
	private BaseResult br = new BaseResult();
	public BusinessException(String code, Exception e) {
		this.br.setReturnCode(code);
		this.br.setReturnDescipt(e.getMessage());
	}
	
	public BusinessException(String errorCode,String Descript) {
		this.br.setReturnCode(errorCode);
		this.br.setReturnDescipt(Descript);
	}
	
	public BusinessException(String errorCode) {
		this.br.setReturnCode(errorCode);
		this.br.setReturnDescipt(ErrorConstants.getErrorDescByCode(errorCode));
	}
	
	public BaseResult getBr() {
		return br;
	}
	public void setBr(BaseResult br) {
		this.br = br;
	}
	@Override
	public String toString() {
		return "BusinessException [ReturnCode=" + br.getReturnCode() + " ReturnDescipt=" + br.getReturnDescipt() + "]";
	}
	
}
