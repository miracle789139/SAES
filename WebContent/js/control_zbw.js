$(document).ready(function(){
	$("#tongzhi").click(function(){
		$("#tongzhi").css("background-color","red");
		$("#gongzuo").css("background-color","rgb(100, 94, 94)");
		$("#shenqing").css("background-color","rgb(100, 94, 94)");
		$("#download").css("background-color","rgb(100, 94, 94)");
		$("#QT").css("background-color","rgb(100, 94, 94)");
		$(".QT").hide();
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
		$("#QT").css("background-color","rgb(100, 94, 94)");
		$(".QT").hide();
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
		$("#QT").css("background-color","rgb(100, 94, 94)");
		$(".QT").hide();
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
		$("#QT").css("background-color","rgb(100, 94, 94)");
		$(".QT").hide();
		$(".download").show();
		$(".gongzuo").hide();
		$(".shenqing").hide();
		$(".tongzhi").hide();
	})
	$("#QT").click(function(){
		$("#QT").css("background-color","red");
		$("#gongzuo").css("background-color","rgb(100, 94, 94)");
		$("#shenqing").css("background-color","rgb(100, 94, 94)");
		$("#download").css("background-color","rgb(100, 94, 94)");
		$("#tongzhi").css("background-color","rgb(100, 94, 94)");
		$(".QT").show();
		$(".gongzuo").hide();
		$(".shenqing").hide();
		$(".download").hide();
	    $(".tongzhi").hide();
	})
	
});
//弹出窗口
function pop(){
	//将窗口居中
	makeCenter();

	//初始化省份列表
	initProvince();

	//默认情况下, 给第一个省份添加choosen样式
	$('[province-id="1"]').addClass('choosen');

	//初始化大学列表
	initSchool(1);
}

//隐藏窗口
function hide(){
	$('#choose-box-wrapper').css("display","none");
}

function initProvince(){
	
	//原先的省份列表清空
	$('#choose-a-province').html('');
	
	for(i=0;i<schoolList.length;i++){
		$('#choose-a-province').append('<a href="javascript:void(0);" class="province-item" province-id="'+schoolList[i].id+'">'+schoolList[i].name+'</a>');
	}
	
	//添加省份列表项的click事件
	$('.province-item').bind('click',function(){
		var item=$(this);
		var province = item.attr('province-id');
		var choosenItem = item.parent().find('.choosen');
		if(choosenItem)
		$(choosenItem).removeClass('choosen');
		item.addClass('choosen');
		
		//更新大学列表
		initSchool(province);
	});
}

function initSchool(provinceID){

	//原先的学校列表清空
	$('#choose-a-school').html('');
	var schools = schoolList[provinceID-1].school;
	for(i=0;i<schools.length;i++){
		$('#choose-a-school').append('<a href="javascript:void(0);" class="school-item" school-id="'+schools[i].id+'">'+schools[i].name+'</a>');
	}
	
	//添加大学列表项的click事件
	$('.school-item').bind('click', function(){
		var item=$(this);
		var school = item.attr('school-id');

		//更新选择大学文本框中的值
		$('#school-name').val(item.text());

		//关闭弹窗
		hide();
	});
}

function makeCenter(){
	$('#choose-box-wrapper').css("display","block");
	$('#choose-box-wrapper').css("position","absolute");
	$('#choose-box-wrapper').css("top", Math.max(0, (($(window).height() - $('#choose-box-wrapper').outerHeight()) / 2) + $(window).scrollTop()) + "px");
	$('#choose-box-wrapper').css("left", Math.max(0, (($(window).width() - $('#choose-box-wrapper').outerWidth()) / 2) + $(window).scrollLeft()) + "px");
}