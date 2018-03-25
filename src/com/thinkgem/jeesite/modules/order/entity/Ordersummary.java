/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.order.entity;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.google.common.collect.Lists;
import com.thinkgem.jeesite.common.persistence.DataEntity;
import com.thinkgem.jeesite.modules.cartitem.entity.Cartitem;
import com.thinkgem.jeesite.modules.shop.entity.Commodity;

/**
 * 订单管理Entity
 * @author lucio
 * @version 2016-06-12
 */
public class Ordersummary extends DataEntity<Ordersummary> {
	
	private static final long serialVersionUID = 1L;
	private String ordernum;		// 订单号
	private String price;		// 订单金额
	private String userid;		// 用户id
	private Integer addressid;		// 地址id
	private Integer invoicetype;		// 发票类型
	private String invoicedesc;		// 发票描述
	private Integer expresstime;		// 送货时间
	private String status;		// 状态
	private String orderdesc;		// 订单备注
	private String yunfei;		// 运费
	private String expresscomp;		// 快递公司
	private String expressno;		// 快递单号
	private Date fahuotime;		// 发货时间
	private Date paytime;		// 支付时间
	private Date donetime;		// 订单完成时间
	private Date createTime;		// 下单时间
	private String reason;		// 退货理由
	private String reasontext;		// 详细退货理由
	private Date updateTime;		// 更新时间
	private String province;
	private String city;
	private String county;
	private String address;
	private String phone;
	private String username;  //收货人姓名
	private List<Map<String,Object>> goodsList = Lists.newArrayList();
	
	private String shopId;
	
	public String getShopId() {
		return shopId;
	}
	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public List<Map<String, Object>> getGoodsList() {
		return goodsList;
	}
	public void addGoodsList(Map<String,Object> goods) {
		this.goodsList.add(goods);
	}
	public void setGoodsList(List<Map<String, Object>> goodsList) {
		this.goodsList = goodsList;
	}
	private List<Cartitem> cartitemList = Lists.newArrayList();
	private List<Commodity> commodityList = Lists.newArrayList();
	
	
	public List<Cartitem> getCartitemList() {
		return cartitemList;
	}

	public void setCartitemList(List<Cartitem> cartitemList) {
		this.cartitemList = cartitemList;
	}

	public List<Commodity> getCommodityList() {
		return commodityList;
	}

	public void setCommodityList(List<Commodity> commodityList) {
		this.commodityList = commodityList;
	}

	public String getProvince() {
		return province;
	}

	public void setProvince(String province) {
		this.province = province;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCounty() {
		return county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	
	
	public Ordersummary() {
		super();
	}

	public Ordersummary(String id){
		super(id);
	}

	@Length(min=1, max=50, message="订单号长度必须介于 1 和 50 之间")
	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	
	@NotNull(message="订单金额不能为空")
	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	@Length(min=1, max=10, message="用户id长度必须介于 1 和 10 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@NotNull(message="地址id不能为空")
	public Integer getAddressid() {
		return addressid;
	}

	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}
	
	@NotNull(message="发票类型不能为空")
	public Integer getInvoicetype() {
		return invoicetype;
	}

	public void setInvoicetype(Integer invoicetype) {
		this.invoicetype = invoicetype;
	}
	
	@Length(min=0, max=512, message="发票描述长度必须介于 0 和 512 之间")
	public String getInvoicedesc() {
		return invoicedesc;
	}

	public void setInvoicedesc(String invoicedesc) {
		this.invoicedesc = invoicedesc;
	}
	
	@NotNull(message="送货时间不能为空")
	public Integer getExpresstime() {
		return expresstime;
	}

	public void setExpresstime(Integer expresstime) {
		this.expresstime = expresstime;
	}
	
	@Length(min=1, max=10, message="状态长度必须介于 1 和 10 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=512, message="订单备注长度必须介于 0 和 512 之间")
	public String getOrderdesc() {
		return orderdesc;
	}

	public void setOrderdesc(String orderdesc) {
		this.orderdesc = orderdesc;
	}
	
	@Length(min=0, max=10, message="运费长度必须介于 0 和 10 之间")
	public String getYunfei() {
		return yunfei;
	}

	public void setYunfei(String yunfei) {
		this.yunfei = yunfei;
	}
	
	@Length(min=0, max=50, message="快递公司长度必须介于 0 和 50 之间")
	public String getExpresscomp() {
		return expresscomp;
	}

	public void setExpresscomp(String expresscomp) {
		this.expresscomp = expresscomp;
	}
	
	@Length(min=0, max=50, message="快递单号长度必须介于 0 和 50 之间")
	public String getExpressno() {
		return expressno;
	}

	public void setExpressno(String expressno) {
		this.expressno = expressno;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getFahuotime() {
		return fahuotime;
	}

	public void setFahuotime(Date fahuotime) {
		this.fahuotime = fahuotime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getPaytime() {
		return paytime;
	}

	public void setPaytime(Date paytime) {
		this.paytime = paytime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getDonetime() {
		return donetime;
	}

	public void setDonetime(Date donetime) {
		this.donetime = donetime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="下单时间不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Length(min=0, max=512, message="退货理由长度必须介于 0 和 512 之间")
	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}
	
	@Length(min=0, max=512, message="详细退货理由长度必须介于 0 和 512 之间")
	public String getReasontext() {
		return reasontext;
	}

	public void setReasontext(String reasontext) {
		this.reasontext = reasontext;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public void addCommodity(Commodity commodity) {
		this.commodityList.add(commodity);
	}
	public void addCartitem(Cartitem cartitem) {
		this.cartitemList.add(cartitem);
	}
	
}