<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>申请管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/application/application/">申请列表</a></li>
		<%-- <shiro:hasPermission name="application:application:edit"><li><a href="${ctx}/application/application/form">申请添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="application" action="${ctx}/application/application/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>申请账号：</label>
				<form:input path="account" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>申请人：</label>
				<form:input path="username" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>电话：</label>
				<form:input path="phone" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>审核状态：</label>
				<form:select path="review"  class="input-medium" style="width:176px; ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('application_review')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>打款状态：</label>
				<form:select path="payment" class="input-medium" style="width:176px; ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('application_payment')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li style="display:block;clear:both;">
			<label>时间段：</label>
				<input name="startDate" id="startTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${courierUser.loginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>至
				<input name="endDate" id="endTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${courierUser.loginDate}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>申请账号</th>
				<th>申请人</th>
				<th>电话</th>
				<th>申请金额</th>
				<th>审核状态</th>
				<th>打款状态</th>
				<th>生成时间</th>
				<th>银行类型</th>
				<shiro:hasPermission name="application:application:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="application">
			<tr>
				<td>
					${application.account}<input type="hidden" value="${application.userId}"/>
				</td>
				<td><a href="${ctx}/application/application/form?id=${application.id}">
					${application.username}
				</a></td>
				<td>
					${application.phone}
				</td>
				<td>
					${application.money}
				</td>
				<c:if test="${application.review == 0}">
					<td>
						未审核
					</td>
				</c:if>
				<c:if test="${application.review == 1}">
					<td>
						审核通过
					</td>
				</c:if>
				<c:if test="${application.review == 2}">
					<td>
						审核不通过
					</td>
				</c:if>
				<c:if test="${application.payment == 0}">
					<td>
						未打款
					</td>
				</c:if>
				<c:if test="${application.payment == 1}">
					<td>
						已打款
					</td>
				</c:if>
				<c:if test="${application.payment == 2}">
					<td>
						其他
					</td>
				</c:if>
				<td>
					${application.createTime}
				</td>
				<td>
					${application.bank}
				</td>
				<shiro:hasPermission name="application:application:edit"><td>
    				<a href="${ctx}/application/application/form?id=${application.id}">处理</a>
					<a href="${ctx}/application/application/delete?id=${application.id}" onclick="return confirmx('确认要删除该申请吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>