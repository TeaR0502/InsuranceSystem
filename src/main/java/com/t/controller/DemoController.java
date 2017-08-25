package com.t.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.t.entity.User;

@Controller
@RequestMapping("/demo")
public class DemoController {
	
	@Autowired
	private HttpSession session;
	
	@RequestMapping("/upload1")
	@ResponseBody
	public String upload1(@RequestParam("imagefile") CommonsMultipartFile imagefile){
		String path = session.getServletContext().getRealPath("userIdPic");
		User user=(User) session.getAttribute("user");
		String username=null;
		if(user!=null){
			username=user.getName();
		}else{
			return "upload fail";
		}
		File targetFile = new File(path+"\\"+username, "idcard1.jpg"); 
		  if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	        try {  
	        	imagefile.transferTo(targetFile);  
	        } catch (Exception e) {  
	        	 e.printStackTrace();
	        	return "upload fail";
	             
	        }   
		return "ok";
		
	}
	
	@RequestMapping("/upload2")
	@ResponseBody
	public String upload2(@RequestParam("imagefile") CommonsMultipartFile imagefile){
		String path = session.getServletContext().getRealPath("userIdPic");
		User user=(User) session.getAttribute("user");
		String username=null;
		if(user!=null){
			username=user.getName();
		}else{
			return "upload fail";
		}
		File targetFile = new File(path+"\\"+username, "idcard2.jpg"); 
		  if(!targetFile.exists()){  
	            targetFile.mkdirs();  
	        }  
	        try {  
	        	imagefile.transferTo(targetFile);  
	        } catch (Exception e) {  
	            e.printStackTrace(); 
	            return "upload fail";
	        }   
		
		return "ok";
		
	}
	
	@RequestMapping("/sessionget")
	@ResponseBody
	public String getSession(String name){
		return (String) session.getAttribute(name);
		
	}
	
	
	@RequestMapping("/sessionset")
	@ResponseBody
	public String setSession(String name,String val){
		session.setAttribute(name, val);
		
		return "sessionSet";
		
	}
	
	
	@RequestMapping("/login")
	public String login(Model model){
		User user=(User) session.getAttribute("user");
		model.addAttribute("user",user);
		return "web-view/proj-a-f/login";
		
	}
	
	@RequestMapping("/myinfo")
	public String myinfo(){
		return "web-view/proj-a-f/myinfo";
	}
	
	@RequestMapping("/require")
	public String require(){
		return "web-view/proj-a-f/require";
	}
	
	@RequestMapping("/intent")
	public String intent(){
		return "web-view/proj-a-f/intent";
	}
	
	@RequestMapping("/apply")
	public String apply(){
		return "web-view/proj-a-f/apply";
	}
	
	@RequestMapping("/admin/login")
	public String adminLogin(Model model){
		User user=(User) session.getAttribute("user");
		
		model.addAttribute("user",user);
		return "web-view/proj-a-b/login";
	}
	@RequestMapping("/admin/product")
	public String adminProduct(){
		return "web-view/proj-a-b/product";
	}
	
	
	@RequestMapping("/admin/prdadd")
	public String adminPrdadd(){
		return "web-view/proj-a-b/prdadd";
	}
	
	@RequestMapping("/admin/apply")
	public String adminApply(){
		return "web-view/proj-a-b/apply";
	}
	
	
}
