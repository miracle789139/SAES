<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page import="net.sf.json.JSONArray" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="../jspf/citeFile.jspf" %>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/fullcalendar.css">

    <script src="<%=request.getContextPath()%>/js/fullcalendar.min.js"></script>
</head>

<body>
<tags:common_header/><%--最顶部的头--%>
<tags:lj_header/><%--模块头--%>
<div class="wrapper row content gongzuo">
    <%--可能某一天老师又回要求要回来，先注释吧--%>
    <%-- <div class="panel-body">
         <a href="schedule_create_team">
             <button class="btn btn-info fr">集体工作安排</button>
         </a>
         <a href="schedule_create_person">
             <button class="btn btn-info fr">个人工作安排</button>
         </a>
     </div>--%>

    <div class="col-xs-12 mainPanel">
        <div class="panel panel-default">
            <div class="panel-heading">
                <span>日程表</span>
                <span class="fr"><a href="javascript:void(0)" id="tips" data-placement="bottom" class="btn btn-warning"
                                    rel="popover">使用提示</a></span>
            </div>
            <div id='calendar'></div>
        </div>
    </div>
</div>
<%@ include file="footer.jsp" %>
<script>
    initNavColor("schedule");
    loadScheduleDoAndEvents();
    var title = "个人日程操作提示";
    var content = "1.  本模块为个人日程信息管理;<br/>2. 添加,点击空白处操作;<br/>3. 编辑,点击已存在日程操作;<br/>4. 删除,在编辑框可选择操作;<br/>5. 拖拽与伸缩;对已存在日程可操作.";
    loadPopover(title, content);
</script>
</body>
</html>
