<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>积分商城商品管理</title>
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
		<li><a href="${ctx}/integralcommodity/integralCommodity/">积分商城商品列表</a></li>
		<li class="active"><a href="${ctx}/integralcommodity/integralCommodity/form?id=${integralCommodity.id}">积分商城商品<shiro:hasPermission name="integralcommodity:integralCommodity:edit">${not empty integralCommodity.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="integralcommodity:integralCommodity:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="integralCommodity" action="${ctx}/integralcommodity/integralCommodity/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>		
		<div class="control-group">
			<label class="control-label">库存：</label>
			<div class="controls">
				<form:input path="number" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品名：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品图片：</label>
			<div class="controls">
				<form:hidden id="picture" path="picture" htmlEscape="false" maxlength="50" class="input-xlarge"/>
				<sys:ckfinder input="picture" type="files" uploadPath="/integralcommodity/integralCommodity" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">所需积分：</label>
			<div class="controls">
				<form:input path="integral" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<%-- <div class="control-group">
			<label class="control-label">所属类别：</label>
			<div class="controls">
				<form:select path="typeid" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div> --%>
		<div class="control-group">
			<label class="control-label">所属类别：</label>
			<div class="controls">
				<input id="hetname" type="hidden" value="${integralCommodity.typeid}"/>
				<form:select path="typeid" id="select2" class="input-xlarge required">
					<c:forEach items="${typeList}" var="type">
						<option value="${type.id }">${type.name }</option>
					</c:forEach>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">子图片1：</label>
			<div class="controls">
				<form:hidden id="onepicture" path="onepicture" htmlEscape="false" maxlength="50" class="input-xlarge"/>
				<sys:ckfinder input="onepicture" type="files" uploadPath="/integralcommodity/integralCommodity" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">twopicture：</label>
			<div class="controls">
				<form:hidden id="twopicture" path="twopicture" htmlEscape="false" maxlength="50" class="input-xlarge"/>
				<sys:ckfinder input="twopicture" type="files" uploadPath="/integralcommodity/integralCommodity" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">threepicture：</label>
			<div class="controls">
				<form:hidden id="threepicture" path="threepicture" htmlEscape="false" maxlength="50" class="input-xlarge"/>
				<sys:ckfinder input="threepicture" type="files" uploadPath="/integralcommodity/integralCommodity" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品描述：</label>
			<div class="controls">
				<form:input path="description" htmlEscape="false" maxlength="50" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上架状态：</label>
			<div class="controls">
				<form:select path="status" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('integral_commodity_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">生产日期：</label>
			<div class="controls">
				<input name="createtime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${integralCommodity.createtime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="integralcommodity:integralCommodity:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>