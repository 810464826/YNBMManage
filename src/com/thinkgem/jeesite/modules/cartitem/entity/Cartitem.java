/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.cartitem.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
import javax.validation.constraints.NotNull;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 购物车Entity
 * @author huanglian
 * @version 2016-08-05
 */
public class Cartitem extends DataEntity<Cartitem> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// 用户id
	private String commodityid;		// 商品id
	private String commoditytype;		// 商品套餐类型0,1,2
	private String status;		// 购买状态,0购物车,1,下单,2支付,3发货,4签收,5完成
	private String total;		// 商品个数
	private String ordernum;		// 汇总订单号
	private Date createTime;		// 下单时间
	private String updateTime;		// update_time
	
	public Cartitem() {
		super();
	}

	public Cartitem(String id){
		super(id);
	}

	@Length(min=1, max=10, message="用户id长度必须介于 1 和 10 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=1, max=10, message="商品id长度必须介于 1 和 10 之间")
	public String getCommodityid() {
		return commodityid;
	}

	public void setCommodityid(String commodityid) {
		this.commodityid = commodityid;
	}
	
	@Length(min=1, max=10, message="商品套餐类型0,1,2长度必须介于 1 和 10 之间")
	public String getCommoditytype() {
		return commoditytype;
	}

	public void setCommoditytype(String commoditytype) {
		this.commoditytype = commoditytype;
	}
	
	@Length(min=1, max=10, message="购买状态,0购物车,1,下单,2支付,3发货,4签收,5完成长度必须介于 1 和 10 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=1, max=10, message="商品个数长度必须介于 1 和 10 之间")
	public String getTotal() {
		return total;
	}

	public void setTotal(String total) {
		this.total = total;
	}
	
	@Length(min=0, max=50, message="汇总订单号长度必须介于 0 和 50 之间")
	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="下单时间不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Length(min=0, max=50, message="update_time长度必须介于 0 和 50 之间")
	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
}