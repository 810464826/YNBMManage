<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>抽奖规则管理</title>
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
		<li class="active"><a href="${ctx}/winrule/winrule/">抽奖规则列表</a></li>
		<shiro:hasPermission name="winrule:winrule:edit"><li><a href="${ctx}/winrule/winrule/form">抽奖规则添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="winrule" action="${ctx}/winrule/winrule/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>背景图片</th>
				<th>指针图片</th>
				<shiro:hasPermission name="winrule:winrule:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="winrule">
			<tr>
				<td><a href="${ctx}/winrule/winrule/form?id=${winrule.id}">
					${winrule.backimage}
				</a></td>
				<td>
					${winrule.pointimage}
				</td>
				<shiro:hasPermission name="winrule:winrule:edit"><td>
    				<a href="${ctx}/winrule/winrule/form?id=${winrule.id}">修改</a>
					<a href="${ctx}/winrule/winrule/delete?id=${winrule.id}" onclick="return confirmx('确认要删除该抽奖规则吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>