package com.t.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.t.entity.Admin;
import com.t.entity.User;
import com.t.service.IUserService;
import com.t.service.impl.AdminServiceimpl;
/**
 * @author 0502  T  2017��8��22��
 */
@Controller
@RequestMapping("/proja/User")
public class UserController {
	@Autowired
	private IUserService iUserService;
	/**
	 * �û���¼����
	 * @param name
	 * @param pwd
	 * @param session
	 * @return
	 */
	@RequestMapping("/login")
	@ResponseBody
	public String login(String name,String pwd ,HttpSession session){
		System.out.println("User/login...");
		if (session.getAttribute("adminname") != null){
			System.out.println("�ѵ�¼");
		}
		User user = iUserService.login(name, pwd);
		if (user != null){
			session.setAttribute("adminname", name);
			session.setAttribute("adminid", user.getId());
			return JSON.toJSONString(user);
		} else {
			return "err";
		}
	}
	
	/**
	 * ע���û�������Ϣ
	 * @param name
	 * @param pwd
	 * @param mobile
	 * @param email
	 * @param verifycode
	 * @param session
	 * @return
	 */
	@RequestMapping("/reg")
	@ResponseBody
	public String register(String name,String pwd ,String mobile,String email,String verifycode ,HttpSession session){
		System.out.println("User/reg...");
		
		return "err";
	}
	
	@RequestMapping("/check")
	@ResponseBody
	public String checkName(String name){
		System.out.println("User/check...");
		if(iUserService.check(name)){
			return "0";//����ʹ��
		} else{
			return "1";//�Ѿ����ڵ��û���
		}
		
	}
}
