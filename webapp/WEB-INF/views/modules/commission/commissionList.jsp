<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>提成管理</title>
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
		<li class="active"><a href="${ctx}/commission/commission/">提成列表</a></li>
		<%-- <shiro:hasPermission name="commission:commission:edit"><li><a href="${ctx}/commission/commission/form">提成添加</a></li></shiro:hasPermission> --%>
	</ul>
	<form:form id="searchForm" modelAttribute="commission" action="${ctx}/commission/commission/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>用户编号：</label>
				<form:input path="userid" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>订单号：</label>
				<form:input path="ordernum" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>购买者编号：</label>
				<form:input path="orderUserid" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li><label>几级提成：</label>
				<form:input path="level" htmlEscape="false" maxlength="100" class="input-medium"/>
			</li>
			<li>
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
				<th>用户编号</th>
				<th>购买订单号</th>
				<th>购买者的用户编号</th>
				<th>属于第几级提成</th>
				<th>提成的金额</th>
				<th>生成时间</th>
				<shiro:hasPermission name="commission:commission:edit"><th>操作</th></shiro:hasPermission> 
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="commission">
			<tr>
				<td><a href="${ctx}/commission/commission/form?id=${commission.id}">
					${commission.userid}
				</a></td>
				<td>
					${commission.ordernum}
				</td>
				<td>
					${commission.orderUserid}
				</td>
				<td>
					${commission.level}
				</td>
				<td>
					${commission.money}
				</td>
				<td>
					${commission.createTime}
				</td>
				 <shiro:hasPermission name="commission:commission:edit"><td>
    				<%--<a href="${ctx}/commission/commission/form?id=${commission.id}">修改</a>--%>
					<a href="${ctx}/commission/commission/delete?id=${commission.id}" onclick="return confirmx('确认要删除该提成吗？', this.href)">删除</a>
				</td></shiro:hasPermission> 
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>