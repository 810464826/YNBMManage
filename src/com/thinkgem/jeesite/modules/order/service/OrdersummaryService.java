/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.modules.cartitem.dao.CartitemDao;
import com.thinkgem.jeesite.modules.cartitem.entity.Cartitem;
import com.thinkgem.jeesite.modules.order.entity.Ordersummary;
import com.thinkgem.jeesite.modules.order.dao.OrdersummaryDao;
import com.thinkgem.jeesite.modules.shop.dao.CommodityDao;
import com.thinkgem.jeesite.modules.shop.entity.Commodity;
import com.thinkgem.jeesite.modules.shop.entity.Commodity;
import com.thinkgem.jeesite.modules.sys.dao.OfficeDao;
import com.thinkgem.jeesite.modules.sys.entity.Office;


/**
 * 订单管理Service
 * @author lucio
 * @version 2016-06-12
 */
@Service
@Transactional(readOnly = true)
public class OrdersummaryService extends CrudService<OrdersummaryDao, Ordersummary> {
	@Autowired
	private CommodityDao commoditydao;
	@Autowired
	private CartitemDao cartItemDao;
	@Autowired
	private OfficeDao officeDao;
	public Ordersummary get(String id) {
		Ordersummary ordersummary = super.get(id);
		Cartitem cartItem = new Cartitem();
		cartItem.setOrdernum(ordersummary.getOrdernum());
		List<Cartitem> cartList = cartItemDao.findList(cartItem);
		for (int i = 0; i < cartList.size(); i++) {
			Map<String,Object> goodsMap = new HashMap<String, Object>();
			Cartitem ci = cartList.get(i);
			Commodity realCommodity = commoditydao.get(ci.getCommodityid());
			goodsMap.put("name", realCommodity.getName());
			goodsMap.put("total", ci.getTotal());
			
			if (ci.getCommoditytype().equals("0")) {
				goodsMap.put("boxTitle", realCommodity.getBoxtitle0());
				goodsMap.put("price", realCommodity.getMember0());
			}
			if (ci.getCommoditytype().equals("1")) {
				goodsMap.put("boxTitle", realCommodity.getBoxtitle1());
				goodsMap.put("price", realCommodity.getMember1());
			}
			if (ci.getCommoditytype().equals("2")) {
				goodsMap.put("boxTitle", realCommodity.getBoxtitle2());
				goodsMap.put("price", realCommodity.getMember2());
			}
			ordersummary.addGoodsList(goodsMap);
		}
		return ordersummary;
	}
	
	public List<Ordersummary> findList(Ordersummary ordersummary) {
		return super.findList(ordersummary);
	}
	
	/**
	 * 根据店铺名查询订单
	 */
	public Page<Ordersummary> findPage(Page<Ordersummary> page, Ordersummary ordersummary) {
		String shopId=ordersummary.getShopId();
		if (!"".equals(shopId)&&shopId!=null) {
			Office office = officeDao.getOfficeByName(shopId);
			ordersummary.setShopId(office.getId());
		}
		return super.findPage(page, ordersummary);
	}
	
	@Transactional(readOnly = false)
	public void save(Ordersummary ordersummary) {
		super.save(ordersummary);
	}
	
	@Transactional(readOnly = false)
	public void delete(Ordersummary ordersummary) {
		super.delete(ordersummary);
	}
	public List<Map<String, Object>> findOrderNumByAddressId(Ordersummary ordersummary) {
		return super.dao.findOrderNumByAddressId(ordersummary);
	}
//	public List<Map<String, Object>> selectSysDict(){
//		return super.dao.selectSysDict();
//	}
	
}