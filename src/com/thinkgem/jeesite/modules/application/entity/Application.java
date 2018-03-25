/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.application.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 打款申请及打款Entity
 * @author tanghaobo
 * @version 2016-10-17
 */
/**
 * 打款申请及打款Entity
 * @author tanghaobo
 * @version 2016-10-17
 */
public class Application extends DataEntity<Application> {
	
	private static final long serialVersionUID = 1L;
	private String userId;		// 申请人ID
	private String money;		// 申请提成的金额
	private String review;		// 审核状态，0是未审核，1是审核通过，2是审核不通过
	private String payment;		// 打款状态，0是未打款，1是已打款，2是其它状态
	private String contents1;		// 非必填的内容1
	private String contents2;		// 非必填的内容2
	private String createTime;		// 生成时间
	private String updateTime;		// 修改时间
	private String review_time;     //审核时间
	private String account;			//申请账号
	private String username;		//申请人姓名
	private String phone;			//申请人电话
	private String bank; 			//银行类型
	public Application() {
		super();
	}

	public Application(String id){
		super(id);
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getMoney() {
		return money;
	}

	public void setMoney(String money) {
		this.money = money;
	}
	
	@Length(min=1, max=10, message="审核状态，0是未审核，1是审核通过，2是审核不通过长度必须介于 1 和 10 之间")
	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}
	
	@Length(min=1, max=10, message="打款状态，0是未打款，1是已打款，2是其它状态长度必须介于 1 和 10 之间")
	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}
	
	@Length(min=0, max=500, message="非必填的内容1长度必须介于 0 和 500 之间")
	public String getContents1() {
		return contents1;
	}

	public void setContents1(String contents1) {
		this.contents1 = contents1;
	}
	
	@Length(min=0, max=500, message="非必填的内容2长度必须介于 0 和 500 之间")
	public String getContents2() {
		return contents2;
	}

	public void setContents2(String contents2) {
		this.contents2 = contents2;
	}
	
	@Length(min=1, max=50, message="生成时间长度必须介于 1 和 50 之间")
	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	
	@Length(min=1, max=50, message="修改时间长度必须介于 1 和 50 之间")
	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getReview_time() {
		return review_time;
	}

	public void setReview_time(String review_time) {
		this.review_time = review_time;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}
	
}