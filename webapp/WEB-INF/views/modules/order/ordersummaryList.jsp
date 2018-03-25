<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>订单管理管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#btnExport").click(function(){
				top.$.jBox.confirm("确认要导出订单数据吗？","系统提示",function(v,h,f){
					if(v=="ok"){
						$("#searchForm").attr("action","${ctx}/order/ordersummary/export");
						$("#searchForm").submit();
					}
				},{buttonsFocus:1});
				top.$('.jbox-body .jbox-icon').css('top','55px');
			});
			$("#btnSubmit").click(function(){
				$("#searchForm").attr("action","${ctx}/order/ordersummary/list");
				$("#searchForm").submit();
			});
		});
		function page(n,s){
			$("#pageNo").val(n);
			$("#pageSize").val(s);
			$("#searchForm").attr("action","${ctx}/order/ordersummary/list");
			$("#searchForm").submit();
        	return false;
        }
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/order/ordersummary/">订单管理列表</a></li>
		<shiro:hasPermission name="order:ordersummary:edit"><li><a href="${ctx}/order/ordersummary/form">订单管理添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="ordersummary" action="${ctx}/order/ordersummary/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>订单号：</label>
				<form:input path="ordernum" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>用户id：</label>
				<form:input path="userid" htmlEscape="false" maxlength="10" class="input-medium"/>
			</li>
			<li><label>发票类型：</label>
				<form:select path="invoicetype" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('invoicetype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('order_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>快递公司：</label>
				<form:select path="expresscomp" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('expresscomp')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<c:if test="${admin==1}">
				<li><label>商铺名称：</label>
					<form:input path="shopId" htmlEscape="false" maxlength="50" class="input-medium"/>
				</li>
			</c:if>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/>
			<input id="btnExport" class="btn btn-primary" type="button" value="导出"/>
			</li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>订单号</th>
				<th>订单金额</th>
				<th>用户id</th>
				<th>送货时间</th>
				<th>状态</th>
				<th>订单备注</th>
				<th>快递公司</th>
				<th>快递单号</th>
				<th>支付时间</th>
				<th>下单时间</th>
				<th>退货理由</th>
				<shiro:hasPermission name="order:ordersummary:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="ordersummary">
			<tr>
				<td><a href="${ctx}/order/ordersummary/form?id=${ordersummary.id}">
					${ordersummary.ordernum}
				</a></td>
				<td>
					${ordersummary.price}
				</td>
				<td>
					${ordersummary.userid}
				</td>
				<td>
					${fns:getDictLabel(ordersummary.expresstime, 'expresstime', '')}
				</td>
				<td>
					${fns:getDictLabel(ordersummary.status, 'order_status', '')}
				</td>
				<td>
					${ordersummary.orderdesc}
				</td>
				<td>
					${fns:getDictLabel(ordersummary.expresscomp, 'expresscomp', '')}
				</td>
				<td>
					${ordersummary.expressno}
				</td>
				<td>
					<fmt:formatDate value="${ordersummary.paytime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					<fmt:formatDate value="${ordersummary.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${ordersummary.reason}
				</td>
				<shiro:hasPermission name="order:ordersummary:edit"><td>
    				<a href="${ctx}/order/ordersummary/form?id=${ordersummary.id}">修改</a>
					<a href="${ctx}/order/ordersummary/delete?id=${ordersummary.id}" onclick="return confirmx('确认要删除该订单管理吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>