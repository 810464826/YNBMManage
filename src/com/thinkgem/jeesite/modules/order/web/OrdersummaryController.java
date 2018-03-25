/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.web;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.DateUtils;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.utils.excel.ExportExcel;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.modules.order.entity.Ordersummary;
import com.thinkgem.jeesite.modules.order.service.OrdersummaryService;
import com.thinkgem.jeesite.modules.sys.entity.User;
import com.thinkgem.jeesite.modules.sys.utils.DictUtils;
import com.thinkgem.jeesite.modules.sys.utils.UserUtils;

/**
 * 订单管理Controller
 * 
 * @author lucio
 * @version 2016-06-12
 */
@Controller
@RequestMapping(value = "${adminPath}/order/ordersummary")
public class OrdersummaryController extends BaseController {

	private static Logger log = LoggerFactory.getLogger(OrdersummaryController.class);

	@Autowired
	private OrdersummaryService ordersummaryService;

	@ModelAttribute
	public Ordersummary get(@RequestParam(required = false) String id) {
		Ordersummary entity = null;
		if (StringUtils.isNotBlank(id)) {
			entity = ordersummaryService.get(id);
//			for (int i = 0; i < entity.getCommodityList().size(); i++) {
//				if(entity.getCommodityList().get(i).getCommodityType().equals("0")){
//					entity.getCommodityList().get(i).setCommodityType(entity.getCommodityList().get(i).getBoxtitle0());
//					entity.getCommodityList().get(i).setMember(entity.getCommodityList().get(i).getMember0().toString());
//				}
//				if(entity.getCommodityList().get(i).getCommodityType().equals("1")){
//					entity.getCommodityList().get(i).setCommodityType(entity.getCommodityList().get(i).getBoxtitle1());
//					entity.getCommodityList().get(i).setMember(entity.getCommodityList().get(i).getMember1().toString());
//				}
//				if(entity.getCommodityList().get(i).getCommodityType().equals("2")){
//					entity.getCommodityList().get(i).setCommodityType(entity.getCommodityList().get(i).getBoxtitle2());
//					entity.getCommodityList().get(i).setMember(entity.getCommodityList().get(i).getMember2().toString());
//				}
//			}
		}
		if (entity == null) {
			entity = new Ordersummary();
		}
		return entity;
	}

	@RequiresPermissions("order:ordersummary:view")
	@RequestMapping(value = { "list", "" })
	public String list(Ordersummary ordersummary, HttpServletRequest request, HttpServletResponse response,
			Model model) {
		Page<Ordersummary> page = ordersummaryService.findPage(new Page<Ordersummary>(request, response), ordersummary);
		model.addAttribute("page", page);
		User currentUser = UserUtils.getUser();
		if (currentUser.getId().equals("1")) {
			model.addAttribute("admin", 1);
		}
		return "modules/order/ordersummaryList";
	}

	@RequiresPermissions("order:ordersummary:view")
	@RequestMapping(value = "form")
	public String form(Ordersummary ordersummary, Model model) {
		model.addAttribute("ordersummary", ordersummary);
		return "modules/order/ordersummaryForm";
	}

