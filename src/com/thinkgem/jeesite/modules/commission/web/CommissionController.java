/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.commission.web;

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
import com.thinkgem.jeesite.modules.commission.entity.Commission;
import com.thinkgem.jeesite.modules.commission.service.CommissionService;

/**
 * 提成记录Controller
 * @author tanghaobo
 * @version 2016-10-14
 */
@Controller
@RequestMapping(value = "${adminPath}/commission/commission")
public class CommissionController extends BaseController {

	@Autowired
	private CommissionService commissionService;
	
	@ModelAttribute
	public Commission get(@RequestParam(required=false) String id) {
		Commission entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = commissionService.get(id);
		}
		if (entity == null){
			entity = new Commission();
		}
		return entity;
	}
	
	@RequiresPermissions("commission:commission:view")
	@RequestMapping(value = {"list", ""})
	public String list(Commission commission, HttpServletRequest request, HttpServletResponse response, Model model) {
		String startTime = request.getParameter("startDate");
		commission.setCreateTime(startTime);
		String endTime = request.getParameter("endDate");
		commission.setEndTime(endTime);
		Page<Commission> page = commissionService.findPage(new Page<Commission>(request, response), commission); 
		model.addAttribute("page", page);
		return "modules/commission/commissionList";
	}

	@RequiresPermissions("commission:commission:view")
	@RequestMapping(value = "form")
	public String form(Commission commission, Model model) {
		model.addAttribute("commission", commission);
		return "modules/commission/commissionForm";
	}

	@RequiresPermissions("commission:commission:edit")
	@RequestMapping(value = "save")
	public String save(Commission commission, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, commission)){
			return form(commission, model);
		}
		commissionService.save(commission);
		addMessage(redirectAttributes, "保存提成成功");
		return "redirect:"+Global.getAdminPath()+"/commission/commission/?repage";
	}
	
	@RequiresPermissions("commission:commission:edit")
	@RequestMapping(value = "delete")
	public String delete(Commission commission, RedirectAttributes redirectAttributes) {
		commissionService.delete(commission);
		addMessage(redirectAttributes, "删除提成成功");
		return "redirect:"+Global.getAdminPath()+"/commission/commission/?repage";
	}

}