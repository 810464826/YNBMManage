/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.userbanks.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.userbanks.entity.Banks;
import com.thinkgem.jeesite.modules.userbanks.dao.BanksDao;

/**
 * 用户银行信息Service
 * @author tanghaobo
 * @version 2016-10-25
 */
@Service
@Transactional(readOnly = true)
public class BanksService extends CrudService<BanksDao, Banks> {

	public Banks get(String id) {
		return super.get(id);
	}
	
	public List<Banks> findList(Banks banks) {
		return super.findList(banks);
	}
	
	/**
	 * 查询银行卡
	 */
	public Page<Banks> findPage(Page<Banks> page, Banks banks) {
		
		return super.findPage(page, banks);
	}
	
	@Transactional(readOnly = false)
	public void save(Banks banks) {
		super.save(banks);
	}
	
	@Transactional(readOnly = false)
	public void delete(Banks banks) {
		super.delete(banks);
	}
	
}