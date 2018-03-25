<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String user = (String) request.getSession().getAttribute("loginUser");
	if(user != null)
	{
		response.sendRedirect(basePath + "shops/index");
	}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta name="renderer" content="webkit">
    <base href="<%=basePath%>">
    <title>一家一盒</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf8">
	<link type="text/css" rel="stylesheet" href="static/css/main.css" />
	<link type="text/css" rel="stylesheet" href="static/css/register.css" />
</head>
<body >
	
	<div id="content" >
	   <div style="float:right;">
        	<div style="float:right;width:36px;">
                <a href="javascript:closeWindow()">
                    <img src="static/images/img_new/close_icon.png" alt="关闭" />
                     <div style="width:30px;"> </div>
                </a>
               
            </div>
        </div>
    	<div >
        	<div style="margin: 20px auto; text-align:center;">
                <a href="javascript:jump();">
                    <img style="margin-left:18px;" src="static/images/img_new/LOGO_noText.png" alt="logo" />
                </a>
                
            </div>
        </div>
        <form id="main" style="margin-top: 20px;" action="<%=basePath%>user/login" method="post">
        	<div class="height60" id="phone">
        		<input value="${user}" class="text_phon text_phon_hover" check="true" name="user" type="text" placeholder="手机号/会员卡号" onFocus="hidePhoneErr(this)" onblur="hideBorder(this)"/>
        		<h5></h5>
        	</div>
        	<c:if test="${exit_code == 1}">
        	<div class="errTip" id="phone_title" style="opacity:1;">
        		<img alt="" src="static/images/img_new/information copy.png"> <span id="phone_title_txt">输入的手机号码不正确</span>
        	</div>
        	</c:if>
        	<c:if test="${exit_code != 1}">
        	<div class="errTip" id="phone_title"  >
        		<img alt="" src="static/images/img_new/information copy.png"> <span id="phone_title_txt">输入的手机号码不正确</span>
        	</div>
        	</c:if>
            
        	<div id="tips">
        		<input value="${pwd}" id="pass" class="text_pass text_phon_hover" name="pwd" type="password" placeholder="密码" onFocus="hidePwdErr(this)" onblur="hideBorder(this)"/>
        	</div>
        	<c:if test="${exit_code == 2}">
        	 <div class="errTip" id="pwd_title" style="opacity:1">
        		<img alt="" src="static/images/img_new/information copy.png"> <span id="pwd_title_txt">密码错误</span>
        	</div>
        	</c:if>
        	<c:if test="${exit_code != 2}">
        	 <div class="errTip" id="pwd_title">
        		<img alt="" src="static/images/img_new/information copy.png"> <span id="pwd_title_txt">密码错误</span>
        	</div>
        	</c:if>
            
            	<a href="javascript:login()" style="color:#fff;font-size: 14px;">
            	<div class="btn_crea height60 btn-active" style="  line-height: 36px;text-align: center;height:36px;" onclick="javascript:login()">
            	登   录       </div></a>
     
            
            <div id="checkToggle">
            	<a href="/pwd/find" target="_parent" style="color:#178FF2;font-size:12px;">找回密码</a>
            	<a href="/user/toRegister" target="_parent" style="color:#178FF2;font-size:12px;float: right">创建会员</a>
            </div>
        </form>
    </div>
</body>
<SCRIPT TYPE="text/javascript" src="static/js_lib/jquery/jquery.js"></SCRIPT>
<SCRIPT TYPE="text/javascript" src="static/js/index.js"></SCRIPT>
<SCRIPT TYPE="text/javascript">

    function login()
    {
        var userName = $("input[name=user]").val();
        var pwd = $("input[name=pwd]").val();
        if(userName == ""){
        	$("#phone_title").css("opacity",1);
            $("#phone_title_txt").html("请输入用户名！");
            return;
        }
        if(pwd == ""){
        	$("#pwd_title").css("opacity",1);
            $("#pwd_title_txt").html("请输入用户密码！");
            return;
        }
        $("#main").submit();
    }
    $(function(){
    	initPageHeight();
    	document.onkeydown=function(event){ 
			e = event ? event :(window.event ? window.event : null); 
			if(e.keyCode==13){ 
				login();
			} 
		} 
    });
    function hidePhoneErr(obj)
    {
    	//$(obj).parent().find(".err-title").addClass("hide");
    	$("#phone_title").css("opacity",0);
    }
    function hidePwdErr(obj)
    {
    	//$(obj).parent().find(".err-title").addClass("hide");
    	$("#pwd_title").css("opacity",0);
    }
    function hideBorder(obj)
    {
    	$(obj).removeClass("input-active");
    }
    
    function closeWindow()
    {
    	var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
        parent.layer.close(index);
    }
	function jump(){
		if(window.parent){
			window.parent.location = "<%=basePath%>";
		}else{
			window.location = "<%=basePath%>";
		}
	}
</SCRIPT>
</html>