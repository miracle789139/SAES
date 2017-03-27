/**
 * 在initNotifyForm()方法之前，都是通用方法
 */

var totalCount = 0;//设置页码总数

$(".datepicker").datepicker({dateFormat: 'yy-mm-dd'});//不设置minDate: -3, maxDate: 3,
$(".ui-multiselect-menu").css("width", "523");//控制时间控件的宽度

function initNavColor(red_area) {
    $("#notify").css("background-color", "rgb(100, 94, 94)");
    $("#schedule").css("background-color", "rgb(100, 94, 94)");
    $("#askreport").css("background-color", "rgb(100, 94, 94)");
    $("#projectaudit").css("background-color", "rgb(100, 94, 94)");
    $("#file").css("background-color", "rgb(100, 94, 94)");
    $("#home").css("background-color", "rgb(100, 94, 94)");
    $("#" + red_area).css("background-color", "red");
}

/**
 * 使用提示的字样显示
 * @param title
 * @param content
 */
function loadPopover(title, content) {
    $("#tips").popover({title: title, content: content});
}

//先设置总数，区域变色，还有按钮显示隐藏；申请汇报可以共用
function setOprateColorAndTotalNum(type, total) {
    $("#totalNum").text(total);
    $("#opType").val(type);

    //导航按钮变色
    $("#all").removeClass("btn-success");
    $("#sender").removeClass("btn-success");
    $("#appro").removeClass("btn-success");
    $("#" + type).addClass("btn-success");

    //按钮显示隐藏
    $("#liDel").css("display", "none");
    $("#liAdd").css("display", "none");

    if (type == "sender") {//只有在发件箱才显示
        $("#liDel").css("display", "block");
        $("#liAdd").css("display", "block");
    }
}

//时间格式化，小于10的，前面+0
function add0(m) {
    return m < 10 ? '0' + m : m
}

function timestamp2Date(timestamp) {
    var d = new Date(timestamp);    //根据时间戳生成的时间对象
    var date = (d.getFullYear()) + "-" +
        add0((d.getMonth() + 1)) + "-" +
        add0((d.getDate())) + " " +
        add0((d.getHours())) + ":" +
        add0((d.getMinutes())) + ":" +
        add0((d.getSeconds()));
    return date;
}


/**
 * 传好action即可匹配其他ajax
 * 删除0del，拒绝1pass，通过2refuse
 * @param id
 * @param operate
 */
function operateById(id, operate, action) {
    switch (operate) {
        case 0:
            if (confirm("您确定要删除吗？")) {//单个删除
                $.get(action, {"delitems": id}, function (msg) {
                    if (msg == 1) {//删除成功
                        $("[name ='check']:checkbox").attr("checked", false);
                        window.location.reload();
                    } else {
                        alert(msg);
                    }
                });
            }
            break;
        default ://1和2传过去即可
            if (confirm("您确定此操作？")) {
                $.get(action, {"id": id, "operate": operate}, function (msg) {
                    if (msg == 1) {
                        if (operate == 1) {
                            alert("已通过!");
                        } else {
                            alert("已拒回!");
                        }
                        window.location.reload();
                    } else {
                        alert(msg);
                    }
                });
            }
            break;
    }
}

//批量删除
function deleteBySelect(action) {
    $("#dellist").click(function () {
        // 判断是否至少选择一项
        var checkedNum = $("input[name='check']:checked").length;
        if (checkedNum == 0) {
            alert("请选择至少一项！");
            return;
        }
        // 批量选择
        if (confirm("确定要删除所选项目？")) {
            var checkedList = new Array();

            $("input[name='check']:checked").each(function () {
                checkedList.push($(this).val());
            });
            $.ajax({
                type: "POST",
                url: action,
                data: {
                    'delitems': checkedList.toString()
                },
                success: function (result) {
                    $("[name ='check']:checkbox").attr("checked", false);
                    window.location.reload();
                }
            });
        }
    });
}
/**
 * 传入actionUrl，即可公用
 * 在首页页面，点击查看，编辑，新建等按钮时，加载fancybox页面
 * @param actionUrl
 * @param action
 * @param id
 */
