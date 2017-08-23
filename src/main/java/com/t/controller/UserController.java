package com.t.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.t.entity.User;
import com.t.service.IUserService;
import com.t.util.MailUtil;
/**
 * @author 0502  T  2017年8月23日
 */
@Controller
@RequestMapping("/user")
public class UserController {
	private static int code;
	@Autowired
	private IUserService userService;
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private MailUtil mailUtil;
	
	@RequestMapping("/login")
	@ResponseBody
	public String login(String name,String pwd){
		
		User user=userService.login(name, pwd);
		
		if(user!=null){
			String result=JSON.toJSONString(user);
			return result;
		}
		
		return "err";
		
	}
	
	@RequestMapping("/register")
	@ResponseBody
	public String register(User user,String verifycode){
		//System.out.println(verifycode);
		int userVerifycode = Integer.parseInt(verifycode);
		if (userVerifycode == code){
			user.setTruename("匿名");
			user.setIdcard("0000");
			user.setState(1);
			if(userService.register(user)){
				return "ok";
			}
		}
		return "fault";
	}
	
	
	@RequestMapping("/updateInfo")
	@ResponseBody
	public String updateInfo(User user){
		User logedUser=(User) session.getAttribute("user");
		if(logedUser!=null){
			user.setUserId(logedUser.getUserId());
			if(userService.updateUser(user)){
				return "ok";
			}
		}
		return "update fail";
		
	}
	@RequestMapping("/sendVerifyCode")
	@ResponseBody
	public String sendVerifyCode(String targetmail){
		//System.out.println(targetmail);
		//生成随机数验证码
		code = (int) (Math.random()*10000);
		//System.out.println(code);
		try {
			mailUtil.senMail(targetmail, code);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "update fail";
		
	}
	
}
