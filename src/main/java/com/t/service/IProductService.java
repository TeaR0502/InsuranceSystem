package com.t.service;

import java.util.List;

import com.t.entity.Product;
import com.t.entity.UserProduct;
/**
 * @author 0502  T  2017年8月23日
 */
public interface IProductService {
	
	/**
     * 根据提供信息改动保险产品
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Product record);
    
	/**
	 * 根据主键删除保险
	 * @param productId
	 * @return
	 */
    int deleteByPrimaryKey(Long productId);
	
	/**
     * 增加一种保险
     * @param record
     * @return
     */
    int insertSelective(Product product);
	
	/**
	 * 查询
	 * @param page
	 * @param rows
	 * @param type
	 * @param namelike
	 * @return
	 */
	public String search(int page,int rows,String type,String namelike,String userType);
	
	/**
	 * 添加user_product
	 * @param up
	 * @return
	 */
	public boolean insertUserProduct(UserProduct up);
	
	/**
	 * 查询用户关注数量
	 * @return
	 */
	public int countUser(long id);
	
	/**
	 * 根据ID查询商品
	 * @return
	 */
	public Product selectById(long id);
	
	/**
	 * 根据id查询用户关注商品
	 * @param id
	 * @return
	 */
	public List<UserProduct> selectByUPId(int id);
	
	/**
	 * 删除用户关注
	 * @param userId
	 * @param productId
	 * @return
	 */
	public boolean delectUP(int userId,int productId);
}
