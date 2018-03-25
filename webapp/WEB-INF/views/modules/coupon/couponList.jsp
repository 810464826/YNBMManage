<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>优惠券管理</title>
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
		<li class="active"><a href="${ctx}/coupon/coupon/">优惠券列表</a></li>
		<shiro:hasPermission name="coupon:coupon:edit"><li><a href="${ctx}/coupon/coupon/form">优惠券添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="coupon" action="${ctx}/coupon/coupon/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>优惠金额：</label>
				<form:input path="money" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>起始时间：</label>
				<input name="starttime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${coupon.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>类型:</label>
				<form:select path="type" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('coupon_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>用户id：</label>
				<form:input path="userid" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>结束时间：</label>
				<input name="endtime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate"
					value="<fmt:formatDate value="${coupon.endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</li>
			<li><label>是否使用:</label>
			<!--实体类对应的字段  -->
				<form:select path="isuse" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('coupon_isUse')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>店铺名称：</label>
				<form:input path="shopid" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>优惠金额</th>
				<th>起始时间</th>
				<th>类型</th>
				<th>用户id</th>
				<th>结束时间</th>
				<th>是否使用</th>
				<th>店铺名称</th>
				<shiro:hasPermission name="coupon:coupon:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="coupon">
			<tr>
				<td><a href="${ctx}/coupon/coupon/form?id=${coupon.id}">
					${coupon.money}
				</a></td>
				<td>
					<fmt:formatDate value="${coupon.starttime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				
				<td>
					${fns:getDictLabel(coupon.type, 'coupon_type', '')}
				</td>
				<td>
					${coupon.userid}
				</td>
				<td>
					<fmt:formatDate value="${coupon.endtime}" pattern="yyyy-MM-dd HH:mm:ss"/>
				</td>
				<td>
					${fns:getDictLabel(coupon.isuse, 'coupon_isUse', '')}
				</td>
				<td>
					${coupon.shopid}
				</td>
				<shiro:hasPermission name="coupon:coupon:edit"><td>
    				<a href="${ctx}/coupon/coupon/form?id=${coupon.id}">修改</a>
					<a href="${ctx}/coupon/coupon/delete?id=${coupon.id}" onclick="return confirmx('确认要删除该优惠券吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>