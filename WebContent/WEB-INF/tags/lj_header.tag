<%--包含5大模块的目录头--%>
<%@ tag import="java.util.Map"%>
<%@ tag pageEncoding="utf-8"%>
<div class="wrapper">
	<%
                Map<String, Object> user = (Map<String, Object>) request.getSession(true).getAttribute("userSession");
                String personId = user.get("ID").toString();
                if (personId.equals("2")) {
            %>
            <!-- 根据角色判断显示导航栏 -->
	<div class="mainMenu_audit">
		<ul>
			<a href="getHomeViewAction"><li id="home">首页</li></a>
			<a href="notify"><li id="notify">通知公告</li></a>
			<a href="schedule"><li id="schedule">工作安排</li></a>
			<a href="projectaudit"><li id="projectaudit">项目审核</li></a>
			<a href="askreport"><li id="askreport">申请汇报</li></a>
			<a href="fileView"><li id="file">下载专区</li></a>
		</ul>
	</div>
	<%} else{%>
	<div class="mainMenu">
		<ul>
			<a href="getHomeViewAction"><li id="home">首页</li></a>
			<a href="notify"><li id="notify">通知公告</li></a>
			<a href="schedule"><li id="schedule">工作安排</li></a>
			<a href="askreport"><li id="askreport">申请汇报</li></a>
			<a href="fileView"><li id="file">下载专区</li></a>
		</ul>
	</div>
	<%} %>
</div>