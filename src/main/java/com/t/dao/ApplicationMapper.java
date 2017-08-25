package com.t.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.t.entity.Admin;
import com.t.entity.Application;
/**
 * @author 0502  T  2017��8��22��
 */
public interface ApplicationMapper {
	
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
     * @param record
     * @return
     */
    int insertSelective(Application record);
	/**
	 * ��ѯ�����������û�����
	 * @param date1
	 * @param date2
	 * @param userid
	 * @return
	 */
	List<Application> selectByUserId(@Param(value = "data1") Date date1,@Param(value = "data2")Date date2,@Param(value = "userId")long userId);
	
	/**
	 * ��ѯ�����������û�����
	 * @param newDate1
	 * @param newDate2
	 * @return
	 */
	List<Application> select(Date newDate1, Date newDate2);
   
    
	
}