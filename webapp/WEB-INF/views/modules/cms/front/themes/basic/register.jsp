<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>一家一盒</title>

<link type="text/css" rel="stylesheet" href="static/css/main.css" />
<link type="text/css" rel="stylesheet" href="static/css/register.css" />
</head>

<body>
	<div id="content" style="height: 100%">
		<div id="header">
			<div class="logo">
				<a href="./index.html"> <img
					src="static/images/img_new/LOGO.png" alt="logo" />
				</a>
			</div>
		</div>

		<div id="main">
			<div class="height60" id="phone">
				<input id="inPhone" value="${phone}"
					class="text_phon text_phon_hover" check="true" name="phone"
					type="text" placeholder="手机号" onblur="phoneChange()" />
				<h5></h5>
			</div>
			<div class="errTip" id="phone_title">
				<img alt="" src="static/images/img_new/information copy.png">
				<span>该手机号已被注册/输入的手机号码不正确</span>
			</div>

			<div class="height60">
				<div class="checkCode_box">
					<input class="text_code text_phon_hover" name="check_code"
						type="text" disabled="disabled" placeholder="短信校验码" />
				</div>
				<button onclick="getCheckCode(this)"
					style="display: inline; font-family: '微软雅黑'; cursor: pointer; width: 80px; height: 36px">
					<span id="code_button" style="font-size: 12px; color: #2c2c2c;">获取验证码</span>
				</button>


				<h5 style="text-align: left; color: red;"></h5>
			</div>
			<div class="errTip" id="code_title">
				<img alt="" src="static/images/img_new/information copy.png">
				<span>验证码有误或过期，请重新获取！</span>
			</div>

			<div id="tips">
				<input id="inpwd" value="${pwd}" id="pass"
					class="text_pass text_phon_hover" name="pwd" type="password"
					placeholder="密码" onblur="gbys()" />
			</div>
			<div class="errTip" id="pwd_title">
				<img alt="" src="static/images/img_new/information copy.png">
				<span>密码格式错误</span>
			</div>


			<a href="javascript:next()" style="color: #fff; font-size: 14px;">
				<div class="btn_crea height60"
					style="line-height: 36px; text-align: center; height: 36px;">
					开始创建会员</div>
			</a>


			<div id="checkToggle">
				<input type="checkbox" id="agreenBox" checked="checked" /> <label
					onclick="choose()" id="agreen" for="agreenBox"
					style="color: #707070; font-size: 12px;"><i
					class="rightIcon"><b></b></b></i></i></label> <label onclick="choose()"
					for="agreenBox" style="color: #707070; font-size: 12px;">我已阅读并同意</label>
				<a href="Help/fuwu.html" target="-blank"
					style="color: #178FF2; font-size: 12px;">《一家一盒服务协议》</a>
			</div>
		</div>

		<input type="hidden" name="code" /> <input type="hidden" id="time"
			value="60" />
		<ul id="nav" style="color: #fff">
			<li class="active"><img src="static/images/img_new/step1.png" /><span>设置账号</span><i
				class="triangle"></i></li>
			<li><img src="static/images/img_new/step2.png" /><span>选择会员类型</span></li>
			<li><img src="static/images/img_new/step3.png" /><span>在线支付会费</span></li>
			<li><img src="static/images/img_new/step4.png" /><span>成为会员</span></li>
		</ul>
	</div>
	<form id="vipForm" action="<%=basePath%>user/toVip" method="post">
		<input type="hidden" id="newphone" name="phone" value="${phone}" /> <input
			type="hidden" id="newpwd" name="pwd" value="${pwd}" />
	</form>
