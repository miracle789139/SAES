package edu.usst.utils;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import edu.usst.core.BusinessException;
import edu.usst.core.ErrorConstants;
import edu.usst.pojo.BaseResult;
import net.sf.json.JSONObject;

/**
 * Created by apple on 15-10-13.
 */
public class HthTools {
    private static Logger log = Logger.getLogger(HthTools.class);

    public static Map getHttpRequestParams(HttpServletRequest request, boolean isLog) {
        Map map = new HashMap();
        Enumeration paramNames = request.getParameterNames();
        while (paramNames.hasMoreElements()) {
            String paramName = (String) paramNames.nextElement();

            String[] paramValues = request.getParameterValues(paramName);
            if (paramValues.length == 1) {
                String paramValue = paramValues[0];
                //if (paramValue.length() != 0)
                {
                    map.put(paramName, paramValue);
                    log.info("======================HttpRequestParams(A)=========================");
                }
            }
        }

        if (isLog) {
            Set<Map.Entry<String, String>> set = map.entrySet();
            if (null != set) {
                log.info("======================HttpRequestParams(B)=========================");
                for (Map.Entry entry : set) {
                    log.info(entry.getKey() + ":" + entry.getValue());
                }
                log.info("======================HttpRequestParams(E)=========================");
            }
        }

        return map;
    }

    /**
     * 参数校验
     *
     * @param clazz
     * @param object
     * @param velidator: 待通过json定义实现spring框架的validator功能
     * @param <T>
     * @return
     */
    public static <T> T checkParam(Class<T> clazz, Object object, String velidator) {
        T ret = null;
        if (null != object) {
            try {
                if (clazz.getSimpleName().equals("Long")) {
                    ret = (T) new Long(Long.parseLong((String) object));
                } else if (clazz.getSimpleName().equals("Integer")) {
                    ret = (T) new Integer(Integer.parseInt((String) object));
                } else if (clazz.getSimpleName().equals("Double")) {
                    ret = (T) new Double(Double.parseDouble((String) object));
                } else {
                    ret = (T) object;
                }
            } catch (Exception e) {

            }
        } else {
            if (clazz.getSimpleName().equals("Long")) {
                ret = (T) new Long(0);
            } else if (clazz.getSimpleName().equals("Integer")) {
                ret = (T) new Integer(0);
            } else if (clazz.getSimpleName().equals("Double")) {
                ret = (T) new Double(0.0);
            } else {
                ret = (T) new String("");
            }
        }
        return ret;
    }

  

    public static String getExtensionName(String filename) {
        String ret = "hth";
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length() - 1))) {
                ret = filename.substring(dot + 1);
            }
        }
        return ret;
    }

    public static String getFileNameNoEx(String filename) {
        String ret = "";
        if ((filename != null) && (filename.length() > 0)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length()))) {
                ret = filename.substring(0, dot);
            }
        }
        return ret;
    }

    /* system properties to get separators */
    static final Properties PROPERTIES = new Properties(System.getProperties());

    /**
     * get line separator on current platform
     *
     * @return line separator
     */
    public static String getLineSeparator() {
        return PROPERTIES.getProperty("line.separator");
    }

    /**
     * get path separator on current platform
     *
     * @return path separator
     */
    public static String getPathSeparator() {
        return PROPERTIES.getProperty("path.separator");
    }

    public static Date str2Date(String dateStr, String formatter) {
        Date date = null;
        if (null != dateStr && !dateStr.isEmpty()) {
            if (null == formatter || formatter.isEmpty()) {
                formatter = "yyyy-MM-dd HH:mm:ss";
            }
            try {
                SimpleDateFormat sdf = new SimpleDateFormat(formatter);
                date = sdf.parse(dateStr);
            } catch (Exception e) {

            }
        }
        return date;
    }

    public static String date2Str(Date date, String formatter) {
        String dateStr = null;
        if (null != date) {
            if (null == formatter || formatter.isEmpty()) {
                formatter = "yyyy-MM-dd HH:mm:ss";
            }
            try {
                SimpleDateFormat sdf = new SimpleDateFormat(formatter);
                dateStr = sdf.format(date);
            } catch (Exception e) {

            }
        }
        return dateStr;
    }

    public static String timeStamp2Str(Object timestamp, String formatter) {
        String dateStr = null;
        if (null != timestamp && timestamp instanceof Timestamp) {
            if (null == formatter || formatter.isEmpty()) {
                formatter = "yyyy-MM-dd HH:mm:ss";
            }
            try {
                Date date = new Date(((Timestamp) timestamp).getTime());
                SimpleDateFormat sdf = new SimpleDateFormat(formatter);
                dateStr = sdf.format(date);
            } catch (Exception e) {

            }
        }
        return dateStr;
    }
    public static void httpResponseByType(BaseResult outData, String conType) throws IOException {
        httpResponseByType(ServletActionContext.getResponse(), outData, conType);
    }

    public static void httpResponseByType(HttpServletResponse servletResponse, BaseResult outData, String conType) throws IOException {
        if (null == conType) conType = MediaType.APPLICATION_JSON;
        servletResponse.setContentType(conType);
        servletResponse.setCharacterEncoding("UTF-8");
        PrintWriter out;
        if (null != outData) {
            out = servletResponse.getWriter();
            if (conType == MediaType.APPLICATION_JSON) {
                out.println(JSONObject.fromObject(outData)); //TODO: catch it to close io-stream!
            } else { //TODO: support other types!
                out.println(outData.toString());
            }
            out.flush();
            out.close();
        } else {
            throw new BusinessException(ErrorConstants.ERROR_UNKNOWN_EXCEPTION);
        }
    }
  
}