<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.job.server.utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>一家一盒</title>
		<meta http-equiv="Content-Type" content="text/html; charset=utf8">
		<link href="<%=basePath%>css/main.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/back.page.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/shop-detail.css" rel="stylesheet" type="text/css" />
		<link href="<%=basePath%>css/indexlunbo.css" rel="stylesheet" type="text/css" />
	<style>
		#shopCart{background-color: #fff;width:213px;height: 125px;position:absolute;
					-webkit-box-shadow: 0 0 4px 0 rgba(132,132,132,.5);
					-moz-box-shadow: 0 0 4px 0 rgba(132,132,132,.5);
					box-shadow: 0 0 4px 0 rgba(132,132,132,.5);z-index:10;
					left:1201px;border: 1px solid #707070;border-radius:2px;
					top:47px;
		}
		#sanjiao{width:10px;height:10px;background-color:#fff;
					-webkit-transform:rotate(45deg);position:absolute;
					border-top:1px solid #707070;border-left:1px solid #707070;
					top:-6px;left:50%;margin-left:-5px;
		}
	</style>
	</head>
	<script type="text/javascript">
	//商品套装类型
	var productType=0;
		function showHideCode(){
             $("#showdiv").toggle();
          }
		function one() {
			$("#shopCart").css("display","none");
            $(".danjia").text("${member0}");
            $(".shichang").text("${originalprice0}");
            var x = Number($(".shichang").text()) - Number($(".danjia").text());
            $(".jieshen").text(Math.round(x * Math.pow(10, 3)) / Math.pow(10, 3) );
            productType=0;
        }
        function two(){
        	$("#shopCart").css("display","none");
                $(".danjia").text("${member1}");
                $(".shichang").text("${originalprice1}");
                var x = Number($(".shichang").text()) - Number($(".danjia").text());
                $(".jieshen").text(Math.round(x * Math.pow(10, 3)) / Math.pow(10, 3));
                productType=1;
            }
        function three(){
        	$("#shopCart").css("display","none");
            $(".danjia").text("${member2}");
            $(".shichang").text("${originalprice2}");
            var x = Number($(".shichang").text()) - Number($(".danjia").text());
            $(".jieshen").text(Math.round(x * Math.pow(10, 3)) / Math.pow(10, 3));
            productType=2;
        }
	</script>
	<body onload="one();">
	<div class="header" style="overflow:visible;">
		<div class="mainHeader" style="position:relative;overflow:visible;">
			<div class="logo">
				<a href="<%=basePath%>index.html">
					<img src="<%=basePath%>img_new/LOGO.png"/>
				</a>
			</div>
			<div class="menu">
				<!--  <span class="active"><a href="#">账号管理</a></span>
				<span><a href="#">订单管理</a></span>
				<span><a href="#">地址管理</a></span>
				<span><a href="#">安全退出登录</a></span>-->
			</div>
			<div class="operate">
				<a href="user/info">
					<img src="<%=basePath%>img_new/user-icon-gray.png"/>
				</a>
				<a href="cart/mycart">
					<img src="<%=basePath%>img_new/shop-icon.png" style="margin-left:50px"/>
				</a>
			</div>
			<div id="shopCart">
			<div style="float: right;margin-top: 10px;margin-right: 10px">
				<img style="width: 12px;cursor: pointer;" onclick="window.close()" src="<%=basePath%>img_new/close_icon.png"/>
			</div>
			<div style="margin-top: 40px;margin-left: 40px">
				<img style="vertical-align:top;width: 16px;height: 16px;" src="<%=basePath%>img_new/success.png"/>
				<span style="line-height:14px;margin-left: 2px;font-size: 14px;position: relative;top:-10px;">商品已加入购物车</span>
			</div>
			<div style="margin-left:30px;">
				<button style="width: 80px;height: 30px;background-color: #ff712f;text-align: center;border-radius:2px;">
					<a href="cart/mycart"><span style="color: #fff;">去结算</span></a>
				</button>
				<a href="<%=basePath%>goods_main.jsp"><span style="margin-left: 20px;cursor: pointer;" >继续逛>>></span></a>
			</div>
			<div id="sanjiao"></div>
		</div>
		</div>
	</div>

		<div class="body" style="width: 1200px;clear:both">
			<div class="photo">
		<div class="goos_pic" id="chinaz" >		
		<ul class="banner-img">
		<li>
			<img src="<%=basePath%>${subpicture1}" alt="商品列表">
			
		</li>
		<li>
			<img src="<%=basePath%>${subpicture2}" alt="商品列表">
			
		</li>
		<li>
			<img src="<%=basePath%>${subpicture3}" alt="商品列表">
			
		</li>
		<li>
			<img src="<%=basePath%>${subpicture4}" alt="商品列表">
			
		</li>
	</ul>
	
				</div>
				<ul class="banner-circle">
		<li class="selected">
			<a href="javascript:;" rel="nofollow">
			<img src="<%=basePath%>${subpicture1}" alt="商品列表">
			</a>
		</li>
		<li>
			<a href="javascript:;" rel="nofollow">
				<img src="<%=basePath%>${subpicture2}" alt="商品列表">
			</a>
		</li>
		<li>
			<a href="javascript:;" rel="nofollow">
				<img src="<%=basePath%>${subpicture3}" alt="商品列表">
			</a>
		</li>
		<li>
			<a href="javascript:;" rel="nofollow">
			<img src="<%=basePath%>${subpicture4}" alt="商品列表">
			</a>
		</li>
		
	</ul>
			</div>
			<div class="detail">
				<div class="introduce">
					<div class="title" style="margin-top: 40px;margin-bottom: 25px">
					<input type="hidden" id="commodityId" value="${id}">
						<span>${name}</span>
					</div>
					<div class="line"></div>
					<div class="discount">
						<span>￥</span><span  class="danjia"> ${member0}</span>
					</div>
					<div class="price">
						<span style="color: #444444">市场价：</span><span style="text-decoration:line-through;color:#707070" class="shichang">￥ ${originalprice0}</span>
						<span style="margin-left: 15px;color: #444444">已节省：</span><span style="color:#707070"  class="jieshen"></span>
					</div>
					<div style="overflow:hidden;" id = "showdiv" class="detail-title">
					
						<span>${description}</span>
					</div>
					<div class="shrink">
						<div class="line" style="border-top: 1px solid #D2D2D2"></div>
						 <div>
						 	<!-- <a  onclick="showHideCode()">
						 		<img src="<%=basePath%>img_new/drop-down.png"/>
						 	</a>  -->
						 </div> 						
						<div class="line" style="border-top: 1px solid #D2D2D2"></div>
						<img alt="" src="img/sp-xiala.png" style="background:#fff;"> 
					</div>
					<div class="bay-number">
						<div class="title">
							<span>选择规格</span>
						</div>
						<div class="size active" style="margin-left: 0px;cursor:pointer;"  onclick = "one()"><span>${boxtitle0}</span></div>
						<div class="size" onclick="two()" style="cursor:pointer"><span>${boxtitle1}</span></div>
						<div class="size" onclick = "three()" style="cursor:pointer;"><span>${boxtitle2}</span></div>
					</div>
					<div class="bay-operate">
						<input type="text" id="total" value="1"/>
						<button onclick="addShop()">
							<img src="<%=basePath%>img_new/shop-car.png"/>
							<span style="font-family: Microsoft YaHei;">加入购物车</span>
						</button>
					</div>
				</div>
				
			</div>
			<div class="jieshao">
				<div class="jieshao_top">
					<div class="jieshao_zhongxian_l"></div>
					<div class="jieshao_jieshao">
						<p class="p1">详&nbsp;情&nbsp;介&nbsp;绍</p>
						<p>M&nbsp;O&nbsp;R&nbsp;E</p>
					</div>
					<div class="jieshao_zhongxian_r"></div>
				</div>
			</div>
			<div class="neirong" style="text-align:center;">
				<img src="${providerintroduce}" alt="" />
			</div>
		</div>
	</body>
	<script type="text/javascript" src="<%=basePath%>js_lib/jquery/jquery.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/jsAddress.js"></script>
	<script type="text/javascript" src="<%=basePath%>js/chinaz.js"></script>
	<script type="text/javascript">
		
		$(".size").click(function(){
			$(".size").removeClass("active")
			$(this).addClass("active")
		})
		$(".list-picture img").click(function(){
			$(".list-picture .active").removeClass("active");
			$(this).addClass("active");
			$(".big-picture img").attr("src",$(this).attr("src"))
		});
		function addShop(){
			var id= $("#commodityId").val();
			var total= $("#total").val();
			 $.ajax({
		            url: "cart/addcart",
		            type: "GET",
		            dataType: "json",
		            data: {
		            	commodityId: id,
		            	total: total,
		            	type: productType
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
		            	  $("#shopCart").css("display","block");
		                  setTimeout(function(){ 		                      
		                  },500);
		              }
		            },
		            error: function() {
		              alert("添加购物车失败");
		            }
		          });
		}
		
		function close(){
			$("#shopCart").css("display","none");
		}
	</script>
</html>