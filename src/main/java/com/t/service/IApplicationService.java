package com.t.service;

import java.util.Date;
import java.util.List;

import com.t.entity.Application;

/**
 * @author 0502 T 2017年8月23日
 */
public interface IApplicationService {
	
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
	 * 
	 * @param userid
	 * @param productid
	 * @return
	 */
	int insert(long userid, long productid);

	/**
	 * 查询符合条件的用户申请
	 * 
	 * @param date1
	 * @param date2
	 * @param userid
	 * @return
	 */
	List<Application> selectByUserId(String date1, String date2, long userid);

}
