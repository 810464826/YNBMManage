	<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	//首次登录后刷新一次
	Boolean refresh = (Boolean)session.getAttribute("refresh");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="renderer" content="webkit">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="一家一盒">
<meta http-equiv="description" content="一家一盒">
<title>一家一盒</title>
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/pccommon.css" />
<link rel="stylesheet" href="./css/personCenter.css" />
<link rel="stylesheet" href="./css/reset.css">
<link rel="stylesheet" href="./css/waterfall.css">
<style type="text/css">
.title{
    width: 265px;
    height: 34px;
    text-align: center;
    margin-top:20px;
    border-bottom: 1px #F6F6F6 solid;
    color: #444;
    font-size: 14px;
}
.jiage{
    margin-top: 10px;
    text-align: center;
    color: #FF712F;
    font-size: 22px;
}
</style>

</head>
<body>
	<header class="header">
		<div class="mainHeader">
		<div class="logo">
			<a href="./goods_main.jsp"> <img src="./img_new/LOGO.png"
				alt="logo" />
			</a>
		</div>

		<ul class="operate" style="float:left;margin-left:910px;">
			<li><a href="user/info"> <img
					src="./img/personCenter/user-icon-gray.png"
					alt="personCenterIcon" />
			</a></li>
			<li class="header-shopIcon"><a href="cart/mycart"> <img
					src="./img/personCenter/shoppingBusIcon.png"
					alt="shoppingBusIcon" />
			</a></li>
		</ul>
		</div>
	</header>
	<div id="header2">
		<a href="./index.html"> <img src="./img/banner.png"
			alt="personCenterIcon" />
		</a>
	</div>
	<div id="container"></div>
	<script type="text/x-handlebars-template" id="waterfall-tpl">
{{#result}}
    <div class="item">
        <a href="index?goods_id={{shopid}}" style="display:inline-block;"><img src="{{image}}" width="{{width}}" height="{{height}}" /></a>
		<div class="title">
			<span>{{name}}</span>
		</div>
		<div class="jiage">
			<span class="price">￥{{prices}}</span> 
		</div>
    </div>
{{/result}}
</script>
	<script type="text/javascript">
	function load()//使网页内容在大窗口中显示,如果没有这个函数，则网页会在中间弹出的小弹框中显示
	{
		if(window.parent != window)
		{
			window.parent.location.href=window.location.href;
		}
	}
	load();
	</script>
	<script src="./js_lib/jquery/jquery.js"></script>
	<script src="./js_lib/waterfall/libs/handlebars/handlebars.js"></script>
	<script src="./js_lib/waterfall/waterfall.min.js"></script>
	<script>
	var timename= null;
	 
	var refresh=<%=refresh%>;
		$('#container').waterfall({
			itemCls : 'item',
			colWidth : 285,
			gutterWidth : 10,
			gutterHeight : 10,
			dataType: "json",
			checkImagesLoaded : false,
			callbacks : {
				loadingStart: function($loading) {
                    $loading.show();
                    //延时0.5秒,等待加载完成
                   // setTimeout(1000);
                },
				
                loadingFinished : function($loading, isBeyondMaxPage) {
					if (!isBeyondMaxPage) {
						$loading.fadeOut();
					} else {
						$loading.hide();
					}
					$(".item img").load(function(){
						setItemTop();//加载完成后，重新设置每个item元素的top值
					});
				},
				
				renderData: function (data, dataType) {
		            var tpl,
		                template,
		                resultNum = data.total;
		                
		            if ( resultNum < 20) {
		                $('#container').waterfall('pause', function() {
		                    //$('#waterfall-message').html('<p style="color:#666;">到底了...</p>')
		                    <%--clearInterval(timename);--%>
		                    <%--if("test" != window.name){		                    	--%>
		                    	<%--//延时0.1秒,等待加载完成--%>
		                        <%--window.name = 'test';--%>
		                        <%--//alert(window.name);--%>
		        	        	<%--timename = setInterval("waitting()",100);--%>
		                	<%--}--%>
		                });
		            }
		    
		            if ( dataType === 'json' ||  dataType === 'jsonp'  ) { // json or jsonp format
		                tpl = $('#waterfall-tpl').html();
		                template = Handlebars.compile(tpl);
		    
		                return template(data);
		            } else { // html format
		                return data;
		            }
	        	}
			},
			
			path : function(page) {
				return './data/data' + page + '.json';
			}
		});
		
		function waitting(){
			window.location.reload();
		}

	function getItem(){
		var item = [];//这会是一个二维数组，将所有的item元素按left值分组存起来
		var leftOfItem = [];//所有不同的left值组成的数组
		$(".item").each(function(i){
			if(i==0){
				leftOfItem.push(parseFloat($(this).position().left));
				item.push([this]);return true;
			}
			var left = parseFloat($(this).position().left);
			for(var j=0;j<leftOfItem.length;j++){
				if(left == leftOfItem[j]){
					item[j].push(this);break;
				}
			}
			if(j==leftOfItem.length){
				leftOfItem.push(left);
				item.push([this]);
			}
		});
		return item;
	}
	function setItemTop(){//设置每个item元素的高度
		var item = getItem();
		for(var i=0,len = item.length;i<len;i++){
			for(var j=0,leng = item[i].length;j<leng;j++){
				if(j-1 in item[i]){
					var top = $(item[i][j-1]).position().top+$(item[i][j-1]).innerHeight()+10;
					$(item[i][j]).css("top",top);
				}
			}
		}
	}
	</script>
	
</body>
</html>
