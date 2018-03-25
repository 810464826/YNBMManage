/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.application.dao;

import org.apache.ibatis.annotations.Param;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.thinkgem.jeesite.modules.application.entity.Application;
import com.thinkgem.jeesite.modules.member.entity.Member;

/**
 * 打款申请及打款DAO接口
 * @author tanghaobo
 * @version 2016-10-17
 */
@MyBatisDao
public interface ApplicationDao extends CrudDao<Application> {
	public Member getUserById(String id) ;
	public void updateMoney(Application application);//Member mem
}