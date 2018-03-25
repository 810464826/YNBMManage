/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.userbanks.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.userbanks.entity.Banks;

/**
 * 用户银行信息DAO接口
 * @author tanghaobo
 * @version 2016-10-25
 */
@MyBatisDao
public interface BanksDao extends CrudDao<Banks> {
	
}