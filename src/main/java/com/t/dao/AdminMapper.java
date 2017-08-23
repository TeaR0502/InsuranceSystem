package com.t.dao;

import com.t.entity.Admin;
/**
 * @author 0502  T  2017年8月22日
 */
public interface AdminMapper {
	
	/**
	 * 根据用户名查找用户
	 * @param name
	 * @return
	 */
	Admin selectByUsername(String name);
	/**
     * 根据用户ID查找用户
     * @param id
     * @return
     */
    Admin selectByPrimaryKey(Long id);
	
    int deleteByPrimaryKey(Long id);

    int insert(Admin record);

    int insertSelective(Admin record);
    

    int updateByPrimaryKeySelective(Admin record);

    int updateByPrimaryKey(Admin record);
}