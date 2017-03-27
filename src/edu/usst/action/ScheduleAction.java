package edu.usst.action;

import edu.usst.dao.ScheduleDao;
import edu.usst.model.Schedule;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import java.io.PrintWriter;
import java.util.*;

/**
 * 工作安排
 */
public class ScheduleAction {
    HttpServletRequest servletRequest = ServletActionContext.getRequest();//获取request参数
    HttpServletResponse servletResponse = ServletActionContext.getResponse();//返回json
    JSONObject jsonObject = new JSONObject();//Json流
    PrintWriter output = null;//打印流

    List<Map<String, Object>> lists = null;//返回list
    Map<String, Object> item = null;//返回map
    PrintWriter out = null;//返回流
    String retString = "FAIL";//定义返回值
    int flag = 0;//dao的返回标记

    Map<String, Object> user = (Map<String, Object>) servletRequest.getSession(true).getAttribute("userSession");
    String personId = user == null ? "8" : user.get("id").toString();
    String personName = user == null ? "刘靖" : user.get("name").toString();

    @Resource(name = "scheduleDao")
    private ScheduleDao scheduleDao;

    /**
     * 最初页面跳转
     *
     * @return
     */
    public String schedule() {
        retString = "SUCCESS";
        return retString;
    }

    /**
     * 初加载，获取数据
     *
     * @return json data
     */
    public void getList() {
        servletResponse.setContentType(MediaType.APPLICATION_JSON);
        servletResponse.setCharacterEncoding("UTF-8");
        List<Schedule> schedules = new ArrayList<Schedule>();

        try {
            output = servletResponse.getWriter();
            lists = scheduleDao.getList(personId);

            if (lists != null && !lists.isEmpty()) {
                for (Map<String, Object> item : lists) {
                    String id = item.get("id").toString();
                    String person_id1 = item.get("person_id").toString();
                    String title = item.get("title").toString();
                    String start = item.get("starttime").toString().substring(0, 16);
                    String end = item.get("endtime").toString().substring(0, 16);
                    Boolean allday = (Boolean) item.get("allday");//很关键
                    String color = item.get("color").toString();
                    String url = item.get("url").toString();
                    String type = item.get("type").toString();
                    String priority = item.get("priority").toString();
                    String status = item.get("status").toString();
                    Schedule schedule = new Schedule(id, person_id1, title, start, end, allday, color, url, type, priority, status);
                    schedules.add(schedule);
                }
            }
            output.println(JSONArray.fromObject(schedules));//返回json
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            output.flush();
            output.close();
        }
    }

    /**
     * 选择，拖拽，编辑等
     */
    public void scheduleDo() {
        String action = servletRequest.getParameter("action");

        servletResponse.setContentType(MediaType.APPLICATION_JSON);
        servletResponse.setCharacterEncoding("UTF-8");
        try {
            output = servletResponse.getWriter();
            if (action.equals("add")) {
                String event = servletRequest.getParameter("event");
                String startdate = servletRequest.getParameter("startdate");
                String s_hour = servletRequest.getParameter("s_hour");
                String s_minute = servletRequest.getParameter("s_minute");
                String enddate = servletRequest.getParameter("enddate");
                String e_hour = servletRequest.getParameter("e_hour");
                String e_minute = servletRequest.getParameter("e_minute");
                String isend = servletRequest.getParameter("isend");
                String isallday = servletRequest.getParameter("isallday");
                flag = scheduleDao.add(personId, event, startdate, s_hour, s_minute, enddate, e_hour, e_minute, isend, isallday);
            } else if (action.equals("edit")) {
                String id = servletRequest.getParameter("id");
                String event = servletRequest.getParameter("event");
                String startdate = servletRequest.getParameter("startdate");
                String s_hour = servletRequest.getParameter("s_hour");
                String s_minute = servletRequest.getParameter("s_minute");
                String enddate = servletRequest.getParameter("enddate");
                String e_hour = servletRequest.getParameter("e_hour");
                String e_minute = servletRequest.getParameter("e_minute");
                String isend = servletRequest.getParameter("isend");
                String isallday = servletRequest.getParameter("isallday");
                flag = scheduleDao.edit(id, personId, event, startdate, s_hour, s_minute, enddate, e_hour, e_minute, isend, isallday);//相比add，多了个id
            } else if (action.equals("del")) {
                String id = servletRequest.getParameter("id");
                flag = scheduleDao.del(id);
            } else if (action.equals("drag")) {
                String id = servletRequest.getParameter("id");
                String daydiff = servletRequest.getParameter("daydiff");
                String minudiff = servletRequest.getParameter("minudiff");
                String allday = servletRequest.getParameter("allday");
                flag = scheduleDao.drag(id, daydiff, minudiff, allday);
            } else if (action.equals("resize")) {
                String id = servletRequest.getParameter("id");
                String daydiff = servletRequest.getParameter("daydiff");
                String minudiff = servletRequest.getParameter("minudiff");
                flag = scheduleDao.resize(id, daydiff, minudiff);
            }
            output.println(flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            output.flush();
            output.close();
        }
    }

    /**
     * 添加和编辑的页面,返回跳转动作
     *
     * @return
     */
    public String scheduleEvent() {
        String action = servletRequest.getParameter("action");
        item = new HashMap<String, Object>();

        //如果是添加
        if (action.equals("add")) {
            String date = servletRequest.getParameter("date");
            String enddate = servletRequest.getParameter("end");
            String display;
            String chk;
            if (date.equals(enddate)) enddate = "";
            if (enddate == "") {
                display = "style=\"display:none\"";
                enddate = date;
                chk = "";
            } else {
                display = "style=\"\"";
                chk = "checked";
            }
            enddate = enddate == "" ? date : enddate;
            item.put("date", date);
            item.put("enddate", enddate);
            item.put("display", display);
            item.put("chk", chk);
            servletRequest.setAttribute("action", "add");

        } else if (action.equals("edit")) {        //如果是编辑
            String id = servletRequest.getParameter("id");
            String display;
            String chk;
            item = scheduleDao.getItemByID(id);
            String starttime = item.get("starttime").toString();
            String endtime = item.get("endtime").toString();
            Date endtime_Date = (Date)item.get("endtime");
            Boolean allday = (Boolean) item.get("allday");

            item.put("start_d", starttime.substring(0, 10));
            item.put("start_h", starttime.substring(10, 13));
            item.put("start_m", starttime.substring(14, 16));

            //是否有结束时间，TODO 要看true false
            if (endtime_Date.getTime() == 0) {//无结束时间，则收起来
                item.put("end_d", starttime.substring(0, 10));
                item.put("end_h", "00");//小时
                item.put("end_m", "00");//分钟
                item.put("end_chk", "\'\'");
                item.put("end_display", "style=\'display:none\'");
            } else {
                item.put("end_d", endtime.substring(0, 10));//结束时间
                item.put("end_h", endtime.substring(10, 13));//小时
                item.put("end_m", endtime.substring(14, 16));//分钟
                item.put("end_chk", "checked");//结束时间
                item.put("end_display", "style=\'\'");//结束时间
            }

            //是否是全天
            if (allday) {//是则收起天数
                item.put("display", "style=\'display:none\'");
                item.put("allday_chk", "checked");
            } else {
                item.put("display", "style=\'\'");
                item.put("allday_chk", "\'\'");
            }
            servletRequest.setAttribute("action", "edit");//add
        }

        servletRequest.setAttribute("item", item);//向页面发送数据信息
        retString = "SUCCESS";
        return retString;
    }
}
