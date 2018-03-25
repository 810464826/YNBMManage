/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.winner.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.winner.entity.Winner;
import com.thinkgem.jeesite.modules.winner.dao.WinnerDao;

/**
 * 中奖记录Service
 * @author 陈小兵
 * @version 2016-12-27
 */
@Service
@Transactional(readOnly = true)
public class WinnerService extends CrudService<WinnerDao, Winner> {

	public Winner get(String id) {
		return super.get(id);
	}
	
	public List<Winner> findList(Winner winner) {
		return super.findList(winner);
	}
	
	public Page<Winner> findPage(Page<Winner> page, Winner winner) {
		return super.findPage(page, winner);
	}
	
	@Transactional(readOnly = false)
	public void save(Winner winner) {
		super.save(winner);
	}
	
	@Transactional(readOnly = false)
	public void delete(Winner winner) {
		super.delete(winner);
	}
	
}