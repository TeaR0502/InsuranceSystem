package com.t.service;

import com.t.entity.Admin;

/**
 * @author 0502  T  2017��8��22��
 */
public interface IAdminService {
	/**
	 * admin login 
	 * @param name
	 * @param passowrd
	 * @return
	 */
	Admin login(String name ,String passowrd);
}
