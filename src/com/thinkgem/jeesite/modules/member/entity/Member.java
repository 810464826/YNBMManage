/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.member.entity;

import org.hibernate.validator.constraints.Length;
import javax.validation.constraints.NotNull;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

import com.thinkgem.jeesite.common.persistence.DataEntity;


/**
 * 会员管理Entity
 * @author lucio
 * @version 2016-08-01
 */
public class Member extends DataEntity<Member> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 用户名
	private String phone;		// 手机号
	private Integer level;		// 用户级别
	private Date createTime;		// 注册时间
	private String ordernum;		// 升级订单号
	private Date updateTime;		// 更新时间
	private String nickname;		// 昵称
	private String faceicon;		// 头像
	private Date payTime;		// 付款时间
	private String commission;  //申请提现金额
	private String parentId;   //上级用户
	private String openid;    //用户微信标识
	private String fullname;   //真实姓名
	private Integer integral;  //会员积分
	public Member() {
		super();
	}

	public Member(String id){
		super(id);
	}

	@Length(min=1, max=100, message="用户名长度必须介于 1 和 100 之间")
	public String getName() {
		return name;
	}

	public void setIntegral(Integer integral) {
		this.integral = integral;
	}
	
	public Integer getIntegral() {
		return integral;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	@Length(min=1, max=100, message="手机号长度必须介于 1 和 100 之间")
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	@NotNull(message="用户级别不能为空")
	public Integer getLevel() {
		return level;
	}

	public void setLevel(Integer level) {
		this.level = level;
	}
	
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Length(min=0, max=50, message="升级订单号长度必须介于 0 和 50 之间")
	public String getOrdernum() {
		return ordernum;
	}

	public void setOrdernum(String ordernum) {
		this.ordernum = ordernum;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	@Length(min=0, max=50, message="昵称长度必须介于 0 和 50 之间")
	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	@Length(min=0, max=1024, message="头像长度必须介于 0 和 1024 之间")
	public String getFaceicon() {
		return faceicon;
	}

	public void setFaceicon(String faceicon) {
		this.faceicon = faceicon;
	}
	
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}
	

	public String getCommission() {
		return commission;
	}

	public void setCommission(String commission) {
		this.commission = commission;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}
	
}