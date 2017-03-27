package edu.usst.action;

import edu.usst.dao.AskreportDao;
import edu.usst.dao.NotifyDao;
import edu.usst.model.PageBean;
import edu.usst.utils.DateUtils;
import edu.usst.utils.StringUtils;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.*;

/**
 * 申请汇报，会简单很多，因为没有涉及到发给所有人，关联表的操作
 * 这个模块从通知管理过来，person_id对应sender_id
 * 以后可不能做批量下载
 */
public class AskreportAction {
    HttpServletRequest servletRequest = ServletActionContext.getRequest();//获取request参数
    HttpServletResponse servletResponse = ServletActionContext.getResponse();//返回json
    PrintWriter output = null;//打印流

    List<Map<String, Object>> lists = null;//返回list
    Map<String, Object> item = new HashMap<String, Object>();
    PrintWriter out = null;//返回流
    String retString = "FAIL";//定义返回值
    int flag = 0;//dao的返回标记

    Map<String, Object> user = (Map<String, Object>) servletRequest.getSession(true).getAttribute("userSession");
    String personId = user == null ? "8" : user.get("id").toString();
    String personName = user == null ? "刘靖" : user.get("name").toString();

    @Resource(name = "askreportDao")
    private AskreportDao askreportDao;

    /**
     * 调取人员和单位
     */
    @Resource(name = "notifyDao")
    private NotifyDao notifyDao;

    /**
     * 首页的页面跳转
     *
     * @return
     */
    public String askreport() {
        servletRequest.setAttribute("personId", personId);
        retString = "SUCCESS";
        return retString;
    }

    /**
     * fancybox的页面跳转
     * 3种情况，add，edit，details
     *
     * @return
     */
    public String askreportEvent() {
        String action = servletRequest.getParameter("action");
        servletResponse.setContentType(MediaType.APPLICATION_JSON);
        servletResponse.setCharacterEncoding("UTF-8");
        try {
            if (!action.equals("add")) {//非才有id，去数据库取详情
                String id = servletRequest.getParameter("id");
                item = askreportDao.getItemByID(id);
            } else if (action.equals("add")) {//add
                item.put("sender_name", personName);
                item.put("sender_id", personId);
                item.put("send_date", DateUtils.datetime(new Date()));
                item.put("state", -1);//未提交
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        List<Map<String, Object>> unitLists = new ArrayList<Map<String, Object>>();
        unitLists = notifyDao.getUnitList();
        lists = notifyDao.getPersonAndUnitList();
        servletRequest.setAttribute("unitLists", unitLists);//所有单位
        servletRequest.setAttribute("personLists", lists);//所有人员
        servletRequest.setAttribute("action", action);//向页面发送数据信息
        servletRequest.setAttribute("item", item);//向页面发送数据信息

        retString = "SUCCESS";
        return retString;
    }

    /**
     * 列表，根据发送人来传送；获取导航的3种类型，见dao拼接的sql
     *
     * @return
     */
    public void getListByPage() throws IOException {
        servletResponse.setContentType(MediaType.APPLICATION_JSON);
        servletResponse.setCharacterEncoding("UTF-8");
        String getType = servletRequest.getParameter("getType");//根据类型的不同，当前登陆者分别是3种角色
        int pNum = Integer.parseInt(servletRequest.getParameter("pNum"));
        PageBean bean = new PageBean();

        try {
            output = servletResponse.getWriter();

            // 根据页码 和 每页条数 计算开始索引
            int start = (pNum - 1) * PageBean.NUMPERPAGE;//当前页仅仅用作计算区间而已
            bean.setpNum(pNum);

            // 调用DAO进行分页查询 --- 结果数据
            lists = askreportDao.getListByPage(personId, getType, start, PageBean.NUMPERPAGE);
            bean.setKyxxList(lists);

            // 封装总记录条数
            int totalRecordNum = askreportDao.findTotalRecordNum(personId, getType);
            bean.setTotalRecordNum(totalRecordNum);

            // 计算总页数
            int totalPageNum = (totalRecordNum + PageBean.NUMPERPAGE - 1) / PageBean.NUMPERPAGE;
            bean.setTotalPageNum(totalPageNum);

            output.println(JSONObject.fromObject(bean));//返回json
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            output.flush();
            output.close();
        }
    }

    /**
     * 获取详情
     *
     * @param id1
     * @return
     */
    public String getItemByID(String id1) {
        String id;
        id = id1.equals("") ? id1 : servletRequest.getParameter("id");//页面调用（不传参数）与函数调用

        try {
            item = askreportDao.getItemByID(id);
            retString = "SUCCESS";
        } catch (Exception e) {
            e.printStackTrace();
        }
        servletRequest.setAttribute("item", item);//向页面发送数据信息
        return retString;
    }

    /**
     * curd操作
     * null：SENDER_DP,ASK_DATE,ASKREPORT_CONTENT,,ACCEPT_DATE
     * 填0：STATE,DELETEID,IS_VIEW
     * @return
     */
    public void askreportDo() {
        servletResponse.setContentType(MediaType.APPLICATION_JSON);
        servletResponse.setCharacterEncoding("UTF-8");
        String action = servletRequest.getParameter("action");

        //暂时没用
        String SENDER_DP = "0";
        String ASK_DATE = "0";
        String ASKREPORT_CONTENT = "0";
        String ACCEPT_DATE = "0";
        String STATE = "0";
        String DELETEID = "0";
        String IS_VIEW = "0";

        String senderID = personId;
        String senderName = personName;

        //前端获取
        String title = servletRequest.getParameter("title");
        String content = servletRequest.getParameter("content");
        String sendDate = servletRequest.getParameter("sendDate");
        String recID = servletRequest.getParameter("recID");
        String recName = StringUtils.replaceBlank(servletRequest.getParameter("recName"));

        try {
            output = servletResponse.getWriter();
            if (action.equals("add")) {//添加
                flag = askreportDao.addItem(title, senderID, senderName, sendDate, content, recID, recName);
            } else if (action.equals("edit")) {//编辑
                String id = servletRequest.getParameter("id");
                flag = askreportDao.updateItemByID(title, content, recID, recName, id);
            }
            // no details dao act

            output.println(flag);//返回json
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            output.flush();
            output.close();
        }
    }

    /**
     * 审核，通过不通过
     */
    public void operateById() {
        servletResponse.setContentType(MediaType.APPLICATION_JSON);
        servletResponse.setCharacterEncoding("UTF-8");
        int ID = Integer.parseInt(servletRequest.getParameter("id"));
        int state = Integer.parseInt(servletRequest.getParameter("operate"));//1通过，2不通过
        try {
            flag = askreportDao.operateById(ID, personId, state);//当前人操作
            output = servletResponse.getWriter();
            output.println(flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            output.flush();
            output.close();
        }
    }

    /**
     * 删除
     */
    public void deleteItemByID() {
        servletResponse.setContentType(MediaType.APPLICATION_JSON);
        servletResponse.setCharacterEncoding("UTF-8");
        String delitems = servletRequest.getParameter("delitems");
        try {
            output = servletResponse.getWriter();
            flag = askreportDao.deleteItemByID(delitems);
            output.println(flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            output.flush();
            output.close();
        }
    }
}
