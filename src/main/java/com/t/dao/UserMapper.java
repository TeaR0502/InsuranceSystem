package com.t.dao;



import com.t.entity.User;

public interface UserMapper {
	
	/**
     * �����û�ID��ѯ�û�
     * @param username
     * @return
     */
    User selectByPrimaryKey(Long userId);
    

    /**
     * �����û�����ѯ�û�
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