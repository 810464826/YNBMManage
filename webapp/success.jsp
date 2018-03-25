<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <link rel="stylesheet" href="./css/weui/weui.css">
    <link rel="stylesheet" href="./css/weui/example.css">
</head>
<body ontouchstart="">

    <div class="page msg">
            <div class="weui_msg">
                <div class="weui_icon_area"><i class="weui_icon_success weui_icon_msg"></i></div>
                <div class="weui_text_area">
                    <h2 class="weui_msg_title">操作成功</h2>
                    <p class="weui_msg_desc"></p>
                </div>
                <div class="weui_opr_area">
                    <p class="weui_btn_area">
                      <c:choose>
						<c:when test="${empty redirect}"> 
						<a href="./weixin/OAuth2" class="weui_btn weui_btn_primary">关闭</a>
   						</c:when>

						<c:otherwise>
						<a href="${redirect}" class="weui_btn weui_btn_primary">关闭</a>
   						</c:otherwise>
					</c:choose>
                    </p>
                </div>
            </div>
        </div>
	</div>
	<script type="text/javascript">
	</script>
</body>
</html>
    