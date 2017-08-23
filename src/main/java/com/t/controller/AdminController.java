package com.t.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.t.entity.Admin;
import com.t.serviceImpl.AdminServiceimpl;

/**
 * @author 0502  T  2017年8月24日
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private AdminServiceimpl adminServiceimpl;
	@RequestMapping("/login")
	@ResponseBody
	public String login(String name,String pwd ,HttpSession session){
		System.out.println("AdminController  >>  login");
		Admin admin = (Admin) session.getAttribute("admin");
//		if (session.getAttribute("adminname") != null){
//			System.out.println("已登录");
//			return JSON.toJSONString(admin);
//		}
		admin = adminServiceimpl.login(name, pwd);
		if (admin != null){
			//session.setAttribute("adminname", name);
			session.setAttribute("admin", admin);
			return JSON.toJSONString(admin);
		} else {
			return "err";
		}
	}
}
