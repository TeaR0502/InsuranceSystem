package com.t.service;

import java.util.Date;
import java.util.List;

import com.t.entity.Application;

/**
 * @author 0502 T 2017��8��23��
 */
public interface IApplicationService {
	
	/**
	 * ��������ɾ������
	 * @param id
	 * @return
	 */
	int deleteByPrimaryKey(Long id);
	
	/**
	 * �����û�����
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelective(Application record);
	
	/**
	 * ����������ѯ�û�����
	 * @param id
	 * @return
	 */
	Application selectByPrimaryKey(Long id);

	/**
	 * �û��ύ����
	 * 
	 * @param userid
	 * @param productid
	 * @return
	 */
	int insert(long userid, long productid);

	/**
	 * ��ѯ�����������û�����
	 * 
	 * @param date1
	 * @param date2
	 * @param userid
	 * @return
	 */
	List<Application> selectByUserId(String date1, String date2, long userid);

}
