/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.coupon.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.coupon.entity.Coupon;

/**
 * 优惠券DAO接口
 * @author 陈小兵
 * @version 2016-12-22
 */
@MyBatisDao
public interface CouponDao extends CrudDao<Coupon> {
	public Coupon findNameById(String id);
}