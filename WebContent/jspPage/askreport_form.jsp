<%@ page import="edu.usst.utils.DateUtils" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<body>
<%
    Map<String, Object> item = (Map<String, Object>) request.getAttribute("item");
    String action = request.getAttribute("action").toString();
    String legend = action.equals("add") ? "发布申请汇报" : (action.equals("edit") ? "编辑申请汇报" : "申请汇报详情");//一共4个状态，未提交，XXX
    String stateZh = item.get("state").equals(-1) ? "未提交" : (item.get("state").equals(0) ? "待审核" : (item.get("state").equals(1) ? "已通过" : "不通过"));
    List<Map<String, Object>> personLists = (List<Map<String, Object>>) request.getAttribute("personLists");//在选择处拉人
    List<Map<String, Object>> unitLists = (List<Map<String, Object>>) request.getAttribute("unitLists");//在选择处拉人
%>
<!-- 条件1：add;条件2：edit ;条件3：details-->
<legend><%=legend%>
</legend>

<form class="form-horizontal" id="askreportForm" action="askreportDo?action=<%=action%>" method="post">

    <input type="hidden" name="id" value="<%=item.get("id") == null ? "" : item.get("id")%>"/>

    <div class="form-group">
        <label for="title" class="col-sm-2 control-label">标题</label>

        <div class="col-sm-8">
            <input type="text" class="form-control" id="title" name="title" placeholder="标题"
                   value="<%=item.get("title")==null?"":item.get("title")%>"/>
        </div>
    </div>
    <div class="form-group">
        <label for="content" class="col-sm-2 control-label">内容</label>

        <div class="col-sm-8">
            <textarea class="form-control" rows="12" id="content" name="content"
                      placeholder="内容"><%=item.get("ASKREPORT_CONTENT") == null ? "" : item.get("ASKREPORT_CONTENT")%></textarea>
        </div>
    </div>
    <div class="form-group">
        <label for="senderName" class="col-sm-2 control-label">创建人</label>

        <div class="col-sm-8">
            <input type="text" disabled="true" class="form-control" id="senderName" name="senderName" placeholder="创建人"
                   value="<%=item.get("sender_name")%>"/>
            <%--其实对应数据库是person_id--%>
            <input type="hidden" id="senderId" value="<%=item.get("sender_id")%>"/>
        </div>
    </div>

    <div class="form-group">
        <label for="recID" class="col-sm-2 control-label">审核人</label>

        <div class="col-sm-8">
            <input type="hidden" class="form-control" id="recID" name="recID"/><%--不用设置，提交前用jq来绑定赋值--%>
            <input type="hidden" class="form-control" id="recName" name="recName"/><%--不用设置，提交前用jq来绑定赋值--%>
            <select id="recIdSelect" multiple="multiple" size="1">
                <%
                    if (unitLists != null) {
                        for (Map<String, Object> unitItem : unitLists) {//遍历教务处
                            String unit_id = unitItem.get("id").toString();
                %>
                <optgroup label="<%=unitItem.get("name")%>" onclick="javascript:void(0);">
                    <%
                        for (Map<String, Object> personItem : personLists) {//遍历人员
                            if (personItem.get("unit_id").toString().equals(unit_id)) {//如果人的单位id相等，则显示
                    %>
                    <option value="<%=personItem.get("id")%>" <%=item.get("rec_id") == null ? "" : (item.get("rec_id").equals(personItem.get("id")) ? "selected" : "")%>><%=personItem.get("name")%>
                    </option>
                    <%
                            }
                        }
                    %>
                </optgroup>
                <%
                        }
                    }
                %>
            </select>
        </div>
    </div>


    <div class="form-group">
        <label for="sendDate" class="col-sm-2 control-label">创建时间</label>

        <div class="col-sm-8">
            <input type="text" class="form-control" readonly="readonly" id="sendDate" name="sendDate"
                   placeholder="创建时间"
                   value="<%=item.get("send_date")==null?DateUtils.datetime(new Date()):item.get("send_date")%>"/>
        </div>
    </div>

    <div class="form-group">
        <label for="state" class="col-sm-2 control-label">批复状态</label>

        <div class="col-sm-8">
            <input type="text" class="form-control" disabled="true" id="stateZh" name="stateZh" placeholder="批复状态"
                   value="<%=stateZh%>"/>
            <input type="hidden" class="form-control" id="state" name="state"
                   value="<%=item.get("state")==null?"":Integer.parseInt(item.get("state").toString())%>"/>
        </div>
    </div>

    <div class="form-group" style="margin-bottom: 30px;">
        <div class="col-sm-offset-2 col-sm-10">
            <%--还没有审核，则可以进行在修改，既state<1,并且是在我的申请里（js控制）--%>
            <% if (Integer.parseInt(item.get("state").toString())<1) {%>
            <input type="submit" class="btn btn-primary"/><%--直接提交--%>
            <input type="reset" class="btn btn-default"/>
            <%}%>
            <input type="button" onclick="$.fancybox.close()" class="btn btn-default" value="返回"/>
        </div>
    </div>
</form>
<script type="text/javascript">
    initAskreportForm("<%=action%>");//包括多选等绑定
    dealWithAskreportFancyBoxSubmit();
</script>
</body>
</html>
