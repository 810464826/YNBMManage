<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>中奖记录管理</title>
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
		<li class="active"><a href="${ctx}/winner/winner/">中奖记录列表</a></li>
		<shiro:hasPermission name="winner:winner:edit"><li><a href="${ctx}/winner/winner/form">中奖记录添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="winner" action="${ctx}/winner/winner/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>中奖名：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>中奖者的id：</label>
				<form:input path="userid" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>中奖名</th>
				<th>中奖者的id</th>
				<shiro:hasPermission name="winner:winner:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="winner">
			<tr>
				<td><a href="${ctx}/winner/winner/form?id=${winner.id}">
					${winner.name}
				</a></td>
				<td>
					${winner.userid}
				</td>
				<shiro:hasPermission name="winner:winner:edit"><td>
    				<a href="${ctx}/winner/winner/form?id=${winner.id}">修改</a>
					<a href="${ctx}/winner/winner/delete?id=${winner.id}" onclick="return confirmx('确认要删除该中奖记录吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>