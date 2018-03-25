/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.application.web;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

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
import com.thinkgem.jeesite.modules.application.entity.Application;
import com.thinkgem.jeesite.modules.application.service.ApplicationService;
import com.thinkgem.jeesite.modules.member.entity.Member;
import com.thinkgem.jeesite.modules.member.service.MemberService;

/**
 * 打款申请及打款Controller
 * @author tanghaobo
 * @version 2016-10-17
 */
@Controller
@RequestMapping(value = "${adminPath}/application/application")
public class ApplicationController extends BaseController {

	@Autowired
	private ApplicationService applicationService;
	@Autowired
	private MemberService memberService;
	
	
	@ModelAttribute
	public Application get(@RequestParam(required=false) String id) {
		Application entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = applicationService.get(id);
		}
		if (entity == null){
			entity = new Application();
		}
		return entity;
	}
	
	@RequiresPermissions("application:application:view")
	@RequestMapping(value = {"list", ""})
	public String list(Application application, HttpServletRequest request, HttpServletResponse response, Model model) {
		String startTime = request.getParameter("startDate");
		application.setCreateTime(startTime);
		String endTime = request.getParameter("endDate");
		application.setUpdateTime(endTime);
		Page<Application> page = applicationService.findPage(new Page<Application>(request, response), application); 
		model.addAttribute("page", page);
		return "modules/application/applicationList";
	}

	@RequiresPermissions("application:application:view")
	@RequestMapping(value = "form")
	public String form(Application application, Model model) {
		model.addAttribute("application", application);
		return "modules/application/applicationForm";
	}

	@RequiresPermissions("application:application:edit")
	@RequestMapping(value = "save")
	public String save(Application application, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, application)){
			return form(application, model);
		}
		if(application.getPayment().equals("1")){
			Date date = new Date();
			String dateStr = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
			application.setUpdateTime(dateStr);
			applicationService.save(application);
			String userId = application.getUserId();
			String money = application.getMoney();
			
			//根据ID查询出用户
			Member member = memberService.get(userId);
			memberService.save(member);
		}
		if(application.getPayment().equals("2")){
			Date date = new Date();
			String dateStr = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(date);
			application.setUpdateTime(dateStr);
			applicationService.save(application);
			String userId = application.getUserId();
			Member member = memberService.get(userId);
			String memMoney = member.getCommission();
			String money = application.getMoney();
			BigDecimal b1 = new BigDecimal(memMoney);//总额度
			BigDecimal b2 = new BigDecimal(money);
			double number = b1.add(b2).doubleValue();
			String overMoney = String.valueOf(number);
			member.setCommission(overMoney);
			memberService.save(member);
		}
		addMessage(redirectAttributes, "保存申请成功");
		return "redirect:"+Global.getAdminPath()+"/application/application/?repage";
	}
	
	@RequiresPermissions("application:application:edit")
	@RequestMapping(value = "delete")
	public String delete(Application application, RedirectAttributes redirectAttributes) {
		applicationService.delete(application);
		addMessage(redirectAttributes, "删除申请成功");
		return "redirect:"+Global.getAdminPath()+"/application/application/?repage";
	}

}