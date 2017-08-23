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
 * @author 0502 T 2017��8��23��
 */
@Controller
@RequestMapping("/Application")
public class ApplicationController {

	@Autowired
	private IApplicationService applicationService;

	// �������뵥
	@RequestMapping(value = "/insert", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String insert(long userid, long productid) {
		if (applicationService.insert(userid, productid) > 0) {
			return "ok";
		}
		return "ʧ��,���Ժ�����";
	}

	// �����������������뵥
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

	// ǩ�����뵥
	@RequestMapping(value = "/esign", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String esign(long appid) {
		Application application = applicationService.selectByPrimaryKey(appid);
		if (application.getUserTruename().equals("����") || application.getUserTruename().equals("")){
			return "ǩ��ʧ��:�벹ȫ��ʵ����";
		}
		if (application.getUserIdCard().length() != 18 && application.getUserIdCard().length() != 15){
			return "ǩ��ʧ��:�벹ȫ���֤��Ϣ";
		}
		if (!application.getEsign().equals("")){
			return "ǩ��ʧ��:�벻Ҫ�ظ�ǩ��";
		}
		if (application.getState() == 0){
			return "ǩ��ʧ��:��ȴ�ͨ�����";
		}
		if (application.getState() == 2){
			return "ǩ��ʧ��:�������ʹ�,����ǩ��";
		}
		int result = applicationService.updateByPrimaryKeySelective(application);
		if (result > 0 ){
			return "ok";
		}
		return "ǩ��ʧ��:δ֪ԭ��,���Ժ�����";
	}
	// �������뵥
	@RequestMapping(value = "/cancel", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String cancelApply(long appid) {
		Application application = applicationService.selectByPrimaryKey(appid);
		if (!application.getEsign().equals("")){
			return "����ʧ��:�Ѿ�ǩ��";
		}
		int result = applicationService.deleteByPrimaryKey(appid);
		if (result > 0 ){
			return "ok";
		}
		return "����ʧ��:δ֪ԭ��,���Ժ�����";
	}
	
}
