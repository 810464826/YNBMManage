/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.commission.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 提成记录Entity
 * @author tanghaobo
 * @version 2016-10-14
 */
public class Commission extends DataEntity<Commission> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// 用户编号
	private String ordernum;		// 购买订单号
	private String orderUserid;		// 购买者的用户编号
	private String level;		// 属于第几级提成
	private String money;		// 提成的金额
	private String createTime;		// 生成时间
	private String endTime;		// 查询结束时间
	
	public Commission() {
		super();
	}

	public Commission(String id){
		super(id);
	}

	@Length(min=1, max=10, message="用户编号长度必须介于 1 和 10 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=1, max=50, message="购买订单号长度必须介于 1 和 50 之间")
	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	
	@Length(min=1, max=10, message="购买者的用户编号长度必须介于 1 和 10 之间")
	public String getOrderUserid() {
		return orderUserid;
	}

	public void setOrderUserid(String orderUserid) {
		this.orderUserid = orderUserid;
	}
	
	@Length(min=1, max=10, message="属于第几级提成长度必须介于 1 和 10 之间")
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}
	
	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}
	
	@Length(min=1, max=50, message="生成时间长度必须介于 1 和 50 之间")
	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
}