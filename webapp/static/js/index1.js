$(function() {
	var height1 = $(window).height();
	$("section").height(height1);
	$(".main").css("top",height1*0.325);
	$("#page6 .upTriangle").css("left",function(i,value){
		return parseInt(value)-302;
	});

	if(parseFloat($("section").css("top"))%height1 !== 0 ){
		$("section").css("top",Math.round(parseFloat($("section").css("top"))/height1)*height1);
	}
	$("#page6 dt>img").mouseover(function () {//第六个页面鼠标移入时的效果
		$("#page6 dt>img").each(function (i) {
			this.src = this.src.replace("color", "gray");
		});
		$("#page6 dl.active").removeClass("active");
		this.src = this.src.replace("gray", "color");
		$(this).parent().parent().addClass("active");
		$("#page6 .upTriangle").css("left", parseInt($(this).offset().left)+56+"px");
		$("#page6 .footer>h3").fadeTo(100,0.45,function(){
			switch (parseInt($(".imgList .active img").attr("data-i"))) {
				case 0:
					$("#page6 .footer>h3").html("“一个人生活，想要的东西又多又杂，有了一家一盒，我的小需求都在盒子里，省心了。”");
					break;
				case 1:
					$("#page6 .footer>h3").html("“老公经常出差应酬，自己工作忙又懒得做饭，买的东西经常过期。一家一盒定时定量的  ‘计划经济’  还真的省了很多事。”");
					break;
				case 2:
					$("#page6 .footer>h3").html("“一大家子人，过日子要处处想着节省开支，他们的家庭集采模式非常适合工薪阶层。每次采购都在这里，几次下来，让我省下不少钱。 ”");
					break;
			}
			$(this).fadeTo(100,1);
		});
	});
	removeAnmi();
	$(".nextPage").click(function () {
		addAnmi();
		move(parseInt(currentPage)+1);
	});
	var currentPage =  1;
	var isResize = sessionStorage.getItem("isResize","false");//记录第一次加载时是因为窗口大小的改变？
	var historyPage = parseInt(sessionStorage.getItem("historyPage"));
	if(historyPage&&isResize=="true"){
		currentPage = historyPage;
		removeAnmi();
		move(currentPage);
		sessionStorage.setItem("isResize", "false");
	}
	function move(pageNum) {//第一个参数为最终要到多少页,负责全部页面内容的移动更新
		if(pageNum > 7 ){ pageNum = 7;isCanMove=true;return;}//如果下一页 是第一页，则不能再向上移动
		if(pageNum < 1 ){ pageNum = 1;isCanMove=true;return;}//如果下一页 是最后一页，则不能再向下移动
		moveToPage(pageNum);
		showRegisterBtn(currentPage);//判断第m页的注册按钮是否显示
		showNextPageBtn(currentPage);//设置第m 页中的 下一页按钮是否显示
		pageNav(currentPage);//设置右侧的指示条，m为第m页，取值为1-7
		setTimeout(function(){
			removeAnmi();
		},500);
	}
	function addAnmi(){//加上过渡
		$("section").css("transition","all 0.5s");
		$(".navProgress>.front").css("transition","all 0.5s");
		$(".imgList dl").css("transition","all 0.6s");
		$(".imgList dl>dt>img").css("transition","all 0.6s");
		$(".imgList dl>dd").css("transition","all 0.6s");

	}
	function removeAnmi(){//去掉过渡
		$("section").css("transition","none");
		$(".navProgress>.front").css("transition","none");
		$(".imgList dl").css("transition","none");
		$(".imgList dl>dt>img").css("transition","none");
		$(".imgList dl>dd").css("transition","none");
	}
	function moveToPage(pageNum){//从当前页移动到 第pageNum页，只负责主体页面的移动
		var height = $(window).height();
		$("section").css("top",(1-pageNum)*height);
		currentPage = pageNum;
		setTimeout(function(){
			isCanMove = true;
		},600);
	}
	function showRegisterBtn(currentPage){//判断第m页的注册按钮是否显示
		if (currentPage==1 || currentPage==7) {
			$(".btn-register").css({"transform": "scale(0,0)", "opacity": "0"});
		} else {
			$(".btn-register").css({"transform": "scale(1,1)", "opacity": "1"});
		}
	}
	function showNextPageBtn(currentPage){//设置第m 页中的 下一页按钮是否显示
		if(currentPage>=6){
			$(".nextPage").css({"transform": "scale(0,0)", "opacity": "0"});
		}else {
			$(".nextPage").css({"transform": "scale(1,1)", "opacity": "1"});
		}
	}
	function pageNav(currentPage){//设置右侧的指示条，m为第m页，取值为1-7
		$(".navProgress>.front").css("top", (currentPage-1) * 30);
	}
	var isCanMove = true;
	if(document.body.onmousewheel !== undefined){
		document.body.onmousewheel = scrollFunc;
	}else if(document.attachEvent){
		document.attachEvent('onmousewheel',scrollFunc);
	}else if(document.addEventListener){
		document.addEventListener('DOMMouseScroll',scrollFunc,false);
	}

	function scrollFunc(e) {
		var val = 0;
		e = e || window.event;
		if (e.wheelDelta) {
			val = e.wheelDelta / 120;
		} else if (e.detail) {
			val = e.detail / 3 * (-1);
		}
		//向前滚动：1，向后滚动: -1;
		if (isCanMove) {
			isCanMove = false;
			addAnmi();
			move(val < 0?currentPage+1:currentPage-1);//如果val<0，则到下一页
		}
	}
	$(window).resize(function(){
		var height = $(window).height();
		$("section").height(height);
		sessionStorage.setItem("isResize","true");
		removeAnmi();
		sessionStorage.setItem("historyPage",currentPage);
		location = location.href;
		$("section").css("top",-(currentPage-1)*height)
	});
});







