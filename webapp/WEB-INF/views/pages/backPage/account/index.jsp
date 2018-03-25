<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String user = (String) request.getSession().getAttribute("loginUser");
	if(user != null)
	{
		response.sendRedirect(basePath+"index");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>一家一盒</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf8">
		<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/back.page.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
		<div class="header">
			<div class="logo">
				<img src="<%=basePath%>img_new/LOGO.png"/>
			</div>
			<div class="menu">
				<span><a href="#">账号管理</a></span>
				<span class="active"><a href="#">订单管理</a></span>
				<span><a href="#">地址管理</a></span>
				<span><a href="#">安全退出登录</a></span>
			</div>
			<div class="operate">
				<img src="<%=basePath%>img_new/user-icon.png"/>
				<img src="<%=basePath%>img_new/shop-icon.png" style="margin-left:50px"/>
			</div>	
		</div>
	</body>
	<SCRIPT TYPE="text/javascript" src="<%=basePath%>js_lib/jquery/jquery.js"></SCRIPT>
	<script type="text/javascript" src="<%=basePath%>js/jsAddress.js"></script>
	<script type="text/javascript">
		
	</script>
</html>
