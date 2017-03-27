package edu.usst.action;

import edu.usst.dao.FileDao;
import edu.usst.model.PageBean;
import edu.usst.utils.DateUtils;
import edu.usst.utils.FileUtils;
import net.sf.json.JSONObject;
import org.apache.struts2.ServletActionContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.core.MediaType;
import java.io.*;
import java.net.URLEncoder;
import java.util.*;

/**
 * 下载专区，主要做文件管理
 * 从申请汇报模块参考而来
 * 没有审核，以后创建的按钮，做隐藏显示即可，就不做到后台去了
 */
public class FileAction {
    HttpServletRequest servletRequest = ServletActionContext.getRequest();//获取request参数
    HttpServletResponse servletResponse = ServletActionContext.getResponse();//返回json
    PrintWriter output = null;//打印流

    List<Map<String, Object>> lists = new ArrayList<Map<String, Object>>();//返回list
    Map<String, Object> item = new HashMap<String, Object>();//返回map
    PrintWriter out = null;//返回流
    String retString = "FAIL";//定义返回值
    int flag = 0;//dao的返回标记

    private File fileupload;

    Map<String, Object> user = (Map<String, Object>) servletRequest.getSession(true).getAttribute("userSession");
    String personId = user == null ? "8" : user.get("id").toString();
    String personName = user == null ? "刘靖" : user.get("name").toString();

    @Resource(name = "fileDao")
    private FileDao fileDao;

    /**
     * 首页的页面跳转
     *
     * @return
     */
    public String fileView() {
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
    public String fileEvent() {
        String action = servletRequest.getParameter("action");
        servletResponse.setContentType(MediaType.APPLICATION_JSON);
        servletResponse.setCharacterEncoding("UTF-8");
        try {
            if (!action.equals("add")) {//非才有id，去数据库取详情,查看和编辑
                String id = servletRequest.getParameter("id");
                item = fileDao.getItemByID(id);
            } else if (action.equals("add")) {//add，默认的要先加上去
                item.put("creator_name", personName);
                item.put("creator_id", personId);
                item.put("creator_time", DateUtils.datetime(new Date()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

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
            lists = fileDao.getListByPage(personId, getType, start, PageBean.NUMPERPAGE);
            bean.setKyxxList(lists);

            // 封装总记录条数
            int totalRecordNum = fileDao.findTotalRecordNum(personId, getType);
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
            item = fileDao.getItemByID(id);
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
     *
     * @return
     */
    public void fileDo() {
        HttpServletRequest servletRequest = ServletActionContext.getRequest();//获取request参数

        servletResponse.setContentType(MediaType.APPLICATION_JSON);
        servletResponse.setCharacterEncoding("UTF-8");
        String action = servletRequest.getParameter("action");

        //暂时没用
        String DOWNLOAD_TIMES = "0";
        String FILE_CLASS_ID = "0";
        String UNIT_ID = "0";
        String DELETEID = "0";
        String PUBLISH_DATE = "0";

        String creatorId = personId;
        String creatorName = personName;

        //前端获取
        String name = servletRequest.getParameter("name");
        String note = servletRequest.getParameter("note");
        String createTime = servletRequest.getParameter("createTime");
        String fileName = servletRequest.getParameter("fileName");
        String extraName = "";
        String filepath = "";

        if (fileupload != null) {
            String middle = "file/public/";
            String middlesave = "file\\public\\";
            extraName = fileName.substring(fileName.lastIndexOf(".")).toLowerCase();
//            fileName = fileName.substring(fileName.lastIndexOf("\\") + 1);//            现在不需要文件真名
            filepath = FileUtils.getFilepathSave(middle, middlesave, fileupload, extraName);
        }

        try {
            output = servletResponse.getWriter();
            if (action.equals("add")) {//添加
                flag = fileDao.addItem(name, note, creatorId, creatorName, createTime, filepath, extraName);
            } else if (action.equals("edit")) {//编辑
                String id = servletRequest.getParameter("id");
                flag = fileDao.updateItemByID(name, note, id, filepath, extraName);
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
     * //TODO
     * 下载的ajax
     */
    public void operateById() {

        try {
            //得到要下载的文件名
            String fileName = servletRequest.getParameter("fileName");  //23239283-92489-阿凡达.avi
            String id = servletRequest.getParameter("id");  //23239283-92489-阿凡达.avi
            Integer downloadTimes = Integer.valueOf(servletRequest.getParameter("downloadTimes"));  //23239283-92489-阿凡达.avi

            fileName = new String(fileName.getBytes("iso8859-1"), "UTF-8");
            //上传的文件都是保存在c:\temp目录下的子目录当中
            String fileSaveRootPath = FileUtils.FILEROOTPATH;
            //通过文件名找出文件的所在目录
            String path = FileUtils.FILEROOTPATH;

            //得到要下载的文件
            File file = new File(path + fileName);
            //如果文件不存在
            if (!file.exists()) {
                flag = 0;//否则，"您要下载的资源已被删除";
                servletResponse.setContentType(MediaType.APPLICATION_JSON);
                servletResponse.setCharacterEncoding("UTF-8");
                output = servletResponse.getWriter();
                output.println(flag);
                return;
            }

            //更新下载次数
            flag = fileDao.operateById(id, downloadTimes);

            //设置响应头，控制浏览器下载该文件
            servletResponse.setHeader("content-disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
            //读取要下载的文件，保存到文件输入流
            FileInputStream in = new FileInputStream(path + fileName);
            //创建输出流
            OutputStream out = servletResponse.getOutputStream();
            //创建缓冲区
            byte buffer[] = new byte[1024];
            int len = 0;
            //循环将输入流中的内容读取到缓冲区当中
            while ((len = in.read(buffer)) > 0) {
                //输出缓冲区的内容到浏览器，实现文件下载
                out.write(buffer, 0, len);
            }
            //关闭文件输入流
            in.close();
            //关闭输出流
            out.close();

        } catch (Exception e) {
            e.printStackTrace();
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
            flag = fileDao.deleteItemByID(delitems);
            output.println(flag);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            output.flush();
            output.close();
        }
    }

    public File getFileupload() {
        return fileupload;
    }

    public void setFileupload(File fileupload) {
        this.fileupload = fileupload;
    }
}
