/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.commission.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.commission.entity.Commission;
import com.thinkgem.jeesite.modules.commission.dao.CommissionDao;

/**
 * 提成记录Service
 * @author tanghaobo
 * @version 2016-10-14
 */
@Service
@Transactional(readOnly = true)
public class CommissionService extends CrudService<CommissionDao, Commission> {

	public Commission get(String id) {
		return super.get(id);
	}
	
	public List<Commission> findList(Commission commission) {
		return super.findList(commission);
	}
	
	public Page<Commission> findPage(Page<Commission> page, Commission commission) {
		return super.findPage(page, commission);
	}
	
	@Transactional(readOnly = false)
	public void save(Commission commission) {
		super.save(commission);
	}
	
	@Transactional(readOnly = false)
	public void delete(Commission commission) {
		super.delete(commission);
	}
	
}