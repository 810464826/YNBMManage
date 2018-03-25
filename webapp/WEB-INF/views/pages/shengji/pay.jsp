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
<link type="text/css" rel="stylesheet" href="<%=basePath%>css/shengji.css" />
</head>

<body>
    <div id="content" style="height: 100%;">
        <div id="header">
        	<div class="logo">
                <a href="<%=basePath%>index.html">
                    <img src="<%=basePath%>img_new/LOGO.png" alt="logo" />
                </a>
            </div>
        </div>
        <form id="main" action="<%=basePath%>user/toSuccess" method="post">
            <!-- <p><input class="text_phon active" onclick="selectPayType(this)" type="button" value="微信" /></p> -->
            <div class="text_phon buttonActive mt30 payDivBtn" type="zhifubao" style="color: #000" onclick="selectPayType(this)">
            	<a  type="button" value="" class="payButton alipay"></a>
            </div>
            <div class="text_phon mt30 payDivBtn" type="weixin"  style="color: #dfdfdf" onclick="selectPayType(this)">
            	<a type="button" value="" class="payButton weixin"></a>
            </div>
            <div onclick="showBack(event)" class="text_phon mt30 payDivBtn " style="cursor:default;color: #dfdfdf;height:19px;position:relative;" >
            	<div id="bankInBox"  style="float:left;"><span>借记卡以及信用卡支付</span><img class="innerImg hidden" src="<%=basePath%>img/bank2.png" /></div>
            	<%--<div class="down" onclick="showBack(this)"></div>--%>
            	<div class="down"></div>
            	<div class="back-list hidden">
	            			<img class="back" src="<%=basePath%>img/bank1.png" />
	            			<img class="back" src="<%=basePath%>img/bank2.png" />
							<img class="back" src="<%=basePath%>img/bank3.png" />
							<img class="back" src="<%=basePath%>img/bank4.png" />
							<img class="back" src="<%=basePath%>img/bank5.png" />
							<img class="back" src="<%=basePath%>img/bank6.png" />
							<img class="back" src="<%=basePath%>img/bank7.png" />
							<img class="back" src="<%=basePath%>img/bank8.png" />
							<img class="back" src="<%=basePath%>img/bank9.png" />
							<img class="back" src="<%=basePath%>img/bank10.png" />
							<img class="back" src="<%=basePath%>img/bank11.png" />
							<img class="back" src="<%=basePath%>img/bank12.png" />
            	</div>
            </div>
           
            	<a href="javaScript:next()" style="color: #fff;font-size: 14px" ><div class="btn_crea payButtonBox mt30 btn-active" >马上去付款</div></a>
            
            <div>
        		<a class="find" href="user/toUpVip">&lt;&lt;&nbsp;返回上一步</a>
        	</div>
        </form>
        <form id="last" action="<%=basePath%>user/toVip" method="post">
        	<input name="phone" type="hidden" value="${phone}"/>
            <input name="pwd" type="hidden" value="${pwd}"/>
        </form>
        <form id="weixin_pay" action="<%=basePath%>pay/toWeixinPay" method="post">
        	<input name="orderNum" type="hidden" value="${orderNum}"/>
        	<input name="subject" type="hidden" value="一家一盒升级金牌会员"/>
        	<input name="totalFee" type="hidden" value="198"/>
        	<input name="body" type="hidden" value="一家一盒升级金牌会员"/>
        	<input name="show_url" type="hidden" value="http://www.iyihe.com"/>
        	<input name="notifyUrl" type="hidden" value="<%=basePath%>weixin/pay">
        </form>
        <form id="alipayment" action="<%=basePath%>pages/buy/alipayapi.jsp" method="post" >
        	<input name="WIDout_trade_no" type="hidden" value="${orderNum}"/>
        	<input name="WIDsubject" type="hidden" value="一家一盒升级金牌会员"/>
        	<input name="WIDtotal_fee" type="hidden" value="198"/>
        	<input name="WIDbody" type="hidden" value="一家一盒升级金牌会员"/>
        	<input name="WIDshow_url" type="hidden" value="http://www.iyihe.com"/>
        	<input name="notify_url" type="hidden" value="pages/alipay/notify_url.jsp"/>
        	<input name="return_url" type="hidden" value="pages/alipay/return_url.jsp"/>
        </form>
        <ul id="nav" style="color:#fff">
        	<li class="active"><img src="<%=basePath%>img_new/step2.png"/><span>选择会员类型</span></li>
        	<li class="active"><img src="<%=basePath%>img_new/step3.png"/><span>在线支付会费</span><i class="triangle"></i></li>
        	<li><img src="<%=basePath%>img_new/step4.png"/><span>升级成功</span></li>
        </ul>
    </div>
