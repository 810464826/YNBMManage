/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.winner.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 中奖记录Entity
 * @author 陈小兵
 * @version 2016-12-27
 */
public class Winner extends DataEntity<Winner> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 中奖名
	private String userid;		// 中奖者的id
	
	public Winner() {
		super();
	}

	public Winner(String id){
		super(id);
	}

	@Length(min=1, max=50, message="中奖名长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=1, max=50, message="中奖者的id长度必须介于 1 和 50 之间")
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
}