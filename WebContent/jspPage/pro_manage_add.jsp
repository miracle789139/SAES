<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.usst.model.*"%>
<%@ taglib prefix="c" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>上海市教育科学研究院</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/main_wk.css">
<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/control_wk.js"></script>
<script type="text/javascript">
	function add() {
		var result = $("#select").val();
		var selectIndex = document.getElementById("select").selectedIndex;//获得是第几个被选中了
		alert("您选择的是：" + result);

	}
</script>
</head>
<body>
	<div class="top">
		<div class="topbar">
			<div class="logo">上海市教育科学研究院 Shanghai Academic of Education
				Sciences</div>
			<div class="logout">
				<a href="1.html">[退出]</a>
			</div>
			<div class="user">
				<img src="images/user.jpg" alt="用户"> <a href="">某某某</a>
			</div>
			<div class="info">
				<img src="images/info.jpg" alt="信息"> <span>1</span>
				<!-- <span class="badge">42</span> -->
			</div>
		</div>
	</div>
	<div class="wrapper row content tongzhi">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->

				<%
					String fromapply = (String) request.getAttribute("fromapply");
					if (fromapply != null) {
				%>
				<div class="panel-heading">

					<span>从申报信息中添加</span>

					<button class="btn btn-info fr">
						<a href="/SAES/pro_manage">返回</a>
					</button>
				</div>
				<%
						List<Map<String, Object>> apply_pros = (List<Map<String, Object>>) request.getAttribute("apply_pros");
					
					
					%>
				<!-- Table -->
				<form action="/SAES/pro_manage_applyinsert" method="post" id="myForm">
					<table class="table table-bordered table-hover" id="mytable">
						<thead>
							<tr>
								<th class="col-xs-1">课题唯一编号</th>
								<th class="col-xs-1">课题申报编号</th>
								<th class="col-xs-1">课题申报名称</th>
								<th class="col-xs-1">申报人</th>
								<th class="col-xs-1">发布时间</th>
								<th class="col-xs-1">所审核</th>
								<th class="col-xs-1">院审核</th>
								<th class="col-xs-1">操作</th>
							</tr>
						</thead>
						<tbody>
							<%
      				for (Map<String, Object> apply_pro : apply_pros) {
      				%>
							<tr>
								<td class="col-xs-1"><input type="text" name="UNIQUE_CODE" value="<%= apply_pro.get("APPLYID") %>"></td>
								<td class="col-xs-1"><input type="text" name="PROJECT_CODE" value="<%= apply_pro.get("APPLYID") %>" /></td>
								<td class="col-xs-1"><input type="text" name="PROJECT_NAME" value="<%= apply_pro.get("NAME")%>" /></td>
								<td class="col-xs-1"><input type="text" name="CHARGER_NAME" value="王凯" /></td>
								<td class="col-xs-1"><%= apply_pro.get("CREATE_TIME") %></td>
								<td class="col-xs-1">
									<%
				          if((Integer)apply_pro.get("SUO_CHECK_STATE")==1) {
												out.print("通过");
											} else {
												out.print("待审核");
											}
									%>
								</td>
								<td class="col-xs-1">
									<%
				          if((Integer)apply_pro.get("YUAN_CHECK_STATE")==1) {
												out.print("通过");
											} else {
												out.print("待审核");
											}
									%>
								</td>
								<td class="col-xs-1"><input type="text"  style="display:none;" name="PROJECT_TYPE" value="<%= apply_pro.get("PROJECT_TYPE")%>">
								<button class="btn btn-info fr" type="submit">添加</button></td>
							</tr>
							<%
      				    }
			      %>
						</tbody>
					</table>
				</form>
				<nav class="page">
				<ul class="pagination ">
					<li><a href="#">|&lt;</a></li>
					<li><a href="#">&lt;</a></li>
					<li><a href="#"><input type="number" placeholder="1"
							value="2">/9</a></li>
					<!-- <li><a href="#">/9</a></li> -->
					<li><a href="#">&gt;</a></li>
					<li><a href="#">&gt;|</a></li>
				</ul>
				</nav>
				<%
					} else {
				%>
				<div class="panel-heading">

					<span>项目基本信息添加</span>
					<button class="btn btn-info fr">
						<a href="/SAES/pro_manage">返回</a>
					</button>
				</div>
				<form action="/SAES/pro_manage_insert" method="post" id="myForm">
					<table class="table table-bordered table-hover">

						<tbody>
							<tr>
								<td colspan="4" class="col-xs-1 active">基本信息</td>
							</tr>
							<tr>
								<td class="col-xs-1 active">项目名称</td>
								<td class="col-xs-1"><input type="text" name="PROJECT_NAME" /></td>
								<td class="col-xs-1 active">项目编号</td>
								<td class="col-xs-1"><input type="text" name="PROJECT_CODE" /></td>
							</tr>
							<tr>
								<td class="col-xs-1 active">负责人</td>
								<td class="col-xs-1"><input type="text" name="CHARGER_NAME" /></td>
								<td class="col-xs-1 active">项目类型</td>
								<td class="col-xs-1"><input type="text" name="PROJECT_TYPE" /></td>
							</tr>
							<tr>
								<td class="col-xs-1 active">所属部门</td>
								<td class="col-xs-1"><input type="text" name="UNIT_ID" /></td>
								<td class="col-xs-1 active">所在科室</td>
								<td class="col-xs-1"><input type="text" name="APPLIER_ID" /></td>
							</tr>
							<tr>

								<td colspan="4" class="col-xs-1 active">附件信息</td>

							</tr>
							<tr>
								<td colspan="2" class="col-xs-1"><a href="#this">上传图片</td>
								<td colspan="2" class="col-xs-1"><a href="#this">上传文档</td>

							</tr>
						</tbody>
					</table>
					<div>
						<button class="btn btn-info fr" type="submit">保存</button>
					</div>
				</form>

				<%
					}
				%>
			</div>
		</div>
	</div>

</body>
</html>