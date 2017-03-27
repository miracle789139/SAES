package edu.usst.dao;

import org.springframework.stereotype.Repository;

import java.text.ParseException;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Repository
public class ScheduleDao extends AbstractBaseDao {

    List<Map<String, Object>> dataList = null;
    String sql = null;
    Object[] params = null;
    String[] colors = new String[]{"#360", "#f30", "#06c"};
    int flag = 0;

    /**
     * 获取日程列表，根据人ID
     *
     * @return
     */
    public List<Map<String, Object>> getList(String person_id) {
        sql = "select * from s_schedule s where s.person_id = ? ;";
        params = new Object[]{person_id};

        try {
            dataList = getJdbcTemplate().queryForList(sql, params);
            if (dataList != null && !dataList.isEmpty()) {
                return dataList;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    /**
     * 单个详情，用来在修改和拖拽时调用
     *
     * @param id
     * @return
     */
    public Map<String, Object> getItemByID(String id) {
        sql = "select * from s_schedule s where s.id = ?;";
        params = new Object[]{id};
        try {
            dataList = getJdbcTemplate().queryForList(sql, params);
            if (dataList != null && !dataList.isEmpty()) {
                return dataList.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


    public int add(String person_id, String event, String startdate, String s_hour, String s_minute, String enddate, String e_hour, String e_minute, String isend, String isallday) {
        sql = "INSERT INTO `s_schedule` (`person_id`, `title`, `starttime`, `endtime`, `allday`, `color`) VALUES (?,?,?,?,?,?);";

        String color = colors[((int) (Math.random() * 3))];
        String s_time = s_hour + ":" + s_minute + ":00";
        String e_time = e_hour + ":" + e_minute + ":00";
        String starttime = "";
        String endtime = "1970-01-01 08:00:00";

        //设置全天
        isallday = isallday == null ? "0" : "1";
        isend = isend == null ? "0" : "1";

        //拼凑时间
        if (isallday.equals("1") && isend.equals("1")) {//勾选了全天、结束时间
            starttime = startdate;
            endtime = enddate;
        } else if (isallday.equals("1") && isend.equals("0")) {
            starttime = startdate;
        } else if (isallday.equals("0") && isend.equals("1")) {//有具体结束时间
            starttime = startdate + " " + s_time;
            endtime = enddate + " " + e_time;
        } else {
            starttime = startdate + " " + s_time;
        }

        params = new Object[]{person_id, event, starttime, endtime, isallday, color};
        try {
            flag = getJdbcTemplate().update(sql, params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 编辑
     * @param id
     * @param person_id
     * @param event
     * @param startdate
     * @param s_hour
     * @param s_minute
     * @param enddate
     * @param e_hour
     * @param e_minute
     * @param isend
     * @param isallday
     * @return
     */
    public int edit(String id, String person_id, String event, String startdate, String s_hour, String s_minute, String enddate, String e_hour, String e_minute, String isend, String isallday) {
        sql = "update `s_schedule` set `title`=?,`starttime`=?,`endtime`=?,`allday`=? where `id`=? and `person_id`=?";

        String s_time = s_hour + ":" + s_minute + ":00";
        String e_time = e_hour + ":" + e_minute + ":00";
        String starttime = "";
        String endtime = "1970-01-01 08:00:00";

        //设置全天
        isallday = isallday == null ? "0" : "1";
        isend = isend == null ? "0" : "1";

        //拼凑时间
        if (isallday.equals("1") && isend.equals("1")) {//勾选了全天、结束时间
            starttime = startdate;
            endtime = enddate;
        } else if (isallday.equals("1") && isend.equals("0")) {
            starttime = startdate;
        } else if (isallday.equals("0") && isend.equals("1")) {//有具体结束时间
            starttime = startdate + " " + s_time;
            endtime = enddate + " " + e_time;
        } else {
            starttime = startdate + " " + s_time;
        }

        params = new Object[]{event, starttime, endtime, isallday, id, person_id};

        try {
            flag = getJdbcTemplate().update(sql, params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 删除
     * @param id
     * @return
     */
    public int del(String id) {
        sql = "delete from `s_schedule` where `id`=?";
        params = new Object[]{id};

        try {
            flag = getJdbcTemplate().update(sql, params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 拖拽
     * @param id
     * @param daydiff1
     * @param minudiff1
     * @param allday
     * @return
     */
    public int drag(String id, String daydiff1, String minudiff1, String allday) throws ParseException {

        //统计时间
        int daydiff = Integer.parseInt(daydiff1) * 24 * 60 * 60 * 1000;
        int minudiff = Integer.parseInt(minudiff1) * 60 * 1000;
        int difftime =   daydiff + minudiff;//不是全天时，使用

        //从数据库获取开始、结束时间
        Map<String, Object> item = getItemByID(id);
        Date endtime_db = (Date) item.get("endtime");
        Date starttime_db = (Date) item.get("starttime");

        //新的开始、结束时间，待插入数据库
        Date starttime = null;
        Date endtime = null;

        if (allday.equals("true")) {//全天，无时分
            starttime = new Date(starttime_db.getTime() + daydiff);
            if (endtime_db.getTime() == 0) {//无结束时间
                sql = "update `s_schedule` set starttime= ? where id=?;";
                params = new Object[]{starttime, id};
            } else {
                endtime = new Date(endtime_db.getTime() + daydiff);
                sql = "update `s_schedule` set starttime=?,endtime=?  where id=?";
                params = new Object[]{starttime, endtime, id};
            }
        } else {//不是全天，有时分
            starttime = new Date(starttime_db.getTime() + difftime);
            if (endtime_db.getTime() == 0) {
                sql = "update `s_schedule` set starttime=? where id=?";
                params = new Object[]{starttime, id};
            } else {
                endtime = new Date(endtime_db.getTime() + difftime);
                sql = "update `s_schedule` set starttime=?,endtime=? where id=?";
                params = new Object[]{starttime, endtime, id};
            }
        }
        flag = getJdbcTemplate().update(sql, params);

        try {
            flag = getJdbcTemplate().update(sql, params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 不管是不是全天，只管有无结束时间
     *
     * @param id
     * @param daydiff1
     * @param minudiff1
     * @return
     */
    public int resize(String id, String daydiff1, String minudiff1) {
        //统计时间
        int daydiff = Integer.parseInt(daydiff1) * 24 * 60 * 60*1000;
        int minudiff = Integer.parseInt(minudiff1) * 60*1000;
        int difftime = daydiff + minudiff;

        //从数据库获取开始、结束时间
        Map<String, Object> item = getItemByID(id);
        Date endtime_db = (Date) item.get("endtime");
        Date starttime_db = (Date) item.get("starttime");

        //新的开始、结束时间，待插入数据库
        Date starttime = new Date(starttime_db.getTime() + daydiff);
        Date endtime = null;

        if (endtime_db.getTime() == 0) {//无结束时间，则需要从开始时间算起
            endtime = new Date(starttime.getTime() + difftime);
            sql = "update `s_schedule` set endtime=? where id=?";
            params = new Object[]{endtime, id};
        } else {//已有结束时间则从结束时间算起
            endtime = new Date(endtime_db.getTime() + difftime);
            sql = "update `s_schedule` set endtime=? where id=?";
            params = new Object[]{endtime, id};
        }
        flag = getJdbcTemplate().update(sql, params);

        try {
            flag = getJdbcTemplate().update(sql, params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