function loadFancybox(actionUrl, action, id) {//add,edit,details
    $.fancybox({//添加
        width: 800,
        height: '90%',
        autoDimensions: false,
        centerOnScroll: true,//弹出窗口始终浏览器居中
        //'scrolling': 'no',
        'type': 'ajax',
        'href': actionUrl + '?action=' + action + '&id=' + id
    });
}


/**
 * 拿数据，构建table，绑定分页组件
 * 依次3个方法，是数据获取和分页设置的
 */
//启动
function callBackPagination(actionUrl, type, curr, limit) {
    getList(actionUrl, curr, limit, type);//首次加载
    $('#callBackPager').extendPagination({//绑定
        totalCount: totalCount,
        limit: limit,
        callback: function (curr, limit, totalCount) {//回调事件，得不到type，而且默认是这3个参数
            getList(actionUrl, curr, limit, type);
        }
    });
}


//获取数据
function getList(actionUrl, curr, limit, type) {
    $.ajax({
        type: "POST",
        dataType: "json",
        async: false,
        data: {"getType": type, "pNum": curr},
        url: actionUrl,
        success: function (result) {
            if (result != null) {
                totalPage = result.totalPageNum;//暂时没什么用
                totalCount = result.totalRecordNum;
                caseCreateTable(actionUrl, result, limit, type);
            }
        }
    });
}

/**
 * 这个也是可以公共用的
 * @param responseText
 * @param statusText
 * @param xhr
 * @param $form
 */
function showResponse(responseText, statusText, xhr, $form) {
    if (statusText == "success") {
        if (responseText == 1) {
            $.fancybox.close();
// TODO 要实现在发件箱等这些导航实现刷新的话，只要传回跳转的url，再调用    callBackPagination('askreportGetList',$("#opType").val(), 1, 10);//初始页面即可，并注释下面的函数
            window.location.reload();
        } else {
            alert(responseText);
        }
    } else {
        alert(statusText);
    }
}

/**
 * 判断创建哪个表的数据
 * @param actionUrl
 * @param result
 * @param limit
 * @param type
 */
function caseCreateTable(actionUrl, result, limit, type) {
	if (actionUrl == "notifyGetList") {
		createNotifyTable(result.pNum, limit, totalCount, result.kyxxList, type);//创建表格
	} else if (actionUrl == "askreportGetList") {
		createAskreportTable(result.pNum, limit, totalCount, result.kyxxList, type);//创建表格
	} else if (actionUrl == "fileGetList") {
		createFileTable(result.pNum, limit, totalCount, result.kyxxList, type);//创建表格
	}else if (actionUrl == "doneauditGetList") {
		createAuditTable(result.pNum, limit, totalCount, result.kyxxList, type);//创建表格
	}
}

/**
 * 以下按函数名，区分模块
 * @param id
 * @param operate
 */

/**
 * 通知公告
 * @param id
 * @param operate
 */

