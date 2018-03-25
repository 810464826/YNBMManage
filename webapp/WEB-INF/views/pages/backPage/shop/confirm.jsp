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

<html>
	<head>
		<base href="<%=basePath%>">

		<title>一家一盒</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf8">
		<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/pccommon.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/personCenter.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/confirm.page.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/shopcart.page.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/shop-ft.css" rel="stylesheet" type="text/css" />
		<style>
		    .juli{height:50px;line-height:50px;}
		</style>
	</head>
	<body>
	<div class="header">
		<div class="mainHeader">
			<div class="logo">
				<a href="<%=basePath%>goods_main.jsp"><img src="<%=basePath%>img_new/LOGO.png"/></a>
			</div>
			<div class="operate" style="float:right;">
				<a href="user/info"><img src="<%=basePath%>img_new/user-icon-gray.png"/></a>
				<a href="cart/mycart"><img src="<%=basePath%>img_new/shop-icon.png" style="margin-left: 50px"/></a>
			</div>
		</div>
	</div>
		<div class="cart_content">
			<div class="payState">
				<ul class="cart_step">
					<li class="active">购物车</li>
					<li class="active">填写核对订单</li>
					<li>完成支付</li>
				</ul>
				<ul class="circle">
					<li class="circle1 active"></li>
					<li class="circle2 active"></li>
					<li class="circle3"></li>
				</ul>
			</div>

	<div class="tipContent" style="margin: 30px auto 0;width:1000px;height:auto;">
	<div style="float:left;padding-bottom:15px;">
			<div class="juli" style="border-bottom: 1px solid #d2d2d2;width: 1000px;text-align: left;">
				<span style="color: #444444;font-size: 16px;margin-left: 40px">收货信息</span>
			</div>

			<div class="address-list">
				<c:forEach items="${addresses}" var="address">
				<c:choose>
					<c:when test="${address.isdefault}">
						<div id="${address.id}" class="address active" >
					</c:when>
					<c:otherwise>
						<div class="address" onClick="def(${address.id})">
					</c:otherwise>
				</c:choose>				
					<input name="addressId" type="hidden" value="${address.id}" >
					<div class="select-address"><img src="<%=basePath%>img_new/selected.png"/></div>
					<div style="color: #444444;font-size: 14px;margin: 20px 0px 20px 20px">${address.username}</div>
					<div>${address.phone}</div>
					<div>${address.province}&nbsp;${address.city}&nbsp;${address.county}</div>
					<div>${address.address}</div>
					<div>${address.postcode}</div>	
						</div>
				</c:forEach>
				
				<div class="add-address" id="addNewAddr" style="width: 280px;border:1px solid #d2d2d2;">
					<div style="margin-top: 62px"><img src="<%=basePath%>img_new/add_address.png"/></div>
					<div style="font-size: 14px;color: #707070"><span style="cursor:default;">使用新地址</span></div>
				</div>
			</div>
	</div>
	</div>

	<div class="tipContent" style="margin: 30px auto 0;width:1000px;height: auto;">
			<div  class="juli" style="border-bottom: 1px solid #d2d2d2;width: 1000px;text-align: left;">
				<span style="color: #444444;font-size: 16px;margin-left: 40px">配送方式及时间</span>
			</div>
			<div>
				<div class="delivery active delivery-style">
					<div class="select-address"><img src="<%=basePath%>img_new/selected.png"/></div>
					<span style="font-size: 16px;color: #444444;position: relative;top:10px">快递送货</span>
				</div>
			</div>
			<div style="height: 120px">
				<div class="delivery-time active">
					<input name="expressTime" type="hidden" value="0" >
					<div class="select-address"><img src="<%=basePath%>img_new/selected.png"/></div>
					<span style="font-size: 16px;color: #444444;position: relative;top:10px">任意时间</span>
				</div>
				<div class="delivery-time">
					<input name="expressTime" type="hidden" value="1" >
					<div class="select-address"><img src="<%=basePath%>img_new/selected.png"/></div>
					<span style="font-size: 16px;color: #444444;position: relative;top:10px">工作日</span>
				</div>
				<div class="delivery-time">
					<input name="expressTime" type="hidden" value="2" >
					<div class="select-address"><img src="<%=basePath%>img_new/selected.png"/></div>
					<span style="font-size: 16px;color: #444444;position: relative;top:10px">休息日</span>
				</div>
			</div>
	</div>

	<div class="tipContent" style="margin: 30px auto 0;width:1000px;height: auto;">
			<div class="juli" style="border-bottom: 1px solid #d2d2d2;width: 1000px;text-align: left;">
				<span style="color: #444444;font-size: 16px;margin-left: 40px">发票信息</span>
			</div>
			<div style="height: 86px">
				<div class="delivery invoice">
					<div class="select-address"><img src="<%=basePath%>img_new/selected.png"/></div>
					<span style="font-size: 16px;color: #444444;position: relative;top:10px">需要发票</span>
				</div>
			</div>
			<div style="margin-top:-26px;text-align: left;padding: 0px 0px 30px 40px;display: none;" class="invoice-detail">
				<div><span>发票类型： 普通发票</span></div>
				<div><span>发票内容： 购买商品明细</span></div>
				<div>
					<span>发票抬头： </span>
					<div class="radioBox">
						<input type="radio"  id="bill_person"  checked="true" name="invoice" value="1"/>
						<label for="bill_person" class="check" onclick="choose(this)"></label>
						<label for="bill_person" class="label" onclick="choose(this)">个人</label>
					</div>
					<div class="radioBox">
						<input type="radio" id="bill_comp" name="invoice" value="2"/>
						<label for="bill_comp" class="uncheck" onclick="choose(this)"></label>
						<label for="bill_comp" class="label" onclick="choose(this)">公司</label>
					</div>
				</div>
					<input type="text" placeholder="公司全称" id="invoicedesc" name="invoicedesc"  />
			</div>
	</div>

	<div class="tipContent" style="margin: 30px auto 30px;width:1000px;height: auto;">
			<div style="width: 1000px;text-align: left;height:50px;line-height:50px;">
				<span style="color: #444444;font-size: 16px;margin-left: 40px;">购物清单</span>
			</div>
			<div class="tipContent" style="width:1000px;border: 0px">
				<div class="cart-thead" style="background-color: #d2d2d2;height:30px;line-height:30px;">
					<div class="cart-head-column" style="width:535px;height:30px;text-align:left; margin-left: 35px;">&nbsp;商品</div>
					<div class="cart-head-column" style="width:120px;height:30px;">价格</div>
					<div class="cart-head-column" style="width:120px;height:30px;">数量</div>
					<div class="cart-head-column" style="width:120px;height:30px;">小计</div>
				</div>
				<c:forEach items="${data}" var="result">
				<div class="cart-list">
					<div class="cart-column" style="width:550px;padding-left:31px;">
						<div class="p-img"><a href="index?goods_id=${result.commodityid}" ><img style="width:auto;height:100%;vertical-align: middle;" alt="${result.commodityname}" src="<%=basePath%>${result.picture}" /></a></div>
						<div class="item-msg">${result.commodityname} [${result.commoditytype}]</div>
					</div>
					<div id="price${result.id}" class="cart-column" style="line-height:76px;width:120px;font-size:12px;color:#707070">
						<p style="height:12px;" >￥ <span>${result.memberprice}</span></p>
						<del>￥<span id="originalPrice${result.id}">${result.originalprice}</span></del>
					</div>
					<div class="cart-column" style="width:120px;font-size:12px;color:#707070">${result.total}</div>
					<div class="cart-column" style="width:120px;font-size:12px;color:#707070">￥<span>${result.totalprice}</span></div>
					
				</div>
				</c:forEach>
				<!-- -------------------汇总结算------------------------------- -->
				<div class="cart-summary">
					<div class="cart-column" style="width:500px;line-height:60px;padding-left:40px; height:60px;border-bottom: 0;text-align: left;">
						<img src="img_new/remarks.png"/>
						<input id="orderdesc" name="orderdesc" style="border-radius:3px;margin-left: 10px;width: 400px;height: 40px;border: 1px solid #D2D2D2;font-size: 12px;padding-left: 20px" placeholder="添加备注   (限100字)"/>
					</div>
					
					<div class="cart-column" style="width:350px;height:90px;padding-bottom:16px;margin-left: 50px;padding-left:0;font-size:14px;">
						<div style="float:left;text-align:left;">
							<div style="line-height:25px;padding-top:5px">购物车商品小计</div>
							<div style="line-height:25px;padding-top:5px">优惠金额</div>
							<div style="line-height:25px;padding-top:5px">运费</div>
						</div>
						<div style="float:right;text-align:right;  padding-left: 150px;">
							<div style="line-height:25px;padding-top:5px">￥<span id="countMoney">${countMoney}</span></div>
							<div style="line-height:25px;padding-top:5px">-￥<span id="totalPriviledge">${ratesprice}</span></div>
							<div style="line-height:25px;padding-top:5px">+￥<span id="yunfei">${yunfei}</span></div>
						</div>
					</div>
				</div>
				<!-- --------------------总价---------------------------------- -->
				
				<div style="float:right;width:350px;height:140px;margin-right:60px;">
					<div style="margin-top: 19px;">
						<div style="float:left;text-align:left;color:#444;font-size:14px;font-weight:bold;">总额</div>
						<div style="float:right;text-align:right;color:#ff712f;font-size:24px;">￥<span id="countprice">${countprice}</span></div>
						<div style="clear:both;"></div>
					</div>
					<div style="margin-top: 15px;">
						<div style="float:left;text-align:left;"><button id="continueShopping" style="height:40px;width:150px;border:1px solid #d2d2d2;background-color: #fff;border-radius:2px;font-size:16px;color:#707070;">继续购物</button></div>
						<div style="float:right;text-align:right;"><button id="goPayBtn" style="color:#fff;background-color:#ff712f;font-size:16px;height:40px;width:150px;border-radius:2px;">去支付</button></div>
					</div>
				</div>
				
			</div>
	</div>
	
		<div id="addNewAddrAlert" class="mask-box " style="display:none;">
            <div class="mask"></div>
            <div class="box alert-box-size addr-mask-box ">
                <h2 class="box-header alert-box-header">添加收货地址<a href="javascript:void(0);" class="fr alertClose">&times;</a></h2>
                <select style="display: none" id="area"></select>
                <div class="alert-box-body" >
                    <form name="addressFrom" name="addressFrom" class="alertInfo">
                        <ul >
                            <li class="alertInfo-L1">
                                <label for="name" style="display:none">收货人姓名</label>
                                <input id="name" name="username" type="text" placeholder="*收货人姓名"/>
                                <label for="telPhone" style="display:none">手机号</label>
                                <input id="telPhone" name="phone" type="text" placeholder="*手机号"/>
                            </li>
                            <li class="alertInfo-L2">
                                <label for="areaCode" style="display:none">区号（选填）</label>
                                <input id="areaCode" name="areacode"  type="text" placeholder="区号（选填）"/>
                                <label for="fixedPhone" style="display:none">固定号码（选填）</label>
                                <input id="fixedPhone" name="telephone"  type="text" placeholder="固定号码（选填）"/>
                            </li>
                            <li class="alertInfo-L3 addr-select">
                                <select id="area" style="display:none"></select>  
                                <label for="cmbProvince" style="display:none">请选择省份</label>
                                <select id="cmbProvince" style="width:127px;" name="province">
                                    
                                </select>
                                <label for="cmbCity" style="display:none">请选择城市</label>
                                <select id="cmbCity"  style="width:127px;margin-left:-1px;" name="city">
                                    
                                </select>
                                <label for="cmbArea" style="display:none">请选择区县</label>
                                <select id="cmbArea"  style="width:127px;margin-right:0;float:right;" name="county">
                                    
                                </select>
                            </li>
                            <li class="alertInfo-L2">
                                <label for="postcode" style="display:none">邮编（选填）</label>
                                <input id="postcode" name="postcode"  type="text" placeholder="邮编（选填）"/>
                                <label for="addressss" style="display:none">详细街道楼宇名称/编号</label>
                                <input id="addressss" name="address" style="width:274px;margin-right:0;margin-left:-6px;" type="text" placeholder="详细街道楼宇名称/编号"/>
                            </li>
                            
                            <li id="checkToggle"  class="uncheck">
                               <!-- <input id="setDefaultAddr" type="checkbox" name="setDefaultAddr"  style="display:none;"/>
                                <label onclick="setDefaultAddrF();" id="agreen" for="setDefaultAddr" style="color:#707070;font-size:12px;"><i class="rightIcon"><b></b></b></i></i></label>
                                <label class="label" onclick="setDefaultAddrF();" for="setDefaultAddr">设为默认地址</label>  --> 
                                <div class="payBtn-box fr">
                                    <a id="saveAddr" href="javascript:void(0);">保存</a>
                                </div>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>

        <form id="createForm" name="createForm" action="order/createOrderItem" method="post">
			<input type="hidden" id="addrid" name="addrid" value="">
			<input type="hidden" id="invoiceid" name="invoiceid" value="">
			<input type="hidden" id="exptime" name="exptime" value="">
			<input type="hidden" id="invdesc" name="invdesc" value="">
			<input type="hidden" id="des" name="des" value="">
			<input type="hidden" id="price" name="price" value="${countprice}">
		</form>
		<form id="weixin_pay" action="<%=basePath%>pay/toWeixinPayOder" method="post" >
        	<input name="orderNum" type="hidden" value="${ordernum}"/>
        	<input name="subject" type="hidden" value="一家一盒购买商品"/>
        	<input name="totalFee" type="hidden" value="${countprice}"/>
        	<input name="body" type="hidden" value="一家一盒购买商品支付信息"/>
        	<input name="show_url" type="hidden" value="http://www.iyihe.com"/>
        	<input name="notifyUrl" type="hidden" value="<%=basePath%>weixin/pay">
        </form>
        <form id="alipayment" action="<%=basePath%>pages/buy/alipayapi.jsp" method="post" >
        	<input name="WIDout_trade_no" type="hidden" value="${ordernum}"/>
        	<input name="WIDsubject" type="hidden" value="一家一盒购买商品"/>
        	<input name="WIDtotal_fee" type="hidden" value="${countprice}"/>
        	<input name="WIDbody" type="hidden" value="一家一盒购买商品支付信息"/>
        	<input name="WIDshow_url" type="hidden" value="http://www.iyihe.com"/>
        	<input name="notify_url" type="hidden" value="pages/alipay/notify_url.jsp"/>
        	<input name="return_url" type="hidden" value="pages/alipay/return_url.jsp"/>
        </form>
