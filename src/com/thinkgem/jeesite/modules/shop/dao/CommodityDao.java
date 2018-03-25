/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shop.dao;

import java.util.List;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.shop.entity.Commodity;

/**
 * 商品管理DAO接口
 * @author 陈小兵
 * @version 2016-12-21
 */
@MyBatisDao
public interface CommodityDao extends CrudDao<Commodity> {
	List<Commodity> findTypeGoodsList(String id);
}