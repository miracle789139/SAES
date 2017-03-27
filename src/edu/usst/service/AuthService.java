package edu.usst.service;


import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.usst.dao.AuthDao;
import edu.usst.utils.MD5;
@Service
public class AuthService {

	/**
	 * 逻辑登录
	 * @param username
	 * @param password
	 * @return
	 */
	@Resource(name="authDao")
	private AuthDao authDao;

	public Map<String, Object> login(String userId,String password){
		
		Map<String, Object> user= authDao.getUser( userId,password);
		return user;
	}


}
