/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.lunbo.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.lunbo.entity.Lunbo;

/**
 * 手机端轮播图片DAO接口
 * @author huanglian
 * @version 2016-08-07
 */
@MyBatisDao
public interface LunboDao extends CrudDao<Lunbo> {
	
}