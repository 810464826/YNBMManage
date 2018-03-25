/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.lunbo.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 手机端轮播图片Entity
 * @author huanglian
 * @version 2016-09-24
 */
public class Lunbo extends DataEntity<Lunbo> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 轮播图片名称
	private String picture;		// 轮播图片
	private String urls;		// 图片链接
	
	public Lunbo() {
		super();
	}

	public Lunbo(String id){
		super(id);
	}

	@Length(min=0, max=500, message="轮播图片名称长度必须介于 0 和 500 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=256, message="轮播图片长度必须介于 0 和 256 之间")
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	@Length(min=1, max=256, message="图片链接长度必须介于 1 和 256 之间")
	public String getUrls() {
		return urls;
	}

	public void setUrls(String urls) {
		this.urls = urls;
	}
	
}