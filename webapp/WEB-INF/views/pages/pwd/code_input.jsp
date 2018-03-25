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
	<div id="content" style="height: 100%">
    	<div id="header">
        	<div class="logo" style="height: 5px; ">
                <a href="<%=basePath%>index.html">
                    <img src="<%=basePath%>img_new/LOGO.png" alt="logo" />
                </a>
            </div>
        </div>
        <form id="main" action="<%=basePath%>pwd/toInput" method="post">
        	<div>
        		<img style="position: relative;top: 3px;margin-left:40px;" src="<%=basePath%>img_new/phone_icon.png"/>
        		<span style="font-size: 14px;margin-left: 9px">短信验证码一发送至您的手机</span>
        		<h5></h5>
        	</div>
        	<div class="input-title">
        	</div>
        	<div>
        		<input name="phone" class="text_phon text_phon_hover"  placeholder="手机号" onchange="check_phone()" value="${phone}" readonly="readonly"/>
        	</div>
        	<div class="errTip" id="phone_title">
        		<img alt="" src="<%=basePath%>img_new/information copy.png"> <span>该手机号已被注册/输入的手机号码不正确</span>
        	</div>
        	<div style="text-align: left;">
        		<input name="code" value="${code}" class="text_phon text_phon_hover" placeholder="短信验证码"  style="width: 65%" onchange="check_code()" />
        		 
        		<span id="check_code" name="check_code" style="padding: 7px;font-size: 14px;border: 1px solid #EEEEEE;" code="${code}" onclick="createCode()" class="check-code">
        			60s 重新发送
        		</span>
        		
        	</div>
        	<div class="errTip" id="code_title">
        	<img alt="" src="<%=basePath%>img_new/information copy.png"> <span>该手机号已被注册/输入的手机号码不正确</span>
        	</div>
        	
        		<a href="javascript:next(this)" style="color:#fff;font-size: 14px;">
        		<div class="btn_crea height60 btn-active " id="next" onclick="next(this)" style="  line-height: 36px;text-align: center;height:36px;">
        		下 一 步</div></a>
        	
        	<a class="find" href="../yijiayihe/pages/pwd/phone_input.jsp">&lt;&lt;&nbsp;返回上一步</a>
        </form>
        <input type="hidden" name="code"/>
        <input type="hidden" id="time" value="60"/>  
        <ul id="nav" style= "color:#fff">
        	<li class="active" style="width:33.333%"><img src="<%=basePath%>img_new/step1.png"/><span>输入手机号</span></li>
        	<li class="active" style="width:33.333%"><img src="<%=basePath%>img_new/step2.png"/><span>短信验证</span><i class="triangle"></i></li>
        	<li style="width:33.333%"><img src="<%=basePath%>img_new/step3.png"/><span>重设密码</span></li>
        </ul>
    </div>
</body>
<SCRIPT TYPE="text/javascript" src="<%=basePath%>/js_lib/jquery/jquery.js"></SCRIPT>
<SCRIPT TYPE="text/javascript">
	var basePath = $("base").attr("href");
	function check_code(){
		var code = $("input[name=code]").val().toUpperCase();
    	if(code != "${code}")
		{
    		$("#code_title").css("opacity",1);
		  	$("#code_title").html('<img src="' + basePath + 'img_new/information copy.png"/><span>短信验证码输入错误，请检查后输入</span>');
		  	$("#next").removeClass("btn-active");
		}else{
			$("#code_title").css("opacity",0);
			$("#next").addClass("btn-active");
		}
	}
    //产生验证码  
    var timename;
	function createCode(){
		var phone = $("input[name=phone]").val();
		$.post(basePath + "user/check_code",{phone:phone},function(code){
	    		$("#check_code").attr("code", code);
	    		clearInterval(timename);
	    		time = 60;
	        	timename = setInterval(waitting,1000);
	    });
	}
	var time = 60;
	function waitting(){
        if(time == 0){
        	clearInterval(timename);
        	$("#check_code").css("padding","7px 14px").html("重新发送")
        }else{
        	$("#check_code").css("padding","7px");
			$("#check_code").html(time + "s 重新发送")
        	time -= 1;
        }
        
    }
    function next(obj){
    	
    	var inputcode = $("input[name=code]").val().toUpperCase();
   		if($(obj).hasClass("btn-active")){
   			$("#main").submit();
   		}
	}
	$(function(){
		var contentHeight = $("#content").height();
		var mainHeight = $("#main").height();
		$("#main").css("margin-top", (contentHeight - mainHeight - 300)/2);
		$("#content").removeClass("hidden");
		createCode();
	}); 
	
	
</SCRIPT>
</html>
