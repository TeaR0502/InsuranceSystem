package com.t.dao;

import com.t.entity.User;
/**
 * @author 0502  T  2017年8月22日
 */
public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    /**
     * 根据用户名查询用户
     * @param name
     * @return
     */
	User selectByUsername(String name);
}