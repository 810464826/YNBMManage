	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.job.server.utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>一家一盒</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
<link rel="stylesheet" href="<%=basePath%>css/main.css" />
<link rel="stylesheet" href="<%=basePath%>css/pccommon.css" />
<link rel="stylesheet" href="<%=basePath%>css/personCenter.css" />

</head>
<body>

<header class="topHeader">
	<div class="mainHeader">
		<div class="logo">
			<a href="<%=basePath%>index.html">
				<img src="<%=basePath%>img_new/LOGO.png" alt="logo" />
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
				<li  data-navName="account" ><a href="user/info">账号管理</a></li>
				<li data-navName="orderInfo" class="header-nav-active" style="border-bottom:3px solid #FF712F;"><a href="order/list">订单管理</a></li>
				<li data-navName="address" ><a href="user/address">地址管理</a></li>
				<li class="out"><a  href="user/logout">安全退出登录</a></li>
		 </ul>
	</div>
</header>
<section id="main">
    <div class="contain" id="orderInfo">
        <!--没有任何订单-->
        <div class="box noOrder-box-size hidden">
            <div class="account-box-body">
                <div class="noOrder-img-box">
                    <img  src="<%=basePath%>img/personCenter/noOrderIcon.png" alt="noOrderIcon"/>
                     <span class="noOrder-imgInfo">您还没有任何订单</span>
                </div>
            </div>
            <footer class="box-footer" style="bottom:120px;">
                <div class="goOther">
                    <a href="#">去逛逛</a>
                </div>
            </footer>
        </div>
        <!--点击删除按钮时的弹出框-->
        <div id="deleteOrCancelMask" class="mask-box hidden" >
            <div class="mask"></div>
            <div class="box alert-box-size">
                <h2 class="box-header alert-box-header">提示<a href="javascript:void(0);" class="fr alertClose">×</a></h2>
                <div class="alert-box-body" >
                    <div class="alertInfo">
                        <img src="<%=basePath%>img/personCenter/delIcon.png" alt=""/>
                        <span>您确定要删除该订单吗？</span>
                    </div>
                </div>
                <footer class="box-footer alert-box-footer" >
                    <div class="alertBtn-box">
                        <a id="alertSure" href="javascript:void(0);">确定</a>
                    </div>
                </footer>
            </div>
        </div>
        <div class="mask-box" style="display:none;" >
            <div class="mask"></div>
            <div class="box alert-box-size goQuery">
                <h2 class="box-header alert-box-header">提示<a href="javascript:void(0);" class="fr alertClose">×</a></h2>
                <div class="alert-box-body" >
                    <div class="alertInfo">
                        <p>承运来源：<span>${expresscomp}</span></p>
                        <p class="waybillNum">运单编号：<span>${expressno}</span></p>
                    </div>
                </div>
                <footer class="box-footer alert-box-footer" >
                    <div class="alertBtn-box">
                        <a href="javascript:void(0);" >去查询<img src="<%=basePath%>img/personCenter/goQueryIcon.png" alt="goQueryIcon"/></a>

                    </div>
                </footer>
            </div>
        </div>

