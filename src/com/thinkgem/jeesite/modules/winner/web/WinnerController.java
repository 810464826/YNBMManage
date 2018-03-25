/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.winner.web;

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
import com.thinkgem.jeesite.modules.winner.entity.Winner;
import com.thinkgem.jeesite.modules.winner.service.WinnerService;

/**
 * 中奖记录Controller
 * @author 陈小兵
 * @version 2016-12-27
 */
@Controller
@RequestMapping(value = "${adminPath}/winner/winner")
public class WinnerController extends BaseController {

	@Autowired
	private WinnerService winnerService;
	
	@ModelAttribute
	public Winner get(@RequestParam(required=false) String id) {
		Winner entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = winnerService.get(id);
		}
		if (entity == null){
			entity = new Winner();
		}
		return entity;
	}
	
	@RequiresPermissions("winner:winner:view")
	@RequestMapping(value = {"list", ""})
	public String list(Winner winner, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Winner> page = winnerService.findPage(new Page<Winner>(request, response), winner); 
		model.addAttribute("page", page);
		return "modules/winner/winnerList";
	}

	@RequiresPermissions("winner:winner:view")
	@RequestMapping(value = "form")
	public String form(Winner winner, Model model) {
		model.addAttribute("winner", winner);
		return "modules/winner/winnerForm";
	}

	@RequiresPermissions("winner:winner:edit")
	@RequestMapping(value = "save")
	public String save(Winner winner, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, winner)){
			return form(winner, model);
		}
		winnerService.save(winner);
		addMessage(redirectAttributes, "保存中奖记录成功");
		return "redirect:"+Global.getAdminPath()+"/winner/winner/?repage";
	}
	
	@RequiresPermissions("winner:winner:edit")
	@RequestMapping(value = "delete")
	public String delete(Winner winner, RedirectAttributes redirectAttributes) {
		winnerService.delete(winner);
		addMessage(redirectAttributes, "删除中奖记录成功");
		return "redirect:"+Global.getAdminPath()+"/winner/winner/?repage";
	}

}