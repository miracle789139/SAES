<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<!-- basic styles -->
		<link href="<%=request.getContextPath()%>/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome.min.css" />

		<!--[if IE 7]>-->
		  <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/font-awesome-ie7.min.css" />
		<!--<![endif]-->
		<!-- ace styles -->

		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/ace.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/ace-rtl.min.css" />
		<link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/ace-skins.min.css" />

		<!--[if lte IE 8]>-->
		  <link rel="stylesheet" href="<%=request.getContextPath()%>/bootstrap/css/ace-ie.min.css" />
		<!--<![endif]-->

		<!-- inline styles related to this page -->

		<!-- ace settings handler -->

		<script src="<%=request.getContextPath()%>/bootstrap/js/ace-extra.min.js"></script>

		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->

		<!--[if lt IE 9]>-->
		<script src="<%=request.getContextPath()%>/bootstrap/js/html5shiv.js"></script>
		<script src="<%=request.getContextPath()%>/bootstrap/js/respond.min.js"></script>
		<!--<![endif]-->

<div class="navbar navbar-default" id="navbar">

			<div class="navbar-container" id="navbar-container">
				<div class="navbar-header pull-left">
					<a href="#" class="navbar-brand">
						<small>
							<i class="icon-leaf"></i>
							上海市科学技术研究院管理系统
						</small>
					</a>
					<!-- /.brand -->
				</div>
				<!-- /.navbar-header -->

				<div class="navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
						<li class="light-blue">
							<a data-toggle="dropdown" href="#" class="dropdown-toggle">
								<img class="nav-user-photo" src="<%=request.getContextPath()%>/images/avatars/user.jpg" alt="Jason's Photo" />
								<span class="user-info">
									<small>欢迎光临</small>
									<c:if test="${!empty userSession}">${userSession.NAME}</c:if>
									<c:if test="${empty userSession}">你好</c:if>
								</span>

								<i class="icon-caret-down"></i>
							</a>

							<ul class="user-menu pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
								<li>
									<a href="#">
										<i class="icon-cog"></i> 设置
									</a>
								</li>

								<li>
									<a href="#">
										<i class="icon-user"></i> 个人资料
									</a>
								</li>

								<li class="divider"></li>

								<li>
									<a href="#">
										<i class="icon-off"></i> 退出
									</a>
								</li>
							</ul>
						</li>
					</ul>
					<!-- /.ace-nav -->
				</div>
				<!-- /.navbar-header -->
			</div>
			<!-- /.container -->
		</div>
<style style="text/css">
<!--   #alertmod_grid-table{display:none;} -->

#delmodgrid-table{
	width: 240px;
	height: auto;
	z-index: 10;
	overflow: hidden;
	top: 120px;
	left: 45%;
	display: block;
	position: absolute;}
.EditTable{
	width:100%;
	text-align: right;}
.widget-header .ui-jqdialog-titlebar-close{
	position: absolute;
	top: 5px;
	}
#delmodgrid-table{
	left: 45%;
	position: absolute;
}
#editmodgrid-table{
	position: absolute;
}
#searchmodfbox_grid-table{
	position: absolute;
	}
#info_dialog{
	position: absolute;	
	}
#editmodgrid-table .DataTD{
	margin-left:5px;
	text-align:left;
	}
#searchhdfbox_grid-table .ui-jqdialog-titlebar-close{
	position: absolute;
	top: 0.7rem;
}
</style>