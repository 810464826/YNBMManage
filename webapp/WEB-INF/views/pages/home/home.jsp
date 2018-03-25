<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	//String user = (String) request.getSession().getAttribute("loginUser");
	//if (user != null) {
		//response.sendRedirect(basePath + "index");
	//}
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
<link rel="stylesheet" href="<%=basePath%>css/reset.css">
<link rel="stylesheet" href="<%=basePath%>css/waterfall.css">

</head>
<body>
	<header class="mainHeader">
	<div class="logo">
		<a href="<%=basePath%>index.html"> <img src="<%=basePath%>img_new/LOGO.png"
			alt="logo" />
		</a>
	</div>

	<ul class="header-icon">
		<li><a href="user/info"> <img
				src="<%=basePath%>img/personCenter/user-icon-gray.png"
				alt="personCenterIcon" />
		</a></li>
		<li class="header-shopIcon"><a href="shopCart/cart"> <img
				src="<%=basePath%>img/personCenter/shoppingBusIcon.png"
				alt="shoppingBusIcon" />
		</a></li>
	</ul>

	</header>
	<div id="header2">
		<a href="<%=basePath%>index.html"> <img src="<%=basePath%>img/banner.png"
			alt="personCenterIcon" />
		</a>
	</div>
	<div id="container"></div>
	<script type="text/x-handlebars-template" id="waterfall-tpl">
{{#result}}
    <div class="item">
        <a href="<%=basePath%>index.html"><img src="{{image}}" width="{{width}}" height="{{height}}" /></a>
		<div class="title">
			<span class="price">￥195.00</span> 
		</div>
		<div class="title">
			<span>js lazyload实现网页图片</span>
		</div>
    </div>
{{/result}}
</script>
	<SCRIPT TYPE="text/javascript" src="<%=basePath%>js_lib/jquery/jquery.js"></SCRIPT>
	<script TYPE="text/javascript" src="<%=basePath%>js_lib/waterfall/libs/handlebars/handlebars.js"></script>
	<script TYPE="text/javascript" src="<%=basePath%>js_lib/waterfall/waterfall.min.js"></script>
	<script>
		$('#container').waterfall({
			itemCls : 'item',
			colWidth : 285,
			gutterWidth : 20,
			gutterHeight : 20,
			checkImagesLoaded : false,
			callbacks : {
				loadingFinished : function($loading, isBeyondMaxPage) {
					if (!isBeyondMaxPage) {
						$loading.fadeOut();
					} else {
						$loading.hide();
						//$('#page-navigation').show();
					}
				}
			},
			path : function(page) {
				//alert(page);
				return '<%=basePath%>pages/home/data/data' + page + '.json';
			}
		});
	</script>
	<script type="text/javascript">
		var _gaq = _gaq || [];
		_gaq.push([ '_setAccount', 'UA-1245097-16' ]);
		_gaq.push([ '_trackPageview' ]);
		_gaq.push([ '_trackPageLoadTime' ]);
	</script>
</body>
</html>
