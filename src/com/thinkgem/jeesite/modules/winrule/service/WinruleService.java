/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.winrule.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.winrule.entity.Winrule;
import com.thinkgem.jeesite.modules.winrule.dao.WinruleDao;

/**
 * 抽奖规则Service
 * @author cxb
 * @version 2016-12-26
 */
@Service
@Transactional(readOnly = true)
public class WinruleService extends CrudService<WinruleDao, Winrule> {

	public Winrule get(String id) {
		return super.get(id);
	}
	
	public List<Winrule> findList(Winrule winrule) {
		return super.findList(winrule);
	}
	
	public Page<Winrule> findPage(Page<Winrule> page, Winrule winrule) {
		return super.findPage(page, winrule);
	}
	
	@Transactional(readOnly = false)
	public void save(Winrule winrule) {
		super.save(winrule);
	}
	
	@Transactional(readOnly = false)
	public void delete(Winrule winrule) {
		super.delete(winrule);
	}
	
}