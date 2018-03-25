<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta name="renderer" content="webkit">
    <title>一家一盒</title>
    <link type="text/css" rel="stylesheet" href="<%=basePath%>css/main.css" />
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/shengji.css" />
</head>

<body>
	<div id="content" style="height: 100%">
    	<div id="header">
        	<div class="logo">
                <a href="<%=basePath%>index.html">
                    <img src="<%=basePath%>img_new/LOGO.png" alt="logo" />
                </a>
            </div>
        </div>
        <form id="main" class="mainToVip" action="<%=basePath%>user/toUpPay" method="post">

           
            <div class="mt30 vipButtonBox"><input class="text_phon text_button buttonActive" style="color:#95969E;text-align:left;" type="button"  value="360天金牌会员"/>
            <input type="hidden" name="membertype" value="2"/>
            <span class="vipPrice">￥198.00</span></div>
            
            
            	<a href="javaScript:next()" style="color: #fff;font-size: 14px;">
            	<div style="text-align: center;" class="btn_crea mt30 btn-active">
            	下一步 </div></a>
           
            <div>
        		<a href="pages/Help/huiyuan.html" target="-blank"><img style="position: relative;top:2px;" src="<%=basePath%>img_new/information_blue.png">&nbsp;&nbsp;<span style="color:#178FF2;">我该如何选择会员？</span></a>
        		<a class="find" href="javaScript:last()">&lt;&lt;&nbsp;返回上一步</a>
        	</div>
            <input name="username" type="hidden" value="${username}"/>
            <input name="pwd" type="hidden" value="${pwd}"/>
             <input id="oldlevel" name="oldlevel" type="hidden" value="0"/>
        </form>
        <form id="last" action="<%=basePath%>user/info" method="post">
        	<input name="phone" type="hidden" value="${phone}"/>
            <input name="pwd" type="hidden" value="${pwd}"/>
        </form> 
        <ul id="nav" style="color:#fff">
        	<li class="active"><img src="<%=basePath%>img_new/step1.png"/><span>选择会员类型</span><i class="triangle"></i></li>
        	<li><img src="<%=basePath%>img_new/step2.png"/><span>在线支付会费</span></li>
        	<li><img src="<%=basePath%>img_new/step3.png"/><span>升级成功</span></li>
        </ul>
    </div>
</body>
<SCRIPT TYPE="text/javascript" src="<%=basePath%>/js_lib/jquery/jquery.js"></SCRIPT>
<SCRIPT TYPE="text/javascript" src="<%=basePath%>/js/index.js"></SCRIPT>
<SCRIPT TYPE="text/javascript">
    function last(){
    	$("#last").submit();
    }
    function next(){
    	$("#oldlevel").val(	$(".text_phon.text_button.buttonActive").next().val());    
    	$("#main").submit();
    }
   	$(".text_phon").click(function(){
   		$(".buttonActive").removeClass("buttonActive");
   		$(this).addClass("buttonActive");
   	});
   	$(".text_phon").mousedown(function(){
     	$(this).css({"outline":"none","outline-offset":"0"});
   	});
    $(function(){
    	initPageHeight();
    });
    
</SCRIPT>
</html>