//非添加时，不可编辑
function initNotifyForm(action) {
    //刚开始就要先绑定
    var rec = $("#recIdSelect option:selected");
    var approval = $("#approvalIdSelect option:selected");//有name和id，但是会多个

    var recID = [];
    var recName = [];

    rec.each(function () {
        recID.push($(this).val());
        recName.push($(this).text());
    });

    $("#recID").val(recID.join(","));
    $("#recName").val(recName.join(",").trim());

    $("#approvalID").val(approval.val());
    $("#approvalName").val(approval.text());

    //审核人
    $("#approvalIdSelect").multiselect({
        multiple: false,
        header: "只能选择一个",
        noneSelectedText: "请选择",
        selectedList: 1,//显示在列上有几个，size是行
        close: function () {
            var approval = $("#approvalIdSelect option:selected");//有name和id，但是会多个

            if (approval.length > 1) {
                alert("只能选择一个审核人");
                return false;
            } else {
                $("#approvalID").val(approval.val());
                $("#approvalName").val(approval.text());
            }
        }
    });
    //通知人
    $("#recIdSelect").multiselect({
        noneSelectedText: "请选择",
        checkAllText: "全选",
        uncheckAllText: '全不选',
        selectedText: '共#项',
        width: '100%',
        selectedList: 7,//简略,TODO 所有的出的用title显示出来

        close: function () {
            var rec = $("#recIdSelect option:selected");

            var recID = [];
            var recName = [];

            rec.each(function () {
                recID.push($(this).val());
                recName.push($(this).text());
            });
            $("#recID").val(recID.join(","));
            $("#recName").val(recName.join(",").trim());
        }
    });

    //设置不可编辑
    if (action == "details" || $("#state").val() > 0) {// !details可见，比如编辑按钮不会出现在这，而每个人的add也都是可编辑的
        $("input[type='text']").attr("disabled", "false");
        $("textarea").attr("disabled", "false");

        //已审核完毕，则不可修改，不知道怎么的，总是大1
        var $recIdSelectWidget = $("#recIdSelect").multiselect();
        var $approvalIdSelectWidget = $("#approvalIdSelect").multiselect();
        $recIdSelectWidget.multiselect('disable');
        $approvalIdSelectWidget.multiselect('disable');
    }
}

function dealWithNotifyFancyBoxSubmit() {
    //提交表单
    $('#notifyForm').ajaxForm({
        beforeSubmit: showNotityRequest, //表单验证
        success: showResponse //成功返回
    });
}

/**
 * 表单验证
 * @returns {boolean}
 */
function showNotityRequest() {
    var title = $("#title").val();
    if (title == '') {
        alert("请输入标题！");
        $("#title").focus();
        return false;
    }
    var content = $("#content").val();
    if (content == '') {
        alert("请输入内容！");
        $("#content").focus();
        return false;
    }

    if ($("#approvalID").val() == '') {
        alert("请选择审核人！");
        $("#approvalID").focus();
        return false;
    }

    if ($("#recID").val() == '') {
        alert("请选择接收人！");
        $("#recID").focus();
        return false;
    }
}

