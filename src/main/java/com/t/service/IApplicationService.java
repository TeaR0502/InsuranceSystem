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
	 * 用户签名
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelectiveForEsign(Application record);
	
	/**
	 * 管理员审批
	 * @param id
	 * @param reply
	 * @param state
	 * @return
	 */
	int updateByPrimaryKeySelectiveForReply(long id,String reply,int state);
	
	/**
	 * 添加备注信息
	 * @param id
	 * @param addtion
	 * @return
	 */
	int updateByPrimaryKeySelectiveForAddition(long id,String addition);
	
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

	
	/**
	 * 查询符合条件的用户申请
	 * @param page 分页使用
	 * @param rows 分页使用
	 * @param date1
	 * @param date2
	 * @return
	 */
	String select(int page, int rows,String date1, String date2);

}
