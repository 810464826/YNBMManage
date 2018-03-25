<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String user = (String) request.getSession().getAttribute("loginUser");
	if(user == null)
	{
		response.sendRedirect(basePath+"user/login");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>一家一盒</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf8">
		<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/shopcart.page.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<div class="header">
		<div class="mainHeader">
			<div class="logo">
				<a href="goods_main.jsp"><img src="<%=basePath%>img_new/LOGO.png"/></a>
			</div>
			<div class="operate">
				<a href="user/info">
					<img src="<%=basePath%>img_new/user-icon-gray.png"/>
				</a>
				<a href="cart/mycart">
					<img src="<%=basePath%>img_new/shop-icon.png" style="margin-left:50px"/>
				</a>
			</div>
		</div>
	</div>
		<div class="cart_content">
			<div class="tipContent">
				<div id="noData" style="padding-top: 92px;">
					<img alt="" src="<%=basePath%>img_new/cart.png">
					<span style="font-size:14px; line-height:92px;vertical-align: bottom;color:#d2d2d2;">您的购物车里没有任何商品</span>
				</div>
				<div class="goOther">
					<a href="goods_main.jsp">去&nbsp;逛&nbsp;逛</a>
				</div>
			</div>
			
		</div>
	</body>
	<SCRIPT TYPE="text/javascript" src="<%=basePath%>js_lib/jquery/jquery.js"></SCRIPT>
	<script type="text/javascript">
		
	</script>
</html>