</body>
<SCRIPT TYPE="text/javascript" src="static/js_lib/jquery/jquery.js"></SCRIPT>
<SCRIPT TYPE="text/javascript" src="static/js/index.js"></SCRIPT>
<SCRIPT TYPE="text/javascript">
    function next(){
    	var phone = $("input[name=phone]").val();
    	if(!/^(1)\d{10}$/i.test(phone))
		{
    		$("#phone_title").css("opacity",1);
		  	return
		}
		if($("input[name=phone]").attr("check") == "false"){
			$("#phone_title").css("opacity",1);
		  	return
		}
		$("#phone_title").css("opacity",0);
		var check_code = $("input[name=check_code]").val();
		if(check_code == ""){
			$("#code_title").css("opacity",1);
			return;
		} 
    	var code = $("input[name=code]").val();
    	if(code != check_code){
    		$("#code_title").css("opacity",1);
    		return;
    	}
    	$("#code_title").css("opacity",0);
    	
    	$("#pwd_title").css("opacity",0);
    	
    	if($("#agreenBox").attr("checked")){
    		$("#newphone").val($("#inPhone").val());
    		$("#newpwd").val($("#inpwd").val());
    		$("#vipForm").submit();
    	}else{
    		$("#agreenBox").css("border","solid 1px red");
    	}
    }
    $(function(){
    	initPageHeight();
    });
    //var int=self.setInterval("waitting()",50) 
	//function clock() 
	//{ 
	//	var t=new Date() 
	//	$("input[name=check_code]").val(t); 
	//} 
    var timename= null;
    function getCheckCode(obj){
    	
    	$("#code_button").attr("disabled", "disabled")
    	var phone = $("input[name=phone]").val();
    	if(!/^(1)\d{10}$/i.test(phone))
		{
		  	$("#phone_title").css("opacity",1);
		  	$("#code_button").removeAttr("disabled");
		  	return
		}
    	
		$("#phone_title").css("opacity",0);
		if(!check_phone(phone))
		{
			var base = document.getElementsByTagName("base")[0].getAttribute("href");
			$.ajax({
	            url: "check/phoneCode",
	            type: "GET",
	            dataType: "json",
	            data: {
	            	"phone": phone,
	            },
	            async: false,
	            success: function(data) {
	              $("input[name=code]").val(data['message']);
	  	    	  $("input[name=check_code]").removeAttr("disabled");
	  	    	  $("input[name=check_code]").val(data['message']);
	  	          clearInterval(timename);
	  	          timename = setInterval("waitting()",1000);
	              
	  	          setTimeout(function(){
	              },500);
	            },
	            error: function() {
	              alert("系统错误");
	            }
	          });
		}
    }
    function waitting(){
        var time = parseInt($("#time").val());
        if(time == 1){
        	$("#time").val("60");
            $("#code_button").html('<span style="margin-right: 20px"></span>重新发送');
            $("#code_button").removeAttr("disabled");
            clearInterval(timename);
            return;
        }
        $("#code_button").html('<span style="margin-right: 20px"></span>已发送(' + time + ')');
        $("#time").val(time - 1);
    }
    function phoneChange(){
    	$("input[name=phone]").attr("check", "false");
    	var phone = $("input[name=phone]").val();
    	if(!/^(1)\d{10}$/i.test(phone))
		{
    		$("#phone_title").css("opacity",1);
		  	return
		}
		var flag = check_phone(phone);
		$("#phone_title").css("opacity",0);
    	$("input[name=phone]").attr("check", "true");
    	$("input[name=code]").val("");
    	$("input[name=check_code]").val("");
    	$("input[name=check_code]").attr("disabled","disabled");
    }
    function check_phone(phone){
    	//var base = document.getElementsByTagName("base")[0].getAttribute("href");
    	$.ajax({
            url: "check/phoneExist",
            type: "GET",
            dataType: "json",
            data: {
            	"phone": phone,
            },
            async: false,
            success: function(data) {
              if(data['result']=="false")
        	  {            	 
            	  return true;
        	  }
              else
              {
            	  $("#phone_title").css("opacity",1);
      			  $("input[name=phone]").attr("check", "false");
            	  return false;
              }
              setTimeout(function(){
              },500);
            },
            error: function() {
              alert("系统错误");
            }
          });
    	
    }
    
    function choose(){
    	$("#checkToggle").toggleClass("uncheck");
    }
    
    function gbys(){
    	if($("#inPhone").val()&&$(".text_phon_hover").val()&&$("#inpwd").val()!=""){
    		$(".btn_crea").addClass("btn-active");
    	}
    }
    /*
    var level = 0;
   
    window.onload = function() {
		$('#pass').keyup(function(){
			level = checkStrong($(this).val());
			$(".s").removeClass("active");
			$(".s" + level).addClass("active");
		});
		
    
    }
    */
    /** 强度规则
		+ ------------------------------------------------------- +
		1) 任何少于6个字符的组合，弱；任何字符数的同类字符组合，弱；
		2) 任何字符数的两类字符组合，中；
		3) 12位字符数以下的三类或四类字符组合，强；
		4) 12位字符数以上的三类或四类字符组合，非常好。
		+ ------------------------------------------------------- +
		**/
	//检测密码强度
	/*
	function checkStrong(sValue) {
		if(sValue == ""){
			return -1;
		}
		var modes = 0;
		if (sValue.length < 6) return modes;
		if (/\d/.test(sValue)) modes++; //数字
		if (/[a-z]/.test(sValue)) modes++; //小写
		if (/[A-Z]/.test(sValue)) modes++; //大写  
		if (/\W/.test(sValue)) modes++; //特殊字符
		switch (modes) {
		case 0:
			return 0;
			break;
		case 1:
			return 1;
		case 2:
		case 3:
		case 4:
			return sValue.length < 12 ? 2 : 3
			break;
		}
	}
		*/
</SCRIPT>
</html>
