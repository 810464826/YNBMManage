<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>积分商城商品管理</title>
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
		<li class="active"><a href="${ctx}/integralcommodity/integralCommodity/">积分商城商品列表</a></li>
		<shiro:hasPermission name="integralcommodity:integralCommodity:edit"><li><a href="${ctx}/integralcommodity/integralCommodity/form">积分商城商品添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="integralCommodity" action="${ctx}/integralcommodity/integralCommodity/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>库存：</label>
				<form:input path="number" htmlEscape="false" maxlength="11" class="input-medium"/>
			</li>
			<li><label>商品名：</label>
				<form:input path="name" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>所需积分：</label>
				<form:input path="integral" htmlEscape="false" maxlength="50" class="input-medium"/>
			</li>
			<li><label>所属类别：</label>
				<%-- <input id="hetname" type="hidden" value="${integralCommodity.typeid}"/> --%>
				<form:select path="typeid" id="select2" class="input-xlarge required">
				<option value=""></option>
					<c:forEach items="${typeList}" var="type">
						<option value="${type.id }">${type.name }</option>
					</c:forEach>
				</form:select>
			</li>
			<%-- <div class="control-group">
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
		</div> --%>
			<li><label>上架状态：</label>
				<form:select path="status" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('integral_commodity_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>商品名</th>
				<th>所需积分</th>
				<th>所属类别</th>
				<th>上架状态</th>
				<shiro:hasPermission name="integralcommodity:integralCommodity:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="integralCommodity">
			<tr>
				<td><a href="${ctx}/integralcommodity/integralCommodity/form?id=${integralCommodity.id}">
					${integralCommodity.name}
				</a></td>
				<td>
					${integralCommodity.integral}
				</td>
				<%-- <td>
					${fns:getDictLabel(integralCommodity.typeid, '', '')}
				</td> --%>
				<td>
					<c:forEach items="${typeList}" var="type">
						<c:if test="${integralCommodity.typeid == type.id}">
							${type.name}
						</c:if>
					</c:forEach>
				</td>
				<td>
					${fns:getDictLabel(integralCommodity.status, 'integral_commodity_status', '')}
				</td>
				<shiro:hasPermission name="integralcommodity:integralCommodity:edit"><td>
    				<a href="${ctx}/integralcommodity/integralCommodity/form?id=${integralCommodity.id}">修改</a>
					<a href="${ctx}/integralcommodity/integralCommodity/delete?id=${integralCommodity.id}" onclick="return confirmx('确认要删除该积分商城商品吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>