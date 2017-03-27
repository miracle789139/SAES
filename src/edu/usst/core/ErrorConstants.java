package edu.usst.core;

import java.util.HashMap;
import java.util.Map;

public class ErrorConstants {

	private static Map<String,String> errorMsg;

	public static String getErrorDescByCode(String errorCode)
	{
		return errorMsg.get(errorCode);
	}

	public static String SUCCESS = "000000";//操作成功
	
	public static String MANAGE = "000002";//管理员

	public static String ERROR_GET_POSTDATA = "000001";	//获取数据失败

	public static String ERROR_INSERT_DATA = "000101";//数据插入失败

	public static String ERROR_SELECT_DATA = "000102";//数据查询失败
	
	public static String ERROR_UPDATE_DATA = "000103";//数据更新失败
	
	/************************************* 错误 代码 ******************************************/


	public static String ERROR_SMS_NO_NAME = "200001";// 短信参数无用户名
	public static String ERROR_SMS_NO_ORDER_ID = "200002";// 短信参数订单号
	public static String ERROR_SMS_NO_TELEPHONE = "200003";// 短信参数电话号码
	public static String ERROR_SMS_NO_URL = "200004";// 短信参数链接


	/************************************* 系统级错误 代码 ******************************************/
	public static String ERROR_IO_EXCEPTION = "300001";
	public static String ERROR_DB_PROC_CODE_IS_NULL = "300002"; //数据库操作代码为空
	public static String ERROR_JSON_PARSE_EXCEPTION  = "300003";  //JSON字符解析出错
    public static String ERROR_DB_PROC_EXCEPTION  = "300004";  //数据库操作失败
	public static String ERROR_URI_SYNTAX_EXCEPTION  = "300006";  //URL地址错误
    public static String ERROR_USER_UNLOGIN_EXCEPTION = "300007";
    public static String ERROR_FILE_IMPORT_EXCEPTION = "300008";
    public static String ERROR_SMS_SEND_FAIL = "300009";
    public static String ERROR_DGF_HG_PUSH_FAIL = "300010";
    public static String ERROR_DGF_HG_IS_PUSHED ="300011";

	public static String ERROR_UNKNOWN_EXCEPTION  = "300099";  //未知错误
	public static String ERROR_HTTP_REQUEST_EXCEPTION  = "300010";  //HTTP请求出错
	public static String ERROR_UNSUPPORTED_ENCODING_EXCEPTION ="300015"; //
	public static String ERROR_JAXB_EXCEPTION ="300020"; //
	public static String ERROR_ILLEGAL_ACCESS_EXCEPTION ="300025";
	public static String ERROR_INVOCATION_TARGET_EXCEPTION ="300030";
	public static String ERROR_NO_SUCH_METHOD_EXCEPTION = "300035";
	public static String ERROR_CLIENT_PROTOCOL_EXCEPTION ="300040";
	public static String ERROR_MALFORMED_URL_EXCEPTION = "300045";

    public static String MSG_ORDER_IS_APPROVED ="401001";
    public static String MSG_ORDER_IS_EDITED ="401002";

	
	static {
		errorMsg = new HashMap<String, String>();
		errorMsg.put(SUCCESS, 									"操作成功");
		errorMsg.put(ERROR_IO_EXCEPTION,						"输入输出错误");
		errorMsg.put(ERROR_DB_PROC_CODE_IS_NULL,				"数据库操作代码为空");
        errorMsg.put(ERROR_DB_PROC_EXCEPTION,				    "数据库操作失败");
		errorMsg.put(ERROR_JSON_PARSE_EXCEPTION,				"JSON字符解析出错");
		errorMsg.put(ERROR_URI_SYNTAX_EXCEPTION,				"URL地址错误");
        errorMsg.put(ERROR_USER_UNLOGIN_EXCEPTION,				"用户未登录");
        errorMsg.put(ERROR_FILE_IMPORT_EXCEPTION,				"文件导入失败");
        errorMsg.put(ERROR_SMS_SEND_FAIL,				        "短信发送失败");
        errorMsg.put(ERROR_DGF_HG_PUSH_FAIL,				    "海关推送失败");
        errorMsg.put(ERROR_DGF_HG_IS_PUSHED,				    "海关已推送");

		errorMsg.put(ERROR_UNKNOWN_EXCEPTION,					"未知错误");
		errorMsg.put(ERROR_HTTP_REQUEST_EXCEPTION,				"HTTP请求出错");
		errorMsg.put(ERROR_UNSUPPORTED_ENCODING_EXCEPTION,		"");
		errorMsg.put(ERROR_JAXB_EXCEPTION,						"字符串转换Java对象错误");
		errorMsg.put(ERROR_ILLEGAL_ACCESS_EXCEPTION,			"");
		errorMsg.put(ERROR_INVOCATION_TARGET_EXCEPTION,			"");
		errorMsg.put(ERROR_NO_SUCH_METHOD_EXCEPTION,			"请求参数错误");
		errorMsg.put(ERROR_CLIENT_PROTOCOL_EXCEPTION,			"");
		errorMsg.put(ERROR_MALFORMED_URL_EXCEPTION,				"");

        errorMsg.put(MSG_ORDER_IS_APPROVED,				        "订单已审核");
        errorMsg.put(MSG_ORDER_IS_EDITED,				        "订单已在编辑");
        
        
	}
}
