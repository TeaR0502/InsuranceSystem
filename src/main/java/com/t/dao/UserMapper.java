package com.t.dao;

import com.t.entity.User;
/**
 * @author 0502  T  2017��8��22��
 */
public interface UserMapper {
    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    /**
     * �����û�����ѯ�û�
     * @param name
     * @return
     */
	User selectByUsername(String name);
}