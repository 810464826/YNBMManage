/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.integralcommodity.web;

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
import com.thinkgem.jeesite.modules.integralcommodity.entity.IntegralCommodity;
import com.thinkgem.jeesite.modules.integralcommodity.service.IntegralCommodityService;
import com.thinkgem.jeesite.modules.integraltype.dao.IntegralTypeDao;
import com.thinkgem.jeesite.modules.integraltype.entity.IntegralType;

/**
 * 积分商城商品Controller
 * @author cxb
 * @version 2016-12-29
 */
@Controller
@RequestMapping(value = "${adminPath}/integralcommodity/integralCommodity")
public class IntegralCommodityController extends BaseController {

	@Autowired
	private IntegralCommodityService integralCommodityService;
	//用来查询所有的类型
	@Autowired
	private IntegralTypeDao integralTypeDao;
	@ModelAttribute
	public IntegralCommodity get(@RequestParam(required=false) String id) {
		IntegralCommodity entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = integralCommodityService.get(id);
		}
		if (entity == null){
			entity = new IntegralCommodity();
		}
		return entity;
	}
	
	@RequiresPermissions("integralcommodity:integralCommodity:view")
	@RequestMapping(value = {"list", ""})
	public String list(IntegralCommodity integralCommodity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<IntegralCommodity> page = integralCommodityService.findPage(new Page<IntegralCommodity>(request, response), integralCommodity); 
		List<IntegralType> typeList=integralTypeDao.findTypes();
		model.addAttribute("typeList", typeList);
		model.addAttribute("page", page);
		return "modules/integralcommodity/integralCommodityList";
	}

	@RequiresPermissions("integralcommodity:integralCommodity:view")
	@RequestMapping(value = "form")
	public String form(IntegralCommodity integralCommodity, Model model) {
		model.addAttribute("integralCommodity", integralCommodity);
		List<IntegralType> typeList=integralTypeDao.findTypes();
		model.addAttribute("typeList", typeList);
		return "modules/integralcommodity/integralCommodityForm";
	}

	@RequiresPermissions("integralcommodity:integralCommodity:edit")
	@RequestMapping(value = "save")
	public String save(IntegralCommodity integralCommodity, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, integralCommodity)){
			return form(integralCommodity, model);
		}
		integralCommodityService.save(integralCommodity);
		addMessage(redirectAttributes, "保存积分商城商品成功");
		return "redirect:"+Global.getAdminPath()+"/integralcommodity/integralCommodity/?repage";
	}
	
	@RequiresPermissions("integralcommodity:integralCommodity:edit")
	@RequestMapping(value = "delete")
	public String delete(IntegralCommodity integralCommodity, RedirectAttributes redirectAttributes) {
		integralCommodityService.delete(integralCommodity);
		addMessage(redirectAttributes, "删除积分商城商品成功");
		return "redirect:"+Global.getAdminPath()+"/integralcommodity/integralCommodity/?repage";
	}

}