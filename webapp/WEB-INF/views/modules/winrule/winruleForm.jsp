<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>抽奖规则管理</title>
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
		<li><a href="${ctx}/winrule/winrule/">抽奖规则列表</a></li>
		<li class="active"><a href="${ctx}/winrule/winrule/form?id=${winrule.id}">抽奖规则<shiro:hasPermission name="winrule:winrule:edit">${not empty winrule.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="winrule:winrule:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="winrule" action="${ctx}/winrule/winrule/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">背景图片：</label>
			<div class="controls">
				<form:hidden id="backimage" path="backimage" htmlEscape="false" maxlength="5000" class="input-xlarge"/>
				<sys:ckfinder input="backimage" type="images" uploadPath="/winrule/winrule" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">指针图片：</label>
			<div class="controls">
				<form:hidden id="pointimage" path="pointimage" htmlEscape="false" maxlength="5000" class="input-xlarge"/>
				<sys:ckfinder input="pointimage" type="images" uploadPath="/winrule/winrule" selectMultiple="false"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="winrule:winrule:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>