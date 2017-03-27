package edu.usst.utils;

/**
 * Created by lj on 2016-06-04.
 */

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtils {

    private static DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
    private static DateFormat format2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    private static DateFormat format3 = new SimpleDateFormat("yyyy-MM-dd HH:mm");


    /**
     * unix时间戳转换为dateFormat
     *
     * @param beginDate
     * @return
     */
    public static String timestampToDate(String beginDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String sd = sdf.format(new Date(Long.parseLong(beginDate)));
        return sd;
    }

    /**
     * 自定义格式时间戳转换
     *
     * @param beginDate
     * @return
     */
    public static String timestampToDate(String beginDate,String format) {
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        String sd = sdf.format(new Date(Long.parseLong(beginDate)));
        return sd;
    }

    /**
     * 将字符串转为时间戳
     *
     * @param user_time
     * @return
     */
    public static String dateToTimestamp(String user_time) {
        String re_time = null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
        Date d;
        try {
            d = sdf.parse(user_time);
            long l = d.getTime();
            String str = String.valueOf(l);
            re_time = str.substring(0, 10);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return re_time;
    }


    public static String formatDate(Date date) {
        if (date != null) {
            return format.format(date);
        }
        return "";
    }

    public static void date(Date date) {
        formatDate(date);
    }

    public static String datetime(Date date) {
        if  (date != null){
            return format2.format(date);
        }
        return "";
    }

    public static String datetime2(Date date) {
        if  (date != null){
            return format3.format(date);
        }
        return "";
    }

    public static String fullCalendar(Date date) {
        if (date != null){
            if (date instanceof Timestamp) {
                return format3.format(new Date(date.getTime()));
            }
            return format3.format(date);
        }
        return "";
    }

    public static Date parseDate(String date) throws ParseException {
        if  (date != null) {
            return format.parse(date);
        }
        return null;
    }

    /**
     * 解析成datetime
     * @param date
     * @return
     * @throws ParseException
     */
    public static Date parseDatetime(String date) throws ParseException {
        if  (date != null) {
            date = date.trim();
            if (date.length() <= 16) {//年月日
                return format3.parse(date);
            } else {
                return format2.parse(date);//时分秒
            }
        }
        return null;
    }


}
