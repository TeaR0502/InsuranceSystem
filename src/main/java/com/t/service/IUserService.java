package com.t.service;


import com.t.entity.User;
/**
 * @author 0502  T  2017��8��23��
 */
public interface IUserService {
	User login(String name,String pwd);
	
	boolean register(User user);
	
	boolean updateUser(User user);
}