	@RequiresPermissions("order:ordersummary:edit")
	@RequestMapping(value = "save")
	public String save(Ordersummary ordersummary, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, ordersummary)) {
			return form(ordersummary, model);
		}
		ordersummaryService.save(ordersummary);
		addMessage(redirectAttributes, "保存订单管理成功");
		return "redirect:" + Global.getAdminPath() + "/order/ordersummary/?repage";
	}

	@RequiresPermissions("order:ordersummary:edit")
	@RequestMapping(value = "delete")
	public String delete(Ordersummary ordersummary, RedirectAttributes redirectAttributes) {
		ordersummaryService.delete(ordersummary);
		addMessage(redirectAttributes, "删除订单管理成功");
		return "redirect:" + Global.getAdminPath() + "/order/ordersummary/?repage";
	}

	/**
	 * 导出订单数据
	 * 
	 * @param ordersummary
	 * @param request
	 * @param response
	 * @param redirectAttributes
	 * @return
	 */
	@RequiresPermissions("order:ordersummary:view")
	@RequestMapping(value = "export", method = RequestMethod.POST)
	public String exportNum(Ordersummary ordersummary, HttpServletRequest request, HttpServletResponse response,
			RedirectAttributes redirectAttributes) {
		try {
			String fileName = "订单数据" + DateUtils.getDate("yyyyMMddHHmmss") + ".xlsx";

			List<String> headerList = Lists.newArrayList();
			headerList.add("订单号");
			headerList.add("订单金额");
			headerList.add("下单时间");
			headerList.add("订单状态");
			headerList.add("收件人");
			headerList.add("收件地址");
			headerList.add("收件人电话");
			headerList.add("发票类型");
			headerList.add("发票描述");
			headerList.add("送货时间");
			headerList.add("订单备注");
			headerList.add("快递公司");
			headerList.add("快递单号");
			headerList.add("发货时间");
			headerList.add("商品名称");
			headerList.add("套装名称");
			headerList.add("商品单价");
			headerList.add("商品数量");
			List<Map<String, Object>> dataList = ordersummaryService.findOrderNumByAddressId(ordersummary);
			ExportExcel ee = new ExportExcel("订单数据", headerList);			
			for (int i = 0; i < dataList.size(); i++) {
				Row row = ee.addRow();
					ee.addCell(row, 0, dataList.get(i).get("orderNum"));
					// 支付金额
					BigDecimal re1 = new BigDecimal((char[]) dataList.get(i).get("price"));
					BigDecimal re2 = new BigDecimal(Float.toString(100.00f));
					Float aa = re1.multiply(re2).floatValue();
					String total_fee = String.valueOf(aa);
					String[] smill = total_fee.split("\\.");
					total_fee = smill[0];
					
					ee.addCell(row, 1, total_fee);
					ee.addCell(row, 2, dataList.get(i).get("create_time"));
					Object status = dataList.get(i).get("status");
					ee.addCell(row, 3, DictUtils.getDictLabel(null == status?null:status.toString(), "order_status", ""));
					ee.addCell(row, 4, dataList.get(i).get("username"));
					String province = dataList.get(i).get("province").toString();
					String city = dataList.get(i).get("city").toString();
					String county = dataList.get(i).get("county").toString();
					ee.addCell(row, 5, province+city+county+dataList.get(i).get("address"));
					ee.addCell(row, 6, dataList.get(i).get("phone"));
					Object invoicetype = dataList.get(i).get("invoicetype");
					ee.addCell(row, 7, DictUtils.getDictLabel(null == invoicetype ? null:invoicetype.toString(), "invoicetype", ""));
					ee.addCell(row, 8, dataList.get(i).get("invoicedesc"));
					Object expresstime =dataList.get(i).get("expresstime");
					ee.addCell(row, 9, DictUtils.getDictLabel(null == expresstime ? null:expresstime.toString(), "expresstime", ""));
					ee.addCell(row, 10, dataList.get(i).get("orderdesc"));
					Object expresscomp =(String) dataList.get(i).get("expresscomp");
					ee.addCell(row, 11,DictUtils.getDictLabel(null == expresscomp ? null:expresscomp.toString(), "expresscomp", ""));
					ee.addCell(row, 12, dataList.get(i).get("expressno"));
					ee.addCell(row, 13, dataList.get(i).get("fahuotime"));
					ee.addCell(row, 14, dataList.get(i).get("name"));
					//判断套餐类型
					ee.addCell(row, 15, dataList.get(i).get("boxtitle"+dataList.get(i).get("commodityType").toString()));
					ee.addCell(row, 16, dataList.get(i).get("Member"+dataList.get(i).get("commodityType").toString()));
					ee.addCell(row, 17, dataList.get(i).get("total"));
			}
			System.out.println("！！！！！导出列表长度为："+dataList.size()+"！！！！！");
			ee.write(response, fileName).dispose();
			log.debug("Export success.");
			return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出信息失败！失败信息：" + e.getMessage());
		}
		return "redirect:" + adminPath + "/order/ordersummary/?repage";
	}
}