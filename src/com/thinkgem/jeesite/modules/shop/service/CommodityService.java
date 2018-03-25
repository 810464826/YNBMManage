/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.shop.entity.Commodity;
import com.thinkgem.jeesite.modules.shop.dao.CommodityDao;
import com.thinkgem.jeesite.modules.sys.dao.OfficeDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.modules.test.entity.Test;
import com.thinkgem.jeesite.test.dao.TestTreeDao;
import com.thinkgem.jeesite.test.entity.TestTree;

/**
 * 商品管理Service
 * @author 陈小兵
 * @version 2016-12-21
 */
@Service
@Transactional(readOnly = true)
public class CommodityService extends CrudService<CommodityDao, Commodity> {
	@Autowired
	private OfficeDao officeDao;
	@Autowired
	private CommodityDao commoditydao;
	@Autowired
	private TestTreeDao testTreeDao;
	public Commodity get(String id) {
		Commodity commodity = super.dao.get(id);
		String typeId=commodity.getCategory();
		Office office = officeDao.get(commodity.getShopId());
		TestTree testTree=testTreeDao.getTestTreeById(typeId);
		commodity.setShopName(office.getName());
		commodity.setType(testTree.getName());
		return commodity;
	}
	
	public List<Commodity> findList(Commodity commodity) {
		return super.findList(commodity);
	}
	
	public List<Commodity> findAllList(Commodity commodity) {
		return super.findAllList(commodity);
	}
	
	public List<Commodity> findTypeGoodsList(String id) {
		return super.dao.findTypeGoodsList(id);
	}
	/**
	 * 商品查询
	 */
	public Page<Commodity> findPage(Page<Commodity> page, Commodity commodity) {
		String shopId=commodity.getShopId();
		if (!"".equals(shopId)&&shopId!=null) {
			Office office = officeDao.getOfficeByName(shopId);
			commodity.setShopId(office.getId());
		}
		return super.findPage(page, commodity);
	}
	
	@Transactional(readOnly = false)
	public void save(Commodity commodity) {
		User currentUser = UserUtils.getUser();
		Office office = officeDao.getOfficeByPRIMARY_PERSON(currentUser.getId());
		if (currentUser.getId().equals("1")) {
		}else {
			commodity.setShopId(office.getId());
		}
		super.save(commodity);
	}
	
	@Transactional(readOnly = false)
	public void delete(Commodity commodity) {
		super.delete(commodity);
	}
	
}