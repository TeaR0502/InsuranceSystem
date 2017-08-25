package com.t.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.t.dao.ProductMapper;
import com.t.dao.UserProductMapper;
import com.t.entity.Product;
import com.t.entity.UserProduct;
import com.t.service.IProductService;
/**
 * @author 0502  T  2017年8月23日
 */
@Service
public class ProductServiceImpl implements IProductService {

	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private UserProductMapper userProductMapper;

	public String search(int page, int rows, String type, String namelike,String userTyep) {

		if (namelike != null) {
			namelike = "%" + namelike + "%";
		}
		if(type!=null){
			if(type.equals("")){
				type=null;
			}
		}
		

		List<Product> list=productMapper.search(type, namelike);
		if ("user".equals(userTyep)){
			//不显示未经审核的保险(更新在数据查询中完成)
			for(int i= 0 ; i<list.size();i++ ){
				if (list.get(i).getState() == 0){
					list.remove(i);
				}
			}
		}
		
		for (Product product : list) {
			product.setUsercount(countUser(product.getProductId()));
		}
		List<Product> smallList=paginationProduct(list, page, rows);
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("total", list.size());
		map.put("rows", smallList);
		
		return JSON.toJSONString(map);
	}

	private List<Product> paginationProduct(List<Product> list, int page, int rows) {
		List<Product> small = new ArrayList<Product>();
		int beginIndex = rows * (page-1); 
		int endIndex;
		if (rows * page > list.size()) {
			endIndex = list.size();
		} else {
			endIndex = rows * page;
		}
		for (int i = beginIndex; i < endIndex; i++) {
			small.add(list.get(i));
		}
		return small;
	}

	public boolean insertUserProduct(UserProduct up) {
		
		int rows=userProductMapper.insert(up);
		
		return rows==1?true:false;
	}

	public int countUser(long id) {
		
		return userProductMapper.countUser((int)id);
	}

	public Product selectById(long id) {
		
		return productMapper.selectByPrimaryKey(id);
	}

	public List<UserProduct> selectByUPId(int userId) {
		
		return userProductMapper.selectByUserId(userId);
	}

	public boolean delectUP(int userId, int productId) {
		
		int rows=userProductMapper.deleteUP(userId, productId);
		
		return rows==1?true:false;
	}

	public int insertSelective(Product product) {
		
		return productMapper.insertSelective(product);
	}

	public int deleteByPrimaryKey(Long productId) {
		
		return productMapper.deleteByPrimaryKey(productId);
	}

	public int updateByPrimaryKeySelective(Product product) {
		
		return productMapper.updateByPrimaryKeySelective(product);
	}

}
