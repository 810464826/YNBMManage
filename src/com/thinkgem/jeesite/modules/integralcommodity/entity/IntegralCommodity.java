/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.integralcommodity.entity;

import org.hibernate.validator.constraints.Length;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 积分商城商品Entity
 * @author cxb
 * @version 2016-12-29
 */
public class IntegralCommodity extends DataEntity<IntegralCommodity> {
	
	private static final long serialVersionUID = 1L;
	private String number;		// 库存
	private String name;		// 商品名
	private String picture;		// 商品图片
	private String integral;		// 所需积分
	private String typeid;		// 所属类别
	private String onepicture;		// 子图片1
	private String twopicture;		// twopicture
	private String threepicture;		// threepicture
	private String description;		// 商品描述
	private String status;		// 上架状态
	private Date createtime;		// 生产日期
	
	public IntegralCommodity() {
		super();
	}

	public IntegralCommodity(String id){
		super(id);
	}

	@Length(min=0, max=11, message="库存长度必须介于 0 和 11 之间")
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	@Length(min=0, max=50, message="商品名长度必须介于 0 和 50 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=50, message="商品图片长度必须介于 0 和 50 之间")
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	@Length(min=0, max=50, message="所需积分长度必须介于 0 和 50 之间")
	public String getIntegral() {
		return integral;
	}

	public void setIntegral(String integral) {
		this.integral = integral;
	}
	
	@Length(min=1, max=50, message="所属类别长度必须介于 1 和 50 之间")
	public String getTypeid() {
		return typeid;
	}

	public void setTypeid(String typeid) {
		this.typeid = typeid;
	}
	
	@Length(min=0, max=50, message="子图片1长度必须介于 0 和 50 之间")
	public String getOnepicture() {
		return onepicture;
	}

	public void setOnepicture(String onepicture) {
		this.onepicture = onepicture;
	}
	
	@Length(min=0, max=50, message="twopicture长度必须介于 0 和 50 之间")
	public String getTwopicture() {
		return twopicture;
	}

	public void setTwopicture(String twopicture) {
		this.twopicture = twopicture;
	}
	
	@Length(min=0, max=50, message="threepicture长度必须介于 0 和 50 之间")
	public String getThreepicture() {
		return threepicture;
	}

	public void setThreepicture(String threepicture) {
		this.threepicture = threepicture;
	}
	
	@Length(min=0, max=50, message="商品描述长度必须介于 0 和 50 之间")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Length(min=1, max=50, message="上架状态长度必须介于 1 和 50 之间")
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	
}