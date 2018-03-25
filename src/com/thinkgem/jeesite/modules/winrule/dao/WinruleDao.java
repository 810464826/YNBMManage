/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.winrule.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.winrule.entity.Winrule;

/**
 * 抽奖规则DAO接口
 * @author cxb
 * @version 2016-12-26
 */
@MyBatisDao
public interface WinruleDao extends CrudDao<Winrule> {
	
}