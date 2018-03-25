<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.job.server.utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String adminFlag = (String) request.getSession().getAttribute(
			Constants.ADMIN_FLAG);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head lang="en">
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>一家一盒</title>
    <link rel="stylesheet" href="<%=basePath%>css/main.css" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>css/pccommon.css" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>css/personCenter.css" type="text/css"/>

</head>
<body>
<header class="topHeader">
    <div class="mainHeader">
    <div class="logo">
        <a href="<%=basePath%>goods_main.jsp">
            <img src="<%=basePath%>img_new/LOGO.png" alt="logo" />
        </a>
    </div>

    <ul class="header-icon">
        <li>
                <a href="user/info">
                    <img src="<%=basePath%>img/personCenter/personCenterIcon.png" alt="personCenterIcon" title="个人中心" />
                </a>
            </li>
            <li class="header-shopIcon">
                <a href="cart/mycart">
                    <img src="<%=basePath%>img/personCenter/shoppingBusIcon.png" alt="shoppingBusIcon" title="去购物车"/>
                </a>
            </li>
    </ul>
    <ul class="header-nav">
            <li  data-navName="account" ><a href="user/info">账号管理</a></li>
            <li data-navName="orderInfo"><a href="order/list">订单管理</a></li>
            <li data-navName="address" class="header-nav-active" style="border-bottom:3px solid #FF712F;"><a href="user/address">地址管理</a></li>
            <li class="out"><a  href="user/logout">安全退出登录</a></li>
        </ul>
    </div>
</header>
<section id="main">

    <div class="contain" id="address">
   
        
          
         
    	<c:forEach items="${data}" var="result">
 <div class="rotate-box" data-isDefault="${result.isdefault}" id="${result.id}">
<%--前面 --%>
<div class="box addr-box-size front"  id="aa${result.id}">
	<div class="box-header addr-box-header addr-gray">
		<div class="fl">
			<h2>${result.username}</h2>
		</div>
		<div class="fr defaultAddr hidden">
			<img src="<%=basePath%>img/personCenter/defaultAddr.png" alt="defaultAddrIcon"><span>默认地址</span>
		</div>
		<div class="fr setDefault ">
			<a  href="javascript:void(0);"  onClick="def(${result.id})">设为默认地址</a></div>
		</div>
		<div class="addr-box-body">
			<table class="personAddr">
				<tbody>
					<tr><td class="t11 alignR" style="font-size:12px;">收件人：</td>
						<td class="t12" style="font-size:12px;">${result.username}</td></tr>
					<tr><td class="t21 alignR" style="font-size:12px;">手机号码：</td>
						<td class="t22" style="font-size:12px;">${result.phone}</td></tr>
					<tr><td class="t21 alignR" style="font-size:12px;">固定号码：</td>
						<td class="t22" style="font-size:12px;">${result.telephone}</td></tr>
					<tr><td class="t31 alignR" style="font-size:12px;">所在地区：</td>
						<td class="t32" style="font-size:12px;">${result.province}&nbsp;&nbsp;${result.city}&nbsp;&nbsp;${result.county}</td></tr>
					<tr><td class="t41 alignR" style="font-size:12px;">详细地址：</td>
					<td class="t42" style="font-size:12px;">${result.address}</td></tr>
					<tr><td class="t51 alignR" style="font-size:12px;">区号：</td>
					<td class="t52" style="font-size:12px;">${result.areacode}</td></tr>
					<tr><td class="t51 alignR" style="font-size:12px;">邮编：</td>
					<td class="t52" style="font-size:12px;">${result.postcode}</td></tr>
				</tbody>
			</table>
		</div>
		<footer class="box-footer">
			<div class="btn-box"><button class="fl" id="edit${result.id}" onClick="modufy(${result.id})">编辑修改</button>
            <button class="fr" id="delete${result.id}" onClick="delBtn(${result.id});">删除</button>
			</div>
		</footer>
</div>
<%--背面 --%>
<div class="box addr-box-size back"  id="${result.id}Back" >
        <div class="box-header addr-box-header addr-gray">
            <div class="fl">
                <h2>${result.username}</h2>
            </div>
            <div class="fr defaultAddr">
                <img src="<%=basePath%>img/personCenter/defaultAddr.png" alt="defaultAddrIcon"/>
                <span></span>
            </div>
            
        </div>
        <div class="addr-box-body">
            <table class="personAddr box-form-input">
                <tbody>
                <tr>
                    <td class="t11 alignR">收件人：</td>
                    <td class="t12"><input id="updname${result.id}" name="userName${result.id}" type="text" value="${result.username}"/></td>
                </tr>
                <tr>
                    <td class="t21 alignR">手机号码：</td>
                    <td class="t22" ><input  id="updtelPhone${result.id}" name="telphone${result.id}"  type="text" value="${result.phone}"/></td>
                </tr>
                <tr>
                    <td class="t31 alignR">所在地区：</td>
                    <td class="t32 addr-select">
                        <select id="updarea${result.id}" style="display:none" ></select>
                        <label for="updcmbProvince${result.id}" style="display:none">请选择省份</label>
                        <select id="updcmbProvince${result.id}" >
                        </select>
                        <label for="updcmbCity${result.id}" style="display:none">请选择城市</label>
                        <select id="updcmbCity${result.id}" style="margin-right:-1px;"  >
                        </select>
                        <label for="updcmbArea${result.id}" style="display:none">请选择区县</label>
                        <select id="updcmbArea${result.id}" class="last" >
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="t41 alignR">详细地址：</td>
                    <td class="t42"><input id="updaddress${result.id}" name="detailAddr${result.id}" type="text" value="${result.address}"/></td>
                </tr>
                <tr>
                    <td class="t51 alignR">邮编：</td>
                    <td class="t52"><input id="updpostcode${result.id}" name="sampNum${result.id}" type="text" value="${result.postcode}"/></td>
                </tr>
                </tbody>
            </table>
        </div>
        <footer class="box-footer">
            <div class="btn-box">
                <button class="fl" id="editSure" onClick="sModuf(${result.id})">确认修改</button>
                <button class="fr" id="editCancel${result.id}" onClick="cancelModufy(${result.id})">取消</button>
            </div>
        </footer>
