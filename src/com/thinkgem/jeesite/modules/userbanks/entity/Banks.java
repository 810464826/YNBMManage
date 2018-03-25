/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.userbanks.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 用户银行信息Entity
 * @author tanghaobo
 * @version 2016-10-25
 */
public class Banks extends DataEntity<Banks> {
	
	private static final long serialVersionUID = 1L;
	private String userid;		// 关联的用户id
	private String bankname;		// 银行名称
	private String banknum;		// 银行卡号
	private String username;		// 用户姓名
	private String phone;		// 用户电话
	private String createTime;		// 生成时间
	
	public Banks() {
		super();
	}

	public Banks(String id){
		super(id);
	}

	@Length(min=1, max=11, message="关联的用户id长度必须介于 1 和 11之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	@Length(min=1, max=50, message="银行名称长度必须介于 1 和 50 之间")
	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}
	
	@Length(min=1, max=256, message="银行卡号长度必须介于 1 和 256 之间")
	public String getBanknum() {
		return banknum;
	}

	public void setBanknum(String banknum) {
		this.banknum = banknum;
	}
	
	@Length(min=1, max=50, message="用户姓名长度必须介于 1 和 50 之间")
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	@Length(min=1, max=50, message="用户电话长度必须介于 1 和 50 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@Length(min=1, max=50, message="生成时间长度必须介于 1 和 50 之间")
	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
}