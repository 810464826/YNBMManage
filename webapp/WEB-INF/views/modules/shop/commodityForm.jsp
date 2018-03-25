<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>商品管理</title>
	<meta name="decorator" content="default"/>
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
		
		//$(".input-xlarge").chosen();
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
		<li><a href="${ctx}/shop/commodity/">商品列表</a></li>
		<li class="active"><a href="${ctx}/shop/commodity/form?id=${commodity.id}">商品<shiro:hasPermission name="shop:commodity:edit">${not empty commodity.id?'修改':'添加'}</shiro:hasPermission><shiro:lacksPermission name="shop:commodity:edit">查看</shiro:lacksPermission></a></li>
	</ul><br/>
	<form:form id="inputForm" modelAttribute="commodity" action="${ctx}/shop/commodity/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>
		<div class="control-group">
			<label class="control-label">商品类型：</label>
			<div class="controls">
				<select class="input-xlarge required" id="TYPEID1" name="TYPEID1" onchange="type1(this)">
					<option value=""></option>
					<c:forEach items="${TopList}" var="type">
						<option value="${type.id }">${type.name }</option>
					</c:forEach>
				</select>
				<form:select path="category" class="input-xlarge required" id="TYPEID2" name="TYPEID2">
					
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品id：</label>
			<div class="controls">
				<form:input path="id" htmlEscape="false" maxlength="500" class="input-xlarge required" disabled="true"/>
				<span class="help-inline"></span>
			</div>
		</div>		
		<div class="control-group">
			<label class="control-label">商品名称：</label>
			<div class="controls">
				<form:input path="name" htmlEscape="false" maxlength="500" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商铺名字：</label>
			<div class="controls">
				<form:input path="shopName" htmlEscape="false" disabled="true" maxlength="256" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品标题：</label>
			<div class="controls">
				<form:input path="boxtitle0" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">套装1名称：</label>
			<div class="controls">
				<form:input path="boxtitle1" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">套装2名称：</label>
			<div class="controls">
				<form:input path="boxtitle2" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">原价：</label>
			<div class="controls">
				<form:input path="originalprice0" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">套装1原价：</label>
			<div class="controls">
				<form:input path="originalprice1" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">套装2原价：</label>
			<div class="controls">
				<form:input path="originalprice2" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">限购数：</label>
			<div class="controls">
				<form:input path="buylimit0" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">套装1限购数：</label>
			<div class="controls">
				<form:input path="buylimit1" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">套装2限购数：</label>
			<div class="controls">
				<form:input path="buylimit2" htmlEscape="false" maxlength="11" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">会员价：</label>
			<div class="controls">
				<form:input path="member0" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">套装1会员价：</label>
			<div class="controls">
				<form:input path="member1" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">套装2会员价：</label>
			<div class="controls">
				<form:input path="member2" htmlEscape="false" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">优惠说明：</label>
			<div class="controls">
				<form:input path="discount" htmlEscape="false" maxlength="500" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品描述：</label>
			<div class="controls">
				<form:input path="description" htmlEscape="false" maxlength="1024" class="input-xlarge "/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品图片：</label>
			<div class="controls">
				<form:hidden id="picture" path="picture" htmlEscape="false" maxlength="256" class="input-xlarge"/>
				<sys:ckfinder input="picture" type="images" uploadPath="/shop/commodity" selectMultiple="false"/>
			</div>
		</div>
		<span class="help-inline"><font color="red">*</font> </span>
		<div class="control-group">
			<label class="control-label">子图片1：</label>
			<div class="controls">
				<form:hidden id="subpicture1" path="subpicture1" htmlEscape="false" maxlength="256" class="input-xlarge"/>
				<sys:ckfinder input="subpicture1" type="images" uploadPath="/shop/commodity" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">子图片2：</label>
			<div class="controls">
				<form:hidden id="subpicture2" path="subpicture2" htmlEscape="false" maxlength="256" class="input-xlarge"/>
				<sys:ckfinder input="subpicture2" type="images" uploadPath="/shop/commodity" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">子图片3：</label>
			<div class="controls">
				<form:hidden id="subpicture3" path="subpicture3" htmlEscape="false" maxlength="256" class="input-xlarge"/>
				<sys:ckfinder input="subpicture3" type="images" uploadPath="/shop/commodity" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">子图片4：</label>
			<div class="controls">
				<form:hidden id="subpicture4" path="subpicture4" htmlEscape="false" maxlength="256" class="input-xlarge"/>
				<sys:ckfinder input="subpicture4" type="images" uploadPath="/shop/commodity" selectMultiple="false"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商品详细描述：</label>
			<div class="controls">
				<form:hidden id="providerintroduce" path="providerintroduce" htmlEscape="false" class="input-xlarge"/>
				<sys:ckfinder input="providerintroduce" type="images" uploadPath="/shop/commodity" selectMultiple="true"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">创建时间：</label>
			<div class="controls">
				<input name="createTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate required"
					value="<fmt:formatDate value="${commodity.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">更新时间：</label>
			<div class="controls">
				<input name="updateTime" type="text" readonly="readonly" maxlength="20" class="input-medium Wdate "
					value="<fmt:formatDate value="${commodity.updateTime}" pattern="yyyy-MM-dd HH:mm:ss"/>"
					onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',isShowClear:false});"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">上架状态:</label>
			<div class="controls">
				<form:select path="shelves" class="input-xlarge required">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('commodity_shelves')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">新品分类:</label>
			<div class="controls">
				<form:select path="newtype" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('commodity_newtype')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">买手推荐:</label>
			<div class="controls">
				<form:select path="buyer" class="input-xlarge ">
					<form:option value="" label=""/>
					<form:options items="${fns:getDictList('commodity_buyer')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
				</form:select>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">销量：</label>
			<div class="controls">
				<form:input path="sales" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">人气量：</label>
			<div class="controls">
				<form:input path="popularity" htmlEscape="false" maxlength="11" class="input-xlarge required"/>
				<span class="help-inline"><font color="red">*</font> </span>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label">商铺名字：</label>
			<div class="controls">
				<form:input path="shopName" htmlEscape="false" disabled="true" maxlength="256" class="input-xlarge "/>
			</div>
		</div>
		<div class="form-actions">
			<shiro:hasPermission name="shop:commodity:edit"><input id="btnSubmit" class="btn btn-primary" type="submit" value="保 存"/>&nbsp;</shiro:hasPermission>
			<input id="btnCancel" class="btn" type="button" value="返 回" onclick="history.go(-1)"/>
		</div>
	</form:form>
</body>
</html>