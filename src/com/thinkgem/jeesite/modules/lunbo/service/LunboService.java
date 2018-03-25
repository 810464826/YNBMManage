/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.lunbo.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.lunbo.entity.Lunbo;
import com.thinkgem.jeesite.modules.lunbo.dao.LunboDao;

/**
 * 手机端轮播图片Service
 * @author huanglian
 * @version 2016-08-07
 */
@Service
@Transactional(readOnly = true)
public class LunboService extends CrudService<LunboDao, Lunbo> {

	public Lunbo get(String id) {
		return super.get(id);
	}
	
	public List<Lunbo> findList(Lunbo lunbo) {
		return super.findList(lunbo);
	}
	
	public Page<Lunbo> findPage(Page<Lunbo> page, Lunbo lunbo) {
		return super.findPage(page, lunbo);
	}
	
	@Transactional(readOnly = false)
	public void save(Lunbo lunbo) {
		super.save(lunbo);
	}
	
	@Transactional(readOnly = false)
	public void delete(Lunbo lunbo) {
		super.delete(lunbo);
	}
	
}