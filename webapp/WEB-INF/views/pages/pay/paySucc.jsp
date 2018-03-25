<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String user = (String) request.getSession().getAttribute("loginUser");
	//if(user != null)
	//{
	//	response.sendRedirect(basePath+"index");
	//}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>一家一盒</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf8">
		<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/shopcart.page.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/shop-ft.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="header">
			<div class="logo">
	<a href="<%=basePath%>index.html"><img src="<%=basePath%>img_new/LOGO.png"/></a>
			</div>
			<div class="operate" style="margin-right:150px;">
	<a href="<%=basePath%>pages/user/info.jsp"><img src="<%=basePath%>img_new/user-icon-gray.png"/></a>
	<a href="<%=basePath%>pages/shopCart/cart.jsp"><img src="<%=basePath%>img_new/shop-icon.png" style="margin-left: 35px"/></a>
			</div>	
		</div>
		<div class="cart_content" style="">
			<div class="payState">
				<ul class="cart_step">
					<li class="active">购物车</li>
					<li class="active">填写核对订单</li>
					<li class="active">完成支付</li>
				</ul>
				<ul class="circle">
					<li class="circle1 active"></li>
					<li class="circle2 active"></li>
					<li class="circle3 active"></li>
				</ul>
			</div>
			
			<div class="tipContent" style="margin: 40px auto 0;width:1000px;height:400px">
				<div class="areaTitle">订单状态</div>
				<div  style="padding-top: 60px;">
					<div style="float: left;padding-left:280px;">
						<img alt="" src="<%=basePath%>img_new/icon_paySucc.png">
					</div>
					<div style="float: left;text-align: left;">
						<div ><span style="font-size:20px; color:#444444;position:absolute;">订单支付成功！</span></div>
						<div style="  padding-top: 40px;">
							<span style="font-size:12px; color:#707070;">我们将尽快为你发货，您可以前往 </span>
							<a href="order/list" style="font-size:12px; color:#178FF2;">&nbsp;订单管理&nbsp;</a>
							<span style="font-size:12px; color:#707070;">查看订单最新信息。</span>
						</div>
					</div>
				</div>
				<div class="goOther" style="margin-top: 160px;">
						<a href="goods_main.jsp">去&nbsp;逛&nbsp;逛</a>
					</div>
			</div>
			
		</div>
	 <div id="foot-one">
           <table>
               <tr>
                   <td>
                       <p class="service">服务电话</p>

                       <p class="number">400 - 1369 - 400</p>

                       <p class="service">（9:00 - 18:00）</p>
                   </td>
                   <td id="tab">
                       <p class="tab-one">了解一家一盒</p>

                       <p class="tab-two">一家一盒专注于家庭高频消费品类，通过集采集卖模式将家庭需求直连产地厂商，平台全程采用会员制经营理念，以零利润售卖策略为家庭用户提供全球口碑好货。</p>
                   </td>
                   <td class="ceall">
                       <p>关注我们</p>
                       <img src="<%=basePath%>img_new/erweima.png" alt=""/>

                       <p><img src="<%=basePath%>img_new/gongzong.png" alt=""/></p>
                   </td>
               </tr>
           </table>
       </div>
       <div id="foot-two">
           <p class="fd-one">
               <a href="women.html">关于我们</a>
               <a href="bangzhu.html">帮助中心</a>
               <a href="huiyuan.html">会员服务</a>
               <a href="">供应商招募</a>
               <a href="shangwu.html">商务合作</a>
               <a href="lianxi.html">联系我们</a>
           </p>

           <p class="fd-two">
               Copyright © 2016 四川一家一盒电子商务有限公司 iYihe.com 版权所有<span class="fd-ad">蜀ICP备15032832号</span>
               公司地址：成都市人民南路四段27号商鼎国际2-1-2501室
           </p>
       </div>	
	</body>
	<SCRIPT TYPE="text/javascript" src="<%=basePath%>js_lib/jquery/jquery.js"></SCRIPT>
	<script type="text/javascript">
		$(".cart_content").height(document.body.clientHeight-60);
	</script>
</html>
