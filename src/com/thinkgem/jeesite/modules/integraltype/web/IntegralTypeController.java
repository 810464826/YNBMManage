/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.integraltype.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.integralcommodity.dao.IntegralCommodityDao;
import com.thinkgem.jeesite.modules.integralcommodity.entity.IntegralCommodity;
import com.thinkgem.jeesite.modules.integraltype.dao.IntegralTypeDao;
import com.thinkgem.jeesite.modules.integraltype.entity.IntegralType;
import com.thinkgem.jeesite.modules.integraltype.service.IntegralTypeService;

/**
 * 积分商城类型Controller
 * @author cxb
 * @version 2016-12-28
 */
@Controller
@RequestMapping(value = "${adminPath}/integraltype/integralType")
public class IntegralTypeController extends BaseController {
	
	@Autowired
	private IntegralTypeService integralTypeService;
	@Autowired
	private IntegralTypeDao integralTypeDao;
	@Autowired
	private IntegralCommodityDao integralCommodityDao;
	@ModelAttribute
	public IntegralType get(@RequestParam(required=false) String id) {
		IntegralType entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = integralTypeService.get(id);
		}
		if (entity == null){
			entity = new IntegralType();
		}
		return entity;
	}
	
	@RequiresPermissions("integraltype:integralType:view")
	@RequestMapping(value = {"list", ""})
	public String list(IntegralType integralType, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<IntegralType> page = integralTypeService.findPage(new Page<IntegralType>(request, response), integralType); 
		model.addAttribute("page", page);
		return "modules/integraltype/integralTypeList";
	}

	@RequiresPermissions("integraltype:integralType:view")
	@RequestMapping(value = "form")
	public String form(IntegralType integralType, Model model) {
		model.addAttribute("integralType", integralType);
		return "modules/integraltype/integralTypeForm";
	}

	@RequiresPermissions("integraltype:integralType:edit")
	@RequestMapping(value = "save")
	public String save(IntegralType integralType, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, integralType)){
			return form(integralType, model);
		}
		integralTypeService.save(integralType);
		addMessage(redirectAttributes, "保存积分商城类型成功");
		return "redirect:"+Global.getAdminPath()+"/integraltype/integralType/?repage";
	}
	
	@RequiresPermissions("integraltype:integralType:edit")
	@RequestMapping(value = "delete")
	public String delete(IntegralType integralType, RedirectAttributes redirectAttributes) {
		/**
		 * 删除相关联的所有的商品
		 *//*
		integralTypeDao.deleteCommodity(integralType.getId());*/
		/**
		 * 将旗下的商品的状态改为售罄 未上架
		 */
		List<IntegralCommodity> list=integralCommodityDao.findAllCommodity(integralType.getId());
		for (IntegralCommodity integralCommodity : list) {
			integralCommodity.setStatus("2");
			integralCommodityDao.deleteCommodity(integralCommodity);
		}
		/*integralTypeDao.deleteCommodity(integralType.getId());*/
		integralTypeService.delete(integralType);
		addMessage(redirectAttributes, "删除积分商城类型成功");
		return "redirect:"+Global.getAdminPath()+"/integraltype/integralType/?repage";
	}

}