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
				<div class="panel-heading">
					<span>项目基本信息添加</span>
					<button class="btn btn-info fr">
						<a href="/SAES/pro_manage">返回</a>
					</button>


				</div>
				<form action="/SAES/pro_manage_edit_submit?UNIQUE_CODE=${proManageModel.UNIQUE_CODE}" method="post">
					<table class="table table-bordered table-hover">

						<tbody>
							<tr>
								<td colspan="4" class="col-xs-1 active">基本信息</td>
							</tr>
							<tr>
								<td class="col-xs-1 active">项目名称</td>
								<td class="col-xs-1"><input type="text" name="PROJECT_NAME" value="${proManageModel.PROJECT_NAME}"/></td>
								<td class="col-xs-1 active">项目编号</td>
								<td class="col-xs-1">${proManageModel.PROJECT_CODE}</td>
							</tr>
							<tr>
								<td class="col-xs-1 active">负责人</td>
								<td class="col-xs-1"><input type="text" name="CHARGER_NAME" value="${proManageModel.CHARGER_NAME}"/></td>
								<td class="col-xs-1 active">项目类型</td>
								<td class="col-xs-1"><input type="text" name="PROJECT_TYPE" value="${proManageModel.PROJECT_TYPE}"/></td>
							</tr>
							<tr>
								<td class="col-xs-1 active">所属部门</td>
								<td class="col-xs-1"><input type="text" name="UNIT_ID" value="${proManageModel.UNIT_ID}"/></td>
								<td class="col-xs-1 active">所在科室</td>
								<td class="col-xs-1"><input type="text" name="APPLIER_ID" value="${proManageModel.APPLIER_ID}"/></td>
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

			</div>
		</div>
	</div>

</body>
</html>