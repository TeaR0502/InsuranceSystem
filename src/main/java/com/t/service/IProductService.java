package com.t.service;

import java.util.List;

import com.t.entity.Product;
import com.t.entity.UserProduct;
/**
 * @author 0502  T  2017��8��23��
 */
public interface IProductService {
	
	/**
     * �����ṩ��Ϣ�Ķ����ղ�Ʒ
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Product record);
    
	/**
	 * ��������ɾ������
	 * @param productId
	 * @return
	 */
    int deleteByPrimaryKey(Long productId);
	
	/**
     * ����һ�ֱ���
     * @param record
     * @return
     */
    int insertSelective(Product product);
	
	/**
	 * ��ѯ
	 * @param page
	 * @param rows
	 * @param type
	 * @param namelike
	 * @return
	 */
	public String search(int page,int rows,String type,String namelike,String userType);
	
	/**
	 * ���user_product
	 * @param up
	 * @return
	 */
	public boolean insertUserProduct(UserProduct up);
	
	/**
	 * ��ѯ�û���ע����
	 * @return
	 */
	public int countUser(long id);
	
	/**
	 * ����ID��ѯ��Ʒ
	 * @return
	 */
	public Product selectById(long id);
	
	/**
	 * ����id��ѯ�û���ע��Ʒ
	 * @param id
	 * @return
	 */
	public List<UserProduct> selectByUPId(int id);
	
	/**
	 * ɾ���û���ע
	 * @param userId
	 * @param productId
	 * @return
	 */
	public boolean delectUP(int userId,int productId);
}
