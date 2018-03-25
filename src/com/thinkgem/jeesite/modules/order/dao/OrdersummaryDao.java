/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.dao;

import java.util.List;
import java.util.Map;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.order.entity.Ordersummary;

/**
 * 订单管理DAO接口
 * @author lucio
 * @version 2016-06-12
 */
@MyBatisDao
public interface OrdersummaryDao extends CrudDao<Ordersummary> {
	List<Map<String, Object>> findOrderNumByAddressId(Ordersummary ordersummary);
//	List<Map<String, Object>> selectSysDict();
}