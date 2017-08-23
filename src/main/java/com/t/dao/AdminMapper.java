package com.t.dao;

import com.t.entity.Admin;
/**
 * @author 0502  T  2017��8��22��
 */
public interface AdminMapper {
	
	/**
	 * �����û��������û�
	 * @param name
	 * @return
	 */
	Admin selectByUsername(String name);
	/**
     * �����û�ID�����û�
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