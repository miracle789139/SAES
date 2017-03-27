<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>
<%@ page import="edu.usst.utils.DateUtils" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<body>
<%
    Map<String, Object> item = (Map<String, Object>) request.getAttribute("item");
    String action = request.getAttribute("action").toString();
    String legend = action.equals("add") ? "发布附件" : (action.equals("edit") ? "编辑附件" : "附件详情");//一共4个状态，未提交，XXX
%>
<!-- 条件1：add;条件2：edit ;条件3：details-->
<legend><%=legend%>
</legend>

<form class="form-horizontal" id="fileForm" action="fileDo?action=<%=action%>" method="post"
      enctype="multipart/form-data">

    <input type="hidden" name="id" value="<%=item.get("id") == null ? "" : item.get("id")%>"/>

    <div class="form-group">
        <label for="name" class="col-sm-2 control-label">标题</label>

        <div class="col-sm-8">
            <input type="text" class="form-control" id="name" name="name" placeholder="标题"
                   value="<%=item.get("name")==null?"":item.get("name")%>"/>
        </div>
    </div>

    <%--TODO 后面再完善上传功能，比如预览显示，详情就不要显示这么难看的框了--%>
    <%
        if (!action.equals("details")) {
    %>
    <div class="form-group">
        <label for="fileupload" class="col-sm-2 control-label">附件上传</label>

        <div class="col-sm-8">
            <input id="fileupload" name="fileupload" class="form-control" type="file" placeholder="附件上传"/>
        </div>
    </div>
    <%
        }
    %>

    <div class="form-group">
        <label for="note" class="col-sm-2 control-label">备注(可选)</label>

        <div class="col-sm-8">
            <textarea class="form-control" rows="12" id="note" name="note"
                      placeholder="备注"><%=item.get("note") == null ? "" : item.get("note")%></textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="creatorName" class="col-sm-2 control-label">创建人</label>

        <div class="col-sm-8">
            <input type="text" disabled="true" class="form-control" id="creatorName" name="creatorName"
                   placeholder="创建人"
                   value="<%=item.get("creator_name")%>"/>
            <%--其实对应数据库是person_id--%>
            <input type="hidden" id="creatorId" value="<%=item.get("creator_id")%>"/>
        </div>
    </div>

    <div class="form-group">
        <label for="createTime" class="col-sm-2 control-label">创建时间</label>

        <div class="col-sm-8">
            <input type="text" class="form-control" readonly="readonly" id="createTime" name="createTime"
                   placeholder="创建时间"
                   value="<%=item.get("create_time")==null?DateUtils.datetime(new Date()):item.get("create_time")%>"/>
        </div>
    </div>

    <div class="form-group" style="margin-bottom: 30px;">
        <div class="col-sm-offset-2 col-sm-10">
            <%--如果属于--%>
            <a id='updatelw' href='javascript:void(0)' onclick='saveClick()' class='btn btn-info'>提交</a>

            <%--<input type="submit" class="btn btn-primary"/>&lt;%&ndash;直接提交&ndash;%&gt;--%>
            <input type="reset" class="btn btn-default"/>
            <input type="button" onclick="$.fancybox.close()" class="btn btn-default" value="返回"/>
        </div>
    </div>
</form>
<script type="text/javascript">
    initFileForm("<%=action%>", $("#opType").val());//包括多选等绑定
    //    dealWithFileFancyBoxSubmit();

    function saveClick() {
        var fileupload = $("#fileupload").val();
        var note = $("#note").val();
        var createTime = $("#createTime").val();
        var title = $("#name").val();
        var options = {
            url: 'fileDo?action=<%=action%>',
            type: 'post',
            dataType: 'json',
            data: {"fileName": fileupload, "note": note, "createTime": createTime, "name": title},
            beforeSubmit: showFileRequest
//            success: showResponse  //返回回来接收不了
        };
        $("#fileForm").ajaxSubmit(options);

        window.setTimeout(function () {
            location.reload();
        }, 1000);

    }
    ;

</script>
</body>
</html>
