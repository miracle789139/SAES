$(document).ready(function () {
    $("#tongzhi").click(function () {
        $("#tongzhi").css("background-color", "red");
        $("#gongzuo").css("background-color", "rgb(100, 94, 94)");
        $("#shenqing").css("background-color", "rgb(100, 94, 94)");
        $("#download").css("background-color", "rgb(100, 94, 94)");
        $(".tongzhi").show();
        $(".gongzuo").hide();
        $(".shenqing").hide();
        $(".download").hide();
    });
    $("#gongzuo").click(function () {
        $("#gongzuo").css("background-color", "red");
        $("#tongzhi").css("background-color", "rgb(100, 94, 94)");
        $("#shenqing").css("background-color", "rgb(100, 94, 94)");
        $("#download").css("background-color", "rgb(100, 94, 94)");
        $(".gongzuo").show();
        $(".tongzhi").hide();
        $(".shenqing").hide();
        $(".download").hide();
    })
    $("#shenqing").click(function () {
        $("#shenqing").css("background-color", "red");
        $("#gongzuo").css("background-color", "rgb(100, 94, 94)");
        $("#tongzhi").css("background-color", "rgb(100, 94, 94)");
        $("#download").css("background-color", "rgb(100, 94, 94)");
        $(".shenqing").show();
        $(".gongzuo").hide();
        $(".tongzhi").hide();
        $(".download").hide();
    })
    $("#download").click(function () {
        $("#download").css("background-color", "red");
        $("#gongzuo").css("background-color", "rgb(100, 94, 94)");
        $("#shenqing").css("background-color", "rgb(100, 94, 94)");
        $("#tongzhi").css("background-color", "rgb(100, 94, 94)");
        $(".download").show();
        $(".gongzuo").hide();
        $(".shenqing").hide();
        $(".tongzhi").hide();
    })
});