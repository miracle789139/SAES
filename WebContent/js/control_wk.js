$(document).ready(function(){
	$("#yilan").click(function(){
		$("#yilan").css("background-color","red");
		$("#lixiang").css("background-color","rgb(100, 94, 94)");
		$("#shishi").css("background-color","rgb(100, 94, 94)");
		$("#zhongjian").css("background-color","rgb(100, 94, 94)");
		$("#jiexiang").css("background-color","rgb(100, 94, 94)");
	})
	$("#lixiang").click(function(){
		$("#lixiang").css("background-color","red");
		$("#yilan").css("background-color","rgb(100, 94, 94)");
		$("#shishi").css("background-color","rgb(100, 94, 94)");
		$("#zhongjian").css("background-color","rgb(100, 94, 94)");
		$("#jiexiang").css("background-color","rgb(100, 94, 94)");
	})
	$("#shishi").click(function(){
		$("#shishi").css("background-color","red");
		$("#lixiang").css("background-color","rgb(100, 94, 94)");
		$("#yilan").css("background-color","rgb(100, 94, 94)");
		$("#zhongjian").css("background-color","rgb(100, 94, 94)");
		$("#jiexiang").css("background-color","rgb(100, 94, 94)");
	})
	$("#zhongjian").click(function(){
		$("#zhongjian").css("background-color","red");
		$("#lixiang").css("background-color","rgb(100, 94, 94)");
		$("#shishi").css("background-color","rgb(100, 94, 94)");
		$("#yilan").css("background-color","rgb(100, 94, 94)");
		$("#jiexiang").css("background-color","rgb(100, 94, 94)");
	})
	$("#jiexiang").click(function(){
		$("#jiexiang").css("background-color","red");
		$("#lixiang").css("background-color","rgb(100, 94, 94)");
		$("#shishi").css("background-color","rgb(100, 94, 94)");
		$("#zhongjian").css("background-color","rgb(100, 94, 94)");
		$("#yilan").css("background-color","rgb(100, 94, 94)");
	})
	$("#doing").click(function(){
		$("#doing").css("background-color","#999");
		$("#result").css("background-color","#f5f5f5");		
		$(".doing").show();
		$(".result").hide();
	});
	$("#result").click(function(){
		$("#result").css("background-color","#999");
		$("#doing").css("background-color","#f5f5f5");		
		$(".result").show();
		$(".doing").hide();
	});
});