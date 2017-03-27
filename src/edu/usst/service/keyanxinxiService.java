package edu.usst.service;

import edu.usst.dao.keyanxinxiDAO;
import edu.usst.model.PageBean;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;
@Service
public class keyanxinxiService {
	@Resource(name="keyanxinxiDAO")
	private keyanxinxiDAO keyanxinxiDAO;
	public static final int NUMPERPAGE = 10;
	public PageBean querykyxx(String biaoname, int pNum, String isread) {
		// 根据页码 和 每页条数 计算开始索引
		int start = (pNum - 1) * NUMPERPAGE;
		PageBean bean = new PageBean();
		// 封装当前页码
		bean.setpNum(pNum);

		// 调用DAO进行分页查询 --- 结果数据

		List<Map<String, Object>> kyxx = keyanxinxiDAO.findByPage(biaoname,start,
				PageBean.NUMPERPAGE,isread);
		bean.setKyxxList(kyxx);

		// 封装总记录条数
		int totalRecordNum = keyanxinxiDAO.findTotalRecordNum(biaoname,isread);
		bean.setTotalRecordNum(totalRecordNum);

		// 计算总页数
		int totalPageNum = (totalRecordNum + PageBean.NUMPERPAGE - 1)
				/ PageBean.NUMPERPAGE;
		bean.setTotalPageNum(totalPageNum);

		return bean;
	}
	public Map<String, Object> querykyxxxq(String biaoname, int parseInt) {

		return	keyanxinxiDAO.findByid(biaoname,parseInt);

	}
}