//创建通知公告表格
function createNotifyTable(currPage, limit, total, dataList, type) {
    setOprateColorAndTotalNum(type, total);

    var html = [], showNum = limit;//本页显示条数

    if (total - (currPage * limit) < 0) showNum = total - ((currPage - 1) * limit);//最后一页
    html.push('<table class="table table-bordered table-hover">');
    html.push('<thead><tr>');
    if (type == "sender") {//只有自己创建的才可以删除
        html.push('<th class="allSelect">全选</th>');
    }
    html.push('<th class="xuHao">序号</th><th class="col-xs-5">公共标题</th><th class="col-xs-1">发布人</th><th class="col-xs-1">发布时间</th><th class="col-xs-1">查看次数</th>');
    if (type != "all") {//条件只有后面两种状态才可以看
        html.push('<th class="col-xs-1">审核状态</th>');
    }
    html.push('<th class="col-xs-1">操作</th></tr></thead><tbody>');
    html.push('<tbody><tr>');
    for (var i = 0; i < showNum; i++) {
        var item = dataList[i];
        var sendDate = timestamp2Date(item.SEND_DATE.time);
        var stateZh = item.STATE == 0 ? "待审核" : (item.STATE == 1 ? "已通过" : "不通过");
        if (type == "sender") {//只有自己创建的才可以删除
            html.push("<td class='allSelect'><input type='checkbox' name='check' value='" + item.ID + "'/></td>");
        }
        html.push("<td class='xuHao' name='XU_HAO'>" + (i + 1) + "</td><td class='col-xs-5 tal' name='title'><a href='javascript:void(0)'onclick=loadFancybox('notifyEvent','details','" + item.ID + "')>" + item.TITLE + "</a></td>");
        html.push("<td class='col-xs-1' name='SENDER_NAME'>" + item.SENDER_NAME + "</td>");
        html.push("<td class='col-xs-1' name='SEND_DATE'>" + sendDate + "</td>");
        html.push("<td class='col-xs-1' name='VIEW_TIMES'>" + item.VIEW_TIMES + "</td>");
        if (type != "all") {//条件只有后面两种状态才可以看
            html.push("<td class='col-xs-1' name='stateZh'>" + stateZh + "</td>");
        }
        html.push("<td class='col-xs-1'>");
        if (type == 'all') {//条件，all其他人看1,sender申请人看到2；审核人看到3
            html.push("<input type='button' class='btn btn-info'onclick=loadFancybox('notifyEvent','details','" + item.ID + "') value='详情' />");
        } else if (type == 'sender') {
            html.push("<input type='button' class='btn btn-info' value='编辑' onclick=loadFancybox('notifyEvent','edit','" + item.ID + "') />");
            html.push("<input type='button' class='btn btn-danger' name='delete'value='删除' onclick=operateById('" + item.ID + "',0,'notifyDeleteItemByID') />");
        } else if (type == 'appro') {
            html.push("<input type='button' class='btn btn-info' onclick=operateById('" + item.ID + "',1,'notifyOperateById') value='通过' />");
            html.push("<input type='button' class='btn btn-danger' onclick=operateById('" + item.ID + "',2,'notifyOperateById') value='拒回' />");
        }
        html.push("</td></tr>");
    }
    html.push('</tbody></table>');
    var mainObj = $('#mainContent');
    mainObj.empty();
    mainObj.html(html.join(''));
}

//创建项目审核表格
function createAuditTable(currPage, limit, total, dataList, type) {
	
	setOprateColorAndTotalNum(type, total);
	var html = [], showNum = limit;//本页显示条数
	
	if (total - (currPage * limit) < 0) showNum = total - ((currPage - 1) * limit);//最后一页
	html.push('<table class="table table-bordered table-hover">');
	html.push('<thead><tr>');
//	if (type == "sender") {//只有自己创建的才可以删除
//		html.push('<th class="allSelect">全选</th>');
//	}
	html.push('<th class="xuHao">项目编号</th><th class="col-xs-4">项目名称</th><th class="col-xs-1">负责人</th><th class="col-xs-2">创建时间</th><th class="col-xs-1">项目分类</th>');
	if (type != "all") {//条件只有后面两种状态才可以看
		html.push('<th class="col-xs-1">审核状态</th>');
	}
	html.push('<th class="col-xs-1">操作</th></tr></thead><tbody>');
	html.push('<tbody><tr>');
	for (var i = 0; i < showNum; i++) {
		var item = dataList[i];
		var sendDate = timestamp2Date(item.CREATE_TIME.time);
		var stateZh = item.SUO_CHECK_STATE == 0 ? "待审核" : (item.SUO_CHECK_STATE == 1 ? "已通过" : "不通过");
//		if (type == "sender") {//只有自己创建的才可以删除
//			html.push("<td class='allSelect'><input type='checkbox' name='check' value='" + item.ID + "'/></td>");
//		}
		html.push("<td class='xuHao' name='XU_HAO'>" + item.PROJECT_CODE + "</td><td class='col-xs-4 tal' name='title'><a href='javascript:void(0)'onclick=loadFancybox('notifyEvent','details','" + item.PROJECT_CODE + "')>" + item.PROJECT_NAME + "</a></td>");
		html.push("<td class='col-xs-1' name='SENDER_NAME'>" + item.CHARGER_NAME + "</td>");
		html.push("<td class='col-xs-2' name='SEND_DATE'>" + sendDate + "</td>");
		html.push("<td class='col-xs-1' name='VIEW_TIMES'>" + item.PROJECT_TYPE + "</td>");
		if (type != "all") {//条件只有后面两种状态才可以看
			html.push("<td class='col-xs-1' name='stateZh'>" + stateZh + "</td>");
		}
		html.push("<td class='col-xs-1'>");
		if (type == 'all') {//条件，all其他人看1,sender申请人看到2；审核人看到3
			html.push("<input type='button' class='btn btn-info' onclick=loadFancybox('notifyEvent','details','" + item.ID + "') value='详情' />");
		} else if (type == 'sender') {
			html.push("<input type='button' class='btn btn-info' value='详情' onclick=loadFancybox('notifyEvent','edit','" + item.ID + "') />");
			html.push("<input type='button' class='btn btn-info' name='delete'value='审核' onclick=operateById('" + item.ID + "',0,'notifyDeleteItemByID') />");
		} else if (type == 'appro') {
			html.push("<input type='button' class='btn btn-info' onclick=operateById('" + item.ID + "',1,'notifyOperateById') value='通过' />");
			html.push("<input type='button' class='btn btn-danger' onclick=operateById('" + item.ID + "',2,'notifyOperateById') value='拒回' />");
		}
		html.push("</td></tr>");
	}
	html.push('</tbody></table>');
	var mainObj = $('#mainContent');
	mainObj.empty();
	mainObj.html(html.join(''));
}

