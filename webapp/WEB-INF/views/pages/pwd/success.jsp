<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>一家一盒</title> 
	<link type="text/css" rel="stylesheet" href="<%=basePath%>css/main.css" />
	<link type="text/css" rel="stylesheet" href="<%=basePath%>css/register.css" />
</head>

<body>
	<div id="content" class="hidden" style="height: 100%">
    	<div id="header">
        	<div class="logo" style="height: 5px; ">
                <a href="<%=basePath%>index.html">
                    <img src="<%=basePath%>img_new/LOGO.png" alt="logo" />
                </a>
            </div>
        </div>
        <form id="main" style="text-align:center">
        	<div>
        		<img style="position: relative;top: 3px;width: 22px;" src="<%=basePath%>img_new/success.png"/>
        		<span style="font-size: 22px;margin-left: 9px">密码重置成功</span>
        	</div>
        	<div class="input-title">
        	</div>
        	<div class="btn_crea success_goOther" style="margin-top: 60px;">
            	<a href="<%=basePath%>login.jsp">返回首页</a>
            </div>
        	
        </form>
        <input type="hidden" name="code"/>
        <input type="hidden" id="time" value="60"/>  
        <ul id="nav" style="color:#fff">
        	<li class="active" style="width:33%"><img src="<%=basePath%>img_new/step1.png"/><span>输入手机号</span></li>
        	<li class="active" style="width:33%"><img src="<%=basePath%>img_new/step2.png"/><span>短信验证</span></li>
        	<li class="active" style="width:33%"><img src="<%=basePath%>img_new/step3.png"/><span>重设密码</span></li>
        </ul>
    </div>
</body>
<SCRIPT TYPE="text/javascript" src="<%=basePath%>/js_lib/jquery/jquery.js"></SCRIPT>
<SCRIPT TYPE="text/javascript">
    function next(obj){
		window.location.href = $("base").attr("href") ;
	}
	$(function(){
		var contentHeight = $("#content").height();
		var mainHeight = $("#main").height();
		$("#main").css("margin-top", (contentHeight - mainHeight - 300)/2);
		$("#content").removeClass("hidden");
	}); 
	
</SCRIPT>
</html>
