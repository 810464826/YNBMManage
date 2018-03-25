/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.integraltype.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.integralcommodity.entity.IntegralCommodity;
import com.thinkgem.jeesite.modules.integraltype.entity.IntegralType;

/**
 * 积分商城类型DAO接口
 * @author cxb
 * @version 2016-12-28
 */
@MyBatisDao
public interface IntegralTypeDao extends CrudDao<IntegralType> {
	public List<IntegralType> findTypes();
	
}