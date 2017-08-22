package com.t.service.impl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t.dao.AdminMapper;
import com.t.dao.ApplicationMapper;
import com.t.dao.UserMapper;
import com.t.entity.Admin;
import com.t.entity.Application;
import com.t.entity.User;
import com.t.service.IAdminService;
import com.t.service.IUserService;

/**
 * @author 0502  T  2017年8月22日
 */
@Service
public class UserServiceimpl implements IUserService{
	
	@Autowired
	private UserMapper userMapper;
	
	public User login(String name, String passowrd ) {
		
		User user =userMapper.selectByUsername(name);
		if (user != null && user.getPwd().equals(passowrd) ) {
			System.out.println("用户登陆成功");
			return user;
		} else {
			System.out.println("用户登陆失败");
			return null;
		}
	}

	public boolean check(String name) {
		User user =userMapper.selectByUsername(name);
		if (user != null){
			return false;
		} else{
			return true;
		}
		
		
	}

}
