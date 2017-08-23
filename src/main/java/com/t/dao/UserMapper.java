package com.t.dao;



import com.t.entity.User;

public interface UserMapper {
	
	/**
     * 根据用户ID查询用户
     * @param username
     * @return
     */
    User selectByPrimaryKey(Long userId);
    

    /**
     * 根据用户名查询用户
     * @param username
     * @return
     */
    User selectByUsername(String username);
    
    int insert(User record);

    int insertSelective(User record);
    
    int deleteByPrimaryKey(Long userId);
    
    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
}