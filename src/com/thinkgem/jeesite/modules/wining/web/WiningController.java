/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wining.web;

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
import com.thinkgem.jeesite.modules.wining.entity.Wining;
import com.thinkgem.jeesite.modules.wining.service.WiningService;

/**
 * 中奖管理Controller
 * @author cxb
 * @version 2016-12-26
 */
@Controller
@RequestMapping(value = "${adminPath}/wining/wining")
public class WiningController extends BaseController {

	@Autowired
	private WiningService winingService;
	
	@ModelAttribute
	public Wining get(@RequestParam(required=false) String id) {
		Wining entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = winingService.get(id);
		}
		if (entity == null){
			entity = new Wining();
		}
		return entity;
	}
	
	@RequiresPermissions("wining:wining:view")
	@RequestMapping(value = {"list", ""})
	public String list(Wining wining, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Wining> page = winingService.findPage(new Page<Wining>(request, response), wining); 
		model.addAttribute("page", page);
		return "modules/wining/winingList";
	}

	@RequiresPermissions("wining:wining:view")
	@RequestMapping(value = "form")
	public String form(Wining wining, Model model) {
		model.addAttribute("wining", wining);
		return "modules/wining/winingForm";
	}

	@RequiresPermissions("wining:wining:edit")
	@RequestMapping(value = "save")
	public String save(Wining wining, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, wining)){
			return form(wining, model);
		}
		winingService.save(wining);
		addMessage(redirectAttributes, "保存中奖管理成功");
		return "redirect:"+Global.getAdminPath()+"/wining/wining/?repage";
	}
	
	@RequiresPermissions("wining:wining:edit")
	@RequestMapping(value = "delete")
	public String delete(Wining wining, RedirectAttributes redirectAttributes) {
		winingService.delete(wining);
		addMessage(redirectAttributes, "删除中奖管理成功");
		return "redirect:"+Global.getAdminPath()+"/wining/wining/?repage";
	}

}