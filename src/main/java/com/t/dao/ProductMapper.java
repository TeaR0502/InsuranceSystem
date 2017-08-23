package com.t.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.t.entity.Product;

public interface ProductMapper {
    int deleteByPrimaryKey(Long productId);
    
    /**
     * 增加一种保险
     * @param record
     * @return
     */
    int insertSelective(Product record);

    /**
     * 通过ID检索
     * @param productId
     * @return
     */
    Product selectByPrimaryKey(Long productId);
    
    /**
     * 通过关键字检索和类型检索
     * @return
     */
    List<Product> search(@Param("type") String type,@Param("namelike") String namelike);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKeyWithBLOBs(Product record);

    int updateByPrimaryKey(Product record);
}