/**
 * 申请汇报
 */
//非添加时，不可编辑
function initAskreportForm(action) {
    //刚开始就要先绑定
    var rec = $("#recIdSelect option:selected");

    $("#recID").val(rec.val());
    $("#recName").val(rec.text());

    if ($("#opType").val() == "appro") {// 在发送界面，点开编辑，可以编辑；而在全部，则默认隐藏提交/重置按钮
        $("input[type='submit']").css("display", "none");
        $("input[type='reset']").css("display", "none");
    }

    //审核人
    $("#recIdSelect").multiselect({
        multiple: false,
        header: "只能选择一个",
        noneSelectedText: "请选择",
        selectedList: 1,//显示在列上有几个，size是行
        close: function () {
            var rec = $("#recIdSelect option:selected");//有name和id，但是会多个
            if (rec.length > 1) {
                alert("只能选择一个审核人");
                return false;
            } else {
                $("#recID").val(rec.val());
                $("#recName").val(rec.text());
            }
        }
    });

    //设置不可编辑
    if (action == "details" || $("#state").val() > 0) {// !details可见，比如编辑按钮不会出现在这，而每个人的add也都是可编辑的
        $("input[type='text']").attr("disabled", "false");
        $("textarea").attr("disabled", "false");

        //已审核完毕，则不可修改，不知道怎么的，总是大1
        var $recIdSelectWidget = $("#recIdSelect").multiselect();
        $recIdSelectWidget.multiselect('disable');
    }
}

function dealWithAskreportFancyBoxSubmit() {
    //提交表单
    $('#askreportForm').ajaxForm({
        beforeSubmit: showAskreportRequest, //表单验证
        success: showResponse //成功返回
    });
}

/**
 * 表单验证
 * @returns {boolean}
 */
function showAskreportRequest() {
    if ($("#title").val() == '') {
        alert("请输入标题！");
        $("#title").focus();
        return false;
    }

    if ($("#content").val() == '') {
        alert("请输入内容！");
        $("#content").focus();
        return false;
    }

    if ($("#recID").val() == '') {
        alert("请选择审核人！");
        $("#recID").focus();
        return false;
    }
}

