package com.t.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.t.dao.AdminMapper;
import com.t.entity.Admin;
import com.t.service.IAdminService;

/**
 * @author 0502  T  2017年8月24日
 */
@Service
public class AdminServiceimpl implements IAdminService {

	@Autowired
	private AdminMapper adminMapper;
	
	public Admin login(String name, String passowrd ) {
		
		Admin admin =adminMapper.selectByUsername(name);
		if (admin != null && admin.getPwd().equals(passowrd) &&admin.getState() == 0) {
			//System.out.println("管理员登陆成功");
			return admin;
		} else {
			//System.out.println("管理员登陆失败");
			return null;
		}
	}

}
