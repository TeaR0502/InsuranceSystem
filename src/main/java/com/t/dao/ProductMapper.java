package com.t.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.t.entity.Product;

public interface ProductMapper {
    int deleteByPrimaryKey(Long productId);
    
    /**
     * ����һ�ֱ���
     * @param record
     * @return
     */
    int insertSelective(Product record);

    /**
     * ͨ��ID����
     * @param productId
     * @return
     */
    Product selectByPrimaryKey(Long productId);
    
    /**
     * ͨ���ؼ��ּ��������ͼ���
     * @return
     */
    List<Product> search(@Param("type") String type,@Param("namelike") String namelike);

    int updateByPrimaryKeySelective(Product record);

    int updateByPrimaryKeyWithBLOBs(Product record);

    int updateByPrimaryKey(Product record);
}