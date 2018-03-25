/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.commission.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.commission.entity.Commission;

/**
 * 提成记录DAO接口
 * @author tanghaobo
 * @version 2016-10-14
 */
@MyBatisDao
public interface CommissionDao extends CrudDao<Commission> {

	
}