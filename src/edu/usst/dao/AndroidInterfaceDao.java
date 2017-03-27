package edu.usst.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class AndroidInterfaceDao extends AbstractBaseDao{

	public List<Map<String, Object>> getNoticeList(){
		String sql= "select id,title,sender_id,send_date,view_times,title_top_flag,notify_type from s_notify order by title_top_flag desc,send_date desc ";
		List<Map<String, Object>> noticeList= null;
		try {
			noticeList=getJdbcTemplate().queryForList(sql);
			if(noticeList!=null&&noticeList.size()>0){
				return noticeList;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	public Map<String, Object> getNoticeDetail(String noticeId){
		String sql= "select id,title,sender_id,send_date,view_times,title_top_flag,notify_type,content from s_notify where  id="+Integer.parseInt(noticeId);
		Map<String, Object> noticeDetail= null;
		try {
			noticeDetail=getJdbcTemplate().queryForMap(sql);
			if(noticeDetail!=null&&noticeDetail.size()>0){
				return noticeDetail;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	public List<Map<String, Object>> getAuditList(String userId) {
		// TODO Auto-generated method stub
		String sql= "select id,name,suo_check_state,yuan_check_state from s_project_apply_info where APPLIER_ID="+Integer.parseInt(userId)+" order by apply_date desc ";
		List<Map<String, Object>> noticeList= null;
		try {
			noticeList=getJdbcTemplate().queryForList(sql);
			if(noticeList!=null&&noticeList.size()>0){
				return noticeList;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public Map<String, Object> getAuditDetail(String auditId) {
		// TODO Auto-generated method stub
		String sql= "select id,name,project_location,subject_class_id,project_class,project_type,project_source_unit,begin_date,end_date,state,note,create_time,creator_id,creator_name,reviewstate,reviewstate_note,suo_check_state,suo_check_state_note,yuan_check_state,yuan_check_state_note,unit_id,division_id,applier_id,subject_id,apply_fee,apply_date,file_id,is_confirm,before_research_info,project_mode from s_project_apply_info where  id="+Integer.parseInt(auditId);
		/*
		String sql= "select id,name,project_class,project_type,create_time,suo_check_state,yuan_check_state,applier_id,apply_fee,apply_date from s_project_apply_info where  id="+Integer.parseInt(auditId);
		*/
		Map<String, Object> noticeDetail= null;
		try {
			noticeDetail=getJdbcTemplate().queryForMap(sql);
			if(noticeDetail!=null&&noticeDetail.size()>0){
				return noticeDetail;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

}
