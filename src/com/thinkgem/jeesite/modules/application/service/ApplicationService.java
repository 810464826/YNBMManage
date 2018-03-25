/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.application.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.BaseEntity;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.application.entity.Application;
import com.thinkgem.jeesite.modules.application.dao.ApplicationDao;
import com.thinkgem.jeesite.modules.member.dao.MemberDao;
import com.thinkgem.jeesite.modules.member.entity.Member;
import com.thinkgem.jeesite.modules.shop.dao.CommodityDao;

/**
 * 打款申请及打款Service
 * @author tanghaobo
 * @version 2016-10-17
 */
@Service
@Transactional(readOnly = true)
public class ApplicationService extends CrudService<ApplicationDao, Application> {
	@Autowired
	private ApplicationDao applicationDao;
	
	public Application get(String id) {
		return super.get(id);
	}
	
	public List<Application> findList(Application application) {
		return super.findList(application);
	}
	
	public Page<Application> findPage(Page<Application> page, Application application) {
		return super.findPage(page, application);
	}
	
	@Transactional(readOnly = false)
	public void save(Application application) {
		super.save(application);
	}
	
	@Transactional(readOnly = false)
	public void delete(Application application) {
		super.delete(application);
	}
	
	public Member getUserById(String id) {
		return super.dao.getUserById(id);
	} 
	
	public void updateMoney(Application application) {
		super.dao.updateMoney(application);//.getCommission(),mem.getId()
	} 
}