</div>
 </div>
 
        </c:forEach>
    	

    <!--没有任何收货地址-->
                <div id="addNewAddrBox" class="box addr-box-size" >
                    <div class="account-box-body" >
                        <div class="noAddr-box-img">
                            <img  src="<%=basePath%>img/personCenter/addrIcon.png" alt="addrIcon"/>
                            <p></p>
                        </div>
                    </div>
                    <footer class="box-footer" >
                        <div class="btn-box">
                            <button id="addNewAddr" >新增收获地址</button>
                        </div>
                    </footer>
                </div>
               
        
        <div id="addNewAddrAlert" class="mask-box " style="display:none">
            <div class="mask"></div>
            <div class="box alert-box-size addr-mask-box ">
                <h2 class="box-header alert-box-header">添加收货地址<a href="javascript:void(0);" class="fr alertClose">&times;</a></h2>
                <div class="alert-box-body" >
                    <form class="alertInfo" action="<%=basePath %>user/address" id="ad"
							method="post">
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
                                <input id="telPhone" name="telephone"  type="text" placeholder="固定号码（选填）"/>
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
                                <input id="addressss" name="address"  type="text" placeholder="详细街道楼宇名称/编号"/>
                            </li>
                            
                            <li id="checkToggle"  class="uncheck">
                               <!-- <input id="setDefaultAddr" type="checkbox" name="setDefaultAddr"  style="display:none;"/>
                                <label onclick="setDefaultAddrF();" id="agreen" for="setDefaultAddr" style="color:#707070;font-size:12px;"><i class="rightIcon"><b></b></b></i></i></label>
                                <label class="label" onclick="setDefaultAddrF();" for="setDefaultAddr">设为默认地址</label>  --> 
                                <div class="payBtn-box fr">
                                    <a id="saveAddr" onclick="document.getElementById('ad').submit();" href="javascript:void(0);">保存</a>
                                </div>
                            </li>
                        </ul>
                    </form>
                </div>
            </div>
        </div>
        <!--点击删除按钮时的弹出框-->
        <div id="deleteAlert" data-delId="" class="mask-box" style="display:none">
            <div class="mask"></div>
            <div class="box alert-box-size">
                <h2 class="box-header alert-box-header">提示<a href="javascript:void(0);" class="fr alertClose">×</a></h2>
                <div class="alert-box-body" >
                    <div class="alertInfo">
                        <img src="<%=basePath%>img/personCenter/delIcon.png" alt=""/>
                        <span>您确定要删除该地址吗？</span>
                    </div>
                </div>
                <footer class="box-footer alert-box-footer" >
                    <div class="alertBtn-box">
                        <a href="javascript:void(0);" onclick="sureDel()">确定</a>
                    </div>
                </footer>
            </div>
        </div>
    </div>
</section>
</body>
<script TYPE="text/javascript" src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script TYPE="text/javascript" src="<%=basePath%>js/jsAddress.js"></script>
<script TYPE="text/javascript" src="<%=basePath%>js/personCenter.js"></script>
<script TYPE="text/javascript" src="<%=basePath%>js/address.js"></script>
	<script type="text/javascript">

    function delBtn(id){
        $("#deleteAlert").show().attr("data-delId",id);
    }
    function sureDel(){
        var id = $("#deleteAlert").attr("data-delId");
        $("#deleteAlert").attr("data-delId","").hide();
        del(id)
    }
		function del(id){
		$.ajax({
            url: "address/deladdress",
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
              location.reload([true])  
            },
            error: function() {
              alert("删除失败");
            }
          });		
        }
        function def(id){
		$.ajax({
            url: "address/defaddress",
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
        	  
        	  if(data['result']=="true")
        	  {
            	 location.reload([true]) 
            	  setDefault("#aa"+data['add']);
            	  
        	  }
              
            },
            error: function() {
              alert("设置失败");
            }
          });
	    }
	  
	addressInit('area','cmbProvince','cmbCity','cmbArea','', '四川', '成都市', '郫　县');
	//addressInit('updarea','updcmbProvince','updcmbCity','updcmbArea','华东地区', '四川', '成都市', '郫　县');  
  function sModuf(id) {//弹出框中的确定按钮
  
	var name = $("#updname"+id).val();
	var telPhone = $("#updtelPhone"+id).val();
	var pro = $("#updcmbProvince"+id).val();
	var city = $("#updcmbCity"+id).val();
	var county = $("#updcmbArea"+id).val();
	var postcode = $("#updpostcode"+id).val();
	var address = $("#updaddress"+id).val();
	
	$.ajax({
        url: "address/updaddress",
        type: "GET",
        dataType: "json",
        data: {
        	id:id,
        	name: name,
        	phone:telPhone,
        	province:pro,
        	city:city,
        	county:county,
        	postcode:postcode,
        	address:address
        },
        async: false,
            success: function(data) {
              if(data['result']=="false")
        	  {
            	  alert(data['message']);
            	  return;
        	  }
        	  
        	  if(data['result']=="true")
        	  {
            	  rotate("aa"+id,id+"Back",2);//翻转效果
                  sureModif(id);
            	  
        	  }
              
            },
            error: function() {
              alert("修改失败");
        }
      });
	
	
	
};

	</script>
</html>
