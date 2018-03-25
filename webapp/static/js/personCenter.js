/**
 * Created by Administrator on 2016/5/16.
 */
function rotate(front,back,direction) {
    direction = direction || 1;
    if(direction == 1){
        $(".rotate-box>#"+front+".front").css("transform", "rotateY(180deg)");
        $(".rotate-box>#"+back+".back").css("transform", "rotateY(0deg)");
    }else if(direction == 2){
        $( ".rotate-box>#"+front+".front").css("transform", "rotateY(0deg)");
        $(".rotate-box>#"+back+".back").css("transform", "rotateY(-180deg)");
    }
}
$(document).ready(function(){
    $(".header-nav>li:not(.out)").click(function(){//导航栏跳转时
        $(".header-nav>li.header-nav-active").removeClass("header-nav-active");
    });
});
