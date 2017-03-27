$(document).ready(function(){
	$("#tongzhi").click(function(){
		$("#tongzhi").css("background-color","red");
		$("#gongzuo").css("background-color","rgb(100, 94, 94)");
		$("#shenqing").css("background-color","rgb(100, 94, 94)");
		$("#download").css("background-color","rgb(100, 94, 94)");
		$(".tongzhi").show();
		$(".gongzuo").hide();
		$(".shenqing").hide();
		$(".download").hide();
	});
	$("#gongzuo").click(function(){
		$("#gongzuo").css("background-color","red");
		$("#tongzhi").css("background-color","rgb(100, 94, 94)");
		$("#shenqing").css("background-color","rgb(100, 94, 94)");
		$("#download").css("background-color","rgb(100, 94, 94)");
		$(".gongzuo").show();
		$(".tongzhi").hide();
		$(".shenqing").hide();
		$(".download").hide();
	})
	$("#shenqing").click(function(){
		$("#shenqing").css("background-color","red");
		$("#gongzuo").css("background-color","rgb(100, 94, 94)");
		$("#tongzhi").css("background-color","rgb(100, 94, 94)");
		$("#download").css("background-color","rgb(100, 94, 94)");
		$(".shenqing").show();
		$(".gongzuo").hide();
		$(".tongzhi").hide();
		$(".download").hide();
	})
	$("#download").click(function(){
		$("#download").css("background-color","red");
		$("#gongzuo").css("background-color","rgb(100, 94, 94)");
		$("#shenqing").css("background-color","rgb(100, 94, 94)");
		$("#tongzhi").css("background-color","rgb(100, 94, 94)");
		$(".download").show();
		$(".gongzuo").hide();
		$(".shenqing").hide();
		$(".tongzhi").hide();
	})
	
	$("#yilan").click(function(){
		$("#yilan").css("background-color","red");
		$("#lixiang").css("background-color","rgb(100, 94, 94)");
		$("#shishi").css("background-color","rgb(100, 94, 94)");
		$("#zhongjian").css("background-color","rgb(100, 94, 94)");
		$("#jiexiang").css("background-color","rgb(100, 94, 94)");
		$(".yilan").show();
		$(".lixiang").hide();
		$(".shishi").hide();
		$(".zhongjian").hide();
		$(".jiexiang").hide();
	})
	$("#lixiang").click(function(){
		$("#lixiang").css("background-color","red");
		$("#yilan").css("background-color","rgb(100, 94, 94)");
		$("#shishi").css("background-color","rgb(100, 94, 94)");
		$("#zhongjian").css("background-color","rgb(100, 94, 94)");
		$("#jiexiang").css("background-color","rgb(100, 94, 94)");
		$(".lixiang").show();
		$(".yilan").hide();
		$(".shishi").hide();
		$(".zhongjian").hide();
		$(".jiexiang").hide();
	})
	$("#shishi").click(function(){
		$("#shishi").css("background-color","red");
		$("#lixiang").css("background-color","rgb(100, 94, 94)");
		$("#yilan").css("background-color","rgb(100, 94, 94)");
		$("#zhongjian").css("background-color","rgb(100, 94, 94)");
		$("#jiexiang").css("background-color","rgb(100, 94, 94)");
		$(".shishi").show();
		$(".lixiang").hide();
		$(".yilan").hide();
		$(".zhongjian").hide();
		$(".jiexiang").hide();
	})
	$("#zhongjian").click(function(){
		$("#zhongjian").css("background-color","red");
		$("#lixiang").css("background-color","rgb(100, 94, 94)");
		$("#shishi").css("background-color","rgb(100, 94, 94)");
		$("#yilan").css("background-color","rgb(100, 94, 94)");
		$("#jiexiang").css("background-color","rgb(100, 94, 94)");
		$(".zhongjian").show();
		$(".lixiang").hide();
		$(".shishi").hide();
		$(".yilan").hide();
		$(".jiexiang").hide();
	})
	$("#jiexiang").click(function(){
		$("#jiexiang").css("background-color","red");
		$("#lixiang").css("background-color","rgb(100, 94, 94)");
		$("#shishi").css("background-color","rgb(100, 94, 94)");
		$("#zhongjian").css("background-color","rgb(100, 94, 94)");
		$("#yilan").css("background-color","rgb(100, 94, 94)");
		$(".jiexiang").show();
		$(".lixiang").hide();
		$(".shishi").hide();
		$(".zhongjian").hide();
		$(".yilan").hide();
	})
	$("#result").click(function(){
		$("#result").css("background-color","#999");
		$("#report").css("background-color","#f5f5f5");
		$("#reference").css("background-color","#f5f5f5");
		$("#otherfiles").css("background-color","#f5f5f5");
		$(".result").show();
		$(".report").hide();
		$(".reference").hide();
		$(".otherfiles").hide();
	});
	$("#report").click(function(){
		$("#report").css("background-color","#999");
		$("#result").css("background-color","#f5f5f5");
		$("#otherfiles").css("background-color","#f5f5f5");
		$("#doing").css("background-color","#f5f5f5");
		$(".report").show();
		$(".result").hide();
		$(".reference").hide();
		$(".otherfiles").hide();
	});
	$("#reference").click(function(){
		$("#reference").css("background-color","#999");
		$("#result").css("background-color","#f5f5f5");
		$("#report").css("background-color","#f5f5f5");
		$("#otherfiles").css("background-color","#f5f5f5");		
		$(".reference").show();
		$(".result").hide();
		$(".report").hide();
		$(".otherfiles").hide();
	});
	$("#otherfiles").click(function(){
		$("#otherfiles").css("background-color","#999");
		$("#result").css("background-color","#f5f5f5");
		$("#report").css("background-color","#f5f5f5");
		$("#reference").css("background-color","#f5f5f5");	
		$(".otherfiles").show();
		$(".result").hide();
		$(".report").hide();
		$(".reference").hide();
	});
});