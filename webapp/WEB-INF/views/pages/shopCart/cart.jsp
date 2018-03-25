<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	String user = (String) request.getSession().getAttribute("loginUser");
	if(user == null)
	{
		response.sendRedirect(basePath+"user/login");
	}
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
			<a href="user/info"><img src="<%=basePath%>img_new/user-icon-gray.png"/></a>
			<a href="cart/mycart"><img src="<%=basePath%>img_new/shop-icon.png" style="margin-left: 50px"/></a>
					</div>
			</div>
		</div>
		<div class="cart_content">
			<div class="payState">
				<ul class="cart_step">
					<li class="active">购物车</li>
					<li>填写核对订单</li>
					<li>完成支付</li>
				</ul>
				<ul class="circle">
					<li class="circle1 active"></li>
					<li class="circle2"></li>
					<li class="circle3"></li>
				</ul>
			</div>
			<div class="tipContent" style="margin:30px auto 38px; width:1000px;">
				<div class="cart-thead">
					<div class="cart-head-column" style="width:400px;text-align:left; margin-left: 50px;">&nbsp;商品</div>
					<div class="cart-head-column" style="width:120px;">价格</div>
					<div class="cart-head-column" style="width:120px;">数量</div>
					<div class="cart-head-column" style="width:120px;">小计</div>
					<div class="cart-head-column" style="width:120px;">操作</div>
				</div>
				<c:forEach items="${data}" var="result">
				<div id="cart-list${result.id}" class="cart-list">
					<div class="cart-column" style="width:450px;">
						<div style="float:left;padding-top: 40px;  padding-left: 20px;">
							<div class="checkToggle">
								<input type="checkbox" class="agreenBox" id="good${result.id}" />
								<label onclick="choose('good${result.id}')" class="agreen" for="good${result.id}" style="color:#707070;font-size:12px;"><i class="rightIcon"><b></b></b></i></i></label>
							</div>
						</div>
						<div class="p-img"><a href="index?goods_id=${result.commodityid}" ><img style="width:auto;height:100%;vertical-align: middle;" alt="${result.commodityname}" src="<%=basePath%>${result.picture}" /></a></div>
						<div class="item-msg">${result.commodityname} [${result.commoditytype}]</div>
					</div>
					<div id="price${result.id}" class="cart-column" style="line-height:76px;width:120px;font-size:12px;color:#707070">
						<p style="height:12px;" >￥ <span>${result.memberprice}</span></p>
						<del>￥<span id="originalPrice${result.id}">${result.originalprice}</span></del>
					</div>
					<div class="cart-column" style="width:120px;line-height:82px;">
						<div class="number" style="margin-left: 15px;float: left; border: solid 1px #d2d2d2;margin-top: 28px;border-radius: 3px;">
							<div style="float:left;height:30px;line-height:30px;width:100px;">
								<span onclick="changeNum('del',${result.id})" style="float:left;cursor:pointer;font-size:24px; margin:0 8px;color:#d2d2d2">-</span>
	                            <span id="number${result.id}" style="">${result.total}</span>
	                            <span onclick="changeNum('add',${result.id})" style="float:right;cursor:pointer;font-size:24px;margin: 0 8px;color:#d2d2d2">+</span>
	                  		</div>
	                    </div>
					</div>
					<div id="totalprice${result.id}" class="cart-column" style="line-height:82px;width:120px;font-size:12px;color:#707070">￥<span>${result.totalprice}</span></div>
					<div class="cart-column" style="width:135px;display: table;">
						<span style="display:table-cell; vertical-align:middle;">
							<img alt="" style="cursor:pointer" src="<%=basePath%>img_new/icon_del_12.png" onClick="del(${result.id})">
						</span>
					</div>
				</div>
				</c:forEach>
				<!-- -------------------汇总结算------------------------------- -->
				<div class="cart-summary">
					<div class="cart-column" style="width:540px; height:150px;border-bottom: 0;">
						<div style="float:left;line-height:25px;padding-top:5px;padding-left:20px;">
						<div class="checkToggle">
								<input type="checkbox" class="agreenBox" id="selectAll" />
								<label onclick="choose('selectAll')" class="agreen" for="selectAll" style="color:#707070;font-size:12px;"><i class="rightIcon"><b></b></b></i></i></label>
								<label onclick="choose('selectAll')" for="selectAll">&nbsp;全选</label>
						</div>

						</div>
						
						<div style="float:left;line-height:25px;padding-top:5px;padding-left:50px;cursor:pointer" onclick="checkedNum()">
						      <span>删除选中商品</span>
					    </div>
						<div style="float:left;line-height:25px;padding-top:5px;padding-left:50px"><span>已经选中</span><span id="countItem" style="margin:0 6px;color:#ff127f">${count}</span><span>件商品</span></div>
					</div>
					
					<div class="cart-column" style="height:96px;padding-left:0;margin-left:11px;width:350px;margin-right: 60px;font-size:14px;">
						<div style="float:left;text-align:left;">
							<div style="line-height:25px;padding-top:5px">购物车商品小计</div>
							<div style="line-height:25px;padding-top:10px">优惠金额</div>
							<div style="line-height:25px;padding-top:10px;">运费</div>
						</div>
						<div style="float:right;text-align:right;  padding-left: 150px;">
							<div style="line-height:25px;padding-top:5px">￥<span id="countMoney">${countMoney}</span></div>
							<div style="line-height:25px;padding-top:10px">-￥<span id="totalPriviledge">${ratesprice}</span></div>
							<div style="line-height:25px;padding-top:10px">+￥<span id="yunfei">${yunfei}</span></div>
						</div>
					</div>
				</div>
				<!-- --------------------总价---------------------------------- -->
				<div style="float:right;width:350px;height:150px;margin-right: 85px;">
					<div style="margin-top: 19px;height:40px;">
						<div style="font-size:14px;color:#444;float:left;text-align:left;font-weight:bold;">总额</div>
						<div style="line-height:36px;float:right;text-align:right;color:#ff712f;font-size:24px;">￥<span id="countprice">${countprice}</span></div>
					</div>
					<div style="margin-top: 19px;">
						<div style="float:left;text-align:left;"><button id="continueShopping" style="color:#707070;height:40px;width:150px;border:1px solid #d2d2d2;background-color: #fff;border-radius:2px;font-size:16px;">继续购物</button></div>
						<div id="goPayBtn" style="float:right;text-align:right;padding-left: 30px;"><button style="color:#fff;background-color:#ff712f;font-size:16px;height:40px;width:150px;border-radius:2px;">去结算</button></div>
					</div>
				</div>
			</div>
		</div>
		<form id="confirmForm" name="confirmForm" action="order/confirm" method="post">
			<input type="hidden" id="confirmids" name="confirmids" value="">
			<input type="hidden" id="confirmnums" name="confirmnums" value="">
		</form>
	   <footer class="shopFooter">
       <div id="foot-one">
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
	<script type="text/javascript">
	//添加或者减少货品数量
	function changeNum(type,id){
		var price= parseFloat($("#price"+id+" span").html());
		if(type=='add'){
		    $("#number"+id).html(parseInt($("#number"+id).html()) + 1);
		    $("#totalprice"+id+" span").html((parseInt($("#number"+id).html()) * price).toFixed(2));
			refeshPrice(id,1)
		}else{
			var number = parseInt($("#number"+id).html());
	        if(number == 1){
	            return;
	        }	        
	        $("#number"+id).html(number - 1);	        
	        $("#totalprice"+id+" span").html((parseInt($("#number"+id).html()) * price).toFixed(2));
			refeshPrice(id,-1)
		}
    }
	function refeshPrice(id,addOrDel){//addOrDel取值 ：1为增加1个，-1为减小1个
		var price= parseFloat($("#price"+id+" span").html());
		var priviledgeSingle = parseFloat($("#originalPrice"+id).html()) - price;
		$("#countMoney").html((parseFloat($("#countMoney").html()) + addOrDel*price).toFixed(2));
		$("#totalPriviledge").html( ( parseFloat($("#totalPriviledge").html()) + addOrDel*priviledgeSingle ).toFixed(2));
		$("#countprice").html((parseFloat($("#countMoney").html()) + parseFloat($("#yunfei").html())).toFixed(2));
	}
	//删除记录
	function del(id){
		$.ajax({
            url: "cart/delcart",
            type: "GET",
            dataType: "json",
            data: {
            	id: id
            },
            async: false,
            success: function(data) {
              if(data['result']=="false")
        	  {
            	  alert(data['message']);
            	  return;
        	  }
              else
              {   
            	  $("#countItem").html(parseInt($("#countItem").html()) - 1);
					refeshPrice(id,-1*$("#number"+id).html());//删除成功后，更改总金额
					$("div").remove("#cart-list"+id);
					refreshCheckBox();//删除div后，更新选择商品的数量
					reloadArea();
                  setTimeout(function(){ 		                      
                  },500);
              }
            },
            error: function() {
              alert("删除失败");
            }
          });		 
	}
	$("#goPayBtn").click(function(){//去支付
		//1.保存购物车中选中的商品数据,修改状态为1
		var goodIds = $("#confirmids").val();
		var goodNums = $("#confirmnums").val();
		$(":checkbox").each(function(i){
    		if(!$(this).parent().hasClass("uncheck")){
    			var attrId = $(this).attr("id");
    			if(attrId.substring(0,4) == "good")
   				{
   					var id = attrId.replace("good","");
        	 		goodIds = (goodIds==""?"":(goodIds + ",")) + id;
        	 		goodNums = (goodNums==""?"":(goodNums + ",")) + $("#number"+id).html();
   				}
   			}
		});
		$("#confirmids").val(goodIds);
		$("#confirmnums").val(goodNums);
		$("#confirmForm").submit();
		
		//location.href = "pages/backPage/shop/confirm.jsp";
	});
	$("#continueShopping").click(function(){//继续购物
		location.href = "goods_main.jsp";
	});
	
	function reloadArea()
	{
		var n = $(".cart-list").length;
		var height = 41+126*n+291;
		$(".tipContent").css("height",height+"px");
	}
	$(document).ready(function(){
		reloadArea();
	});

	//单击复选框时
	function unCheck(){//返回一共有几个没选中
		var unCheckNum = 0;
		var countMoney = 0 ,totalPriviledge = 0;
		$(".checkToggle").each(function(i){
			if( i !== $(".checkToggle").length-1){
				var id = $(this).children("input").attr("id").replace("good","");
				if($(this).hasClass("uncheck")){
					unCheckNum++;
				}else{
					var price= parseFloat($("#price"+id+" span").html());
					var priviledgeSingle = parseFloat($("#originalPrice"+id).html()) - price;
					countMoney +=  parseFloat($("#totalprice"+id+" span").html());
					totalPriviledge += parseFloat(priviledgeSingle*$("#number"+id).html());

				}
			}
		});
		$("#countMoney").html(countMoney.toFixed(2));
		$("#totalPriviledge").html(totalPriviledge.toFixed(2));
		$("#countprice").html((countMoney + parseFloat($("#yunfei").html())).toFixed(2));
		return unCheckNum;
	}
	function refreshCheckBox(){//判断每个商品的选中状态，以此来更新全部选择复选框
		var unCheckNum = unCheck();
		if(unCheckNum > 0){
			$(".checkToggle").has("#selectAll").addClass("uncheck");
		}else{
			$(".checkToggle").has("#selectAll").removeClass("uncheck");
		}
		$("#countItem").html($(".checkToggle").length - 1 - unCheckNum);//更新选择的数量;
	}
	function choose(id){
		if(id == "selectAll"){//单击全选复选框时
			if($(".checkToggle").has("#selectAll").hasClass("uncheck")){
				$(".checkToggle").removeClass("uncheck");
			}else{
				$(".checkToggle").addClass("uncheck");
			}
		}else{//单击其它复选框时
			$(".checkToggle").has("#"+id).toggleClass("uncheck");
		}
		refreshCheckBox();
	}
	
	function checkedNum(){
		//checkNum=function(){$(".checkToggle>label").checked="checked";}
	
		$(".checkToggle").find(':checkbox').each(function(){
			if($(this).is(":checked")){
				alert(this.length)
			}
		})
		
	}	
	</script>
</html>
