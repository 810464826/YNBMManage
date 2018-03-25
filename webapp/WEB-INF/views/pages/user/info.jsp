<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.job.server.utils.Constants"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String adminFlag = (String) request.getSession().getAttribute(Constants.ADMIN_FLAG);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>一家一盒</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf8">
    <link rel="stylesheet" href="<%=basePath%>css/main.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/pccommon.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/personCenter.css"/>

</head>
<body>
    <header class="topHeader">
    <div class="mainHeader">
        <div class="logo">
            <a href="<%=basePath%>goods_main.jsp">
                <img src="<%=basePath%>img_new/LOGO.png" alt="logo"  title="首页" />
            </a>
        </div>

        <ul class="operate">
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
            <li  data-navName="account" class="header-nav-active" style="border-bottom:3px solid #FF712F;"><a href="user/info">账号管理</a></li>
            <li data-navName="orderInfo"><a href="order/list">订单管理</a></li>
            <li data-navName="address"><a href="user/address">地址管理</a></li>
            <li class="out"><a  href="user/logout">安全退出登录</a></li>
        </ul>
    </div>
    </header>
    <section id="main">

        <div class="contain" id="account">
        <input type="hidden" id="username" name="username" value="${name}">
            <ul>
                <li>
                    <div class="rotate-box" id="personSet">
                        <div class="box account-box-size  front" id="personSetFront">
                            <h2 class="box-header account-box-header">个人设置</h2>
                            <div class="account-box-body">
                                <div id="frontImg" class="account-box-img headIcon">
	                                <div class="box-tableCell">
	                                 	<img  src="<%=basePath%>img/personCenter/faces/${faceicon}" alt="${faceicon}"/>
	                                </div>
                                </div>
                                <p id="nickname" class="account-box-imgInfo">${nickname}</p>
                            </div>
                            <footer class="box-footer">
                                <div class="btn-box">
                                    <button class="fl" id="edit">设置头像</button>
                                    <button class="fr" id="reNameFront">修改昵称</button>
                                </div>
                            </footer>
                        </div>
                        <div class="box account-box-size  back" id="personSetBack" >
                            <h2 class="box-header account-box-header">上传头像</h2>
                           
                            <div class="account-box-body">
                                <div id="preImg" class="account-box-img">
                                	<div class="box-tableCell headIcon">
                                   		 <img   src="<%=basePath%>img/personCenter/faces/${faceicon}" alt="${faceicon}"/>
                                    </div>
                                </div>
                                <!--<p class="account-box-imgInfo">头像</p>-->
                                <input id="chooseFile" class="chooseFile" type="text" placeholder="请输入图像地址"/>
                                <div class="updateBox">
                                    <label for="updateBtnDefault">选择文件</label>
                                    <input id="updateBtnDefault" name="updateBtnDefault" class="updateBtnDefault" type="file"/>
                                </div>
                            </div>
                            <footer class="box-footer">
                                <div class="btn-box">
                                    <button class="fl" id="sureUpdate">确定上传</button>
                                    <button class="fr" id="cancelUpadate">取消</button>
                                </div>
                            </footer>
                            
                        </div>
                        <div class="box account-box-size  back" id="rename">
                            <h2 class="box-header account-box-header">修改昵称</h2>
                            <div class="account-box-body  box-form-input">
                                <p id="oldName" class="oldName">旧昵称：<span>${nickname}</span></p>
                                <label for="nameInput" hidden>请输入新的昵称</label>
                                 <input  id="nameInput" type="text" placeholder="请输入新的昵称"/>
                                <div class="box-form-errorInfo hidden">
                                    <img src="<%=basePath%>img_new/information copy.png" alt=""/>
                                    <span>昵称的格式不正确，请重新输入</span>
                                </div>
                            </div>
                            <footer class="box-footer">
                                <div class="btn-box">
                                    <button class="fl" id="sureRename">确定修改</button>
                                    <button class="fr" id="cancelRename">取消</button>
                                </div>
                            </footer>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="rotate-box">
                        <div class="box account-box-size front" id="VIPFront">
                            <h2 class="box-header account-box-header" >会员认证状态</h2>
                            <div class="account-box-body">
                            <c:choose> 
                                <c:when test="${level == 2}">
                                <div class="account-box-img">   
                               	    <div class="box-tableCell">                             
                                   		 <img  src="<%=basePath%>img/personCenter/goldVIPIcon.png" alt="goldVIPIcon"/>                                
                                    </div>
                                </div>
                                <p class="account-box-imgInfo">金牌会员</p>
                                 </c:when>
                                <c:otherwise>
                                <div class="account-box-img"> 
                                	<div class="box-tableCell">                               
                                   		 <img  src="<%=basePath%>img/personCenter/tiyanVIPIcon.png" alt="goldVIPIcon"/>     
                                    </div>                         
                                </div>
                                <p class="account-box-imgInfo">体验会员</p>
                                </c:otherwise>
                            </c:choose>
                            </div>
                            <footer class="box-footer">
                                <div class="btn-box box-vip-btn">
                                    <button class="fl" >升级会员</button>
                                    <button class="fr" id="bs-a"><a href="/yijiayihe/pages/Help/huiyuan.html#quanyi" target="-blank">查看会员特权</a></button>
                                </div>
                            </footer>
                        </div>
                        <div class="box account-box-size back" id="VIPBack">
                            <h2 class="box-header account-box-header" >会员认证状态</h2>
                            <div class="account-box-body">
                                <div class="account-box-img">
                                	<div class="box-tableCell">
                                    	<img  src="<%=basePath%>img/personCenter/goldVIPIcon.png" alt="goldVIPIcon"/>
                                	</div>
                                	<p class="account-box-imgInfo">金牌会员</p>
                                </div>
                            </div>
                            <footer class="box-footer">
                                <div class="btn-box box-vip-btn">
                                    <button class="fl" >升级会员</button>
                                    <button class="fr">查看会员特权</button>
                                </div>
                            </footer>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="rotate-box">
                        <div class="box account-box-size front" id="pwdFront">
                            <h2 class="box-header account-box-header">密码变更</h2>
                            <div class="account-box-body" >
                                <div class="account-box-img">
                                	<div class="box-tableCell">
                                   		 <img  src="<%=basePath%>img/personCenter/passpord.png" alt="passpordIcon"/>
                                    </div>
                                </div>
                            </div>
                            <footer class="box-footer" >
                                <div class="btn-box">
                                    <button id="setPw">修改密码</button>
                                </div>
                            </footer>
                        </div>
                        <div class="box account-box-size back" id="rePwd">
                            <h2 class="box-header account-box-header">密码变更</h2>
                            <div class="account-box-body" >
                                <div class="box-form">
                                    <form action="" class="box-form-input" >
                                        <label for="oldPwd" hidden>旧密码</label>
                                        <input  id="oldPwd" type="password" placeholder="旧密码"/>
                                        <div class="box-form-errorInfo ">
                                            <img src="<%=basePath%>img_new/information copy.png" alt=""/>
                                            <span>密码错误，请重新输入</span>
                                        </div>
                                        <label for="newPwd" hidden>新密码</label>
                                        <input id="newPwd" type="password" placeholder="新密码"/>
                                        <div class="box-form-errorInfo">
                                            <img src="<%=basePath%>img_new/information copy.png" alt=""/>
                                            <span>密码格式不正确</span>
                                        </div>
                                        <label for="surePwd" hidden>确认新密码</label>
                                        <input id="surePwd" type="password" placeholder="确认新密码"/>
                                        <div class="box-form-errorInfo">
                                            <img src="<%=basePath%>img_new/information copy.png" alt=""/>
                                            <span>两次密码不相同，请重新输入</span>
                                        </div>
                                    </form>
                                 </div>
                            </div>
                                <footer class="box-footer" >
                                    <div class="btn-box">
                                        <button id="surePwBtn">确认修改</button>
                                    </div>
                                </footer>
                        </div>
                    </div>
                </li>
            </ul>



        </div>
    </section>
</body>
<script src="<%=basePath%>js/jquery-1.11.3.min.js"></script>
<script src="<%=basePath%>js/ajaxfileupload.js"></script>
<script src="<%=basePath%>js/personCenter.js"></script>
<script src="<%=basePath%>js/account.js"></script>
</html>