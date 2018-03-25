/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.integraltype.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 积分商城类型Entity
 * @author cxb
 * @version 2016-12-28
 */
public class IntegralType extends DataEntity<IntegralType> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// name
	
	public IntegralType() {
		super();
	}

	public IntegralType(String id){
		super(id);
	}

	@Length(min=1, max=50, message="name长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
}