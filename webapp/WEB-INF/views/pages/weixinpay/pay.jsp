<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String user = (String) request.getSession().getAttribute("loginUser");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta name="renderer" content="webkit">
<base href="<%=basePath%>">
<title>微信支付</title>
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/common1c2d8f.css">
<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/emoji190985.css">
</head>
<body>
	<input id="text" value="${url}" type="hidden" />
	<div class="header pngFix">
		<h1 class="pay_logo">
			<img class="pngFix" style="width: 160px;"
				src="<%=basePath%>img/logo_pay.png" alt="微信支付标志" title="微信支付"></a>
		</h1>
	</div>
	<div class="content">
		<div class="wrapper mail_box">
			<div class="mail_box_inner pngFix">
				<div class="area primary">
					<div class="pay_msg qr_default" id="payMsg">
						<div class="area_hd">
							<h2>支付结果</h2>
						</div>
						<div class="area_bd" id="pay_succ">
							<i class="icon110_msg pngFix"></i>
							<h3 class="pay_msg_t">购买成功</h3>
							<div id="payMsgDetail" class="vh">
								<p class="pay_msg_desc">
									<span id="userName">&lt;用户&gt;</span>，你使用<strong id="bankCard">&lt;银行卡&gt;</strong>银行卡完成了本次交易。
								</p>
								<p class="pay_tip">
									<span id="redirectTimer">5</span>秒后返回商户网页，你也可以点击 <a
										href="javascript:;" target="_blank" id="resultLink">这里</a>
									立即返回。
								</p>
							</div>
						</div>

						<div class="area_bd" id="pay_error">
							<i class="icon110_msg pngFix"></i>
							<h3 class="pay_msg_t">无法支付</h3>
							<p class="pay_msg_desc">商品金额大于银行卡快捷支付限额</p>
						</div>

						<div class="area_bd" id="qr_normal">
							<span class="qr_img_wrapper" style="height: 336px;">
								<div class="qrcode"
									style="margin-left: 115px; width: 325px; height: 325px; text-align: center;
	/* width: 301px; */ -webkit-border-radius: 8px; -moz-border-radius: 8px; border-radius: 8px; -webkit-box-shadow: #666 0px 0px 20px; -moz-box-shadow: #666 0px 0px 20px; box-shadow: #666 0px 0px 20px; background: #EEFF99; padding-left: 25px; padding-top: 25px; border-radius: 5px 5px 5px 5px; background-color: #ffffff; background-repeat: no-repeat; background-position: center;"
									alt="二维码" id="qrcode"></div>
							</span>
							<div style="text-align: center; margin-top: 40px">
								<img src="<%=basePath%>img/pay.png" />
							</div>
							<div class="msg_box">
								<i class="icon60_qr pngFix"></i>
								<p>
									<strong>扫描成功</strong>请在手机确认支付
								</p>
							</div>
						</div>

					</div>
				</div>
				<div class="area second">
					<div class="pay_bill shopping">
						<div class="area_hd">
							<h2>支付清单</h2>
							<span class="icon_wrapper"><i class="icon60_pay pngFix"></i></span>
						</div>
						<div class="area_bd">
							<h3 class="pay_money">
								<span>￥</span>${price}
							</h3>
							<div class="pay_bill_unit no_extra">
								<dl>
									<dt>一家一盒</dt>
									<dd></dd>
								</dl>
								<div class="pay_bill_info">
									<p>
										<label>交易单号</label><span class="pay_bill_value">${orderNum}</span>
									</p>
									<p>
										<label>订单详情</label><span class="pay_bill_value">${info}</span>
									</p>
									<p>
										<label>创建时间</label><span class="pay_bill_value">${date}</span>
									</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<input name="orderNum" value="${orderNum}" type="hidden" /> <b
				class="mail_box_corner left pngFix"></b> <b
				class="mail_box_corner right pngFix"></b>
		</div>
	</div>
	<div class="footer">
		<p class="linklist">
			<a href="<%=basePath%>">一家一盒</a> <a href="">服务条款</a> <a href="">反馈建议</a>
		</p>
		<p class="copyright">© 1998 - 2016 yijiayihe Inc. All reserved.</p>
		<p class="linklist">
			<a href="tenpay/test?result_code=SUCCESS&out_trade_no=${orderNum}" target="_blank">测试支付成功</a> 
		</p>
	</div>
	<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/qrcode.js"></script>
	<script type="text/javascript">
	
		function makeCode() {
			var elText = document.getElementById("text");
			if (!elText.value) {
				elText.focus();
				return;
			}
			var qrcode = new QRCode(document.getElementById("qrcode"), {
				width : 300,
				height : 300,
				background : "#ccc",
				foreground : "red"
			});
			qrcode.makeCode(elText.value);
		}
		var base = document.getElementsByTagName("base")[0]
				.getAttribute("href");
		function remainTime() {
			$.post(base + "pay/checkWeiXinPay", {
				"orderNum" : $("input[name=orderNum]").val()
			}, function(data) {
				if (data != "true") {
					setTimeout("remainTime()", 1000);
				} else {
				  <%if(null == user)
					{
					%>
						location.href = base + "user/toSuccess"
				  <%}else{%>				
						location.href = base + "user/toUpSuccess"
				  <%}%>	
				}
			});

		}
		$(function() {
			makeCode();
			remainTime();
		});
	</script>
</body>
</html>