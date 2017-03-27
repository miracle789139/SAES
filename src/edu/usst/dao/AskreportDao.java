package edu.usst.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 有交互，需要逻辑复杂些；需要拉取未读，改变成已读
 */
@Repository
public class AskreportDao extends AbstractBaseDao {

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
        if (getType.equals("sender")) {
           /*发送人，优先级1，什么状态都有可能；带个参数决定吧，默认先这个*/
            sql = "select *  from s_askreport s where s.PERSON_ID = ? and s.DELETEID= 0  order by s.id  desc limit ?,?;";
        } else {//appro
            /*待审核人，优先级2，状态为0的*/
            sql = "select * from s_askreport s WHERE s.REC_ID = ? and s.STATE=0 and s.DELETEID=0 order by s.id desc limit ?,?;";
        }
        params = new Object[]{send_id, start, numberPage};
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
     * 单个详情
     *
     * @param ID
     * @return
     */
    public Map<String, Object> getItemByID(String ID) {
        sql = "select * from s_askreport s where s.ID = ?;";
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
     * 增加数据，变化model,sql,params就可以了
     * 除了主键，都要增加
     * 刚开始时，state是0
     * 下面字段先不管
     * null：SENDER_DP,ASK_DATE,ASKREPORT_CONTENT,,ACCEPT_DATE
     * 填0：STATE,DELETEID,IS_VIEW,FILE_ID
     * viewTimes, titleTopFlag, notifyType, fileId,
     */
    public int addItem(String title, String senderID, String senderName, String sendDate, String content, String recID, String recName) {
        sql = "INSERT INTO `s_askreport` ( `TITLE`, `PERSON_ID`, `SENDER_NAME`, `SEND_DATE`, `ASKREPORT_CONTENT`,`REC_ID`, `REC_NAME`) VALUES (?,?,?,?,?,?,?);;";
        params = new Object[]{title, senderID, senderName, sendDate, content,recID,recName};//示例数据，11,2,"李明明","2016-06-14 09:56:27","1212大苏打",8,'刘靖'
        try {

            flag = getJdbcTemplate().update(sql, params);
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
    public int updateItemByID(String title, String content, String recID, String recName,  String id) {
        sql = "update  s_askreport s  set  s.TITLE=?,s.ASKREPORT_CONTENT=?,s.REC_ID=?,s.REC_NAME=? WHERE s.ID = ?;";
        params = new Object[]{title, content, recID, recName, id};
        try {
            flag = getJdbcTemplate().update(sql, params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 审批，同意则更新状态和审核时间，进入待读状态
     * 同时未审批的做未读，可以用来拉取
     * 0是未审核，1是同意，2是不同意
     *
     * @return
     */
    public int operateById(int ID, String accept_id, int state) {
        sql = "update  s_askreport s set s.ACCEPT_DATE = NOW(),  s.STATE = ? WHERE s.REC_ID = ? and s.ID = ?;";
        params = new Object[]{state, accept_id, ID};
        try {
            flag = getJdbcTemplate().update(sql, params);
            //暂时不需要更新，通过的，搜索查看的，用sql结合通过即可
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
        sql = "update  s_askreport s set s.DELETEID = 1 WHERE s.id = ?;";
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

    /**
     * 计算记录数
     * @param send_id
     * @param getType
     * @return
     */
    public int findTotalRecordNum(String send_id, String getType) {
        if (getType.equals("sender")) {
           /*发送人，优先级1，什么状态都有可能；带个参数决定吧，默认先这个*/
            sql = "select count(*)  from s_askreport s where s.PERSON_ID = ? and s.DELETEID= 0";
        } else {//appro
            /*待审核人，优先级2，状态为0的*/
            sql = "select count(*) from s_askreport s WHERE s.REC_ID = ? and s.STATE=0 and s.DELETEID=0 ";
        }
        params = new Object[]{send_id};
        try {
            flag = getJdbcTemplate().queryForInt(sql, params);//条数
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}
