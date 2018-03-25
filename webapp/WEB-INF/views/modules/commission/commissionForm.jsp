<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>提成管理</title>
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
		<li><a href="${ctx}/commission/commission/">提成列表</a></li>
		<li class="active"><a href="${ctx}/commission/commission/form?id=${commission.id}">提成<shiro:hasPermission name="commission:commission:edit">详细</shiro:hasPermission><shiro:lacksPermission name="commission:commission:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="commission" action="${ctx}/commission/commission/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">用户编号：</label>
			<div class="controls">
				<form:input path="userid" htmlEscape="false" maxlength="10" class="input-xlarge required" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">购买订单号：</label>
			<div class="controls">
				<form:input path="ordernum" htmlEscape="false" maxlength="50" class="input-xlarge required" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">购买者的用户编号：</label>
			<div class="controls">
				<form:input path="orderUserid" htmlEscape="false" maxlength="10" class="input-xlarge required" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">属于第几级提成：</label>
			<div class="controls">
				<form:input path="level" htmlEscape="false" maxlength="10" class="input-xlarge required" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">提成的金额：</label>
			<div class="controls">
				<form:input path="money" htmlEscape="false" class="input-xlarge required" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">生成时间：</label>
			<div class="controls">
				<form:input path="createTime" htmlEscape="false" maxlength="50" class="input-xlarge required" disabled="true"/>
			</div>
		</div>
		<div class="form-actions">
			<%-- <shiro:hasPermission name="commission:commission:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission> --%>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>