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
		$("#shishi").css("background-color", "red");
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		/* 中检申请  */
		$("#midexam_apply").click(function() {
			 var ipt = document.getElementById('UNIQUE_CODE');//获取input的节点
			   var UNIQUE_CODE = ipt.value;//获取input的值
			if (confirm("确定要申请中检？")) {
				var checkedList = new Array();
				$.ajax({
					type : "POST",
					url : "pro_midexam_apply",
					data : {
						'UNIQUE_CODE' : UNIQUE_CODE
					},
					success : function(result) {
						window.location.reload();
					}
				});
			}
		});
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
						List<Map<String, Object>> actualizeLists = (List<Map<String, Object>>) request.getAttribute("actualizeList");
												System.out.println(actualizeLists);
					%>
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th class="col-xs-1">项目编号</th>
								<th class="col-xs-1">项目名称</th>
								<th class="col-xs-1">负责人</th>
								<th class="col-xs-1">所属部门</th>
								<th class="col-xs-1">立项日期</th>
								<th class="col-xs-1">项目分类</th>
								<th class="col-xs-1">所在科室</th>
								<th class="col-xs-1">实施状态</th>
								<!-- <th class="col-xs-1">院审核</th> -->
								<th class="col-xs-1">操作/中检申请</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Map<String, Object> actualizeList : actualizeLists) {
							%>

							<tr>
								<td class="col-xs-1" id="PROJECT_CODE"><%=actualizeList.get("PROJECT_CODE")%></td>
								<td class="col-xs-1" id="PROJECT_NAME"><%=actualizeList.get("PROJECT_NAME")%></td>
								<td class="col-xs-1" id="CHARGER_NAME"><%=actualizeList.get("CHARGER_NAME")%></td>
								<td class="col-xs-1" id="UNIT_ID"><%=actualizeList.get("UNIT_ID")%></td>
								<td class="col-xs-1" id="CREATE_TIME"><%=actualizeList.get("APPROVAL_TIME")%></td>
								<td class="col-xs-1" id="PROJECT_TYPE"><%=actualizeList.get("PROJECT_TYPE")%></td>
								<td class="col-xs-1" id="APPLIER_ID"><%=actualizeList.get("APPLIER_ID")%></td>
								<td class="col-xs-1">
									<%
										if((Integer)actualizeList.get("ACTUALIZE_STATUS")==1) {
																										out.print("实施中");
																									} else {
																										out.print("未实施");
																									}
									%>
								</td>
								<%-- <td class="col-xs-1">
									<%
										if((Integer)approvalList.get("YUAN_CHECK_STATE")==1) {
																			out.print("通过");
																		} else {
																			out.print("待审核");
																		}
									%>
								</td> --%>
								<td class="col-xs-1"><a class="btn btn-info"
									href="/SAES/pro_actualize_edit?UNIQUE_CODE=<%=actualizeList.get("UNIQUE_CODE")%>">编辑</a>
									<% if((Integer)actualizeList.get("MIDEXAM_APPLY")==1) {%>
								    <a class="btn btn-info">已申请</a>
									<%} else {%> 
									<a class="btn btn-info" rel="midexam_apply" href="javascript:void(0)" id="midexam_apply" var="midexam_apply">申请</a>
									<input type="hidden" id="UNIQUE_CODE" name="UNIQUE_CODE" value="<%=actualizeList.get("UNIQUE_CODE")%>" />
									<%}%>
								</td>
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