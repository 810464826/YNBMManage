<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.job.server.utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String adminFlag = (String) request.getSession().getAttribute(Constants.ADMIN_FLAG);
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>一家一盒</title>
<link rel="stylesheet" href="<%=basePath%>css/main.css" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>css/pccommon.css"
	type="text/css" />
<link rel="stylesheet" href="<%=basePath%>css/personCenter.css"
	type="text/css" />
</head>
<body>
	<header class="mainHeader">
	<div class="logo">
		<a href="<%=basePath%>index.html"> <img
			src="<%=basePath%>img_new/LOGO.png" alt="logo" />
		</a>
	</div>

	<ul class="header-icon">
		 <li>
                <a href="user/info">
                    <img src="<%=basePath%>img/personCenter/personCenterIcon.png" alt="personCenterIcon" title="个人中心" />
                </a>
            </li>
            <li class="header-shopIcon">
                <a href="cart/mycart">
                    <img src="<%=basePath%>img/personCenter/shoppingBusIcon.png" alt="shoppingBusIcon" title="去购物车"/>
                </a>
            </li>
	</ul>
	<ul class="header-nav">
		<li navName="account"><a href="user/info">账号管理</a></li>
		<li navName="orderInfo"><a href="order/info">订单管理</a></li>
		<li navName="address" class="header-nav-active"><a
			href="user/myaddress">地址管理</a></li>
		<li class="out"><a href="user/logout">安全退出登录</a></li>
	</ul>
	</header>
	<section id="main">
	<div class="contain" id="address">
		<ul>
			<li>
			<div class="rotate-box" id="12">
					<div class="box addr-box-size front" id="12Front"
						style="transform: rotateY(0deg);">
						<div class="box-header addr-box-header addr-gray">
							<div class="fl">
								<h2>收货人</h2>
							</div>
							<div class="fr defaultAddr hidden">
								<img src="<%=basePath%>img/personCenter/defaultAddr.png"
									alt="defaultAddrIcon"><span>默认地址</span>
							</div>
							<div class="fr setDefault ">
								<a href="javascript:void(0);">设为默认地址</a>
							</div>
						</div>
						<div class="addr-box-body">
							<table class="personAddr">
								<tbody>
									<tr>
										<td class="t11 alignR">收件人：</td>
										<td class="t12">收货人</td>
									</tr>
									<tr>
										<td class="t21 alignR">联系电话：</td>
										<td class="t22">17708020155&nbsp;&nbsp;-25845654</td>
									</tr>
									<tr>
										<td class="t31 alignR">所在地区：</td>
										<td class="t32">四川省&nbsp;&nbsp;成都市&nbsp;&nbsp;锦江区</td>
									</tr>
									<tr>
										<td class="t41 alignR">详细地址：</td>
										<td class="t42">街道20号</td>
									</tr>
									<tr>
										<td class="t51 alignR">邮编：</td>
										<td class="t52">028</td>
									</tr>
								</tbody>
							</table>
						</div>
						<footer class="box-footer">
						<div class="btn-box">
							<button class="fl" id="edit12">编辑修改</button>
							<button class="fr" id="delete12">删除</button>
						</div>
						</footer>
					</div>
					<div class="box addr-box-size back" id="12Back"
						style="transform: rotateY(-180deg);">
						<div class="box-header addr-box-header addr-gray">
							<div class="fl">
								<h2>收货人</h2>
							</div>
							<div class="fr defaultAddr hidden">
								<img src="<%=basePath%>img/personCenter/defaultAddr.png"
									alt="defaultAddrIcon"><span>默认地址</span>
							</div>
							<div class="fr setDefault ">
								<a href="javascript:void(0);">设为默认地址</a>
							</div>
						</div>
						<div class="addr-box-body">
							<table class="personAddr box-form-input">
								<tbody>
									<tr>
										<td class="t11 alignR">收件人：</td>
										<td class="t12"><input id="userName-12" name="userName12"
											type="text" value="收货人"></td>
									</tr>
									<tr>
										<td class="t21 alignR">联系电话：</td>
										<td class="t22"><input id="telphone-12" name="telphone12"
											type="text" value="17708020155&nbsp;&nbsp;-25845654"></td>
									</tr>
									<tr>
										<td class="t31 alignR">所在地区：</td>
										<td class="t32 addr-select"><label for="pro12"
											style="display: none">请选择省份</label><select id="pro12"><option
													value="请选择省份">请选择省份</option>
												<option value="四川省" selected="selected">四川省</option>
												<option value="河北省">河北省</option></select><label for="city12"
											style="display: none">请选择城市</label><select id="city12"><option
													value="请选择城市">请选择城市</option>
												<option value="成都市" selected="selected">成都市</option>
												<option value="海南">海南</option></select><label for="county12"
											style="display: none">请选择区县</label><select id="county12"
											class="last"><option value="请选择区县">请选择区县</option>
												<option value="金堂县">金堂县</option>
												<option value="锦江区" selected="selected">锦江区</option></select></td>
									</tr>
									<tr>
										<td class="t41 alignR">详细地址：</td>
										<td class="t42"><input id="detailAddr-12"
											name="detailAddr12" type="text" value="街道20号"></td>
									</tr>
									<tr>
										<td class="t51 alignR">邮编：</td>
										<td class="t52"><input id="sampNum-12" name="sampNum12"
											type="text" value="028"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<footer class="box-footer">
						<div class="btn-box">
							<button class="fl" id="editSure12">确认修改</button>
							<button class="fr" id="editCancel12">取消</button>
						</div>
						</footer>
					</div>
				</div>
			</li>
			<li>
				<!--没有任何收货地址-->
				<div id="addNewAddrBox" class="box addr-box-size">
					<div class="account-box-body">
						<div class="noAddr-box-img">
							<img src="<%=basePath%>img/personCenter/addrIcon.png"
								alt="addrIcon" />
							<p>您还未设置收货地址</p>
						</div>
					</div>
					<footer class="box-footer">
					<div class="btn-box">
						<button id="addNewAddr">新增收货地址</button>
					</div>
					</footer>
				</div>
			</li>
		</ul>
		<div id="addNewAddrAlert" class="mask-box " style="display: none">
			<div class="mask"></div>
			<div class="box alert-box-size addr-mask-box ">
				<h2 class="box-header alert-box-header">
					添加收货地址<a href="javascript:void(0);" class="fr alertClose">&times;</a>
				</h2>
				<div class="alert-box-body">
					<form class="alertInfo">
						<ul>
							<li class="alertInfo-L1"><label for="name"
								style="display: none">收货人姓名</label> <input id="name" type="text"
								placeholder="*收货人姓名" /> <label for="telPhone"
								style="display: none">手机号</label> <input id="telPhone"
								type="text" placeholder="*手机号" /></li>
							<li class="alertInfo-L2"><label for="areaCode"
								style="display: none">区号（选填）</label> <input id="areaCode"
								type="text" placeholder="区号（选填）" /> <label for="fixedPhone"
								style="display: none">固定号码（选填）</label> <input id="fixedPhone"
								type="text" placeholder="固定号码（选填）" /></li>
							<li class="alertInfo-L3 addr-select"><label for="pro"
								style="display: none">请选择省份</label> <select id="pro">
									<option value="请选择省份">请选择省份</option>
									<option value="四川省">四川省</option>
									<option value="河北省">河北省</option>
							</select> <label for="city" style="display: none">请选择城市</label> <select
								id="city">
									<option value="请选择城市">请选择城市</option>
									<option value="成都市">成都市</option>
									<option value="海南">海南</option>
							</select> <label for="county" style="display: none">请选择区县</label> <select
								id="county">
									<option value="请选择区县">请选择区县</option>
									<option value="金堂县">金堂县</option>
									<option value="锦江区">锦江区</option>
							</select></li>
							<li class="alertInfo-L4"><label for="addrDetail"
								style="display: none">详细街道楼宇名称/编号</label> <input id="addrDetail"
								type="text" placeholder="详细街道楼宇名称/编号" /></li>
							<li id="checkToggle" class="uncheck"><input
								id="setDefaultAddr" type="checkbox" name="setDefaultAddr"
								style="display: none;" /> <label onclick="setDefaultAddrF();"
								id="agreen" for="setDefaultAddr"
								style="color: #707070; font-size: 12px;"><i
									class="rightIcon"><b></b></b></i></i></label> <label class="label"
								onclick="setDefaultAddrF();" for="setDefaultAddr">设为默认地址</label>
								<div class="payBtn-box fr">
									<a id="saveAddr" href="javascript:void(0);">保存</a>
								</div></li>
						</ul>
					</form>
				</div>
			</div>
		</div>
		<!--点击删除按钮时的弹出框-->
		<div id="deleteAlert" data-delete="" class="mask-box"
			style="display: none">
			<div class="mask"></div>
			<div class="box alert-box-size">
				<h2 class="box-header alert-box-header">
					提示<a href="javascript:void(0);" class="fr alertClose">×</a>
				</h2>
				<div class="alert-box-body">
					<div class="alertInfo">
						<img src="<%=basePath%>img/personCenter/delIcon.png" alt="" /> <span>您确定要删除该地址吗？</span>
					</div>
				</div>
				<footer class="box-footer alert-box-footer">
				<div class="alertBtn-box">
					<a href="javascript:void(0);">确定</a>
				</div>
				</footer>
			</div>
		</div>
	</div>
	</section>
</body>
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>js/jsAddress.js"></script>
<script src="<%=basePath%>js/personCenter.js"></script>
<script src="<%=basePath%>js/address.js"></script>
</html>