//创建表格
function createAskreportTable(currPage, limit, total, dataList, type) {
    setOprateColorAndTotalNum(type, total);

    var html = [], showNum = limit;//本页显示条数

    if (total - (currPage * limit) < 0) showNum = total - ((currPage - 1) * limit);//最后一页
    html.push('<table class="table table-bordered table-hover">');
    html.push('<thead><tr>');
    if (type == "sender") {//只有自己创建的才可以删除
        html.push('<th class="allSelect">全选</th>');
    }
    html.push('<th class="xuHao">序号</th><th class="col-xs-5">申请标题</th><th class="col-xs-1">申请人</th><th class="col-xs-1">申请时间</th><th class="col-xs-1">审核人</th>');
    if (type != "all") {//条件只有后面两种状态才可以看
        html.push('<th class="col-xs-1">审核状态</th>');
    }
    html.push('<th class="col-xs-1">操作</th></tr></thead><tbody>');
    html.push('<tbody><tr>');
    for (var i = 0; i < showNum; i++) {
        var item = dataList[i];
        var sendDate = timestamp2Date(item.SEND_DATE.time);
        var stateZh = item.STATE == 0 ? "待审核" : (item.STATE == 1 ? "已通过" : "不通过");
        if (type == "sender") {//只有自己创建的才可以删除
            html.push("<td class='allSelect'><input type='checkbox' name='check' value='" + item.ID + "'/></td>");
        }
        html.push("<td class='xuHao' name='XU_HAO'>" + (i + 1) + "</td><td class='col-xs-5 tal' name='title'><a href='javascript:void(0)'onclick=loadFancybox('askreportEvent','details','" + item.ID + "')>" + item.TITLE + "</a></td>");
        html.push("<td class='col-xs-1' name='SENDER_NAME'>" + item.SENDER_NAME + "</td>");
        html.push("<td class='col-xs-1' name='SEND_DATE'>" + sendDate + "</td>");
        html.push("<td class='col-xs-1' name='REC_NAME'>" + item.REC_NAME + "</td>");
        html.push("<td class='col-xs-1' name='stateZh'>" + stateZh + "</td>");//状态都可以看
        html.push("<td class='col-xs-1'>");
        if (type == 'sender') {//条件，sender申请人看到2；审核人看到3
            html.push("<input type='button' class='btn btn-info' value='编辑' onclick=loadFancybox('askreportEvent','edit','" + item.ID + "') />");
            html.push("<input type='button' class='btn btn-danger' name='delete'value='删除' onclick=operateById('" + item.ID + "',0,'askreportDeleteItemByID') />");
        } else if (type == 'appro') {
            html.push("<input type='button' class='btn btn-info' onclick=operateById('" + item.ID + "',1,'askreportOperateById') value='通过' />");
            html.push("<input type='button' class='btn btn-danger' onclick=operateById('" + item.ID + "',2,'askreportOperateById') value='拒回' />");
        }
        html.push("</td></tr>");
    }
    html.push('</tbody></table>');
    var mainObj = $('#mainContent');
    mainObj.empty();
    mainObj.html(html.join(''));
}

/**
 * 下载专区
 */
//非添加时，不可编辑
function initFileForm(action, opType) {
    //设置不可编辑
    if (action == "details") {// !details可见，比如编辑按钮不会出现在这，而每个人的add也都是可编辑的
        $("input[type='text']").attr("disabled", "false");
        $("input[type='file']").attr("disabled", "false");
        $("textarea").attr("disabled", "false");

        //提交等按钮隐藏
        $("input[type='submit']").css("display", "none");
        $("input[type='reset']").css("display", "none");
    }

    if (opType == "sender") {// 在发送界面，点开编辑，可以编辑；而在全部，则默认隐藏提交/重置按钮
        $("input[type='submit']").css("display", "");
        $("input[type='reset']").css("display", "");
    }
}

function dealWithFileFancyBoxSubmit() {
    //提交表单
    $('#fileForm').ajaxForm({
        beforeSubmit: showFileRequest, //表单验证
        success: showResponse //成功返回
    });
}

