	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String user = (String) request.getSession().getAttribute("loginUser");
	//if(user != null)
	//{
	//	response.sendRedirect(basePath+"index");
	//}
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>一家一盒</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf8">
		<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/shopcart.page.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/shop-ft.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
	<div class="header">
		<div class="mainHeader">
			<div class="logo">
	<a href="<%=basePath%>goods_main.jsp"><img src="<%=basePath%>img_new/LOGO.png"/></a>
			</div>
			<div class="operate" style="float:right;">
	<a href="<%=basePath%>pages/user/info.jsp"><img src="<%=basePath%>img_new/user-icon-gray.png"/></a>
	<a href="<%=basePath%>pages/shopCart/cart.jsp"><img src="<%=basePath%>img_new/shop-icon.png" style="margin-left: 35px"/></a>
			</div>
		</div>
	</div>
		<div class="cart_content" style="height:auto;">
			<div class="payState">
				<ul class="cart_step">
					<li class="active">购物车</li>
					<li class="active">填写订单</li>
					<li>完成支付</li>
				</ul>
				<ul class="circle">
					<li class="circle1 active"></li>
					<li class="circle2 active"></li>
					<li class="circle3"></li>
				</ul>
			</div>
			
			<div class="tipContent" style="margin: 30px auto 0;width:1000px;height:270px">
				<div class="areaTitle"><span>订单状态</span></div>
				<div  style="padding-top: 60px;">
					<div style="float: left;padding-left:280px;">
						<img alt="" src="<%=basePath%>img_new/icon_order_succ.png">
					</div>
					<div style="float: left;text-align: left;">
						<div ><span style="font-size:20px; color:#444444;position:absolute;margin-top:-8px;font-weight:bold">订单提交成功！</span></div>
						<div style="margin-top:18px;">
							<span style="font-size:12px; color:#707070;">请在</span>
							<span style="font-size:12px; color:#444;">&nbsp;2小时内&nbsp;</span>
							<span style="font-size:12px; color:#707070;">完成支付，超时订单将自动取消。</span>
						</div>
						<div class="shop-xg">
							<img src="<%=basePath%>img_new/sy-shijian.png" alt="" style="margin-bottom:-4.5px;"/>
							<span class="shop-xg-text">剩余支付时间</span>
							<span class="shop-xg-time">01：46：34</span>
						</div>
					</div>					
				</div>
			</div>
			
			<div class="tipContent" style="margin: 30px auto 0;width:1000px;height: auto;">
				<div class="xinxi-head">
					<span style="margin-left:40px;">订单信息</span>
					<div style="float:right;margin-right:40px;">
						<span >订单编号：</span>
						<a href="<%=basePath%>order/list" style="color:#0AE">10427289218921</a>
					</div>
				</div>
				<div class="xinxi-sec">
					<div class="xinxi-lx" >
						<p style="margin-left:14px;">联系人：郑小笑</p>
						<p style="margin-top:-6px;">联系电话：13888888888</p>
					</div>
					<div class="xinxi-dz" >
						<p>收件地址：成都市人民南路四段27号商鼎国际2-1-2501室</p>
						<p  style="margin-top:-6px;">座机号码：028-</p>
					</div>
				</div>
			</div>
			
			<div class="tipContent goodsDiv" style="margin: 30px auto 0;width:1000px;height: auto;">
				<div class="xinxi-head">
					<span style="margin-left:40px;">商品信息</span>
					<div style="float:right;margin-right:40px;display:table;" >
						<span  style="margin-right:10px;" class="fun-text">展开查看</span>
						<div  class="fun-img" onclick="shopList()"><img src='<%=basePath%>img_new/zhankai.png' id="img"/></div>
					</div>
				</div>
				<div id="goodsInfo">
					<div class="cart-thead" style="background-color: #ccc;height:30px">
						<div class="cart-head-column" style="width:530px;line-height:31px;text-align:left; margin-left: 45px;">&nbsp;商品</div>
						<div class="cart-head-column" style="width:120px;line-height:31px;">价格</div>
						<div class="cart-head-column" style="width:120px;line-height:31px;">数量</div>
						<div class="cart-head-column" style="width:120px;line-height:31px;">小计</div>
					</div>
					<c:forEach items="${data}" var="result">
					<div class="cart-list">
						<div class="cart-column" style="width:580px;">
							<div style="float:left;padding-top: 40px;  padding-left: 20px;"></div>
							<div class="p-img"><a href="index?goods_id=${result.commodityid}" ><img style="width:auto;height:100%;vertical-align: middle;" alt="${result.commodityname}" src="<%=basePath%>${result.picture}" /></a></div>
							<div class="item-msg">${result.commodityname} [${result.commoditytype}]</div>
						</div>
						<div class="cart-column" style="line-height:76px;width:120px;font-size:12px;color:#707070">
							<p style="height:12px;" >￥ <span>${result.memberprice}</span></p>
							<del>￥<span id="originalPrice${result.id}">${result.originalprice}</span></del>
						</div>
						<div class="cart-column" style="width:120px;line-height:80px;">
							<span id="number" style="margin-left:-10px;">${result.total}</span>
						</div>
						<div class="cart-column" style="line-height:80px;width:136px;font-size:12px;color:#707070">
							<span style="margin-left:-27px;">￥<span>${result.totalprice}</span></span>
						</div>
					</div>
					</c:forEach>
				</div>	
			</div>	
			
			
			<div class="tipContent" style="margin: 30px auto 0px;width:1000px;height: auto;">
				<div class="areaTitle"><span>支付方式</span></div>
				<div id="payWayBox" style="  padding: 30px 50px;">
					<div id="" class="payWaytitle noBorderTop">
						<ul class="clearfix payTab">
							<li class="current mobilePay" onclick="payType('mobilePay','bankPay')"><a  href="javascript:void(0)" >平台支付</a></li>
							<li class="other bankPay" onclick="payType('bankPay','mobilePay')"><a name="AccountPay" href="javascript:void(0)">借记卡及信用卡支付</a><span class="weixin_new"></span></li>
							
						</ul>
					</div>
					<form id="mobilePay" action="order/pay" method="post" target="_blank">
						<div class="orderMain" id="mobilePayDiv" style="display: block;">
							<div value="alipay" class="payButton alipay"></div>
							<div value="weixin" class="payButton weixin"></div>
						</div>
				  	</form>
				  	
				  	<form id="bankPay" action="pages/pay/paySucc.jsp" method="post" target="_blank">
						<div class="orderMain" id="bankPayDiv"  style="display: none;">
							<div value="" class="payButton chinaBank"></div>
							<div value="" class="payButton chinaGS"></div>
							<div value="" class="payButton chinaNY"></div>
							<div value="" class="payButton chinaJS"></div>
							<div value="" class="payButton ZSBank"></div>
							<div value="" class="payButton JTBank"></div>
							<div value="" class="payButton chinaYZ"></div>
							<div value="" class="payButton XYBank"></div>
							<div value="" class="payButton chinaMS"></div>
							<div value="" class="payButton BJBank"></div>
							<div value="" class="payButton GFBank"></div>
							<div value="" class="payButton PABank"></div>
							
						</div>
				  	</form>
					
				</div>
				<div>
					<div style="padding-right:30px;text-align: right;margin-bottom: 30px;">
						<div style="display:inline-block;vertical-align:middle;">应付金额：</div>
						<div style="display:inline-block;vertical-align:middle;text-align:right;color:#ff712f;font-size:24px;height:40px;line-height:40px;">
							￥<span id="countPrice">${countprice}</span>
						</div>
						<div style="display:inline-block;vertical-align:middle;text-align:right;padding-left: 30px;">
							<button id="goPayBtn" onclick="fixedDiv()">现在支付</button>
						</div>
					</div>
				</div>
			</div>
			
					<!-- -------------------汇总结算------------------------------- -->
					<!-- <div class="cart-summary">
						<div class="cart-column" style="width:540px; height:150px;border-bottom: 0;">
							<div style="float:left;padding-left:50px;line-height:25px;padding-top:5px;">
								<span style="font-size:14px;color:#444;">备注信息：</span><span>${orderdesc}</span>
							</div>
						</div>

						<div class="cart-column" style="width:350px;padding-left:0;height:100px;margin-left: 36px;font-size:14px;">
							<div style="float:left;text-align:left;">
								<div style="line-height:25px;padding-top:5px">购物车商品小计</div>
								<div style="line-height:25px;padding-top:12px">优惠金额</div>
								<div style="line-height:25px;padding-top:12px">运费</div>
							</div>
							<div style="float:right;text-align:right;  padding-left: 150px;">
								<div style="line-height:25px;padding-top:5px">￥<span id="countMoney">${countMoney}</span></div>
								<div style="line-height:25px;padding-top:12px">-￥<span id="totalPriviledge">${ratesprice}</span></div>
								<div style="line-height:25px;padding-top:12px">+￥<span id="yunfei">${yunfei}</span></div>
							</div>
						</div>
					</div> -->
					<!-- --------------------总价---------------------------------- -->
		</div>
		
		<form id="weixin_pay" action="pay/weixin-pay.html" method="post" target="-blank">
        	<input name="orderNum" type="hidden" value="${ordernum}"/>
        	<input name="subject" type="hidden" value="一家一盒购买商品"/>
        	<input name="totalFee" type="hidden" value="${countprice}"/>
        	<input name="body" type="hidden" value="一家一盒购买商品支付信息"/>
        	<input name="show_url" type="hidden" value="http://www.iyihe.com"/>
        	<input name="notifyUrl" type="hidden" value="<%=basePath%>weixin/pay">
        </form>
        <form id="alipayment" action="<%=basePath%>pages/buy/alipayapi.jsp" method="post" target="-blank" >
        	<input name="WIDout_trade_no" type="hidden" value="${ordernum}"/>
        	<input name="WIDsubject" type="hidden" value="一家一盒购买商品"/>
        	<input name="WIDtotal_fee" type="hidden" value="${countprice}"/>
        	<input name="WIDbody" type="hidden" value="一家一盒购买商品支付信息"/>
        	<input name="WIDshow_url" type="hidden" value="<%=basePath%>goods_main.jsp"/>
        	<input name="notify_url" type="hidden" value="pages/alipay/notify_url.jsp"/>
        	<input name="return_url" type="hidden" value="pages/alipay/return_url.jsp"/>
        </form>
          <div id="foot-one" style="margin-top:100px;">
           <table>
               <tr>
                   <td>
                       <p class="service">服务电话</p>

                       <p class="number">400 - 1369 - 400</p>

                       <p class="service">（9:00 - 18:00）</p>
                   </td>
                   <td id="tab">
                       <p class="tab-one">了解一家一盒</p>

                       <p class="tab-two">一家一盒专注于家庭高频消费品类，通过集采集卖模式将家庭需求直连产地厂商，平台全程采用会员制经营理念，以零利润售卖策略为家庭用户提供全球口碑好货。</p>
                   </td>
                   <td class="ceall">
                       <p>关注我们</p>
                       <img src="<%=basePath%>img_new/erweima.png" alt=""/>

                       <p><img src="<%=basePath%>img_new/gongzong.png" alt=""/></p>
                   </td>
               </tr>
           </table>
       </div>
       <div id="foot-two">
           <p class="fd-one">
               <a href="women.html">关于我们</a>
               <a href="bangzhu.html">帮助中心</a>
               <a href="huiyuan.html">会员服务</a>
               <a href="">供应商招募</a>
               <a href="shangwu.html">商务合作</a>
               <a href="lianxi.html">联系我们</a>
           </p>

           <p class="fd-two">
               Copyright © 2016 四川一家一盒电子商务有限公司 iYihe.com 版权所有<span class="fd-ad">蜀ICP备15032832号</span>
               公司地址：成都市人民南路四段27号商鼎国际2-1-2501室
           </p>
       </div>
 
 			
		<div class="fixed-bg"></div>
			<div class="fix-div">
				<p class="fix-div-head">请在<span style="color:#FF712F">2小时</span>内完成付款，否则订单会被系统取消</p>
				<div  class="fix-div-head">
					<a href="<%=basePath%>order/list"><div class="fix-div-bt fix-div-suc">我已完成付款</div></a>
					<a onclick="fixedDiv()"><div class="fix-div-bt fix-div-pro">遇到问题，重新付款</div></a>
				</div>
				<p style="clear:both;font-size:14px;position:relative;top:12px;color:#707070">如有疑问，或需要帮助，请联系客服热线400—1369—400</p>
			</div>
        
	</body>
	<SCRIPT TYPE="text/javascript" src="<%=basePath%>js_lib/jquery/jquery.js"></SCRIPT>
	<script type="text/javascript">
		
		function shopList(){
			var url=$("#img").attr("src")
			if($(".fun-text").text()=="展开查看"&&$("#img").attr("src")=="<%=basePath%>img_new/zhankai.png"){
				$(".fun-text").text("收起");
				$("#img").attr('src','<%=basePath%>img_new/shouqi.png');
			}else{
				$(".fun-text").text("展开查看");
				$("#img").attr('src','<%=basePath%>img_new/zhankai.png')
			};							
			$("#goodsInfo").toggleClass("shop-hidden");			
		}
			
	 	function fixedDiv(){
			$(".fixed-bg").toggleClass("fixDisplay");
			$(".fix-div").toggleClass("fixDisplay");
	 	}
		
		function payType(focusTab,flurTab){
			
			$("."+focusTab).addClass("current");
			$("."+flurTab).addClass("other");
			$("."+flurTab).removeClass("current");
			$("."+focusTab).removeClass("other");
			
			$("#"+focusTab+"Div").show();
			$("#"+flurTab+"Div").hide();
		}
		
		$(".payButton").click(function(){
			$(".payButton").removeClass('payButtonActive');
			$(this).addClass('payButtonActive');
		})
		
	</script>
	
	<script type="text/javascript">
	$("#goPayBtn").click(function(){
		//测试用
		/*location.href = "pages/pay/paySucc.jsp";*/
		var ordernum="${ordernum}";
    	if($(".payButton.weixin").hasClass("payButtonActive")){
    		$("#weixin_pay").submit();
    	}else if($(".payButton.alipay").hasClass("payButtonActive")){
    		//测试用
    		//location.href = "pages/alipay/return_url.jsp?trade_status=TRADE_SUCCESS&trade_no=2016332145&out_trade_no="+ordernum;
    		$("#alipayment").submit();
    	}
    	else{
    		$("#bankPay").submit();
    	};
		
	});
	
	
	$("#payWayBox").click(function(event){//当选择好一个银行后，去支付按钮变成红色并可用
		if($(event.target).hasClass("payButton")){
			if($(event.target).hasClass("payButtonActive")){
				if($(event.target).parent().attr("id") === "mobilePayDiv"){//当银行可用时，将此if语句的去掉
					$("#goPayBtn").css("backgroundColor","#FF712F").removeAttr("disabled");//此句一直保留
				}else{
					$("#goPayBtn").css("backgroundColor","rgb(221,221,221)").attr("disabled","disabled");
				}
			}else{
				$("#goPayBtn").css("backgroundColor","rgb(221,221,221)").attr("disabled","disabled");
			}
		}
	});
	</script>
</html>
