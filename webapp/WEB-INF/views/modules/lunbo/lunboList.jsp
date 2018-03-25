<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>轮播图片管理</title>
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
		<li class="active"><a href="${ctx}/lunbo/lunbo/">轮播图片列表</a></li>
		<shiro:hasPermission name="lunbo:lunbo:edit"><li><a href="${ctx}/lunbo/lunbo/form">轮播图片添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="lunbo" action="${ctx}/lunbo/lunbo/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>图片名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>轮播图片名称</th>
				<shiro:hasPermission name="lunbo:lunbo:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="lunbo">
			<tr>
				<td><a href="${ctx}/lunbo/lunbo/form?id=${lunbo.id}">
					${lunbo.name}
				</a></td>
				<shiro:hasPermission name="lunbo:lunbo:edit"><td>
    				<a href="${ctx}/lunbo/lunbo/form?id=${lunbo.id}">修改</a>
					<a href="${ctx}/lunbo/lunbo/delete?id=${lunbo.id}" onclick="return confirmx('确认要删除该轮播图片吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>