</body>
<SCRIPT TYPE="text/javascript" src="<%=basePath%>/js_lib/jquery/jquery.js"></SCRIPT>
<SCRIPT TYPE="text/javascript" src="<%=basePath%>/js/index.js"></SCRIPT>
<SCRIPT TYPE="text/javascript">
    function last(){
    	$("#last").submit();
    }
    function selectPayType(obj){
    	$(".buttonActive").removeClass("buttonActive");
		$("#bankInBox").next().removeClass("up").addClass("down");
		if($(".back-list").hasClass("hidden")){
    		$(".btn_crea").show();
    	}else{
			$("#bankInBox").next().removeClass("up").addClass("down");
			$(".back-list").addClass("hidden");
    	}
   		$(obj).addClass("buttonActive");
    }
    function next(){
    	var type = $(".text_phon.buttonActive").attr("type");
    	var ordernum="${orderNum}";
    	if(type == "weixin"){
    		$("#weixin_pay").submit();
    	}else if(type == "zhifubao"){
    		location.href = "pages/alipay/return_url.jsp?trade_status=TRADE_SUCCESS&trade_no=2016332145&out_trade_no="+ordernum;
			//$("#alipayment").submit();
    		
    		//var base = document.getElementsByTagName("base")[0].getAttribute("href");
    		//var orderNum = $("input[name=orderNum]").val();
        	//window.location.href = base + "pages/buy/index.jsp?orderNum=" + orderNum;
    	}
    	else{
    		$("#main").submit();
    	}
    	
    }
    $(function(){
    	initPageHeight();
    	$(".back-list img").click(function(event){
			event.stopPropagation();
    		$(".back.active").removeClass("active");
    		$(this).addClass("active");
			$(".buttonActive").removeClass("buttonActive");
			$("#bankInBox span").hide();
			$("#bankInBox img").attr("src",$(this).attr("src")).show();
			$(".btn_crea").show();
			$(".back-list").addClass("hidden");
			$("#bankInBox").next().removeClass("down").addClass("up").parent().addClass("buttonActive");
			alert("暂不支持银行直接付款！");
			$("#bankInBox").next().removeClass("up").addClass("down").parent().removeClass("buttonActive");//当银行支付可用时，将这句删掉
    	});
    });
    function showBack(event){
		$(".buttonActive").removeClass("buttonActive");
		$("#bankInBox").next().removeClass("up").addClass("down");
		var isShow = $(".back-list").hasClass("hidden") ? false:true;

		if( isShow ){
			$(".btn_crea").hide();
			$(".back-list").addClass("hidden");
			$(".buttonActive").removeClass("buttonActive");

		}else{
			$(".btn_crea").show();
			$(".back-list").removeClass("hidden");
		}
		if(($("#bankInBox img").css("display") !== "none" || $("#bankInBox span").css("display") !== "none") && $(".back-list").hasClass("hidden") ){
			$(".btn_crea").show();
			$("#bankInBox").next().removeClass("down").addClass("up").parent().addClass("buttonActive");
			if( !($("#bankInBox span").css("display") !== "none")){
				alert("暂不支持银行直接付款！");
			}
			$("#bankInBox").next().removeClass("up").addClass("down").parent().removeClass("buttonActive");//当银行支付可用时，将这句删掉
		}
	 }
    


</SCRIPT>
</html>

