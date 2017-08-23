package com.t.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.t.entity.UserProduct;

public interface UserProductMapper {
    int deleteByPrimaryKey(Long userProductId);

    int insert(UserProduct record);

    int insertSelective(UserProduct record);

    UserProduct selectByPrimaryKey(Long userProductId);

    int updateByPrimaryKeySelective(UserProduct record);

    int updateByPrimaryKey(UserProduct record);
    
    @Select("SELECT count(userid) FROM user_product WHERE productid=#{id}")
    int countUser(int id);
    
    @Select("SELECT id, userid, username, productid, productname, createtime, state FROM user_product WHERE userid=#{userId}")
    List<UserProduct> selectByUserId(int userId);
    
    @Delete("delete from user_product where userid=#{uid} AND productid=#{pid}")
    int deleteUP(@Param("uid") int userId,@Param("pid") int productId);
}