package com.t.controller;

import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.t.entity.Application;
import com.t.service.IApplicationService;

/**
 * @author 0502 T 2017年8月23日
 */
@Controller
@RequestMapping("/Application")
public class ApplicationController {

	@Autowired
	private IApplicationService applicationService;

	// 增加申请单
	@RequestMapping(value = "/insert", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String insert(long userid, long productid) {
		if (applicationService.insert(userid, productid) > 0) {
			return "ok";
		}
		return "失败,请稍后重试";
	}

	// 按条件搜索所有申请单
	@RequestMapping(value = "/myapply", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String myapply(long userid, String date1, String date2) {
		// System.out.println("Application >> myapply ...");
		// System.out.println("userId"+userid);
		// System.out.println("date1"+date1);
		// System.out.println("date2"+date2);
		List<Application> list = applicationService.selectByUserId(date1, date2, userid);
		// for (Application application : list) {
		// System.out.println(application);
		// }
		return JSON.toJSONString(list);
	}

	// 签名申请单
	@RequestMapping(value = "/esign", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String esign(long appid) {
		Application application = applicationService.selectByPrimaryKey(appid);
		if (application.getUserTruename().equals("匿名") || application.getUserTruename().equals("")){
			return "签字失败:请补全真实姓名";
		}
		if (application.getUserIdCard().length() != 18 && application.getUserIdCard().length() != 15){
			return "签字失败:请补全身份证信息";
		}
		if (!application.getEsign().equals("")){
			return "签字失败:请不要重复签字";
		}
		if (application.getState() == 0){
			return "签字失败:请等待通过审核";
		}
		if (application.getState() == 2){
			return "签字失败:保单已送达,无需签字";
		}
		int result = applicationService.updateByPrimaryKeySelective(application);
		if (result > 0 ){
			return "ok";
		}
		return "签字失败:未知原因,请稍后再试";
	}
	// 撤销申请单
	@RequestMapping(value = "/cancel", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String cancelApply(long appid) {
		Application application = applicationService.selectByPrimaryKey(appid);
		if (!application.getEsign().equals("")){
			return "撤销失败:已经签字";
		}
		int result = applicationService.deleteByPrimaryKey(appid);
		if (result > 0 ){
			return "ok";
		}
		return "撤销失败:未知原因,请稍后再试";
	}
	
}
