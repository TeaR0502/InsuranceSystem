package com.t.serviceImpl;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.t.dao.ApplicationMapper;
import com.t.dao.ProductMapper;
import com.t.dao.UserMapper;
import com.t.entity.Application;
import com.t.entity.Product;
import com.t.entity.User;
import com.t.service.IApplicationService;

/**
 * @author 0502 T 2017年8月23日
 */
@Service
public class ApplicationServiceimpl implements IApplicationService {

	@Autowired
	private ApplicationMapper applicationMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private ProductMapper productMapper;
	
	
	public List<Application> selectByUserId(String date1, String date2, long userId) {
		// System.out.println("ApplicationServiceimpl >> selectByUserId...");
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date newDate1 = null;
		Date newDate2 = null;
		try {
			newDate1 = simpleDateFormat.parse(date1);
			newDate2 = simpleDateFormat.parse(date2);
			Calendar   calendar   =   new   GregorianCalendar(); 

		    calendar.setTime(newDate2); 

		    calendar.add(calendar.DATE,1);//把日期往后增加一个周期的天数.整数往后推,负数往前移动 

		    newDate2=calendar.getTime();   
			// System.out.println("ApplicationServiceimpl >>
			// newDate1..."+newDate1);
			// System.out.println("ApplicationServiceimpl >>
			// newDate2..."+newDate2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}

		List<Application> list = applicationMapper.selectByUserId(newDate1, newDate2, userId);
		// for (Application application : list) {
		// System.out.println(application);
		// }

		return list;
	}
	
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED)
	public int insert(long userid, long productid) {
		User user = userMapper.selectByPrimaryKey(userid);
		Product product = productMapper.selectByPrimaryKey(productid);
		Date now = new Date(); 
		Date endtime = new Date(); 
		Calendar   calendar   =   new   GregorianCalendar(); 

	    calendar.setTime(endtime); 

	    calendar.add(calendar.DATE,product.getPeriod());//把日期往后增加一个周期的天数.整数往后推,负数往前移动 

	    endtime=calendar.getTime();   

		Application record = new Application(null, userid, user.getName(), user.getTruename(), user.getMobile(), user.getIdcard(), productid,
				product.getName(), product.getPeriod(), now, endtime, "", null, 0, null, "", now);

		// TODO Auto-generated method stub
		return applicationMapper.insertSelective(record);
	}

	public Application selectByPrimaryKey(Long id) {
		
		return applicationMapper.selectByPrimaryKey(id);
	}

	public int updateByPrimaryKeySelectiveForEsign(Application record) {
		record.setEsign(record.getUserTruename());
		Date now = new Date(); 
		record.setEsigntime(now);
		return applicationMapper.updateByPrimaryKeySelective(record);
	}

	public int deleteByPrimaryKey(Long id) {
		
		return applicationMapper.deleteByPrimaryKey(id);
	}

	public String select(int page, int rows,String date1, String date2) {
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date newDate1 = null;
		Date newDate2 = null;
		try {
			newDate1 = simpleDateFormat.parse(date1);
			newDate2 = simpleDateFormat.parse(date2);
			Calendar   calendar   =   new   GregorianCalendar(); 

		    calendar.setTime(newDate2); 

		    calendar.add(calendar.DATE,1);//把日期往后增加一个周期的天数.整数往后推,负数往前移动 

		    newDate2=calendar.getTime();   
			// System.out.println("ApplicationServiceimpl >>
			// newDate1..."+newDate1);
			// System.out.println("ApplicationServiceimpl >>
			// newDate2..."+newDate2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			// e.printStackTrace();
		}

		List<Application> list = applicationMapper.select(newDate1, newDate2);
		
		
		List<Application> smallList=paginationProduct(list, page, rows);
		Map<String, Object> map =new HashMap<String, Object>();
		map.put("total", list.size());
		map.put("rows", smallList);
		
		return JSON.toJSONString(map);
	}
	
	private List<Application> paginationProduct(List<Application> list, int page, int rows) {
		List<Application> small = new ArrayList<Application>();
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

	public int updateByPrimaryKeySelectiveForReply(long id,String reply,int state) {
		Application application = applicationMapper.selectByPrimaryKey(id);
		application.setReply(reply);
		Date now = new Date(); 
		application.setReplytime(now);
		application.setState(state);
		return applicationMapper.updateByPrimaryKeySelective(application);
	}

	public int updateByPrimaryKeySelectiveForAddition(long id, String addition) {
		Application application = applicationMapper.selectByPrimaryKey(id);
		application.setAddition(addition);
		return applicationMapper.updateByPrimaryKeySelective(application);
	}
	

}
