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
	<div class="wrapper row content shishi">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>任务分工</span>
				</div>
				<div class="panel-body">
					<button class="btn-sm">项目信息</button>
					<button class="btn-sm btn-info">项目成员</button>
					<button class="btn-sm btn-info">子课题</button>
                    <button class="btn-sm btn-info">项目节点</button>
                    <button class="btn-sm btn-info">项目文档</button>
                    <button class="btn-sm btn-info">任务分工</button>
                    <button class="btn-sm btn-info">内部研讨</button>
                    <button class="btn-sm btn-info">专家咨询</button>
                    <button class="btn-sm btn-info">实地调研</button>
				</div>

		  		<!-- Table -->
		  		<table class="table table-bordered table-hover">
		  		
                <tbody>
                  <tr>
                    <td colspan="4" class="col-xs-1 active">基本信息</td>
                  </tr>
                  <tr>
                    <td class="col-xs-1 active">项目名称</td>
                    <td class="col-xs-1">智能机器人</td>
                    <td class="col-xs-1 active">项目编号</td>
                    <td class="col-xs-1">11111111</td>
                  </tr>
                  <tr>
                    <td class="col-xs-1 active">负责人类型</td>
                    <td class="col-xs-1">本所人员</td>
                    <td class="col-xs-1 active">负责人</td>
                    <td class="col-xs-1">张泽</td>
                  </tr>
                  <tr>
                    <td class="col-xs-1 active">所属部门</td>
                    <td class="col-xs-1">研究中心</td>
                    <td class="col-xs-1 active">所在科室</td>
                    <td class="col-xs-1">创新研究室</td>
                  </tr>
                  <tr>
                    <td class="col-xs-1 active">项目分类</td>
                    <td class="col-xs-1">重点任务</td>
                    <td class="col-xs-1 active">项目子类</td>
                    <td class="col-xs-1">预见</td>
                  </tr>
                </tbody>
		  		</table>
		  		
                <table class="table table-bordered table-hover">
                <tbody>
                  <tr>
                    <td class="col-xs-1 ">&nbsp;</td>
                  </tr>
                   <tr>
                   <td colspan="4" class="col-xs-1 active">详细信息</td>
                  </tr>
                  <tr>
                    <td class="col-xs-1 active">项目来源单位</td>
                    <td class="col-xs-1">上海市科委</td>
                    <td class="col-xs-1 active">项目状态</td>
                    <td class="col-xs-1">进行</td>
                  </tr>
                  <tr>
                    <td class="col-xs-1 active">立项日期</td>
                    <td class="col-xs-1">2015-5-9</td>
                    <td class="col-xs-1 active">开始时间</td>
                    <td class="col-xs-1">2015-5-10</td>
                  </tr>
                  <tr>
                    <td class="col-xs-1 active">计划完成时间</td>
                    <td class="col-xs-1">2015-10-10</td>
                    <td class="col-xs-1 active">成果形式</td>
                    <td class="col-xs-1">线路图报告</td>
                  </tr>
                  <tr>
                    <td class="col-xs-1 active">研究目的</td>
                    <td class="col-xs-1">&nbsp;</td>
                    <td colspan="2" class="col-xs-1">&nbsp;</td>
                  </tr>
                  <tr></tr>
                </tbody>
	  		  </table>
	  		  
		  		<nav class="page">
				  <ul class="pagination ">
				    <li><a href="#">|&lt;</a></li>
				    <li><a href="#">&lt;</a></li>
				    <li><a href="#"><input type="number" placeholder="1" value="2">/9</a></li>
				    <!-- <li><a href="#">/9</a></li> -->
				    <li><a href="#">&gt;</a></li>
				     <li><a href="#">&gt;|</a></li>
				  </ul>
			  </nav>
			</div>
		</div>
	</div>

</body>
</html>