/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.winrule.web;

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
import com.thinkgem.jeesite.modules.winrule.entity.Winrule;
import com.thinkgem.jeesite.modules.winrule.service.WinruleService;

/**
 * 抽奖规则Controller
 * @author cxb
 * @version 2016-12-26
 */
@Controller
@RequestMapping(value = "${adminPath}/winrule/winrule")
public class WinruleController extends BaseController {

	@Autowired
	private WinruleService winruleService;
	
	@ModelAttribute
	public Winrule get(@RequestParam(required=false) String id) {
		Winrule entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = winruleService.get(id);
		}
		if (entity == null){
			entity = new Winrule();
		}
		return entity;
	}
	
	@RequiresPermissions("winrule:winrule:view")
	@RequestMapping(value = {"list", ""})
	public String list(Winrule winrule, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Winrule> page = winruleService.findPage(new Page<Winrule>(request, response), winrule); 
		model.addAttribute("page", page);
		return "modules/winrule/winruleList";
	}

	@RequiresPermissions("winrule:winrule:view")
	@RequestMapping(value = "form")
	public String form(Winrule winrule, Model model) {
		model.addAttribute("winrule", winrule);
		return "modules/winrule/winruleForm";
	}

	@RequiresPermissions("winrule:winrule:edit")
	@RequestMapping(value = "save")
	public String save(Winrule winrule, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, winrule)){
			return form(winrule, model);
		}
		winruleService.save(winrule);
		addMessage(redirectAttributes, "保存抽奖规则成功");
		return "redirect:"+Global.getAdminPath()+"/winrule/winrule/?repage";
	}
	
	@RequiresPermissions("winrule:winrule:edit")
	@RequestMapping(value = "delete")
	public String delete(Winrule winrule, RedirectAttributes redirectAttributes) {
		winruleService.delete(winrule);
		addMessage(redirectAttributes, "删除抽奖规则成功");
		return "redirect:"+Global.getAdminPath()+"/winrule/winrule/?repage";
	}

}