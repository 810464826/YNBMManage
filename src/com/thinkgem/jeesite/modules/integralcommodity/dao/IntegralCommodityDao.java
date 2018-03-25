/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.integralcommodity.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.integralcommodity.entity.IntegralCommodity;

/**
 * 积分商城商品DAO接口
 * @author cxb
 * @version 2016-12-29
 */
@MyBatisDao
public interface IntegralCommodityDao extends CrudDao<IntegralCommodity> {
	public List<IntegralCommodity> findAllCommodity(String typeid);
	public void deleteCommodity(IntegralCommodity c);
}