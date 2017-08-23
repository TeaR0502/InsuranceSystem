package com.t.controller;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.t.entity.Product;
import com.t.entity.User;
import com.t.entity.UserProduct;
import com.t.service.IProductService;
/**
 * @author 0502  T  2017年8月23日
 */
@Controller
@RequestMapping("/Product")
public class ProductController {
	
	@Autowired
	private IProductService productService;
	@Autowired
	private HttpSession session;
	//
	@RequestMapping(value = "/listProductF",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String listProduct(int page,int rows,String type,String namelike) throws UnsupportedEncodingException{

		return productService.search(page, rows, type, namelike);

	}
	
	@RequestMapping(value = "/addrequire",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String addrequire(String name ,String memo) throws UnsupportedEncodingException{
		User user = (User) session.getAttribute("user");
		Product product = new Product();
		product.setMemo(memo);
		product.setName(name);
		product.setCreatetime(new Date());
		product.setCreatorname(user.getName());
		product.setCreatorid(user.getUserId());
		product.setState(0);
		int result = productService.insertSelective(product);
		if (result > 0 ){
			return "ok";
		}
		return "添加失败!请稍后重试!";

	}
	
	
	@RequestMapping(value = "/myIntent",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String myIntent(int userid){
		
		List<UserProduct> list=productService.selectByUPId(userid);
		List<UserProduct> newList = new LinkedList<UserProduct>();
		
		for (UserProduct userProduct : list) {
			userProduct.setMemo(productService.selectById(userProduct.getProductid()).getMemo());
			newList.add(userProduct);
		}
		return JSON.toJSONString(newList);
		
	}
	
	@RequestMapping(value ="/getProductById",produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String getProductById(long prdid){
		
		Product product=productService.selectById(prdid);
		return JSON.toJSONString(product);
		
	}
}
