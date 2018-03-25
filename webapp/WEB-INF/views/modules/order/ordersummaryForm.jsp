<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
<title>订单管理管理</title>
<meta name="decorator" content="default" />
<script type="text/javascript">
		$(document).ready(function() {
			//$("#name").focus();
			$("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
		});
	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li><a href="${ctx}/order/ordersummary/">订单管理列表</a>
		</li>
		<li class="active"><a
			href="${ctx}/order/ordersummary/form?id=${ordersummary.id}">订单管理<shiro:hasPermission
					name="order:ordersummary:edit">${not empty ordersummary.id?'修改':'添加'}</shiro:hasPermission>
				<shiro:lacksPermission name="order:ordersummary:edit">查看</shiro:lacksPermission>
		</a>
		</li>
	</ul>
	<br />
	<form:form id="inputForm" modelAttribute="ordersummary"
		action="${ctx}/order/ordersummary/save" method="post"
		class="form-horizontal">
		<form:hidden path="id" />
		<sys:message content="${message}" />
		<div class="control-group">
			<label class="control-label">订单号：</label>
			<div class="controls">
				<form:input path="ordernum" htmlEscape="false" maxlength="50"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">店铺名称：</label>
			<div class="controls">
				<form:input path="shopId" htmlEscape="false" maxlength="10"  disabled="true"
					class="input-xlarge required digits" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">订单金额：</label>
			<div class="controls">
				<form:input path="price" htmlEscape="false"
					class="input-xlarge required number" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">用户id：</label>
			<div class="controls">
				<form:input path="userid" htmlEscape="false" maxlength="10"
					class="input-xlarge required" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地址id：</label>
			<div class="controls">
				<form:input path="addressid" htmlEscape="false" maxlength="10"
					class="input-xlarge required digits" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">联系电话：</label>
			<div class="controls">
				<form:input path="phone" htmlEscape="false" maxlength="100"
					disabled="true" class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">收货人姓名：</label>
			<div class="controls">
				<form:input path="username" htmlEscape="false" maxlength="100"
					disabled="true" class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">地址：</label>
			<div class="controls">
				<form:input path="province" htmlEscape="false" maxlength="100"
					disabled="true" class="input-small " />
				<form:input path="city" htmlEscape="false" maxlength="100"
					disabled="true" class="input-small " />
				<form:input path="county" htmlEscape="false" maxlength="100"
					disabled="true" class="input-small " />
				<form:input path="address" htmlEscape="false" maxlength="100"
					disabled="true" class="input-xxlarge " />
			</div>
		</div>

		<div class="control-group">
			<label class="control-label">商品：</label>
			<div class="controls">
				<table id="contentTable"
					class="table table-striped table-bordered table-condensed">
					<thead>
						<tr>
							<th class="hide"></th>
							<th>名称</th>
							<th>套装</th>
							<th>单价</th>
							<th>数量</th>
						</tr>
					</thead>
					<tbody id="commodityList">
					</tbody>

				</table>
				<script type="text/template" id="testDataChildTpl">//<!--
						<tr id="commodityList{{idx}}">
							<td class="hide">
								<input id="commodityList{{idx}}_id" name="commodityList[{{idx}}].id" type="hidden" value="{{row.id}}"/>
							</td>
							<td>
								<input id="commodityList{{idx}}_name" name="commodityList[{{idx}}].name" type="text" value="{{row.name}}" maxlength="100" disabled="true"  class="input-small "/>
							</td>
							<td>
								<input id="commodityList{{idx}}_boxTitle" name="commodityList[{{idx}}].boxTitle" type="text" value="{{row.boxTitle}}" maxlength="100" disabled="true"  class="input-small "/>
							</td>
							<td>
								<input id="commodityList{{idx}}_price" name="commodityList[{{idx}}].price" type="text" value="{{row.price}}" maxlength="100" disabled="true"  class="input-small "/>
							</td>
							<td>
								<input id="commodityList{{idx}}_total" name="commodityList[{{idx}}].total" type="text" value="{{row.total}}" maxlength="100" disabled="true"  class="input-small "/>
							</td>
							
						</tr>//-->
					</script>
				<script type="text/javascript">
					function addRow(list, idx, tpl, row){
						$(list).append(Mustache.render(tpl, {
							idx: idx, delBtn: true, row: row
						}));
						$(list+idx).find("select").each(function(){
							$(this).val($(this).attr("data-value"));
						});
						$(list+idx).find("input[type='checkbox'], input[type='radio']").each(function(){
							var ss = $(this).attr("data-value").split(',');
							for (var i=0; i<ss.length; i++){
								if($(this).val() == ss[i]){
								$(this).attr("checked","checked");
								}
							}
						});
					}
						var testDataChildRowIdx = 0, testDataChildTpl = $("#testDataChildTpl").html().replace(/(\/\/\<!\-\-)|(\/\/\-\->)/g,"");
						$(document).ready(function() {
							var data = ${fns:toJson(ordersummary.goodsList)};
							//alert(data.length);
							for (var i=0; i<data.length; i++){
								
								addRow('#commodityList', testDataChildRowIdx, testDataChildTpl, data[i]);
								testDataChildRowIdx = testDataChildRowIdx + 1;
							}
						});
					</script>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发票类型：</label>
			<div class="controls">
				<form:select path="invoicetype" class="input-xlarge required">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('invoicetype')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发票描述：</label>
			<div class="controls">
				<form:input path="invoicedesc" htmlEscape="false" maxlength="512"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">送货时间：</label>
			<div class="controls">
				<form:select path="expresstime" class="input-xlarge required">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('expresstime')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">状态：</label>
			<div class="controls">
				<form:select path="status" class="input-xlarge required">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('order_status')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">订单备注：</label>
			<div class="controls">
				<form:input path="orderdesc" htmlEscape="false" maxlength="512"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">运费：</label>
			<div class="controls">
				<form:input path="yunfei" htmlEscape="false" maxlength="10"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">快递公司：</label>
			<div class="controls">
				<form:select path="expresscomp" class="input-xlarge ">
					<form:option value="" label="" />
					<form:options items="${fns:getDictList('expresscomp')}"
						itemLabel="label" itemValue="value" htmlEscape="false" />
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">快递单号：</label>
			<div class="controls">
				<form:input path="expressno" htmlEscape="false" maxlength="50"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">发货时间：</label>
			<div class="controls">
				<input name="fahuotime" type="text" readonly="readonly"
					maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${ordersummary.fahuotime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">支付时间：</label>
			<div class="controls">
				<input name="paytime" type="text" readonly="readonly" maxlength="20"
					class="input-medium Wdate "
					value="<fmt:formatDate value="${ordersummary.paytime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">订单完成时间：</label>
			<div class="controls">
				<input name="donetime" type="text" readonly="readonly"
					maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${ordersummary.donetime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">下单时间：</label>
			<div class="controls">
				<input name="createTime" type="text" readonly="readonly"
					maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${ordersummary.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">退货理由：</label>
			<div class="controls">
				<form:input path="reason" htmlEscape="false" maxlength="512"
					class="input-xlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">详细退货理由：</label>
			<div class="controls">
				<form:textarea path="reasontext" htmlEscape="false" rows="4"
					maxlength="512" class="input-xxlarge " />
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">更新时间：</label>
			<div class="controls">
				<input name="updateTime" type="text" readonly="readonly"
					maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${ordersummary.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});" />
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="order:ordersummary:edit">
				<input id="btnSubmit" class="btn btn-primary" type="submit"
					value="保 存" />&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回"
				onclick="history.go(-1)" />
		</div>
	</form:form>
</body>
</html>