/**
 * 表单验证
 * @returns {boolean}
 */
function showFileRequest() {
    if ($("#name").val() == '') {
        alert("请输入标题！");
        $("#name").focus();
        return false;
    }

    if ($("#fileupload").val() == '') {
        alert("请选择附件！");
        $("#fileupload").focus();
        return false;
    }


    // TODO增加附件列，不能为空
    //    if ($("#recID").val() == '') {
    //        alert("请选择审核人！");
    //       $("#recID").focus();
    //        return false;
//}
}

//创建表格
function createFileTable(currPage, limit, total, dataList, type) {
    setOprateColorAndTotalNum(type, total);

    var html = [], showNum = limit;//本页显示条数

    if (total - (currPage * limit) < 0) showNum = total - ((currPage - 1) * limit);//最后一页
    html.push('<table class="table table-bordered table-hover">');
    html.push('<thead><tr>');
    if (type == 'sender') {//所有人没有全选
        html.push('<th class="allSelect">全选</th>');//批量下载需要全选
    }
    html.push('<th class="xuHao">序号</th><th class="col-xs-5">文件名称</th><th class="col-xs-1">发布人</th><th class="col-xs-1">发布时间</th><th class="col-xs-1">文件类型</th><th class="col-xs-1">下载次数</th>');
    html.push('<th class="col-xs-1">操作</th></tr></thead><tbody>');
    html.push('<tbody><tr>');
    for (var i = 0; i < showNum; i++) {
        var item = dataList[i];
        var sendDate = timestamp2Date(item.CREATE_TIME.time);
        if (type == 'sender') {//所有人没有全选
            html.push("<td class='allSelect'><input type='checkbox' name='check' value='" + item.ID + "'></td>");
        }
        html.push("<td class='xuHao' name='XU_HAO'>" + (i + 1) + "</td><td class='col-xs-5 tal' name='NAME'><a href='javascript:void(0)'onclick=loadFancybox('fileEvent','details','" + item.ID + "')>" + item.NAME + "</a></td>");
        html.push("<td class='col-xs-1' name='CREATOR_NAME'>" + item.CREATOR_NAME + "</td>");
        html.push("<td class='col-xs-1' name='CREATE_TIME'>" + sendDate + "</td>");
        html.push("<td class='col-xs-1' name='EXTRA_NAME'>" + item.EXTRA_NAME + "</td>");
        html.push("<td class='col-xs-1' name='DOWNLOAD_TIMES'>" + item.DOWNLOAD_TIMES + "</td>");
        html.push("<td class='col-xs-1'>");
        if (type == 'all') {//普通的，只能查看和下载
            html.push("<input type='button' class='btn btn-info' value='详情' onclick=loadFancybox('fileEvent','details','" + item.ID + "') />");
            html.push("<a id='whiteButton' class='btn btn-success' href=fileOperateById?fileName=" + item.FILE_ID + "&id="+ item.ID +"&downloadTimes="+ item.DOWNLOAD_TIMES +">下载</a>");
        } else {//条件，sender申请人看到2；审核人看到3
            html.push("<input type='button' class='btn btn-info' value='编辑' onclick=loadFancybox('fileEvent','edit','" + item.ID + "') />");
            html.push("<input type='button' class='btn btn-danger' name='delete'value='删除' onclick=operateById('" + item.ID + "',0,'fileDeleteItemByID') />");
        }
        html.push("</td></tr>");
    }
    html.push('</tbody></table>');
    var mainObj = $('#mainContent');
    mainObj.empty();
    mainObj.html(html.join(''));
}


/**
 * 日程表
 * @param jsonArray
 */
