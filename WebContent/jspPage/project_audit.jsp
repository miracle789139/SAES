<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../jspf/citeFile.jspf" %>
</head>
<body>
<tags:common_header/><%--最顶部的头--%>
<tags:lj_header/><%--模块头--%>

<div id="div_notify" class="wrapper row content tongzhi">

    <div class="col-xs-12 mainPanel">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span>公告列表</span>
                <span class="fr">共<font id="totalNum"></font>项</span>

            </div>
            <div class="panel-body">
                <ul class="list-inline">
                    <input type="hidden" class="btn btn-success " id="opType" value="all">
                    <li class=""><input type="button" class="btn btn-success " id="all"
                                        onclick="callBackPagination('doneauditGetList','all',1,10);" value="已审核"/></li>
                    <li class=""><input type="button" class="btn " id="sender"
                                        onclick="callBackPagination('doneauditGetList','sender',1,10);"value="待审核"/></li>
                    <!-- <li class=""><input type="button" class="btn " id="appro"
                                        onclick="callBackPagination('notifyGetList','appro',1,10);"
                                        value="待审批"/></li> -->
                    <!-- <li class="fr" id="liDel"><input type="button" class="btn btn-danger fr" id="dellist" value="删除"/></li>
                    <li class="fr" id="liAdd"><input type="button" class="btn btn-info" id="add"
                                          onclick="loadFancybox('notifyEvent','add', '');" value="新建"/></li> -->
                    <!-- <li class="fr"><input type="button" class="btn btn-warning" id="tips" data-placement="bottom" rel="popover" value="使用提示"/></li> -->
                    <%--<button class="btn btn-info fr">查询</button>--%>
                </ul>
            </div>

            <div id="mainContent"></div>
            <!-- Table -->
            <div id="callBackPager"></div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    initNavColor("projectaudit");
    deleteBySelect("notifyDeleteItemByID");//批量删除
    callBackPagination('doneauditGetList',$("#opType").val(), 1, 10);//默认根据hidden赋值，这样可以在fancybox加载完后锁定当前导航页（还是不能做，工作量太大了，就先默认这样吧！）；类型，当前页，每页最大数

    var title = "通知公告操作提示";
    var content = '<p><b>说明</b></p>1. 本通知管理模块包含公告的新建、审核、查看功能;<br/>2. 在"发件箱",查看自己新建的公告;<br/>3. 在"待审核",查看需要进行审核的公告";<br/>4. 在"查看",查看已通过审核的公告.<br/><p><b>特别注意</b></p>1. 新建公告需要选择审核人进行审核;<br/>2. 属于接收人才能在"查看"看到公告;<br/>3. 只能修改"待审核"状态的公告信息;<br/>4. 只能对自己创建的公告进行编辑和删除;<br/>5. 只有通过审核的公告才会更新查看次数.';
    loadPopover(title,content);
</script>
</body>
</html>