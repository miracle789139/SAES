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
});

 $(function() {
        var date = new Date();
        var d = date.getDate();
        var m = date.getMonth();
        var y = date.getFullYear();
        
        $('#calendar').fullCalendar({
            header: {
                left: 'prev,title,next',
                center: "1",
                right: ''
            },
            firstDay:1,
            editable: true,
            timeFormat: 'H:mm',
            axisFormat: 'H:mm',
            events: [
                {
                    title: '全天计划\r\n#####\r\n写代码',
                    start: new Date(y, m, 1)
                },
                {
                    title: '张家界四日游',
                    start: new Date(y, m, d-5),
                    end: new Date(y, m, d-2)
                },
                {
                    id: 999,
                    title: '电话回访客户',
                    start: new Date(y, m, d-6, 16, 0),
                    allDay: false
                },
                {
                    id: 999,
                    title: '电话回访客户',
                    start: new Date(y, m, d+4, 16, 0),
                    allDay: false
                },
                {
                    title: '视频会议',
                    start: new Date(y, m, d, 10, 30),
                    allDay: false
                },
                {
                    title: '中秋放假',
                    start: '2013-09-19',
                    end: '2013-09-21',
                },
                {
                    title: '午饭',
                    start: new Date(y, m, d, 12, 0),
                    end: new Date(y, m, d, 14, 0),
                    allDay: false
                },
                {
                    title: '生日聚会',
                    start: new Date(y, m, d+1, 19, 0),
                    end: new Date(y, m, d+1, 22, 30),
                    allDay: false
                },
                {
                    title: '访问Helloweba主页',
                    start: new Date(y, m, 28),
                    end: new Date(y, m, 29),
                    url: 'http://helloweba.com/'
                },
                {
                    title: '实战训练课',
                    start: new Date(y, m, d+23)
                },
            ]
        });
    });