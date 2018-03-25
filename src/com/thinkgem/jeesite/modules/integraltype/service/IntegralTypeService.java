/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.integraltype.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.integraltype.entity.IntegralType;
import com.thinkgem.jeesite.modules.integraltype.dao.IntegralTypeDao;

/**
 * 积分商城类型Service
 * @author cxb
 * @version 2016-12-28
 */
@Service
@Transactional(readOnly = true)
public class IntegralTypeService extends CrudService<IntegralTypeDao, IntegralType> {

	public IntegralType get(String id) {
		return super.get(id);
	}
	
	public List<IntegralType> findList(IntegralType integralType) {
		return super.findList(integralType);
	}
	
	public Page<IntegralType> findPage(Page<IntegralType> page, IntegralType integralType) {
		return super.findPage(page, integralType);
	}
	
	@Transactional(readOnly = false)
	public void save(IntegralType integralType) {
		super.save(integralType);
	}
	
	@Transactional(readOnly = false)
	public void delete(IntegralType integralType) {
		super.delete(integralType);
	}
	
}