<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品管理</title>
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
		function type1(obj){
			//alert(obj);
			$.ajax({
				type: "GET",
				url: "${ctx}/shop/commodity/goTwo",
		    	data: {PARENTID:chose_get_value('#TYPEID1')},
				dataType:'json',
				//beforeSend: validateData,
				cache: false,
				success: function(data){
					//alert(data);
					var strlist = "";
					 $.each(data.result, function(i, result){
							//alert(result.name);
							var str = "<option value='"+result.id+"'>"+result.name+"</option>";
							strlist +=str;
							
					 });
					 $("#TYPEID2").html(strlist);
					//单选select 数据同步
					 chose_get_ini('#TYPEID2');
				}
			});
			
		}
		//select 数据同步
		function chose_get_ini(select){
		    $(select).trigger("liszt:updated");
		}
		//单选select 数据初始化
		function chose_set_ini(select, value){
		    $(select).attr('value',value);
		    $(select).trigger("liszt:updated");
		}
		//单选select value获取
		function chose_get_value(select){
		    return $(select).val();
		}
		
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/shop/commodity/">商品列表</a></li>
		<shiro:hasPermission name="shop:commodity:edit"><li><a href="${ctx}/shop/commodity/form">商品添加</a></li></shiro:hasPermission>
	</ul>
	<form:form id="searchForm" modelAttribute="commodity" action="${ctx}/shop/commodity/" method="post" class="breadcrumb form-search">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<ul class="ul-form">
			<li><label>商品名称：</label>
				<form:input path="name" htmlEscape="false" maxlength="500" class="input-medium"/>
			</li>
			<li><label>会员价：</label>
				<form:input path="member0" htmlEscape="false" class="input-medium"/>
			</li>
			<li><label>创建时间：</label>
				<input name="createTime" type="text" readonly="readonly"
					maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${commodity_create_time}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd',isShowClear:false});" />
			</li>
			<li><label>上架状态:</label>
				<form:select path="shelves" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('commodity_shelves')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>新品分类:</label>
				<form:select path="newtype" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('commodity_newtype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>买手推荐:</label>
				<form:select path="buyer" class="input-medium">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('commodity_buyer')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</li>
			<li><label>商品类型：</label>
				<select class="input-medium" id="TYPEID1" name="TYPEID1" onchange="type1(this)">
					<option value=""></option>
					<c:forEach items="${TopList}" var="type">
						<option value="${type.id }">${type.name }</option>
					</c:forEach>
				</select>
				<form:select path="category" htmlEscape="false" class="input-medium" id="TYPEID2" name="TYPEID2">
				</form:select>
			</li>
			<li><label>商铺名称：</label>
				<form:input path="shopId" htmlEscape="false" maxlength="256" class="input-medium"/>
			</li>
			
			<li class="btns"><input id="btnSubmit" class="btn btn-primary" type="submit" value="查询"/></li>
			<li class="clearfix"></li>
		</ul>
	</form:form>
	<sys:message content="${message}"/>
	<table id="contentTable" class="table table-striped table-bordered table-condensed">
		<thead>
			<tr>
				<th>商品名称</th>
				<shiro:hasPermission name="shop:commodity:edit"><th>操作</th></shiro:hasPermission>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="commodity">
			<tr>
				<td><a href="${ctx}/shop/commodity/form?id=${commodity.id}">
					${commodity.name}
				</a></td>
				<shiro:hasPermission name="shop:commodity:edit"><td>
    				<a href="${ctx}/shop/commodity/form?id=${commodity.id}">修改</a>
					<a href="${ctx}/shop/commodity/delete?id=${commodity.id}" onclick="return confirmx('确认要删除该商品吗？', this.href)">删除</a>
				</td></shiro:hasPermission>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<div class="pagination">${page}</div>
</body>
</html>