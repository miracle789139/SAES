<!DOCTYPE html>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <%@ include file="../jspf/citeFile.jspf" %>
</head>
<body>
<tags:common_header/><%--最顶部的头--%>
<tags:lj_header/><%--模块头--%>

<%--申请汇报--%>
<div id="div_askreport" class="wrapper row content shenqing">
    <div class="col-xs-12 mainPanel">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span>申请列表</span>
                <span class="fr">共<font id="totalNum"></font>项</span>
            </div>

            <div class="panel-body">
                <ul class="list-inline">
                    <input type="hidden" class="btn btn-success " id="opType" value="sender"/>
                    <li class=""><input type="button" class="btn btn-success" id="sender"
                                        onclick="callBackPagination('askreportGetList','sender',1,10);"
                                        value="我的申请"/></li>
                    <%
                        String personId = request.getAttribute("personId").toString();
                        if (personId.equals("2")) {
                    %>
                    <li class=""><input type="button" class="btn " id="appro"
                                        onclick="callBackPagination('askreportGetList','appro',1,10);"
                                        value="待审批"/></li>
                    <%} %>
                    <li class="fr" id="liDel"><input type="button" class="btn btn-danger fr" id="dellist" value="删除"/></li>
                    <li class="fr" id="liAdd"><input type="button" class="btn btn-info" id="add"
                                                     onclick="loadFancybox('askreportEvent','add', '');" value="新建"/></li>
                    <li class="fr"><input type="button" class="btn btn-warning" id="tips" data-placement="bottom" rel="popover" value="使用提示"/></li>
                    <%--<button class="btn btn-info fr">查询</button>--%>
                </ul>
            </div>

            <div id="mainContent"></div>
            <div id="callBackPager"></div>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>

<script>
    /*以下方法都是通用的，值需要实现对应接口即可*/
    initNavColor("askreport");
    deleteBySelect("askreportDeleteItemByID");//批量删除
    callBackPagination('askreportGetList',$("#opType").val(), 1, 10);//初始页面

    var title = "申请汇报操作提示";
    var content = '1. 本模块处理申请汇报和审批事项;<br/>2. 包含申请的新建、审核、查看功能;<br/>3. 新建申请需要选择审核人进行审核;<br/>4. 在"我的申请",查看自己申请的事项;<br/>5. 在"待审批",查看需要审批的申请;<br/>6. 只能编辑"待审核"状态的申请汇报;<br/>7. 只能对自己创建的申请进行编辑和删除.';
    loadPopover(title,content);
</script>
</body>
</html>