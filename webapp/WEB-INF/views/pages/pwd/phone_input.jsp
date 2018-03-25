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
                <a href="<%=basePath%>">
                    <img src="<%=basePath%>img_new/LOGO.png" alt="logo" />
                </a>
            </div>
        </div>
        <form id="main" action="<%=basePath%>pwd/toCheckCode" method="post">
        	<div>
        		<input name="phone" class="text_phon text_phon_hover" placeholder="手机号" onchange="check_phone()"/>
        	</div>
        	<div class="errTip" id="phone_title">
        		<img alt="" src="<%=basePath%>img_new/information copy.png"> <span>该手机号已被注册/输入的手机号码不正确</span>
        	</div>
        	
        	<div class="height60">
            	<div class="checkCode_box ">
            		<input class="text_code text_phon_hover" name="check_code"  onchange="checkcode()"  placeholder="验证码" />
            	</div>
            	<button onclick="changeCode(); return false;" style="display: inline; cursor: pointer;width:80px;height:36px">
            		<img id="vimg" title="点击更换" onclick="changeCode();" style="display: inline; cursor: pointer;width:80px;height:36px" src="<%=basePath%>user/creatrand">
            	</button>
            	
            	<h5 style="text-align:left; color:red;"></h5>
            </div>
        	<div class="errTip" id="code_title"  >
        		<img alt="" src="<%=basePath%>img_new/information copy.png"> <span>验证码有误或过期，请重新获取！</span>
        	</div>
        	
        	
            	<a href="javascript:next()" style="color:#fff;font-size: 14px;">
            	<div class="btn_crea height60 btn-active" id="next" onclick="next()"  style=" line-height: 36px;text-align: center;height:36px;">
            	发送短信验证码</div></a>
            
        </form>
        
        
        <input type="hidden" name="code"/>
        <input type="hidden" id="time" value="60"/>  
        <ul id="nav" style="color:#fff">
        	<li class="active" style="width:33.333%"><img src="<%=basePath%>img_new/step1.png"/><span>输入手机号</span><i class="triangle"></i></li>
        	<li style="width:33.333%"><img src="<%=basePath%>img_new/step2.png"/><span>短信验证</span></li>
        	<li style="width:33.333%"><img src="<%=basePath%>img_new/step3.png"/><span>重设密码</span></li>
        </ul>
    </div>
</body>
<SCRIPT TYPE="text/javascript" src="<%=basePath%>/js_lib/jquery/jquery.js"></SCRIPT>
<SCRIPT TYPE="text/javascript">
	var basePath = $("base").attr("href");
	function check_phone(){
		var phone = $("input[name=phone]").val();
    	if(!/^(1)\d{10}$/i.test(phone))
		{
    		$("#phone_title").css("opacity",1);
		  	$("#phone_title").html('<img src="' + basePath + 'img_new/information copy.png"/><span>手机号码不正确</span>');
		  	$("#next").removeClass("btn-active");
		  	return false;
		}
    	$("#phone_title").css("opacity",0);
    	return true;
		
	}
	function check_codes(){
		$("#code_title").empty();
		var code = $("input[name=code]").val().toUpperCase();
    	if(code != $("#check_code").html().toUpperCase())
		{
		  	$("#code_title").html('<img src="' + basePath + 'img_new/information copy.png"/><span>验证码输入错误，请重新输入</span>');
		}
		if($("#phone_title").html() == "" && $("#code_title").html() == ""){
			$("#next").addClass("next");
		}else{
			$("#next").removeClass("next");
		}
	}
    //产生验证码  
	function createCode(){  
		code = "";   
		var codeLength = 4;//验证码的长度  
		var checkCode = document.getElementById("code");   
		var random = new Array(0,1,2,3,4,5,6,7,8,9,'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R',  
		   'S','T','U','V','W','X','Y','Z');//随机数  
		for(var i = 0; i < codeLength; i++) {//循环操作  
		   var index = Math.floor(Math.random()*36);//取得随机数的索引（0~35）  
		   code += random[index];//根据索引取得随机数加到code上  
		}
		$("#check_code").html(code);
		var marginLeft = (67 - $("#check_code").width())/2;
		$("#check_code").css("padding-left", marginLeft).css("padding-right", marginLeft);
	}
	function next(){
		if($("#next").hasClass("btn-active")){
			if(check_phone())
			{
				var code = $("input[name=check_code]").val().toUpperCase();
				if(code.length < 4)
				{
					$("#code_title").css("opacity",1);
		    		$("#code_title").html('<img src="' + basePath + 'img_new/information copy.png"/><span>验证码输入错误，请重新输入</span>');
					return;
				}
				$.post(basePath + "user/checkRand",{code:code},function(flag){
			    	if(flag == "true"){
			    		$("#next").addClass("btn-active");
			    		$("#code_title").css("opacity",0);
			    		$("#main").submit();
		    			return;
		    		}
			    	else
			    	{
			    		$("#next").removeClass("btn-active");
			    		$("#code_title").css("opacity",1);
			    		$("#code_title").html('<img src="' + basePath + 'img_new/information copy.png"/><span>验证码输入错误，请重新输入</span>');
			    	}
			    });
				
			}
		}
	}
	function changeCode() { 
		  var imgNode = document.getElementById("vimg");
		  vimg.src = "<%=basePath%>user/creatrand?t=" + Math.random();
    }
	function checkcode(){
		var code = $("input[name=check_code]").val().toUpperCase();
		if(code.length < 4)
		{
			$("#code_title").css("opacity",1);
    		$("#code_title").html('<img src="' + basePath + 'img_new/information copy.png"/><span>验证码输入错误，请重新输入</span>');
			return;
		}
		$.post(basePath + "user/checkRand",{code:code},function(flag){
	    	if(flag == "true"){
	    		$("#next").addClass("btn-active");
	    		$("#code_title").css("opacity",0);
    			return true;
    		}
	    	else
	    	{
	    		$("#next").removeClass("btn-active");
	    	}
	    });
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
