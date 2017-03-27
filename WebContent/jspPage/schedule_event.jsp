<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<body>
<%
    String action = request.getAttribute("action").toString();
    if (action.equals("add")) {
    Map<String, Object> item = (Map<String, Object>) request.getAttribute("item");
%>
<div class="fancy">
    <h3>新建事件</h3>
    <form id="add_form" action="scheduleDo?action=add" method="post">
        <p>日程内容：<input type="text" class="input" name="event" id="event" style="width:320px" placeholder="记录你将要做的一件事..."></p>
        <p>开始时间：<input type="text" class="input datepicker" name="startdate" id="startdate" value="<%=item.get("date")%>" readonly>
    <span id="sel_start" style="display:none"><select name="s_hour">
        <option value="00">00</option>
        <option value="01">01</option>
        <option value="02">02</option>
        <option value="03">03</option>
        <option value="04">04</option>
        <option value="05">05</option>
        <option value="06">06</option>
        <option value="07">07</option>
        <option value="08" selected>08</option>
        <option value="09">09</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
    </select>:
    <select name="s_minute">
        <option value="00" selected>00</option>
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
        <option value="40">40</option>
        <option value="50">50</option>
    </select>
    </span>
        </p>
        <p id="p_endtime" <%=item.get("display")%>>结束时间：<input type="text" class="input datepicker" name="enddate" id="enddate" value="<%=item.get("enddate")%>" readonly>
    <span id="sel_end" style="display:none"><select name="e_hour">
        <option value="00">00</option>
        <option value="01">01</option>
        <option value="02">02</option>
        <option value="03">03</option>
        <option value="04">04</option>
        <option value="05">05</option>
        <option value="06">06</option>
        <option value="07">07</option>
        <option value="08">08</option>
        <option value="09">09</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12" selected>12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
    </select>:
    <select name="e_minute">
        <option value="00" selected>00</option>
        <option value="10">10</option>
        <option value="20">20</option>
        <option value="30">30</option>
        <option value="40">40</option>
        <option value="50">50</option>
    </select>
    </span>
        </p>
        <p>
            <label><input type="checkbox" value="1" id="isallday" name="isallday" checked> 全天</label>
            <label><input type="checkbox" value="1" id="isend" name="isend" <%=item.get("chk")%>> 结束时间</label>
        </p>
        <div class="sub_btn"><input type="submit" class="btn btn_ok" value="确定"> <input type="button" class="btn btn_cancel" value="取消" onClick="$.fancybox.close()"></div>
    </form>
</div>
<%
    }else if (action.equals("edit")) {
        Map<String, Object> item = (Map<String, Object>) request.getAttribute("item");
%>
<div class="fancy">
    <h3>编辑事件</h3>
    <form id="add_form" action="scheduleDo?action=edit" method="post">
        <input type="hidden" name="id" id="eventid" value="<%=item.get("id")%>">
        <p>日程内容：<input type="text" class="input" name="event" id="event" style="width:320px" placeholder="记录你将要做的一件事..." value="<%=item.get("title")%>"></p>
        <p>开始时间：<input type="text" class="input datepicker" name="startdate" id="startdate" value="<%=item.get("start_d")%>" readonly>
            <span id="sel_start" <%=item.get("display")%>><select name="s_hour">
                <option value="<%=item.get("start_h")%>" selected><%=item.get("start_h")%></option>
                <option value="00">00</option>
                <option value="01">01</option>
                <option value="02">02</option>
                <option value="03">03</option>
                <option value="04">04</option>
                <option value="05">05</option>
                <option value="06">06</option>
                <option value="07">07</option>
                <option value="08">08</option>
                <option value="09">09</option>
                <option value="10">10</option>
                <option value="11">11</option>
                <option value="12">12</option>
                <option value="13">13</option>
                <option value="14">14</option>
                <option value="15">15</option>
                <option value="16">16</option>
                <option value="17">17</option>
                <option value="18">18</option>
                <option value="19">19</option>
                <option value="20">20</option>
                <option value="21">21</option>
                <option value="22">22</option>
                <option value="23">23</option>
            </select>:
            <select name="s_minute">
                <option value="<%=item.get("start_m")%>" selected><%=item.get("start_m")%></option>
                <option value="00">00</option>
                <option value="10">10</option>
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="40">40</option>
                <option value="50">50</option>
            </select>
            </span>
        </p>
        <p id="p_endtime" <%=item.get("end_display")%>>结束时间：<input type="text" class="input datepicker" name="enddate" id="enddate" value="<%=item.get("end_d")%>" readonly>
        <span id="sel_end"  <%=item.get("display")%>><select name="e_hour">
        <option value="<%=item.get("end_h")%>" selected><%=item.get("end_h")%></option>
        <option value="00">00</option>
        <option value="01">01</option>
        <option value="02">02</option>
        <option value="03">03</option>
        <option value="04">04</option>
        <option value="05">05</option>
        <option value="06">06</option>
        <option value="07">07</option>
        <option value="08">08</option>
        <option value="09">09</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
    </select>:
        <select name="e_minute">
            <option value="<%=item.get("end_m")%>" selected><%=item.get("end_m")%></option>
            <option value="00">00</option>
            <option value="10">10</option>
            <option value="20">20</option>
            <option value="30">30</option>
            <option value="40">40</option>
            <option value="50">50</option>
        </select>
        </span>
        </p>
        <p>
            <label><input type="checkbox" value="1" id="isallday" name="isallday" <%=item.get("allday_chk")%>> 全天</label>
            <label><input type="checkbox" value="1" id="isend" name="isend" <%=item.get("end_chk")%>> 结束时间</label>
        </p>
        <div class="sub_btn"><span class="del"><input type="button" class="btn btn_del" id="del_event" value="删除"></span><input type="submit" class="btn btn_ok" value="确定"> <input type="button" class="btn btn_cancel" value="取消" onClick="$.fancybox.close()"></div>
    </form>
</div>
<%
    }
%>

<script>
    loadScheduleForm();
</script>
</body>
</html>
