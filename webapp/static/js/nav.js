/**
 * Created by Administrator on 2016/5/23.
 */
$(function(){
	var huiyuan=document.getElementById("hy-hidden");
	var shouhou=document.getElementById("sh-hidden");
	var bangzhu=document.getElementById("bz-hidden");
	
    $(".click1").click(function(){
    	if(huiyuan.style.display =="inline"){
        	$(".hidden1").css("display","none")
        }else{
        	$(".hidden1").css("display","inline")
        };   	
        $(".bg-1").toggleClass("bg");
    });
    $(".click2").click(function(){
    	if(shouhou.style.display =="inline"){
        	$(".hidden2").css("display","none")
        }else{
        	$(".hidden2").css("display","inline")
        };
        $(".bg-2").toggleClass("bg");
    });
    $(".click3").click(function(){
    	if(bangzhu.style.display =="inline"){
        	$(".hidden3").css("display","none")
        }else{
        	$(".hidden3").css("display","inline")
        }; 
        $(".bg-3").toggleClass("bg");
    });
})





