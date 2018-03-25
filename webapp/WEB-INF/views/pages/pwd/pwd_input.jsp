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
        <form id="main" action="<%=basePath%>pwd/save" method="post">
        	<input type="hidden" name="phone" value="${phone}"/>
        	<div>
        		<input name="pwd" class="text_phon text_phon_hover" type="password" placeholder="新密码" onchange="check_pwd()"/>
        	</div>
        	<div class="errTip" id="pwd_title">
        		<img src="<%=basePath%>img_new/information copy.png"/><span>密码格式不正确</span>
        	</div>
        	<div>
        		<input name="again_pwd" class="text_phon text_phon_hover"  type="password" placeholder="重复新密码" onchange="check_again_pwd()"/>
        	</div>
        	<div class="errTip" id="again_pwd_title">
        		<img src="<%=basePath%>img_new/information copy.png"/><span>两次密码不相同</span>
        	</div>
        	        	
        	
        		<a href="javascript:next(this)" style="color:#fff;font-size: 14px;">
        		<div class="btn_crea height60 btn-active" id="next" onclick="next(this)" style="  line-height: 36px;text-align: center;height:36px;">
        		确定更改密码        	</div></a>

        </form>
        <ul id="nav" style="color:#fff">
        	<li class="active" style="width:33.333%"><img src="<%=basePath%>img_new/step1.png"/><span>输入手机号</span></li>
        	<li class="active" style="width:33.333%"><img src="<%=basePath%>img_new/step2.png"/><span>短信验证</span></li>
        	<li class="active" style="width:33.333%"><img src="<%=basePath%>img_new/step3.png"/><span>重设密码</span></li>
        </ul>
    </div>
</body>
<SCRIPT TYPE="text/javascript" src="<%=basePath%>/js_lib/jquery/jquery.js"></SCRIPT>
<SCRIPT TYPE="text/javascript">
	var basePath = $("base").attr("href");
	function check_pwd(){
		
		var pwd = $("input[name=pwd]").val();
		pwd = $.trim(pwd);
		    /*
		    * 判断从开头到结尾不全由数字组成
		    * 判断从开头到结尾不全由字母组成(大写和小写)
		    * */
		    var reg = new RegExp("(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-zA-Z]{"+8+","+16+"}");
    	if(!reg.test(pwd))
		{
    		$("#pwd_title").css("opacity",1);
		  	$("#pwd_title").html('<img src="' + basePath + 'img_new/information copy.png"/><span>密码格式不正确</span>');
		  	$("#next").removeClass("btn-active");
		  	return false;
		}
    	else
    	{
    		$("#pwd_title").css("opacity",0);
    		var pwd = $("input[name=pwd]").val();
    		if(pwd == $("input[name=again_pwd]").val())
    		{
    			$("#next").addClass("btn-active");
    		}
    		else
    		{
    			$("#again_pwd_title").css("opacity",1);
    		  	$("#again_pwd_title").html('<img src="' + basePath + 'img_new/information copy.png"/><span>两次密码不相同</span>');
    		  	$("#next").removeClass("btn-active");
    		}
    		return true;
    	}
		
	}
	function check_again_pwd(){
		var pwd = $("input[name=pwd]").val();
    	if(pwd != $("input[name=again_pwd]").val())
		{
    		$("#again_pwd_title").css("opacity",1);
		  	$("#again_pwd_title").html('<img src="' + basePath + 'img_new/information copy.png"/><span>两次密码不相同</span>');
		  	$("#next").removeClass("btn-active");
		  	return false;
		}
    	else
    	{
    		$("#again_pwd_title").css("opacity",0);
    		check_pwd();
    		return true;
    	}
		
	}
	function next(obj){
		var newpwd = $("input[name=pwd]").val();
		if($(obj).hasClass("btn-active")){
			if(newpwd == null || newpwd == ""){
				alert("请输入密码！");
				return;
			}
			if(newpwd == $("input[name=again_pwd]").val()){
				$("#main").submit();	
			}
		}
	}
	$(function(){
		var contentHeight = $("#content").height();
		var mainHeight = $("#main").height();
		$("#main").css("margin-top", (contentHeight - mainHeight - 300)/2);
		$("#content").removeClass("hidden");
	}); 
	
</SCRIPT>
</html>
