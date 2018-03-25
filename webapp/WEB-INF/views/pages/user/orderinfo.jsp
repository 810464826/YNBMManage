<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.job.server.utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String adminFlag = (String) request.getSession().getAttribute(
			Constants.ADMIN_FLAG);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>一家一盒</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf8">
		
		<link href="<%=basePath%>css/address.css" rel="stylesheet" type="text/css"/>
		<link href="<%=basePath%>css/content.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/chinaz.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css" />
		
		<style>
#Content .main-wrap,#content .main-wrap {
	margin-left: 100px;
}

#Content .col-sub,#content .col-sub {
	width: 140px;
	margin-left: -100%; *
	display: inline;
}
#Content select, #Content input{
	height: 30px;
}
table th{
	width: 200px;
}
</style>
<style type="text/css">
		#menu li:hover {
			background-color: #fff
		}
	</style>
	</head>

	<body>
		<ul id="header" style="background-color: #A19A9A">
        	<li class="header_menu" style="  margin-top: 5px;">
                <a href="<%=basePath%>goods_main.jsp">
                    <img src="<%=basePath%>/img/logo_red.png" alt="菜单" />
                </a>
            </li>
            <li class="header_search">
                <!-- <input type="text"  id="search_text" value="年货节" />
                <input type="button" id="search_btn" value="搜索" /> -->
            </li>
            <li class="header_close" style="float:right;margin-top:15px;margin-right:55px;" onmousemove="showMenu()" onmouseout="closeMenu()">
               <a href="javaScript:void(0)" style="padding-left: 15px">
                    <img src="img/close_btn.png"  style="width: 23px"/>
                </a>
                <br/>
                <ul id="menu" style="background-color: #A19A9A;margin-top:-6px;position:fixed" class="hide">
		        	<li style="float:none;width:80px;padding-left: 15px">
		        		<a href="<%=basePath%>user/info">
		               		个人信息
		                </a>
		        	</li>
		        	<li style="float:none;padding-left: 15px">
		        		<a href="<%=basePath%>user/address">
		               		地址管理
		                </a>
		        	</li>
		        	<li style="float:none;padding-left: 15px">
		        		<a href="<%=basePath%>user/orderinfo">
		               		订单详情
		                </a>
		        	</li>
		        </ul> 
            </li>
        </ul>
		<div id="content" style="overflow: hidden;width:90%">
			<div class="col-main">
				<div class="main-wrap" style="border: 1px solid #c4d5e0;">
					<h2 class="h2-single">
						<span class="entity">订单详情</span>
					</h2>
					<div style="float:right; margin-top:-30px;  margin-right: 30px; cursor:pointer">
						<!-- 
						<h2 class="h2-single">
							<span class="entity">返回</span>
						</h2>
						-->
						<a style="font-size:14px;" href="<%=basePath%>index">&nbsp;&nbsp;返回</a>
					</div>

					<div class="form-box" id="J_FormBox">
						
					<div class="tbl-deliver-address">

						<table border="0" cellspacing="0" cellpadding="0" class="tbl-main">
							
							<tbody>
								<tr class="thead-tbl-grade">
									<th>
										商品名称
									</th>
									<th>
										商品个数
									</th>
									<th>
										商品单价
									</th>
									<th>
										商品总价
									</th>
									<th>
										下单时间
									</th>
								</tr>
								<c:forEach items="${data}" var="result">
									<tr class="thead-tbl-address ">
									<td>
										${result.commodityname}
									</td>
									<td>
										${result.total}
									</td>
									<td>
										${result.price}
									</td>
									<td>
										${result.totalprice}
									</td>
									<td>
										${result.f_create_time}
									</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>


		</div>
		</div>
 
	</body>
	<SCRIPT TYPE="text/javascript" src="<%=basePath%>js_lib/jquery/jquery.js"></SCRIPT>
	<script type="text/javascript">
		function showMenu(){
	    	$("#menu").removeClass("hide");
	    }
	    function closeMenu(){
	    	$("#menu").addClass("hide");
	    }
	</script>
</html>
