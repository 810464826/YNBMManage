/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shop.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.alibaba.fastjson.JSON;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.modules.shop.entity.Commodity;
import com.thinkgem.jeesite.modules.shop.service.CommodityService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;
import com.thinkgem.jeesite.test.entity.TestTree;
import com.thinkgem.jeesite.test.service.TestTreeService;

/**
 * 商品管理Controller
 * @author 陈小兵
 * @version 2016-12-21
 */
@Controller
@RequestMapping(value = "${adminPath}/shop/commodity")
public class CommodityController extends BaseController {

	@Autowired
	private CommodityService commodityService;
	
	@Autowired
	private TestTreeService testTreeService;
	@ModelAttribute
	public Commodity get(@RequestParam(required=false) String id) {
		Commodity entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = commodityService.get(id);
		}
		if (entity == null){
			entity = new Commodity();
		}
		return entity;
	}
	
	@RequiresPermissions("shop:commodity:view")
	@RequestMapping(value = {"list", ""})
	public String list(Commodity commodity, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Commodity> page = commodityService.findPage(new Page<Commodity>(request, response), commodity); 
		model.addAttribute("page", page);
		model.addAttribute("TopList", testTreeService.findTopList());
		User currentUser = UserUtils.getUser();
		if (currentUser.getId().equals("1")) {
			model.addAttribute("admin", 1);
		}
		return "modules/shop/commodityList";
	}

	@RequiresPermissions("shop:commodity:view")
	@RequestMapping(value = "form")
	public String form(Commodity commodity, Model model) {
		model.addAttribute("commodity", commodity);
		model.addAttribute("TopList", testTreeService.findTopList());
		return "modules/shop/commodityForm";
	}

	@RequiresPermissions("shop:commodity:edit")
	@RequestMapping(value = "save")
	public String save(Commodity commodity, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, commodity)){
			return form(commodity, model);
		}
		commodityService.save(commodity);
		addMessage(redirectAttributes, "保存商品成功");
		return "redirect:"+Global.getAdminPath()+"/shop/commodity/?repage";
	}
	
	@RequiresPermissions("shop:commodity:edit")
	@RequestMapping(value = "delete")
	public String delete(Commodity commodity, RedirectAttributes redirectAttributes) {
		commodityService.delete(commodity);
		addMessage(redirectAttributes, "删除商品成功");
		return "redirect:"+Global.getAdminPath()+"/shop/commodity/?repage";
	}
	/**
	 * 加载二级商品类别
	 */
	@RequestMapping(value="/goTwo")
	public Object goTwo(HttpServletRequest request, HttpServletResponse response,
						@RequestParam(value = "PARENTID", required = true) String PARENTID)  
						throws Exception{
		List <TestTree> TwoList = testTreeService.findTwoList(PARENTID);
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("result", TwoList);
		JsonWriteSupport w = new JsonWriteSupport();
		w.renderData(response, JSON.toJSONString(modelMap));
		return null;
	}
}