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
<body>
	<tags:common_header />
	<%--最顶部的头--%>
	<div class="wrapper row content tongzhi">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>项目立项信息添加</span>
					<button class="btn btn-info fr">
						<a href="/SAES/pro_manage">返回</a>
					</button>
				</div>
				<%
					Map<String, Object> approvalList = (Map<String, Object>) request.getAttribute("approvalList");
						System.out.println(approvalList);
					%>
					<table class="table table-bordered table-hover">
						<tbody>
							<tr>
								<td colspan="4" class="col-xs-1 active">基本信息</td>
							</tr>
							<tr>
								<td class="col-xs-1 active">项目名称</td>
								<td class="col-xs-1"><%= approvalList.get("PROJECT_NAME")%></td>
								<td class="col-xs-1 active">项目编号</td>
								<td class="col-xs-1"><%= approvalList.get("PROJECT_CODE")%></td>
							</tr>
							<tr>
								<td class="col-xs-1 active">负责人</td>
								<td class="col-xs-1"><%= approvalList.get("CHARGER_NAME")%></td>
								<td class="col-xs-1 active">计划完成时间</td>
								<td class="col-xs-1"><%= approvalList.get("PLAN_END_DATE")%></td>
							</tr>
							<tr>
								<td class="col-xs-1 active">项目经费</td>
								<td class="col-xs-1"><%= approvalList.get("PROJECT_FEE")%>元</td>
								<td class="col-xs-1 active">预期成果形式</td>
								<td class="col-xs-1"><%= approvalList.get("EXPECT_RESULT")%></td>
							</tr>
							<tr>
								<td colspan="4" class="col-xs-1 active">附件信息</td>
							</tr>
							<tr>
								<td colspan="2" class="col-xs-1"><a href="#this">上传图片</td>
								<td colspan="2" class="col-xs-1"><a href="#this">上传文档</td>
							</tr>
							<tr></tr>
						</tbody>
					</table>

			</div>
		</div>
	</div>

</body>
</html>