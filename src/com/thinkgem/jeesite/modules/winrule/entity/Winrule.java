/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.winrule.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 抽奖规则Entity
 * @author cxb
 * @version 2016-12-26
 */
public class Winrule extends DataEntity<Winrule> {
	
	private static final long serialVersionUID = 1L;
	private String backimage;		// 背景图片
	private String pointimage;		// 指针图片
	
	public Winrule() {
		super();
	}

	public Winrule(String id){
		super(id);
	}

	@Length(min=0, max=5000, message="背景图片长度必须介于 0 和 5000 之间")
	public String getBackimage() {
		return backimage;
	}

	public void setBackimage(String backimage) {
		this.backimage = backimage;
	}
	
	@Length(min=0, max=5000, message="指针图片长度必须介于 0 和 5000 之间")
	public String getPointimage() {
		return pointimage;
	}

	public void setPointimage(String pointimage) {
		this.pointimage = pointimage;
	}
	
}