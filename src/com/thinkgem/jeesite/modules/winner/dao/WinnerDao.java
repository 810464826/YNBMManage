/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.winner.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.winner.entity.Winner;

/**
 * 中奖记录DAO接口
 * @author 陈小兵
 * @version 2016-12-27
 */
@MyBatisDao
public interface WinnerDao extends CrudDao<Winner> {
	
}