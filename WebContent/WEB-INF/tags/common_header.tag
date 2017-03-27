<%@ tag import="java.util.Map" %>
<%@ tag pageEncoding="utf-8" %>
<div class="top">
    <div class="topbar">
        <div class="logo">
            <a href="/SAES/getHomeViewAction">
                上海市教育科学研究院
                Shanghai Academic of Education Sciences
            </a>
        </div>
        <div class="logout">
            <a href="/SAES/getloginViewAction">[退出]</a>
        </div>
        <div class="user">
            <%
                Map<String, Object> user = (Map<String, Object>) request.getSession(true).getAttribute("userSession");
                String personName = user.get("NAME").toString();
            %>
            <img src="/SAES/images/user.jpg">
            <a href="/SAES/queryperson?is=1"><%=personName%>
            </a>
        </div>
    </div>
</div>