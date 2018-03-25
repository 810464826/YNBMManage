$(document).ready(function(){
	var n = 1;
	var height = 54+92*n+300;
	//$(".tipContent").css("height",height+"px");
	initAddressHeight()
	addressInit('area','pro','city','county','华东地区', '四川', '成都', '郫县');
})
function initAddressHeight(){
	var addressLength = $(".address-list .address").length + 1;
	var height = Math.ceil(addressLength/3) * 160
	$(".address-list").css("height", height);
}
$(".address").live("click", function(){
	$(".address.active").removeClass("active");
	$(this).addClass("active");
	//location.reload([true])
})
$(".delivery-time").live("click", function(){
	$(".delivery-time.active").removeClass("active");
	$(this).addClass("active");
})

$(".invoice").click(function(){
	$(this).toggleClass("active");
	if($(this).hasClass("active") == true){
		$(".invoice-detail").css("display","block");
	}else{
		$(".invoice-detail").css("display","none");
	}
})
$(".delivery-style").click(function(){
	$(this).toggleClass("active");
	
})
$("#addNewAddr").click(function(){
	$("#addNewAddrAlert").css("display","block");
});
$(".alertClose").click(function() {//关闭弹出框
    $(".mask-box").hide();
});
var basePath = $("base").attr("href")
$("#saveAddr").click(function() {//弹出框中的确定按钮
	var name = $("#name").val();
	var telPhone = $("#telPhone").val();
	var areaCode = $("#areaCode").val();
	var fixedPhone = $("#fixedPhone").val();
	var pro = $("#cmbProvince").val();
	var city = $("#cmbCity").val();
	var county = $("#cmbArea").val();
	var postcode = $("#postcode").val();
	var address = $("#address").val();
	
	$.ajax({
        url: "order/addaddress",
        type: "GET",
        dataType: "json",
        data: {
        	name: name,
        	phone:telPhone,
        	areacode:areaCode,
        	telephone:fixedPhone,
        	province:pro,
        	city:city,
        	county:county,
        	postcode:postcode,
        	address:address
        },
        async: false,
        success: function(data) {
        	var addressid=data['addressid'];
          if(data['result']=="false")
    	  {
        	  alert(data['message']);
        	  return;
    	  }
          else
        	  {
//        	  alert(data['result']);
        	  var addressNode = $('<div class="address"><div class="select-address"><img src="' + basePath + 'img_new/selected.png"/></div></div>')
        		addressNode.append('<div style="color: #444444;font-size: 14px;margin: 20px 0px 20px 20px">'+name+'</div>')
        		addressNode.append('<input name="addressId" type="hidden" value="'+addressid+'" >');
        		addressNode.append('<div>'+ telPhone + '</div>');
        		addressNode.append('<div>'+ pro + " " + city + " " + county + ' </div>');
        		addressNode.append('<div>'+ address + '</div>');
        		addressNode.append('<div>'+ postcode + '</div>');
        		$("#addNewAddr").before(addressNode);
        		initAddressHeight();
        		$(".mask-box").hide();
        	  }
        	  
         // location.reload([true])  
        },
        error: function() {
          alert("添加失败");
        }
      });
	
	
	
});

