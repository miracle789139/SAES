package edu.usst.dao;

import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 下载dao
 */
@Repository
public class FileDao extends AbstractBaseDao {

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
           /*发送人，优先级1，什么状态都有可能；带个参数决定吧，默认先这个*/
            sql = "select *  from s_file s where s.DELETEID= 0  order by s.id  desc limit ?,?;";
            params = new Object[]{start, numberPage};
        } else {//自己建立的列表，加人id
            /*待审核人，优先级2，状态为0的*/
            sql = "select * from s_file s WHERE s.creator_Id = ? and s.DELETEID=0 order by s.id desc limit ?,?;";
            params = new Object[]{send_id, start, numberPage};
        }
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
        sql = "select * from s_file s where s.ID = ? order by s.id desc limit 1;";
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
     * 标题 name
     * 附件上传 fileId
     * 备注 note
     * 创建人 creatorName
     * 创建人 creatorId
     * 创建时间 createTime
     * <p/>
     * 刚开始时，state是0
     * 下面字段先不管
     * DOWNLOAD_TIMES ，fileId，FILE_CLASS_ID，UNIT_ID，DELETEID，PUBLISH_DATE(更新的时候显示）
     */
    public int addItem(String name, String note, String creatorId, String creatorName, String createTime, String filepath, String extraName) {
        sql = "INSERT INTO `s_file` (`NAME`,`NOTE`, `CREATOR_ID`, `CREATOR_NAME`, `CREATE_TIME`,`PUBLISH_DATE`,`FILE_ID`,`EXTRA_NAME`) VALUES (?,?,?,?,?,?,?,?);";
        params = new Object[]{name, note, creatorId, creatorName, createTime, createTime, filepath, extraName};//示例数据，11,2,"李明明","2016-06-14 09:56:27","1212大苏打",8,'刘靖';修改时间也为创建时间
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
    public int updateItemByID(String name, String note, String ID, String filepath, String extraName) {
        sql = "update  s_file s  set  s.name=?,s.note=?,s.PUBLISH_DATE=?,s.FILE_ID=?,s.EXTRA_NAME=? WHERE s.ID = ?;";
        params = new Object[]{name, note, new Date(), filepath, extraName, ID};
        try {
            flag = getJdbcTemplate().update(sql, params);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

    /**
     * 原来0是未审核，1是同意，2是不同意；现在增加，3是下载
     * 现在用来 更新下次次数
     *
     */
    public int operateById(String ID, Integer downloadTimes) {
        //先拿到当前次数，这样做不严谨，应该到数据库去取出最新条数再做修改
        sql = "update  s_file  set  DOWNLOAD_TIMES= " + (downloadTimes + 1) + " WHERE ID = ?;";
        params = new Object[]{ID};
        try {
            flag = getJdbcTemplate().update(sql,params);
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
        sql = "update  s_file s set s.DELETEID = 1 WHERE s.id = ?;";
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
     *
     * @param send_id
     * @param getType
     * @return
     */
    public int findTotalRecordNum(String send_id, String getType) {
        if (getType.equals("all")) {//所有的
            sql = "select count(*)  from s_file s where s.DELETEID= 0";
        } else {//自己创建的
            sql = "select count(*) from s_file s WHERE s.creator_id = ?  and s.DELETEID=0 ";
            params = new Object[]{send_id};
        }
        try {
            if (getType.equals("all")) {//所有的
                flag = getJdbcTemplate().queryForInt(sql);//条数
            } else {//自己创建的
                flag = getJdbcTemplate().queryForInt(sql, params);//条数
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
