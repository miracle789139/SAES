<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../jspf/citeFile.jspf" %>
</head>

<body>
<tags:common_header/><%--最顶部的头--%>
<tags:lj_header/><%--模块头--%>

<%--文件操作--%>
<div id="div_file" class="wrapper row content download">
    <div class="col-xs-12 mainPanel">
        <div class="panel panel-default">

            <div class="panel-heading">
                <span>下载列表</span>
                <span class="fr">共<font id="totalNum"></font>项</span>
            </div>

            <div class="panel-body">
                <ul class="list-inline">
                    <input type="hidden" class="btn btn-success " id="opType" value="all"/>
                    <li class=""><input type="button" class="btn btn-success" id="all"
                                        onclick="callBackPagination('fileGetList','all',1,10);"
                                        value="全部"/></li>
                    <%
                        String personId = request.getAttribute("personId").toString();
                        if (personId.equals("2")) {
                    %>
                    <li class=""><input type="button" class="btn " id="sender"
                                        onclick="callBackPagination('fileGetList','sender',1,10);"
                                        value="我上传的"/></li>
                    <%} %>
                    <li class="fr" id="liDel"><input type="button" class="btn btn-danger fr" id="dellist" value="删除"/>
                    </li>
                    <li class="fr" id="liAdd"><input type="button" class="btn btn-info" id="add"
                                                     onclick="loadFancybox('fileEvent','add', '');" value="新建"/></li>
                    <%--暂时不实现批量下载，大概思路是批量访问选中的链接即可，不整zip包了--%>
            <%--        <li class="fr" id="liDown"><input type="button" class="btn btn-info" id="down"
                                                      onclick="loadFancybox('fileEvent','down', '');" value="下载"/></li>--%>
                    <li class="fr"><input type="button" class="btn btn-warning" id="tips" data-placement="bottom"
                                          rel="popover" value="使用提示"/></li>
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
    initNavColor("file");
    deleteBySelect("fileDeleteItemByID");//批量删除
    callBackPagination('fileGetList', $("#opType").val(), 1, 10);//初始页面

    var title = "下载专区操作提示";
    var content = '1. 本模块为公共附件管理;<br/>2. 包含附件下载、新建、编辑功能;<br/>3. 在"我上传的",查看自己申请的事项;<br/>4. 在"全部",查看公共附件列表;<br/>5. 只能对自己发布的附件进行编辑和删除管理.';
    loadPopover(title, content);
</script>
</body>
</html>
