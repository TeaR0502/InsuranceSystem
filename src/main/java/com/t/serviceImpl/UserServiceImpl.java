package com.t.serviceImpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.t.dao.UserMapper;
import com.t.entity.User;
import com.t.service.IUserService;
/**
 * @author 0502  T  2017Äê8ÔÂ23ÈÕ
 */
@Service
public class UserServiceImpl implements IUserService{

	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private HttpSession session;
	
	public User login(String name, String pwd) {
		
		User user=userMapper.selectByUsername(name);
		if(user!=null){
			if(pwd.equals(user.getPwd())){
				session.setAttribute("user", user);
				return user;
			}
		}
		return null;
	}

	public boolean register(User newUser) {
		User user=userMapper.selectByUsername(newUser.getName());
		if(user!=null){
			return false;
		}
		int rows=userMapper.insert(newUser);
		if (rows > 0){
			session.setAttribute("user", user);
			return true;
		}
		return false;
	}

	public boolean updateUser(User user) {
		int rows=userMapper.updateByPrimaryKeySelective(user);
		return rows==1?true:false;
	}
	
}
