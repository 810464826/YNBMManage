<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String orderNum = request.getParameter("out_trade_no");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta name="renderer" content="webkit">
    <base href="<%=basePath%>">
    
    <title>一家一盒</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/main.css" />
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/register.css" />
</head>

<body>
	<div id="formbackground" style="position:absolute; width:100%; height:100%; z-index:-1">  
		
	</div>
    <div id="content" style="height: 100%;">
        <div id="header">
            <div class="logo">
                <a href="<%=basePath%>index.html">
                    <img src="<%=basePath%>img_new/LOGO.png" alt="logo" />
                </a>
            </div>
        </div>
        <form id="main" style="width: 600px;text-align:center">
           <h1 class="success_h1"><img src="<%=basePath%>img_new/success_goldVIP_yellow.png" />恭喜，  您已经成功开通了金牌会员！</h1>
           <div class="success_hr"></div>
           <h6 style="color:#444;font-weight:normal;"><time id="time">10</time>秒后自动跳转到会员中心首页，请立即到我的<a style="color:178FF2" href="<%=basePath%>user/info">会员中心</a>完善您的收货地址！</h6>
           <div class="btn_crea success_goOther" >
            	<a href="<%=basePath%>user/login">去&nbsp;逛&nbsp;逛</a>
            </div>
        </form> 
        <ul id="nav" style="color:#fff">
            <li class="active"><img src="<%=basePath%>img_new/step1.png"/><span>设置账号</span></li>
        	<li class="active"><img src="<%=basePath%>img_new/step2.png"/><span>选择会员类型</span></li>
        	<li class="active"><img src="<%=basePath%>img_new/step3.png"/><span>在线支付会费</span></li>
        	<li class="active"><img src="<%=basePath%>img_new/step4.png"/><span>成为会员</span></li>
        </ul>
    </div>
    <input type="hidden" value="${orderNum}" name="orderNum"/>
</body>
<SCRIPT TYPE="text/javascript" src="<%=basePath%>/js_lib/jquery/jquery.js"></SCRIPT>
<SCRIPT TYPE="text/javascript" src="<%=basePath%>/js/index.js"></SCRIPT>
<SCRIPT TYPE="text/javascript">
    var timename= null;
    $(function(){
    	var base = document.getElementsByTagName("base")[0].getAttribute("href");
        clearInterval(timename);
        timename = setInterval(waitting,1000);
        if($('[name="orderNum"]').val() != ""){
        	$.post(base + "user/buy", {"orderNum":$('[name="orderNum"]').val()},function(){});
        }
    });
    function waitting(){
        var time = parseInt($("#time").html());
        if(time == 1){
            clearInterval(timename);
            var base = document.getElementsByTagName("base")[0].getAttribute("href");
            window.location.href = base + "goods_main.jsp";
        }  
        $("#time").html(time - 1);
    }
    $(function(){
    	initPageHeight();
    });
</SCRIPT>
</html>
