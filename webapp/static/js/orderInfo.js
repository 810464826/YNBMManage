/**
 * Created by Administrator on 2016/5/19.
 */
/******************************* order页面 ******************************/
var base = document.getElementsByTagName("base")[0].getAttribute("href");
$(".alertClose").click(function() {//关闭弹出框
    $(".mask-box").hide();
});
function deleteOrder(self) {//点击删除或取消菜单按钮
	self = this !== window ? this:self;
    var clickStr = $(self).html();
    if(clickStr.search(/删除订单/)!=-1){
        $("#deleteOrCancelMask .alertInfo>span").html("您确定要删除该订单吗？");
        $("#deleteOrCancelMask .alertInfo>img").attr("src",base+"img/personCenter/delIcon.png");
        clickStr = "删除订单";
    }else if(clickStr.search(/取消/)!=-1){
        $("#deleteOrCancelMask .alertInfo>span").html("您确定要取消该订单吗？");
        $("#deleteOrCancelMask .alertInfo>img").attr("src",base+"img/personCenter/grayCancelIcon.png");
        clickStr = "取消订单";
    }else if(clickStr.search(/快递查询/)!=-1){
        $("#deleteOrCancelMask .alert-box-size").addClass("goQuery");
        $("#deleteOrCancelMask .alertInfo").html('<p>承运来源：<span>顺风快递</span></p><p class="waybillNum">运单编号：<span>2288384899989</span></p>');
        $("#deleteOrCancelMask .alertBtn-box>a").html('去查询<img src= "'+base+'img/personCenter/goQueryIcon.png" alt="goQueryIcon"/>');
        clickStr = "快递查询";
    }
    $("#deleteOrCancelMask").show();
    $("#deleteOrCancelMask").attr("data-Id",$(".box").has(self).attr("id")).attr("data-btn",clickStr);
}
$("#alertSure").click(function() {//确定删除或取消或去查询 按钮
    $("#deleteOrCancelMask").hide();
    var btn = $("#deleteOrCancelMask").attr("data-btn");
    var id = $("#deleteOrCancelMask").attr("data-Id");
    switch(btn){
        case "删除订单":
            $("#"+$("#deleteOrCancelMask").attr("data-Id")).hide();
            refesh();break;//每删除一个定单，就看看是否还有定单，以决定显示没有任何定单页面
        case "取消订单":
            $("#"+id+" .orderState>img").attr("src",base+"img/personCenter/whiteCancelIcon.png");
            $("#"+id+" .orderState>span").text("订单已取消");
            $("#"+id+" .deleteOrder").text("删除订单");
            $("#"+id+" .orderWaitPay").attr("class","orderCancel");
            $("#"+id+" .payBtn-box").hide();
            return;
        case "快递查询":return;
    }

});
function dropMenu(self) {//右上角的弹出运送状态按钮
	self = this !== window ? this:self;
    if($("img",self).attr("data-direction")=="down") {
        $("img", self).css("transform", "rotate(180deg)").attr("data-direction","up");
        $(".sendSlide",$(".orderList-box-size").has(self)).slideDown("slow");
    }else{
        $("img", self).css("transform", "rotate(0deg)").attr("data-direction","down");
        $(".sendSlide",$(".orderList-box-size").has(self)).slideUp("slow");
    }
}

function set(orderNum,statusId){//传入定单号  运送的状态号
    switch(parseInt(statusId)){
        case 1://订单待支付
            data.src="img/personCenter/waitPayIcon.png";
            data.alt = "waitPayIcon";
            data.state="订单待支付";
            data.btn = "取消订单";
            data.orderList = "orderWaitPay";
            $("#"+orderNum+" .payBtn-box").show();
            break;
        case 6://订单已取消
            data.src="img/personCenter/whiteCancelIcon.png";
            data.alt = "CancelIcon";
            data.state="订单已取消";
            data.btn = "删除订单";
            data.orderList = "orderCancel";
            break;
        case 2://商品已出库
            data.src="img/personCenter/shopOutIcon.png";
            data.alt = "shopOutIcon";
            data.state="商品已出库";
            data.btn = "快递查询";
            data.orderList = "shopOutLibrary";
            break;
        case 3://商品配送中
            data.src="img/personCenter/shopCarryIcon.png";
            data.alt = "shopCarryIcon";
            data.state="商品配送中";
            data.btn = "快递查询";
            data.orderList = "shopOutLibrary";
            break;
        case 5://订单已完成
            data.src="img/personCenter/finishIcon.png";
            data.alt = "finishIcon";
            data.state="订单已完成";
            data.btn = "删除订单";
            data.orderList = "";
            break;
    }
    setState(orderNum,data);
}
var data = {src:"",alt:"",state:"",btn:"",orderList:""};
function setState(orderNum,data){
    $("#"+orderNum+" .orderState>img").
        attr({"src":base+data.src,"alt":data.alt}).//订单待支付前的 小图标
        next().html(data.state);//"订单待支付";
    $("#"+orderNum+" .deleteOrder").html(data.btn);//"取消定单";
    $("#"+orderNum+" .sendState>ul").addClass(data.orderList);//"orderWaitPay";
}







