/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wining.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.wining.entity.Wining;
import com.thinkgem.jeesite.modules.wining.dao.WiningDao;

/**
 * 中奖管理Service
 * @author cxb
 * @version 2016-12-26
 */
@Service
@Transactional(readOnly = true)
public class WiningService extends CrudService<WiningDao, Wining> {

	public Wining get(String id) {
		return super.get(id);
	}
	
	public List<Wining> findList(Wining wining) {
		return super.findList(wining);
	}
	
	public Page<Wining> findPage(Page<Wining> page, Wining wining) {
		return super.findPage(page, wining);
	}
	
	@Transactional(readOnly = false)
	public void save(Wining wining) {
		super.save(wining);
	}
	
	@Transactional(readOnly = false)
	public void delete(Wining wining) {
		super.delete(wining);
	}
	
}