<c:forEach items="${data}" var="result">
		<div class="box orderList-box-size" id="${result.ordernum}" data-status="${result.status}">
			<div class="box-header orderList-box-header">
				<div class="fl">
					<p>
						订单号：<span class="orderNum">${result.ordernum}</span>
					</p>
				</div>
				<ul class="fr ">

					<li class="orderState"><img
						src="<%=basePath%>img/personCenter/finishIcon.png" alt="finishIcon"><span>订单已完成</span></li>
					<li class="divider"><div></div></li>
					<li><span class="deleteOrder" onclick="deleteOrder(this)">删除订单</span></li>
					<li class="divider"><div></div></li>
					<li class="orderList-dropMenu" onclick="dropMenu(this)"><img data-direction="down" 
						src="<%=basePath%>img/personCenter/dropTriangle.png"
						alt="dropTriangleIcon"></li>
				</ul>
			</div>
			<div class="orderList-box-body">
				<div class="sendSlide" style="display: none;">
					<div class="sendState">
						<ul class="">
							<li class="orderSuccess "><ol>
									<li class="os11"><p>${result.f_create_time}</p>
										<span>${result.f_create_time}</span></li>
									<li class="os12"><b class="radius"></b>
									<div class="progressLine"></div></li>
									<li class="color444">下单成功</li>
								</ol></li>
							<li class="paySuccess"><ol>
									<li class="os11"><p>${result.paytime}</p>
										<span>15:28</span></li>
									<li class="os12"><b class="radius"></b>
									<div class="progressLine"></div></li>
									<li class="color444">支付成功</li>
								</ol></li>
							<li class="shopOut"><ol>
									<li class="os11"><p>${result.fahuotime}</p>
										<span>15:28</span></li>
									<li class="os12"><b class="radius"></b>
									<div class="progressLine"></div></li>
									<li class="color444">商品出库</li>
								</ol></li>
							<li class="tradeSuccess "><ol>
									<li class="os11"><p>${result.donetime }</p>
										<span>15:28</span></li>
									<li class="os12"><b class="radius"></b>
									<div class="progressLine"></div></li>
									<li class="color444">交易完成</li>
								</ol></li>
						</ul>
						
					</div>
					<ul class="sendInfo">
						<li class="sendInfo-person"><p>
								收货人：<span>${result.username}</span>
							</p>
							<p>
								收货地址：<span>${result.province}${result.city}${result.county}${result.address}</span>
							</p>
							<p>
								联系电话：<span>${result.phone}</span>
							</p></li>
						<li class="sendInfo-bill"><p>
								收货人：<span>${result.username}</span>
							</p>
							<p>
								发票抬头：<span>${result.invoicedesc}</span>
							</p>
							<p>
								联系电话：<span>${result.phone}</span>
							</p></li>
					</ul>
				</div>
				<table class="shopList" >
					<thead>
						<tr>
							<th colspan="3" class="t01">商品</th>
							<th class="t02">价格</th>
							<th class="t03">数量</th>
							<th class="t04">小计</th>
						</tr>
					</thead>
					
					<tbody>
					<c:forEach items="${result.data}" var="shops">
						<tr class="tbody-t1">
							<td colspan="3" class="t11"><div class="shopIcon">
									<img src="<%=basePath%>${shops.picture}"
										alt="noOrderIcon"><span class="shop-imgInfo">${shops.commodityname}</span>
								</div></td>
							<td class="t12"><span class="price">¥${shops.memberprice}</span>
							<del>¥${shops.originalprice}</del></td>
							<td class="t13">${shops.total}</td>
							<td class="t14">¥${shops.totalprice}</td>
						</tr>
					</c:forEach>
						<tr class="tbody-t2">
							<td class="t21">商品总金额：¥${result.countMoney}</td>
							<td class="t22">优惠金额：-¥${result.ratesprice}</td>
							<td class="t23">运费：+¥${result.yunfei}</td>
							<td colspan="3" class="t24"><span>订单总额：&nbsp;</span><span
								class="orderPay">¥&nbsp;${result.countprice}</span></td>
						</tr>
					</tbody>
					
				</table>
				<div class="payBtn-box">
					<a href="order/showpay?ordernum=${result.ordernum}">去支付</a>
				</div>
			</div>
		</div>
</c:forEach>

    </div>
</section>
</body>
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>js/personCenter.js"></script>
<script src="<%=basePath%>js/orderInfo.js"></script>
<script>
	function refeshPage(){
		$(".orderList-box-size").each(function(){
			set(this.id,$(this).attr("data-status"));
		});
	}
	function refesh(){
		$(".noOrder-box-size").toggleClass("hidden",$(".orderList-box-size:visible").length !== 0)
	}
	refeshPage();
	refesh();
	$(function(){
		var din=$(".waybillNum>span").text();
		$(".waybillNum>span").text(din);
		
		var time=$(".os11>p").text();
		var str1=time.charAt(0);
		for (var n=1;n<=10;n++){
			str1+=time.charAt(n);			
		}
		$(".os11>p").text(str1);
				
		var str2=time.charAt(11);
		for (var n=12;n<=15;n++){
			str2+=time.charAt(n);			
		}
		$(".os11>span").text(str2);						
	});
		
</script>
</html>