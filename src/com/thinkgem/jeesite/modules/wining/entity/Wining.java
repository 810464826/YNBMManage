/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.wining.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 中奖管理Entity
 * @author cxb
 * @version 2016-12-26
 */
public class Wining extends DataEntity<Wining> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 中奖名
	private String startdeg;		// 开始的角度
	private String enddeg;		// 结束的角度
	private String size;		// 角度大小   总和360
	private String posibility;		// 概率  总和为1
	
	public Wining() {
		super();
	}

	public Wining(String id){
		super(id);
	}

	@Length(min=1, max=50, message="中奖名长度必须介于 1 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=50, message="开始的角度长度必须介于 0 和 50 之间")
	public String getStartdeg() {
		return startdeg;
	}

	public void setStartdeg(String startdeg) {
		this.startdeg = startdeg;
	}
	
	@Length(min=0, max=50, message="结束的角度长度必须介于 0 和 50 之间")
	public String getEnddeg() {
		return enddeg;
	}

	public void setEnddeg(String enddeg) {
		this.enddeg = enddeg;
	}
	
	@Length(min=0, max=50, message="角度大小   总和360长度必须介于 0 和 50 之间")
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}
	
	@Length(min=0, max=50, message="概率  总和为1长度必须介于 0 和 50 之间")
	public String getPosibility() {
		return posibility;
	}

	public void setPosibility(String posibility) {
		this.posibility = posibility;
	}
	
}