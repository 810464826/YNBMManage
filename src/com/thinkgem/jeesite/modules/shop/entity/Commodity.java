/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.thinkgem.jeesite.modules.shop.entity;

import java.util.Date;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 商品管理Entity
 * @author 陈小兵
 * @version 2016-12-21
 */
public class Commodity extends DataEntity<Commodity> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 商品名称
	private String boxtitle0;		// 商品标题
	private String boxtitle1;		// 套装1名称
	private String boxtitle2;		// 套装2名称
	private String originalprice0;		// 原价
	private String originalprice1;		// 套装1原价
	private String originalprice2;		// 套装2原价
	private String buylimit0;		// 限购数
	private String buylimit1;		// 套装1限购数
	private String buylimit2;		// 套装2限购数
	private String member0;		// 会员价
	private String member1;		// 套装1会员价
	private String member2;		// 套装2会员价
	private String discount;		// 优惠说明
	private String description;		// 商品描述
	private String picture;		// 商品图片
	private String subpicture1;		// 子图片1
	private String subpicture2;		// 子图片2
	private String subpicture3;		// 子图片3
	private String subpicture4;		// 子图片4
	private String providerintroduce;		// providerintroduce
	private Date createTime;		// create_time
	private Date updateTime;		// update_time
	private String shelves;		// 上架状态:0是未上架,1是上架,2是售罄
	private String newtype;		// 新品分类:0是默认不是,1是新品分类
	private String buyer;		// 买手推荐:0是默认不是,1是买手推荐
	private String category;		// 商品类型id
	private String sales;		// 销量
	private String popularity;		// 人气量
	private String shopId;		// 商铺id
	
	private String shopName;    //商铺名
	
	private String type;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public Commodity() {
		super();
	}

	public Commodity(String id){
		super(id);
	}

	@Length(min=1, max=500, message="商品名称长度必须介于 1 和 500 之间")
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=500, message="商品标题长度必须介于 0 和 500 之间")
	public String getBoxtitle0() {
		return boxtitle0;
	}

	public void setBoxtitle0(String boxtitle0) {
		this.boxtitle0 = boxtitle0;
	}
	
	@Length(min=0, max=500, message="套装1名称长度必须介于 0 和 500 之间")
	public String getBoxtitle1() {
		return boxtitle1;
	}

	public void setBoxtitle1(String boxtitle1) {
		this.boxtitle1 = boxtitle1;
	}
	
	@Length(min=0, max=500, message="套装2名称长度必须介于 0 和 500 之间")
	public String getBoxtitle2() {
		return boxtitle2;
	}

	public void setBoxtitle2(String boxtitle2) {
		this.boxtitle2 = boxtitle2;
	}
	
	public String getOriginalprice0() {
		return originalprice0;
	}

	public void setOriginalprice0(String originalprice0) {
		this.originalprice0 = originalprice0;
	}
	
	public String getOriginalprice1() {
		return originalprice1;
	}

	public void setOriginalprice1(String originalprice1) {
		this.originalprice1 = originalprice1;
	}
	
	public String getOriginalprice2() {
		return originalprice2;
	}

	public void setOriginalprice2(String originalprice2) {
		this.originalprice2 = originalprice2;
	}
	
	@Length(min=0, max=11, message="限购数长度必须介于 0 和 11 之间")
	public String getBuylimit0() {
		return buylimit0;
	}

	public void setBuylimit0(String buylimit0) {
		this.buylimit0 = buylimit0;
	}
	
	@Length(min=0, max=11, message="套装1限购数长度必须介于 0 和 11 之间")
	public String getBuylimit1() {
		return buylimit1;
	}

	public void setBuylimit1(String buylimit1) {
		this.buylimit1 = buylimit1;
	}
	
	@Length(min=0, max=11, message="套装2限购数长度必须介于 0 和 11 之间")
	public String getBuylimit2() {
		return buylimit2;
	}

	public void setBuylimit2(String buylimit2) {
		this.buylimit2 = buylimit2;
	}
	
	public String getMember0() {
		return member0;
	}

	public void setMember0(String member0) {
		this.member0 = member0;
	}
	
	public String getMember1() {
		return member1;
	}

	public void setMember1(String member1) {
		this.member1 = member1;
	}
	
	public String getMember2() {
		return member2;
	}

	public void setMember2(String member2) {
		this.member2 = member2;
	}
	
	@Length(min=0, max=500, message="优惠说明长度必须介于 0 和 500 之间")
	public String getDiscount() {
		return discount;
	}

	public void setDiscount(String discount) {
		this.discount = discount;
	}
	
	@Length(min=0, max=1024, message="商品描述长度必须介于 0 和 1024 之间")
	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	@Length(min=0, max=256, message="商品图片长度必须介于 0 和 256 之间")
	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}
	
	@Length(min=0, max=256, message="子图片1长度必须介于 0 和 256 之间")
	public String getSubpicture1() {
		return subpicture1;
	}

	public void setSubpicture1(String subpicture1) {
		this.subpicture1 = subpicture1;
	}
	
	@Length(min=0, max=256, message="子图片2长度必须介于 0 和 256 之间")
	public String getSubpicture2() {
		return subpicture2;
	}

	public void setSubpicture2(String subpicture2) {
		this.subpicture2 = subpicture2;
	}
	
	@Length(min=0, max=256, message="子图片3长度必须介于 0 和 256 之间")
	public String getSubpicture3() {
		return subpicture3;
	}

	public void setSubpicture3(String subpicture3) {
		this.subpicture3 = subpicture3;
	}
	
	@Length(min=0, max=256, message="子图片4长度必须介于 0 和 256 之间")
	public String getSubpicture4() {
		return subpicture4;
	}

	public void setSubpicture4(String subpicture4) {
		this.subpicture4 = subpicture4;
	}
	
	public String getProviderintroduce() {
		return providerintroduce;
	}

	public void setProviderintroduce(String providerintroduce) {
		this.providerintroduce = providerintroduce;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@NotNull(message="create_time不能为空")
	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
	
	@Length(min=1, max=10, message="上架状态:0是未上架,1是上架,2是售罄长度必须介于 1 和 10 之间")
	public String getShelves() {
		return shelves;
	}

	public void setShelves(String shelves) {
		this.shelves = shelves;
	}
	
	@Length(min=0, max=10, message="新品分类:0是默认不是,1是新品分类长度必须介于 0 和 10 之间")
	public String getNewtype() {
		return newtype;
	}

	public void setNewtype(String newtype) {
		this.newtype = newtype;
	}
	
	@Length(min=0, max=10, message="买手推荐:0是默认不是,1是买手推荐长度必须介于 0 和 10 之间")
	public String getBuyer() {
		return buyer;
	}

	public void setBuyer(String buyer) {
		this.buyer = buyer;
	}
	
	@Length(min=0, max=500, message="商品类型id长度必须介于 0 和 500 之间")
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	@Length(min=1, max=11, message="销量长度必须介于 1 和 11 之间")
	public String getSales() {
		return sales;
	}

	public void setSales(String sales) {
		this.sales = sales;
	}
	
	@Length(min=1, max=11, message="人气量长度必须介于 1 和 11 之间")
	public String getPopularity() {
		return popularity;
	}

	public void setPopularity(String popularity) {
		this.popularity = popularity;
	}
	
	@Length(min=0, max=256, message="商铺id长度必须介于 0 和 256 之间")
	public String getShopId() {
		return shopId;
	}

	public void setShopId(String shopId) {
		this.shopId = shopId;
	}
	
}