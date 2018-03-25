/**
 * Created by Administrator on 2016/5/20.
 */
function setDefaultAddrF(){//复选框的选中与未选中样式的切换效果
    $("#checkToggle").toggleClass("uncheck");
}
$(".alertClose").click(function() {//关闭弹出框
    $(".mask-box").hide();
});
$("#addNewAddr").click(function() {//新增地址按钮
    $("#addNewAddrAlert").show();
});

setDefault("#"+$("[data-isDefault=true]").attr("id"));//页面加载完成后有一个是默认地址

function setDefault(id){//传入一个id值，将这个id的div设成默认地址
    $(".addr-box-size .defaultAddr").hide().next().show();
    $(".addr-box-size>.addr-box-header").addClass("addr-gray");
    $(id+" .setDefault").hide();
    $(id+" .setDefault").prev().show().addClass("defaultAddr");
    $(id+" .addr-box-header").removeClass("addr-gray");
}
function sureModif(id){//确定修改 时调用的函数，id是整个地址框的id
    $("#"+id+"Back .personAddr td[class$=2]>input").each(function(i){
        var self = this;
        if(this.id == "userName-"+id){//将name赋值给标题行
            setTimeout(function(){//等它翻转过来后再更改
                $("#"+id+" .addr-box-header h2").text(self.value);
            },300);
        }
        var className = $(this).parent().attr("class");
        $("#aa"+id+" .personAddr td."+className).html(this.value);
    });
    var areaStr = "";
    $("#"+id+"Back .personAddr td.t32>select>option:selected").each(function(i){//处理 3个select 元素的值
        areaStr += this.value+"  ";
    });
    $("#aa"+id+" .personAddr td.t32").text(areaStr);
}
function modufy(id){//编辑修改按钮
    rotate("aa"+id,id+"Back",1);//翻转效果
    addressInit('updarea'+id,'updcmbProvince'+id,'updcmbCity'+id,'updcmbArea'+id,'', '四川', '成都市', '郫　县'); 
}
function cancelModufy(id){//取消修改按钮
    rotate("aa"+id,id+"Back",2);//翻转效果
}
function sModuf(id){//确定修改按钮
    rotate("aa"+id,id+"Back",2);//翻转效果
    sureModif(id);
}
$(document).ready(function(){
	var n = 1;
	var height = 54+92*n+300;
	//$(".tipContent").css("height",height+"px");
	initAddressHeight();
	
})






