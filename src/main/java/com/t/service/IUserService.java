package com.t.service;

import com.t.entity.User;

/**
 * @author 0502  T  2017Äê8ÔÂ22ÈÕ
 */
public interface IUserService {
	
	/**
	 * username check
	 * @param name
	 * @param passowrd
	 * @return
	 */
	boolean check(String name);
	/**
	 * user login 
	 * @param name
	 * @param passowrd
	 * @return
	 */
	User login(String name ,String passowrd);
}
