//初始化页面高度
function initPageHeight(){
	$("#content").css("min-height", $("body").height());
	$("#formbackground img").css({
		"width":$("#content").width(),
		"height":$("#content").height()
	});
}
//跳转到登录页面
function toLogin(){
	var base = document.getElementsByTagName("base")[0].getAttribute("href");
    window.location.href = base + "user/toLogin";
}
//跳转到注册页面
function toRegister(){
	var base = document.getElementsByTagName("base")[0].getAttribute("href");
    window.location.href = base + "user/toRegister";
}