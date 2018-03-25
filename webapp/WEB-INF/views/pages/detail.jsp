<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.job.server.utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>一家一盒</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf8">
		<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/back.page.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/shop-detail.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<div class="header">
		<div class="mainHeader">
			<div class="logo">
				<a href="<%=basePath%>goods_main.jsp">
					<img src="<%=basePath%>img_new/LOGO.png"/>
				</a>
			</div>
			<div class="menu">
				<!--  <span class="active"><a href="#">账号管理</a></span>
				<span><a href="#">订单管理</a></span>
				<span><a href="#">地址管理</a></span>
				<span><a href="#">安全退出登录</a></span>-->
			</div>
			<div class="operate">
				<img src="<%=basePath%>img_new/user-icon.png"/>
				<img src="<%=basePath%>img_new/shop-icon.png" style="margin-left:50px"/>
			</div>	
		</div>
	</div>
		<div id="shopCart" style="display:none; background-color: #fff;width:213px;height: 125px;position:absolute;left:1100px;border: 1px solid #707070;border-radius:6px;margin-top: -5px;">
			<div style="float: right;margin-top: 10px;margin-right: 10px">
				<img style="width: 12px" onclick="close()" src="<%=basePath%>img_new/close_icon.png"/>
			</div>
			<div style="margin-top: 40px;margin-left: 40px">
				<img src="<%=basePath%>img_new/success-icon.png"/>
				<span style="margin-left: 6px;font-size: 14px;position: relative;top:-4px;">商品已加入购物车</span>
			</div>
			<div style="margin-left:30px;">
				<button style="width: 80px;height: 30px;background-color: #ff712f;text-align: center;">
					<span style="color: #fff">去结算</span>
				</button>
				<span style="margin-left: 20px;">继续逛>>></span>
			</div>
		</div>
		<div class="body" style="width: 1200px">
			<div class="photo">
				<div class="left-picture">
					<img src="<%=basePath%>img_new/left.png">
				</div>
				<div class="show-picture">
					<div class="big-picture">
						<img src="<%=basePath%>${picture}"/>
					</div>
					<div class="list-picture">
						<div>
							<img class="active" src="<%=basePath%>${picture}"/>
						</div>
						<div>
							<img src="<%=basePath%>${picture}"/>
						</div>
						<div>
							<img src="<%=basePath%>${picture}"/>
						</div>
						<div>
							<img src="<%=basePath%>${picture}" style="margin-right: 0px"/>
						</div>
					</div>
				</div>
				<div class="right-picture">
					<img src="<%=basePath%>img_new/right.png">
				</div>
			</div>
			<div class="detail">
				<div class="introduce">
					<div class="title" style="margin-top: 40px;margin-bottom: 25px">
						<span>${title}</span>
					</div>
					<div class="line"></div>
					<div class="discount">
						<span>￥ ${member}</span>
					</div>
					<div class="price">
						<span style="color: #444444">市场价：</span><span style="text-decoration:line-through;color:#707070">￥ ${Originalprice}</span>
						<span style="margin-left: 15px;color: #444444">已节省：</span><span style="color:#707070">￥ 29.00</span>
					</div>
					<div class="detail-title">
						<span>
							来自中国浙江嘉善姚庄黄桃之乡，皮薄肉满，个大味甜，鲜嫩多汁，可口诱人。单果净重达250g~300g，第一时间采摘，顺丰当天送达。
						</span>
					</div>
					<div class="shrink">
						<div class="line"></div>
						<div><img src="<%=basePath%>img_new/drop-down.png"/></div>
						<div class="line"></div>
					</div>
					<div class="bay-number">
						<div class="title">
							<span>选择规格</span>
						</div>
						<div class="size active" style="margin-left: 0px;cursor:pointer;"><span>单瓶装</span></div>
						<div class="size" style="cursor:pointer;"><span>礼包装 （5瓶）</span></div>
						<div class="size" style="cursor:pointer;"><span>包年装 （12瓶）</span></div>
					</div>
					<div class="bay-operate">
						<input value="1"/>
						<button onclick="addShop()">
							<img src="<%=basePath%>img_new/shop-car.png"/>
							<span>加入购物车</span>
						</button>
					</div>
				</div>
				
			</div>
		</div>
	</body>
	<SCRIPT TYPE="text/javascript" src="<%=basePath%>js_lib/jquery/jquery.js"></SCRIPT>
	<script type="text/javascript" src="<%=basePath%>js/jsAddress.js"></script>
	<script type="text/javascript">
		$(".size").click(function(){
			$(".size").removeClass("active")
			$(this).addClass("active")
		})
		$(".list-picture img").click(function(){
			$(".list-picture .active").removeClass("active");
			$(this).addClass("active");
			$(".big-picture img").attr("src",$(this).attr("src"))
		});
		function addShop(){
			$("#shopCart").css("display","block");
		}
		function close(){
			$("#shopCart").css("display","none");
		}
	</script>
</html>