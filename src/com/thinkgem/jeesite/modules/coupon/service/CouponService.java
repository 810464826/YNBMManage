/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.coupon.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.coupon.entity.Coupon;
import com.thinkgem.jeesite.modules.coupon.dao.CouponDao;
import com.thinkgem.jeesite.modules.sys.dao.OfficeDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;

/**
 * 优惠券Service
 * @author 陈小兵
 * @version 2016-12-22
 */
@Service
@Transactional(readOnly = true)
public class CouponService extends CrudService<CouponDao, Coupon> {
@Autowired
private OfficeDao officeDao;
@Autowired
private CouponDao couponDao;
	public Coupon get(String id) {
		return super.get(id);
	}
	
	public List<Coupon> findList(Coupon coupon) {
		return super.findList(coupon);
	}
	
	/**
	 * 查询优惠券
	 */
	public Page<Coupon> findPage(Page<Coupon> page, Coupon coupon) {
		String id=coupon.getShopid();
		if(id!=null&&!id.equals("")){
			Office off=officeDao.getOfficeByName(id);
			coupon.setShopid(off.getId());
		}
		return super.findPage(page, coupon);
	}
	
	@Transactional(readOnly = false)
	public void save(Coupon coupon) {
		Date date=new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss:SSS");
		String nowTime=sdf.format(date);  
		long StartmillionSeconds=0;
		try {
			StartmillionSeconds = sdf.parse(nowTime).getTime();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		coupon.setNumber(coupon.getId()+Long.toString(StartmillionSeconds));
		couponDao.insert(coupon);
	}
	
	@Transactional(readOnly = false)
	public void delete(Coupon coupon) {
		super.delete(coupon);
	}
	
}