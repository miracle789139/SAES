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
//��������
function pop(){
	//�����ھ���
	makeCenter();

	//��ʼ��ʡ���б�
	initProvince();

	//Ĭ�������, ����һ��ʡ�����choosen��ʽ
	$('[province-id="1"]').addClass('choosen');

	//��ʼ����ѧ�б�
	initSchool(1);
}

//���ش���
function hide(){
	$('#choose-box-wrapper').css("display","none");
}

function initProvince(){
	
	//ԭ�ȵ�ʡ���б����
	$('#choose-a-province').html('');
	
	for(i=0;i<schoolList.length;i++){
		$('#choose-a-province').append('<a href="javascript:void(0);" class="province-item" province-id="'+schoolList[i].id+'">'+schoolList[i].name+'</a>');
	}
	
	//���ʡ���б����click�¼�
	$('.province-item').bind('click',function(){
		var item=$(this);
		var province = item.attr('province-id');
		var choosenItem = item.parent().find('.choosen');
		if(choosenItem)
		$(choosenItem).removeClass('choosen');
		item.addClass('choosen');
		
		//���´�ѧ�б�
		initSchool(province);
	});
}

function initSchool(provinceID){

	//ԭ�ȵ�ѧУ�б����
	$('#choose-a-school').html('');
	var schools = schoolList[provinceID-1].school;
	for(i=0;i<schools.length;i++){
		$('#choose-a-school').append('<a href="javascript:void(0);" class="school-item" school-id="'+schools[i].id+'">'+schools[i].name+'</a>');
	}
	
	//��Ӵ�ѧ�б����click�¼�
	$('.school-item').bind('click', function(){
		var item=$(this);
		var school = item.attr('school-id');

		//����ѡ���ѧ�ı����е�ֵ
		$('#school-name').val(item.text());

		//�رյ���
		hide();
	});
}

function makeCenter(){
	$('#choose-box-wrapper').css("display","block");
	$('#choose-box-wrapper').css("position","absolute");
	$('#choose-box-wrapper').css("top", Math.max(0, (($(window).height() - $('#choose-box-wrapper').outerHeight()) / 2) + $(window).scrollTop()) + "px");
	$('#choose-box-wrapper').css("left", Math.max(0, (($(window).width() - $('#choose-box-wrapper').outerWidth()) / 2) + $(window).scrollLeft()) + "px");
}