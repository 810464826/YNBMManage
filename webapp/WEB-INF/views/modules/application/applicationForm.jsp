<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>申请管理</title>
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
		<li><a href="${ctx}/application/application/">申请列表</a></li>
		<li class="active"><a href="${ctx}/application/application/form?id=${application.id}">申请<shiro:hasPermission name="application:application:edit">处理</shiro:hasPermission><shiro:lacksPermission name="application:application:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="application" action="${ctx}/application/application/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	
		<div class="control-group">
			<label class="control-label">申请账号：</label>
			<div class="controls">
				<form:input path="account" htmlEscape="false" maxlength="500" class="input-xlarge " disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">申请者姓名：</label>
			<div class="controls">
				<form:input path="username" htmlEscape="false" maxlength="500" class="input-xlarge " disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">电话：</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="500" class="input-xlarge " disabled="true"/>
			</div>
		</div>	
		<div class="control-group">
			<label class="control-label">申请提成的金额：</label>
			<div class="controls">
				<form:input path="money" htmlEscape="false" class="input-xlarge required" disabled="true"/>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">内容2：</label>
			<div class="controls">
				<form:input path="contents2" htmlEscape="false" maxlength="500" class="input-xlarge " disabled="true"/>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">生成时间：</label>
			<div class="controls">
				<form:input path="createTime" htmlEscape="false" maxlength="50" class="input-xlarge required" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">修改时间：</label>
			<div class="controls">
				<form:input path="updateTime" htmlEscape="false" maxlength="50" class="input-xlarge required" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">银行类型：</label>
			<div class="controls">
				<form:input path="bank" htmlEscape="false" maxlength="50" class="input-xlarge required" disabled="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">审核状态：</label>
			<div class="controls">
				<form:select path="review" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('application_review')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">打款状态：</label>
			<div class="controls">
				<form:select path="payment" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('application_payment')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">结果描述：</label>
			<div class="controls">
				<form:textarea path="contents1" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		
		<form:input path="review_time" type="hidden" htmlEscape="false" maxlength="50" class="reviewtime"/>
		<div class="form-actions">
			<shiro:hasPermission name="application:application:edit"><input id="btnSubmit" class="btn btn-primary" type="button" value="确定"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
	<script type="text/javascript">
	
	$("#btnSubmit").click(function(){
		var localTime = new Date();
		var year = localTime.getFullYear();
		var month = localTime.getMonth();
		var day = localTime.getDate();
		var hours = localTime.getHours();
		var min = localTime.getMinutes();
		var second = localTime.getSeconds();
		var Times = year + "-"+ (month+1) + "-"+day+ " " + hours + ":" + min + ":"+ second;
		$("#review_time").val(Times);
		$("#btnSubmit").submit();
	})
	</script>
</body>
</html>