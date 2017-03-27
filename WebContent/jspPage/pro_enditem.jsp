<!DOCTYPE html>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.lang.*"%>
<%@ page import="java.util.*"%>
<%@ page import="edu.usst.model.*"%>
<%@ taglib prefix="c" uri="/struts-tags"%>
<html>
<head>
<%@ include file="../jspf/citeFile_wk.jspf"%><%--引用的文件--%>
<script>
	$(function() {
		$("#jiexiang").css("background-color", "red");
	});
</script>
</head>
<body>
	<tags:common_header />
	<%--最顶部的头--%>
	<tags:wk_header />
	<%--模块头--%>

	<div class="wrapper row content lixiang">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">

				<div class=" doing">
					<div class="panel-default panel-heading">
						<span>所有项目列表</span>

					</div>
					<%
						List<Map<String, Object>> enditemLists = (List<Map<String, Object>>) request.getAttribute("enditemList");
									System.out.println(enditemLists);
					%>
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th class="col-xs-1">项目编号</th>
								<th class="col-xs-1">项目名称</th>
								<th class="col-xs-1">负责人</th>
								<th class="col-xs-1">所属部门</th>
								<th class="col-xs-1">结项日期</th>
								<th class="col-xs-1">项目分类</th>
								<th class="col-xs-1">所在科室</th>
								<th class="col-xs-1">所审核</th>
								<th class="col-xs-1">院审核</th>
								<th class="col-xs-1">操作</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Map<String, Object> enditemList : enditemLists) {
							%>

							<tr>
								<td class="col-xs-1" id="PROJECT_CODE"><%=enditemList.get("PROJECT_CODE")%></td>
								<td class="col-xs-1" id="PROJECT_NAME"><%=enditemList.get("PROJECT_NAME")%></td>
								<td class="col-xs-1" id="CHARGER_NAME"><%=enditemList.get("CHARGER_NAME")%></td>
								<td class="col-xs-1" id="UNIT_ID"><%=enditemList.get("UNIT_ID")%></td>
								<td class="col-xs-1" id="CREATE_TIME"><%=enditemList.get("ENDITEM_TIME")%></td>
								<td class="col-xs-1" id="PROJECT_TYPE"><%=enditemList.get("PROJECT_TYPE")%></td>
								<td class="col-xs-1" id="APPLIER_ID"><%=enditemList.get("APPLIER_ID")%></td>
								<td class="col-xs-1">
									<%
										if((Integer)enditemList.get("SUO_CHECK_STATE")==1) {
																			out.print("通过");
																		} else {
																			out.print("待审核");
																		}
									%>
								</td>
								<td class="col-xs-1">
									<%
										if((Integer)enditemList.get("YUAN_CHECK_STATE")==1) {
																			out.print("通过");
																		} else {
																			out.print("待审核");
																		}
									%>
								</td>
								<td class="col-xs-1">
								<a class="btn btn-info"
									href="/SAES/pro_enditem_check?UNIQUE_CODE=<%=enditemList.get("UNIQUE_CODE")%>">查看</a>
								<a class="btn btn-info"
									href="/SAES/pro_enditem_edit?UNIQUE_CODE=<%=enditemList.get("UNIQUE_CODE")%>">编辑</a></td>
							</tr>
							<%
								}
							%>
						</tbody>
					</table>
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
				</div>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
</body>
</html>