/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wining.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.wining.entity.Wining;

/**
 * 中奖管理DAO接口
 * @author cxb
 * @version 2016-12-26
 */
@MyBatisDao
public interface WiningDao extends CrudDao<Wining> {
	
}