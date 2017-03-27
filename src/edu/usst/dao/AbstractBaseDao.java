package edu.usst.dao;

import org.springframework.jdbc.core.JdbcTemplate;

import javax.annotation.Resource;

/**
 * 
 * @author shadow
 * @email 124010356@qq.com
 * @create 2012.04.28
 * 
 * @param <T>
 */
public abstract class AbstractBaseDao{

	// SPRING JDBC模板接口
	private JdbcTemplate jdbcTemplate;

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	@Resource
	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}


}