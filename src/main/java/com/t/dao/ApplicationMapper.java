package com.t.dao;

import com.t.entity.Admin;
import com.t.entity.Application;
/**
 * @author 0502  T  2017Äê8ÔÂ22ÈÕ
 */
public interface ApplicationMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Application record);

    int insertSelective(Application record);

    Application selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Application record);

    int updateByPrimaryKey(Application record);

	Admin selectByUsername(String name);
}