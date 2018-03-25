/**
 * Created by Administrator on 2016/5/21.
 */


/******************************* account页面 ******************************/
function setImg(){
    //如果图片大于120×120，就设置成120×120
    if($(".headIcon img").css("width") >120 && $(".headIcon img").css("height") >120){
        $(".headIcon img").css({width:"120px",height:"120px"});
    }else{
        $(".headIcon img").css({width:"auto",height:"auto"});//否则就设置成默认大小
    }
}
setImg();

$("#VIP .fl").click(function() {
    $("#VIP .account-box-img img").attr("src","../../img/personCenter/goldVIPIcon.png");
    $("#VIP .account-box-imgInfo").text("金牌会员");
});
/******翻转效果********/
$("#edit").click(function(){//上传头像按钮
    rotate("personSetFront","personSetBack",1);
    //$("#preImg img").css({width:"150px",height:"120px",radius:"60px"})
});
$("#sureUpdate").click(function(){//确定上传按钮
    
    if($("#frontImg img").attr("src") == "../../img/personCenter/user.png"){//如果还是默认图片，就什么也不做
        return;
    }
    setTimeout(function(){
        $("#frontImg img").attr("src",$("#preImg img").attr("src"));
    },500);
    setImg();//判断是否要更改图片大小
    ajaxFileUpload();
    rotate("personSetFront","personSetBack",2);
});
function ajaxFileUpload() {
	$.ajaxFileUpload({
		url : 'upload',
		secureuri : false,
		fileElementId : 'updateBtnDefault',
		dataType : 'json',
		data : {username : $("#updateBtnDefault").val()},
		success : function(data, status) {
			$('#frontImg img').attr('src',data.picUrl);
		},
		error : function(data, status, e) {
			alert('上传出错'+data.picUrl);
		}
	})

	return false;

}
$("#cancelUpadate").click(function(){//取消上传按钮
    rotate("personSetFront","personSetBack",2);
    setTimeout(function(){
    if($("#frontImg img").attr("src") !== "../../img/personCenter/user.png"){
        $("#preImg img").attr("src",$("#frontImg img").attr("src"));
        setImg();
    }else{

            $("#preImg img").attr("src","../../img/personCenter/user.png").css({width:"50px",height:"50px",radius:"0"});

    }
    },600);

});
$("#reNameFront").click(function(){//修改昵称按钮
    rotate("personSetFront","rename",1);
});
$("#sureRename").click(function(){//确定修改昵称按钮
    
    var newnameValue = $("#nameInput").val();
    if($.trim(newnameValue).length == 0)
    {
    	return;
    }
    var nickname = $("#nickname").text();
    $.ajax({
        url: "useredit/nickname",
        type: "GET",
        dataType: "json",
        data: {
          username: nickname,
          newname: newnameValue
        },
        async: false,
        success: function(data) {
          if(data['result']=="false")
    	  {
        	  alert(data['message']);
        	  return;
    	  }
          else
          {
        	  $("#nickname").text(newnameValue);
        	  $("#oldName span").text(newnameValue);
        	  $("#nameInput").val("");
        	  rotate("personSetFront","rename",2);
        	  
          }
          setTimeout(function(){
          },500);
        },
        error: function() {
          alert("昵称修改失败");
        }
      });
});
$("#cancelRename").click(function(){//取消修改昵称按钮
    rotate("personSetFront","rename",2);
    setTimeout(function(){
        $("#nameInput").val($(".oldName>span").text());
    },500);
});

/*********文件上传**********/
if(window.FileReader){
    var fileObj = new FileReader();
}
$("#updateBtnDefault").change(function(){
    $("#chooseFile").val($(this).val());
    fileObj.readAsDataURL(this.files[0]);
    fileObj.onload =function(){
        $("#preImg img").attr("src",this.result) ;
        if($("#preImg img").css("width") >120 && $(".headIcon img").css("height") >120){
            $("#preImg img").css({width:"120px",height:"120px"});
        }else{
            $("#preImg img").css({width:"auto",height:"auto"});//否则就设置成默认大小
        }
    }
});

/****************** 密码验证 *****************/
var GLOBAL={};
GLOBAL.oldPwd = "";
$("#oldPwd").blur(function(){//验证输入的旧密码是否正确
    if($.trim($(this).val()) ==GLOBAL.oldPwd){
        $(this).next().css("opacity","1");
    }else{
        $(this).next().css("opacity","0");
    }
});
$("#newPwd").blur(function(){//验证输入的新密码是否正确
    var value = $(this).val();
    if(!verifyPwd(value,8,16)){
        $(this).next().css("opacity","1");
    }else{
        $(this).next().css("opacity","0");
    };
    var sureValue = $("#surePwd").val();
    if($.trim(sureValue) !== ""){
        if(value !== sureValue){
            $("#surePwd").next().css("opacity","1");
        }else{
            $("#surePwd").next().css("opacity","0");
        };
    }
});
$("#surePwd").blur(function(){//验证输入的确认新密码是否与前面输入的新密码一样
    var value = $(this).val();
    if(value !== $("#newPwd").val()){
        $(this).next().css("opacity","1");
    }else{
        $(this).next().css("opacity","0");
    };
});
function verifyPwd(str,min,max){
    str = $.trim(str);
    /*
    * 判断从开头到结尾不全由数字组成
    * 判断从开头到结尾不全由字母组成(大写和小写)
    * */
    var reg = new RegExp("(?![0-9]+$)(?![a-zA-Z]+$)[0-9a-zA-Z]{"+min+","+max+"}");
    return reg.test(str);
}
/*****************修改密码*******************/
$("#setPw").click(function(){//修改密码按钮
    rotate("pwdFront","rePwd",1);
});
$("#surePwBtn").click(function(){//确认修改密码按钮
    var isTrue = 0;
    //isTrue += $("#oldPwd").val() == GLOBAL.oldPwd ? 1 : ($("#oldPwd").next().css("opacity","1"),0);
    isTrue += verifyPwd($("#newPwd").val(),8,16) ? 1 : ($("#newPwd").next().css("opacity","1"),0);
    isTrue += $("#newPwd").val() == $("#surePwd").val() ? 1 : ($(this).next().css("opacity","1"),0);
    if(isTrue == 2){
    	var oldValue = $("#oldPwd").val();
    	var sureValue = $("#newPwd").val();
        
        $.ajax({
            url: "useredit/pwd",
            type: "GET",
            dataType: "json",
            data: {
            	oldpwd: oldValue,
            	newpwd: sureValue
            },
            async: false,
            success: function(data) {
              if(data['result']=="false")
        	  {
            	  $("#oldPwd").val("");
            	  $("#oldPwd").next().css("opacity","1");
            	  return;
        	  }
              else
              {   
            	  rotate("pwdFront","rePwd",2);//当三个输入框都验证通过后，就翻转回去
                  setTimeout(function(){ //当修改成功后，将三个输入框均清空，以便下次再修改
                      $("#oldPwd").val("");
                      $("#newPwd").val("");
                      $("#surePwd").val("");
                  },500);
              }              
            },
            error: function() {
              alert("昵称修改失败");
            }
          });
    }else{
    	$("#newPwd").next().css("opacity","1");
    	$("#surePwd").next().css("opacity","1");
    }
});
/**************** 升级会员  *******************/
$(".box-vip-btn>.fl").click(function(){//确认修改密码按钮
	//rotate("VIPFront","VIPBack",1);
	top.location="user/toUpVip";
});


















