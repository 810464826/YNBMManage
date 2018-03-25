<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>用户银行信息管理</title>
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
		<li class="active"><a href="${ctx}/userbanks/banks/">用户银行信息列表</a></li>
		<%-- <shiro:hasPermission name="userbanks:banks:edit"><li><a href="${ctx}/userbanks/banks/form">用户银行信息添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="banks" action="${ctx}/userbanks/banks/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>用户：</label>
				<form:input path="userid" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>银行名称：</label>
				<form:input path="bankname" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>银行卡号：</label>
				<form:input path="banknum" htmlEscape="false" maxlength="256" class="input-medium"/>
			</li>
			<li><label>用户姓名：</label>
				<form:input path="username" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>用户电话：</label>
				<form:input path="phone" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>用户</th>
				<th>银行名称</th>
				<th>银行卡号</th>
				<th>用户姓名</th>
				<th>用户电话</th>
				<th>生成时间</th>
				<shiro:hasPermission name="userbanks:banks:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="banks">
			<tr>
				<td><%-- <a href="${ctx}/userbanks/banks/form?id=${banks.id}"> --%>
					${banks.userid}
				<!-- </a> --></td>
				<td>
					${banks.bankname}
				</td>
				<td>
					${banks.banknum}
				</td>
				<td>
					${banks.username}
				</td>
				<td>
					${banks.phone}
				</td>
				<td>
					${banks.createTime}
				</td>
				<shiro:hasPermission name="userbanks:banks:edit"><td>
    				<%-- <a href="${ctx}/userbanks/banks/form?id=${banks.id}">修改</a> --%>
					<a href="${ctx}/userbanks/banks/delete?id=${banks.id}" onclick="return confirmx('确认要删除该用户银行信息吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>