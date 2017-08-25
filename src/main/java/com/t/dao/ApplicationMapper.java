package com.t.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.t.entity.Admin;
import com.t.entity.Application;
/**
 * @author 0502  T  2017年8月22日
 */
public interface ApplicationMapper {
	
	/**
	 * 根据主键删除订单
	 * @param id
	 * @return
	 */
	int deleteByPrimaryKey(Long id);
	
	/**
	 * 更新用户订单
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(Application record);
	
	/**
	 * 根据主键查询用户申请
	 * @param id
	 * @return
	 */
	Application selectByPrimaryKey(Long id);
	 /**
     * 用户提交申请
     * @param record
     * @return
     */
    int insertSelective(Application record);
	/**
	 * 查询符合条件的用户申请
	 * @param date1
	 * @param date2
	 * @param userid
	 * @return
	 */
	List<Application> selectByUserId(@Param(value = "data1") Date date1,@Param(value = "data2")Date date2,@Param(value = "userId")long userId);
	
	/**
	 * 查询符合条件的用户申请
	 * @param newDate1
	 * @param newDate2
	 * @return
	 */
	List<Application> select(Date newDate1, Date newDate2);
   
    
	
}