</div>

	<footer class="shopFooter" style="clear:both;">
      <div id="foot-one" style="background:#FFF;" >
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
	</footer>
</body>
	<SCRIPT TYPE="text/javascript" src="<%=basePath%>js_lib/jquery/jquery.js"></SCRIPT>
	<script type="text/javascript" src="<%=basePath%>js/jsAddress.js"></script>
	<script src="<%=basePath%>js/confirm.js"></script>
	<script type="text/javascript">
	
	
	$("#goPayBtn").click(function(){
		var addrid = $(".address.active :hidden").val();
		//alert(addrid);
		if(undefined == addrid || ""==addrid)
		{
			alert("请选择收货地址!");
			return;
		}
		$("#addrid").val(addrid);
		var invoiceid = 0;
		if($(".delivery.invoice").hasClass("active"))
		{
			invoiceid = $('.invoice-detail input:radio:checked').val();
		}
		//alert(invoiceid);
		$("#invoiceid").val(invoiceid);
		$("#invdesc").val($("#invoicedesc").val());
		$("#des").val($("#orderdesc").val());
		$("#exptime").val($('.delivery-time.active input:hidden').val());
		//alert($("#price").val());
		$("#createForm").submit();
	});
	$("#continueShopping").click(function(){//继续购物
		location.href = "goods_main.jsp";
	});
	function reloadArea()
	{
		var n = $(".cart-list").length;
		var height = 41+126*n+291;
		//$(".tipContent").css("height",height+"px");
	}
	$(document).ready(function(){
		reloadArea();
	});
	function choose(obj){
		$("[name=invoice]:checked").removeAttr("checked");
		$(".check").removeClass("check").addClass("uncheck");
		if($(obj).hasClass("label")){
			obj = $(obj).prev();
		}
		$(obj).toggleClass(function(i,c){
			 var back = c=="uncheck"? "check":"uncheck";
			  if(back == "check"){$(obj).prevAll("input").attr("checked","true");}
				return back;
		});
		billHead();
	}
	function billHead(){
		var info = $(".radioBox input:checked").val() == 1 ? "姓名" : "公司全称";
		$("#invoicedesc").attr("placeholder",info);
	}
	billHead();
	
	addressInit('area','cmbProvince','cmbCity','cmbArea','华东地区', '四川', '成都市', '郫　县'); 
	
//	function def(id){
//		$.ajax({
//           url: "address/defaddress",
//            type: "GET",
//            dataType: "json",
//            data: {
//            	id: id
//            },
//            async: false,
//            success: function(data) {
//              if(data['result']=="false")
//        	  {
//        	  	  
//            	  alert(data['message']);
//            	  return;
//        	  }
//        	  
//        	  if(data['result']=="true")
//        	  {
//            	  //alert(data['add']);
//            	  setDefault("#aa"+data['add']);
//            	  
//        	  }
//              
//            },
//            error: function() {
//              alert("设置失败");
//              
//            }
//          });
//	    }

	</script>
</html>