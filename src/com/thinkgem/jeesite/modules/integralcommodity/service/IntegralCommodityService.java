/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.integralcommodity.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.integralcommodity.entity.IntegralCommodity;
import com.thinkgem.jeesite.modules.integralcommodity.dao.IntegralCommodityDao;

/**
 * 积分商城商品Service
 * @author cxb
 * @version 2016-12-29
 */
@Service
@Transactional(readOnly = true)
public class IntegralCommodityService extends CrudService<IntegralCommodityDao, IntegralCommodity> {

	public IntegralCommodity get(String id) {
		return super.get(id);
	}
	
	public List<IntegralCommodity> findList(IntegralCommodity integralCommodity) {
		return super.findList(integralCommodity);
	}
	
	public Page<IntegralCommodity> findPage(Page<IntegralCommodity> page, IntegralCommodity integralCommodity) {
		return super.findPage(page, integralCommodity);
	}
	
	@Transactional(readOnly = false)
	public void save(IntegralCommodity integralCommodity) {
		super.save(integralCommodity);
	}
	
	@Transactional(readOnly = false)
	public void delete(IntegralCommodity integralCommodity) {
		super.delete(integralCommodity);
	}
	
}