function loadScheduleDoAndEvents(jsonArray) {
    $('#calendar').fullCalendar({
        timeFormat: 'H:mm',//24小时制
        events: 'scheduleGetList',

        header: {
            left: 'prev,next today',
            center: 'title',
            right: 'month,agendaWeek,agendaDay'
        },
        editable: true,
        dragOpacity: {
            agenda: .5,
            '': .6
        },
        eventDrop: function (event, dayDelta, minuteDelta, allDay, revertFunc) {
            $.post("scheduleDo?action=drag", {
                id: event.id,
                daydiff: dayDelta,
                minudiff: minuteDelta,
                allday: allDay
            }, function (msg) {
                if (msg != 1) {
                    alert(msg);
                    revertFunc();
                }
            });
        },

        eventResize: function (event, dayDelta, minuteDelta, revertFunc) {
            $.post("scheduleDo?action=resize", {
                id: event.id,
                daydiff: dayDelta,
                minudiff: minuteDelta
            }, function (msg) {
                if (msg != 1) {
                    alert(msg);
                    revertFunc();
                }
            });
        },

        selectable: true,
        select: function (startDate, endDate, allDay, jsEvent, view) {
            var start = $.fullCalendar.formatDate(startDate, 'yyyy-MM-dd');
            var end = $.fullCalendar.formatDate(endDate, 'yyyy-MM-dd');
            $.fancybox({
                width: 514,
                height: 285,
                autoScale: false,
                autoDimensions: false,
                centerOnScroll: true,//弹出窗口始终浏览器居中
                'scrolling': 'no',
                'type': 'ajax',
                'href': 'scheduleEvent?action=add&date=' + start + '&end=' + end
            });
        },

        dayClick: function (date, allDay, jsEvent, view) {
            var selDate = $.fullCalendar.formatDate(date, 'yyyy-MM-dd');
            $.fancybox({
                width: 514,
                height: 285,
                autoScale: false,
                autoDimensions: false,
                centerOnScroll: true,//弹出窗口始终浏览器居中
                'scrolling': 'no',
                'type': 'ajax',
                'href': 'scheduleEvent?action=add&date=' + selDate
            });
        },
        eventClick: function (calEvent, jsEvent, view) {
            $.fancybox({
                width: 514,
                height: 285,
                autoScale: false,
                autoDimensions: false,
                centerOnScroll: true,//弹出窗口始终浏览器居中
                'scrolling': 'no',
                'type': 'ajax',
                'href': 'scheduleEvent?action=edit&id=' + calEvent.id
            });
        }
    });
}

function loadScheduleForm() {
    $("#isallday").click(function () {
        if ($("#sel_start").css("display") == "none") {
            $("#sel_start,#sel_end").show();
        } else {
            $("#sel_start,#sel_end").hide();
        }
    });

    $("#isend").click(function () {
        if ($("#p_endtime").css("display") == "none") {
            $("#p_endtime").show();
        } else {
            $("#p_endtime").hide();
        }
        //$.fancybox.resize();//调整高度自适应
    });

    //提交表单
    $('#add_form').ajaxForm({
        beforeSubmit: showRequest, //表单验证
        success: showResponse //成功返回
    });

    //删除事件
    $("#del_event").click(function () {
        if (confirm("您确定要删除吗？")) {
            var eventid = $("#eventid").val();
            $.post("scheduleDo?action=del", {id: eventid}, function (msg) {
                if (msg == 1) {//删除成功
                    $.fancybox.close();
                    $('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据
                } else {
                    alert(msg);
                }
            });
        }
    });

    function showRequest() {
        var events = $("#event").val();
        if (events == '') {
            alert("请输入日程内容！");
            $("#event").focus();
            return false;
        }
    }

    function showResponse(responseText, statusText, xhr, $form) {
        if (statusText == "success") {
            if (responseText == 1) {
                $.fancybox.close();
                $('#calendar').fullCalendar('refetchEvents'); //重新获取所有事件数据
            } else {
                alert(responseText);
            }
        } else {
            alert(statusText);
        }
    }
}

/**
 * 文件下载
 * @param action
 * @param id
 */
function fileDownload() {
    //TODO
};
