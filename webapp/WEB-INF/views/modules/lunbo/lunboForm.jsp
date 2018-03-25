<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>轮播图片管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/lunbo/lunbo/">轮播图片列表</a></li>
		<li class="active"><a href="${ctx}/lunbo/lunbo/form?id=${lunbo.id}">轮播图片<shiro:hasPermission name="lunbo:lunbo:edit">${not empty lunbo.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="lunbo:lunbo:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="lunbo" action="${ctx}/lunbo/lunbo/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">轮播图片名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">轮播图片：</label>
			<div class="controls">
				<form:hidden id="picture" path="picture" htmlEscape="false" maxlength="256" class="input-xlarge"/>
				<sys:ckfinder input="picture" type="images" uploadPath="/lunbo/lunbo" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">图片链接：</label>
			<div class="controls">
				<form:input path="urls" htmlEscape="false" maxlength="256" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<li>1.链接商品时，填入:goodsDetails?goods_id=xx,xx表示商品id(纯数字),可在商品详情页查到.</li>
		<div class="form-actions">
			<shiro:hasPermission name="lunbo:lunbo:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>