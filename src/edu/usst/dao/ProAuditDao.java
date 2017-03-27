package edu.usst.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 有审批，需要逻辑复杂些；需要拉取未读，改变成已读
 */
@Repository
public class ProAuditDao extends AbstractBaseDao {

    List<Map<String, Object>> dataList = null;
    String sql = null;
    Object[] params = null;
    int flag = 0;

    /**
     * 发送人查看自己的列表
     * 还包括发送出来，还有待审核的
     *
     * @param send_id
     * @return
     */
    public List<Map<String, Object>> getListByPage(String send_id, String getType, int start, int numberPage) {
        if (getType.equals("all")) {
            /*部门领导（处长）的已审核项目判断*/
        	sql=" select * from s_project_basic_info where SUO_CHECK_STATE=1 and YUAN_CHECK_STATE=1 and IF_DELETE=0 order by CREATE_TIME desc limit ?,?;";
//            sql = "select a.* from s_notify a left join s_notify_view_info b on a.id = b.NOTIFY_ID where b.rec_id = ? and a.DELETEID=0 and a.STATE = 1 order by a.id desc limit ?,?;";
        } else if (getType.equals("sender")) {
           /*发送人，优先级1，什么状态都有可能；带个参数决定吧，默认先这个*/
            sql = "select * from s_project_basic_info where SUO_CHECK_STATE=0 and YUAN_CHECK_STATE=0 and IF_DELETE=0 order by CREATE_TIME desc limit ?,?;";
        } else {//appro
            /*待审核人，优先级2，状态为0的*/
            sql = "select * from s_notify s WHERE s.APPROVAL_ID = ? and s.STATE=0 and s.DELETEID=0 order by s.id desc limit ?,?;";
        }
        params = new Object[]{start, numberPage};
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
     * 还是有有必要的
     * 用来刚插入后得到id，插入关联表
     * IS_VIEW是1未查看的，（可选，并且state是1同意的）；并且未遭到删除的,0
     * @return
     */
    public Map<String, Object> getLastItem() {
        sql = "select * from s_notify s order by s.id desc limit 1; ";
        try {
            dataList = getJdbcTemplate().queryForList(sql);
            if (dataList != null && !dataList.isEmpty()) {
                return dataList.get(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 单个详情
     * @param ID
     * @return
     */
    public Map<String, Object> getItemByID(String ID) {
        sql = "select * from s_notify s where s.ID = ?;";
        params = new Object[]{ID};
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

    /**
     * 获取发送人员的名单
     *
     * @returns_
     */
    public List<Map<String, Object>> getNotifyInfoListByID(String id) {
        sql = "select * from s_notify_view_info s where s.NOTIFY_ID = ?;";
        params = new Object[]{id};
        try {
            dataList = getJdbcTemplate().queryForList(sql, params);
            if (dataList != null && !dataList.isEmpty()) {
                return dataList;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataList;
    }

    /**
     * 增加数据，变化model,sql,params就可以了
     * 除了主键，都要增加
     * 刚开始时，state是0
     * viewTimes, titleTopFlag, notifyType, fileId,字段先不要
     *
     * @return
     */
    public int addItem(String title, String senderID, String senderName, String sendDate, String content, String viewTimes, String titleTopFlag, String notifyType, String fileId, String approvalID, String approvalName, String state, String recID, String recName) {
        sql = "INSERT INTO `s_notify` ( `TITLE`, `SENDER_ID`, `SENDER_NAME`, `SEND_DATE`, `CONTENT`, `VIEW_TIMES`, `TITLE_TOP_FLAG`, `NOTIFY_TYPE`, `FILE_ID`, `APPROVAL_ID`, `DELETEID`, `APPROVAL_NAME`, `STATE`) VALUES (?,?,?,?,?,?,?,?,?,?,0,?,?);";
        params = new Object[]{title, senderID, senderName, sendDate, content, viewTimes, titleTopFlag, notifyType, fileId, approvalID, approvalName, state};
        Integer infoFlag = 0;
        int lastNotifyId;
        try {
            flag = getJdbcTemplate().update(sql, params);
            lastNotifyId = (Integer) getLastItem().get("id");
            if (lastNotifyId > 0) {
                String sql1 = "INSERT INTO `s_notify_view_info` (`REC_ID`, `REC_NAME`,`NOTIFY_ID`, `IS_VIEW`) VALUES (?,?,?, 0);";
                String[] rId = recID.split(",");
                String[] rName = recName.split(",");
                int lenth = rId.length;
                for (int i = 0; i < lenth; i++) {
                    params = new Object[]{rId[i], rName[i], lastNotifyId};
                    infoFlag = getJdbcTemplate().update(sql1, params);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 个人修改
     * 如果已经审批过，则需要改变状态，再审批
     * 2个sql
     * 还要去关键表现删除旧的，生成新的
     *
     * @return
     */
    public int updateItemByID(String title, String content, String approvalID, String approvalName, String state, String id, String recID, String recName) {
        int infoFlag;
        sql = "update  s_notify s  set  s.TITLE=?,s.CONTENT=?,s.APPROVAL_ID=?,s.APPROVAL_NAME=?,s.STATE=? WHERE s.ID = ?;";
        params = new Object[]{title, content, approvalID, approvalName, state, id};
        try {
            flag = getJdbcTemplate().update(sql, params);
            if (state.equals("0")) {//等待审核时才可以修改
                //先删除，再重新插入
                String sql2 = "delete from s_notify_view_info where NOTIFY_ID=?;";
                params = new Object[]{id};
                infoFlag = getJdbcTemplate().update(sql2, params);

                String sql1 = "INSERT INTO `s_notify_view_info` (`REC_ID`, `REC_NAME`,`NOTIFY_ID`, `IS_VIEW`) VALUES (?,?,?, 0);";
                String[] rId = recID.split(",");
                String[] rName = recName.split(",");
                int lenth = rId.length;
                for (int i = 0; i < lenth; i++) {
                    params = new Object[]{rId[i], rName[i], id};
                    infoFlag = getJdbcTemplate().update(sql1, params);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 审批，同意则更新状态和审核时间，进入待读状态
     * 其他人待读的，结合状态查询,sql结合即可
     * 0是未审核，1是同意，2是不同意
     * @return
     */
    public int operateById(int ID, String approval_id, int state) {
        sql = "update  s_notify s set s.APPROVAL_TIME = NOW(),  s.STATE = ? WHERE s.APPROVAL_ID = ? and s.ID = ?;";
        params = new Object[]{state, approval_id, ID};
        try {
            flag = getJdbcTemplate().update(sql, params);
            //暂时不需要更新，通过的，搜索查看的，用sql结合通过即可

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 读完后，设置为已读
     * IS_VIEW已读是1
     */
    public int updateItemByNotifyIDWithIsView(String notify_id, String is_view) {
        sql = "update  s_notify_view_info s set s.VIEW_DATE = NOW(),  s.IS_VIEW = ? WHERE s.NOTIFY_ID = ?;;";
        params = new Object[]{is_view, notify_id};
        try {
            flag = getJdbcTemplate().update(sql, params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 更新阅读次数
     * 顺带把是否读，一起判断，更新
     * @return
     */
    public int updateItemByIDWithIsViewAndViewTimes(String ID, String personId) {
        Integer count = 0;
        Integer state;

        try {
            //查询更新条数
            params = new Object[]{ID};
            Map<String, Object> item = getItemByID(ID);
            state = (Integer) item.get("STATE");
            if (state != 1) {//不是审核通过，不更新阅读次数，不设置已读
                return 0;
            }

            //更新条数
            count = (Integer) item.get("VIEW_TIMES");
            sql = "update s_notify s set s.VIEW_TIMES = " + (count + 1) + "  WHERE s.ID = ?; ";
            flag = getJdbcTemplate().update(sql, params);

            //顺带，一起查询是否读过，没读则设置为已读
            String sql1 = "select s.IS_VIEW from s_notify_view_info s where s.NOTIFY_ID = ? and s.REC_ID = ? order by s.id desc limit 1;";
            params = new Object[]{ID, personId};

            flag = getJdbcTemplate().queryForInt(sql1, params);

            if (flag == 0) {
                flag = updateItemByNotifyIDWithIsView(ID, "1");//设为已读
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 还需要删除关联的表
     * 先不删除，某天又要回来，修改deleteid就可以了
     */
    public int deleteItemByID(String items) {
        sql = "update  s_notify s set s.DELETEID = 1 WHERE s.id = ?;";
        String[] item = items.split(",");
        try {
            for (int i = 0; i < item.length; i++) {//批量删除
                params = new Object[]{Integer.parseInt(item[i])};
                flag = getJdbcTemplate().update(sql, params);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    public int findTotalRecordNum(String send_id, String getType) {
        if (getType.equals("all")) {
            /*已审核的数目*/
            sql = "select count(*) from s_project_basic_info where SUO_CHECK_STATE=1 and YUAN_CHECK_STATE=1 and IF_DELETE=0";
        } else if (getType.equals("sender")) {
           /*发送人，优先级1，什么状态都有可能；带个参数决定吧，默认先这个*/
            sql = "select count(*)  from s_project_basic_info where SUO_CHECK_STATE=0 and YUAN_CHECK_STATE=0 and IF_DELETE=0";
        } else {//appro
            /*待审核人，优先级2，状态为0的*/
            sql = "select count(*) from s_notify s WHERE s.APPROVAL_ID = ? and s.STATE=0 and s.DELETEID=0 ";
        }
        params = new Object[]{send_id};
        try {
            flag = getJdbcTemplate().queryForInt(sql);//条数
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 不该出现在这里的类
     * 获取用户和单位部门名
     * 多个unit_id,unit_name
     *
     * @return
     */
    public List<Map<String, Object>> getPersonAndUnitList() {
        sql = "select s.*,u.ID as unit_id,u.NAME as unit_name from s_person s left join s_unit u on s.UNIT_ID=u.ID order by u.unit_id asc;";
        try {
            dataList = getJdbcTemplate().queryForList(sql);
            if (dataList != null && !dataList.isEmpty()) {
                return dataList;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataList;
    }

    /**
     * 不该出现在这里的方法
     * 获取用户和单位部门名
     * 多个unit_id,unit_name
     *
     * @return
     */
    public List<Map<String, Object>> getUnitList() {
        sql = "select * from s_unit u order by u.id asc;";
        try {
            dataList = getJdbcTemplate().queryForList(sql);
            if (dataList != null && !dataList.isEmpty()) {
                return dataList;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dataList;
    }

}
