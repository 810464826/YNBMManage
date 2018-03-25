/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cartitem.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.cartitem.entity.Cartitem;

/**
 * 购物车DAO接口
 * @author huanglian
 * @version 2016-08-05
 */
@MyBatisDao
public interface CartitemDao extends CrudDao<Cartitem> {
	
}