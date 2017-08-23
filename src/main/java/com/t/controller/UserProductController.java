package com.t.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.t.entity.UserProduct;
import com.t.service.IProductService;
/**
 * @author 0502  T  2017Äê8ÔÂ23ÈÕ
 */
@Controller
@RequestMapping("/UserProduct")
public class UserProductController {

	@Autowired
	private IProductService ps;
	
	@RequestMapping("/insert")
	@ResponseBody
	public String insert(UserProduct up){
		
		if(ps.insertUserProduct(up)){
			return "ok";
		}
		
		return "insert fail";
		
	}
	
	@RequestMapping("/delete")
	@ResponseBody
	public String delete(int userid,int productid){
		
		if(ps.delectUP(userid, productid)){
			return "ok";
		}
		
		return "delete fail";
		
	}
	
}
