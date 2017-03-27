package edu.usst.utils;

public class DataUtil {
	private static String  dbname=null;
	
	public static String getString(Object s){
		return s!=null?s.toString():null;
	}
	public static int getInt(Object s){
		return (s!=null&&!s.equals(""))?Integer.valueOf(s.toString()):0;
	}
	public static String getDbname() {
		return dbname;
	}
	public static void setDbname(String dbname) {
		DataUtil.dbname = dbname;
	}

}
