/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.lunbo.web;

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
import com.thinkgem.jeesite.modules.lunbo.entity.Lunbo;
import com.thinkgem.jeesite.modules.lunbo.service.LunboService;

/**
 * 手机端轮播图片Controller
 * @author huanglian
 * @version 2016-08-07
 */
@Controller
@RequestMapping(value = "${adminPath}/lunbo/lunbo")
public class LunboController extends BaseController {

	@Autowired
	private LunboService lunboService;
	
	@ModelAttribute
	public Lunbo get(@RequestParam(required=false) String id) {
		Lunbo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = lunboService.get(id);
		}
		if (entity == null){
			entity = new Lunbo();
		}
		return entity;
	}
	
	@RequiresPermissions("lunbo:lunbo:view")
	@RequestMapping(value = {"list", ""})
	public String list(Lunbo lunbo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Lunbo> page = lunboService.findPage(new Page<Lunbo>(request, response), lunbo); 
		model.addAttribute("page", page);
		return "modules/lunbo/lunboList";
	}

	@RequiresPermissions("lunbo:lunbo:view")
	@RequestMapping(value = "form")
	public String form(Lunbo lunbo, Model model) {
		model.addAttribute("lunbo", lunbo);
		return "modules/lunbo/lunboForm";
	}

	@RequiresPermissions("lunbo:lunbo:edit")
	@RequestMapping(value = "save")
	public String save(Lunbo lunbo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, lunbo)){
			return form(lunbo, model);
		}
		lunboService.save(lunbo);
		addMessage(redirectAttributes, "保存轮播图片成功");
		return "redirect:"+Global.getAdminPath()+"/lunbo/lunbo/?repage";
	}
	
	@RequiresPermissions("lunbo:lunbo:edit")
	@RequestMapping(value = "delete")
	public String delete(Lunbo lunbo, RedirectAttributes redirectAttributes) {
		lunboService.delete(lunbo);
		addMessage(redirectAttributes, "删除轮播图片成功");
		return "redirect:"+Global.getAdminPath()+"/lunbo/lunbo/?repage";
	}

}