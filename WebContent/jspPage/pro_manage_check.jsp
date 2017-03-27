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
					<span>项目基本信息添加</span>
					<button class="btn btn-info fr">
						<a href="/SAES/pro_manage">返回</a>
					</button>
				</div>
				<table class="table table-bordered table-hover">

					<tbody>
						<tr>
							<td colspan="4" class="col-xs-1 active">基本信息</td>
						</tr>
						<tr>
							<td class="col-xs-1 active">项目名称</td>
							<td class="col-xs-1">${proManageModel.PROJECT_NAME}</td>
							<td class="col-xs-1 active">项目编号</td>
							<td class="col-xs-1">${proManageModel.PROJECT_CODE}</td>
						</tr>
						<tr>
							<td class="col-xs-1 active">负责人</td>
							<td class="col-xs-1">${proManageModel.CHARGER_NAME}</td>
							<td class="col-xs-1 active">项目类型</td>
							<td class="col-xs-1">${proManageModel.PROJECT_TYPE}</td>
						</tr>
						<tr>
							<td class="col-xs-1 active">所属部门</td>
							<td class="col-xs-1">${proManageModel.UNIT_ID}</td>
							<td class="col-xs-1 active">所在科室</td>
							<td class="col-xs-1">${proManageModel.APPLIER_ID}</td>
						<tr>
							<td colspan="1" class="col-xs-1 active">创建时间</td>
							<td colspan="3" class="col-xs-1">${proManageModel.CREATE_TIME}</td>
						</tr>
						<tr>
							<td class="col-xs-1 active">所审核状态</td>
							<td class="col-xs-1">${proManageModel.SUO_CHECK_STATE}</td>
							<td class="col-xs-1 active">院审核状态</td>
							<td class="col-xs-1">${proManageModel.YUAN_CHECK_STATE}</td>
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