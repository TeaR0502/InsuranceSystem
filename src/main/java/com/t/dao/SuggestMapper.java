package com.t.dao;

import com.t.entity.Suggest;
/**
 * @author 0502  T  2017��8��22��
 */
public interface SuggestMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Suggest record);

    int insertSelective(Suggest record);

    Suggest selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Suggest record);

    int updateByPrimaryKey(Suggest record);
}