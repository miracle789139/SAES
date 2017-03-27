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
<script type="text/javascript">
	//JavaScript Document 
	$(document).ready(function() {
		/* 批量删除 */
		$("#dele").click(function() {
			// 判断是否至少选择一项 
			var checkedNum = $("input[name='check']:checked").length;
			if (checkedNum == 0) {
				alert("请选择至少一项！");
				return;
			}
			// 批量选择 
			if (confirm("确定要删除所选项目？")) {
				var checkedList = new Array();
				$("input[name='check']:checked").each(function() {
					checkedList.push($(this).val());
				});
				$.ajax({
					type : "POST",
					url : "pro_manage_delete",
					data : {
						'delitems' : checkedList.toString()
					},
					success : function(result) {
						$("[name ='check']:checkbox").attr("checked", false);
						window.location.reload();
					}
				});
			}
		});
	});
</script>
<SCRIPT>
	function firm() {
		if (confirm("是否从申请项目中添加？")) {
			location.href = "/SAES/pro_manage_add?fromapply=add ";
		} else {
			location.href = "/SAES/pro_manage_add";
		}
	}

	function approval() {
		location.href = "/SAES/pro_approval";
	}
</SCRIPT>
<script>
	$(function() {
		$("#yilan").css("background-color", "red");
	});
</script>
</head>
<body>
	<tags:common_header />
	<%--最顶部的头--%>
	<tags:wk_header />
	<%--模块头--%>

	<div class="wrapper row content yilan">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">

				<div class=" doing">
					<div class="panel-default panel-heading">
						<span>所有项目列表</span>

					</div>
					<div class="panel-body" >
						<button class="btn btn-danger fr" id="dele">
							删除
						</button>
						<button class="btn btn-info fr" onclick="firm()">
							新增
						</button>

					</div>
					<%
						List<Map<String, Object>> promanageLists = (List<Map<String, Object>>) request.getAttribute("promanageLists");
									System.out.println(promanageLists);
					%>
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th class="col-xs-1">全选</th>
								<th class="col-xs-1">项目编号</th>
								<th class="col-xs-1">项目名称</th>
								<th class="col-xs-1">负责人</th>
								<th class="col-xs-1">所属部门</th>
								<th class="col-xs-1">创建日期</th>
								<th class="col-xs-1">项目分类</th>
								<th class="col-xs-1">所在科室</th>
								<th class="col-xs-1">所审核</th>
								<th class="col-xs-1">院审核</th>
								<th class="col-xs-1">操作</th>
							</tr>
						</thead>
						<tbody>
							<%
								for (Map<String, Object> promanageList : promanageLists) {
							%>

							<tr>
								<td class="col-xs-1"><input type="checkbox" id="chk"
									name="check" value="<%=promanageList.get("UNIQUE_CODE")%>"></td>
								<td class="col-xs-1" id="PROJECT_CODE"><%=promanageList.get("PROJECT_CODE")%></td>
								<td class="col-xs-1" id="PROJECT_NAME"><%=promanageList.get("PROJECT_NAME")%></td>
								<td class="col-xs-1" id="CHARGER_NAME"><%=promanageList.get("CHARGER_NAME")%></td>
								<td class="col-xs-1" id="UNIT_ID"><%=promanageList.get("UNIT_ID")%></td>
								<td class="col-xs-1" id="CREATE_TIME"><%=promanageList.get("CREATE_TIME")%></td>
								<td class="col-xs-1" id="PROJECT_TYPE"><%=promanageList.get("PROJECT_TYPE")%></td>
								<td class="col-xs-1" id="APPLIER_ID"><%=promanageList.get("APPLIER_ID")%></td>
								<td class="col-xs-1">
									<%
										if((Integer)promanageList.get("SUO_CHECK_STATE")==1) {
																			out.print("通过");
																		} else {
																			out.print("待审核");
																		}
									%>
								</td>
								<td class="col-xs-1">
									<%
										if((Integer)promanageList.get("YUAN_CHECK_STATE")==1) {
																			out.print("通过");
																		} else {
																			out.print("待审核");
																		}
									%>
								</td>
								<td class="col-xs-1"><a class="btn btn-info"
									href="/SAES/pro_manage_check?UNIQUE_CODE=<%=promanageList.get("UNIQUE_CODE")%>">查看</a>
									<a class="btn btn-info"
									href="/SAES/pro_manage_edit?UNIQUE_CODE=<%=promanageList.get("UNIQUE_CODE")%>">编辑</a>
									
									<a class="btn btn-info"
									href="/SAES/pro_manage_edit?UNIQUE_CODE=<%=promanageList.get("UNIQUE_CODE")%>">打印</a>
										
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