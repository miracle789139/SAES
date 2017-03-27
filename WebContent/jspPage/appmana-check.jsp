<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>上海市教育科学研究院</title>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/xmsb_kt.css">
<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
<style type="text/css">
<!--
.STYLE2 {color: #000000}
.STYLE3 {
	font-weight: bold;
	font-size: 18px;
}
-->
</style>
</head>
<body>
	<div class="top">
		<div class="topbar">
			<div class="logo">
				上海市教育科学研究院
				Shanghai Academic of Education Sciences
			</div>
			<div class="logout">
				<a href="1.html">[退出]</a>
			</div>
			<div class="user">
				<img src="images/user.jpg" alt="用户">
				<a href="">某某某</a>
			</div>
			<div class="info">
				<img src="images/info.jpg" alt="信息">
				<span>1</span>
				<!-- <span class="badge">42</span> -->
			</div>			
		</div>
	</div>
	<div class="wrapper">
		<div class="mainMenu">
			<ul>
				<li id="tongzhi">项目申报信息</li>
				<li id="gongzuo">人员申报信息</li>
				<li id="shenqing">附件申报信息</li>
			</ul>
		</div>
	</div>
	<div class="wrapper row content tongzhi">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>项目基本信息</span>
					<button class="btn btn-info fr STYLE1"><a href="/SAES/appmana-index">返回</a></button>
				</div>
				<div class="panel-body">
					<button class="btn btn-info fr">保存</button>
				</div>

		  		<!-- Table -->
				<table class="table table-bordered table-hover">
					
      				<tbody>
				       <tr>
				          <td colspan="5" class="col-xs-1">项目名称</td>
				          <td colspan="4" class="col-xs-1">全国哲学社会</td>
			          </tr>
				        <tr>
				          <td colspan="2" class="col-xs-1">学科分类</td>
				          <td colspan="3" class="col-xs-5 tal">课程教材</td>
				          <td colspan="2" class="col-xs-1">研究领域</td>
				          <td colspan="2" class="col-xs-1">高等教育</td>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">申请人姓名</td>
				          <td colspan="3" class="col-xs-5 tal">王 凯</td>
				          <td width="8%" class="col-xs-1">性别</td>
				          <td width="8%" class="col-xs-1">男</td>
				          <td width="8%" class="col-xs-1">身份证号码</td>
				          <td width="18%" class="col-xs-1">44445588663454546</td>
				        </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">行政职务</td>
				          <td colspan="3" class="col-xs-5 tal">科员</td>
				          <td colspan="2" class="col-xs-1">职称</td>
				          <td colspan="2" class="col-xs-1">教授</td>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">工作单位</td>
				          <td colspan="3" class="col-xs-5 tal">上海市科学研究所</td>
				          <td colspan="2" class="col-xs-1">电子信箱</td>
				          <td colspan="2" class="col-xs-1">www.123@.com</td>
			            </tr>
						<tr>
				          <td colspan="2" class="col-xs-1">通讯地址</td>
				          <td colspan="3" class="col-xs-5 tal">&nbsp;</td>
				          <td colspan="2" class="col-xs-1">联系电话</td>
				          <td colspan="2" class="col-xs-1">2346789456</td>
			            </tr>
						 <tr>
				          <td width="7%" rowspan="6" bordercolor="#FFFFFF" bgcolor="#FFFFFF" class="col-xs-1 STYLE2">&nbsp;</td>
				          <td width="11%" height="42" class="col-xs-1">姓名</td>
				          <td width="10%" class="col-xs-1">性别</td>
				          <td width="20%" class="col-xs-1">出生年月</td>
				          <td width="10%" class="col-xs-1">职称</td>
				          <td colspan="2" class="col-xs-1">研究专长</td>
				          <td class="col-xs-1">学历</td>
						  <td class="col-xs-1">工作单位</td>
			          </tr>
					  <tr>
					    <td class="col-xs-1">郑博文</td>
				          <td width="10%" class="col-xs-1">男</td>
				          <td width="20%" class="col-xs-1">1992-02-05</td>
				          <td width="10%" class="col-xs-1">讲授</td>
				          <td colspan="2" class="col-xs-1">数据库</td>
				          <td class="col-xs-1">硕士</td>
						  <td class="col-xs-1">上海理工大学</td>
			          </tr>
					  <tr>
					    <td class="col-xs-1">&nbsp;</td>
				          <td width="10%" class="col-xs-1">&nbsp;</td>
				          <td width="20%" class="col-xs-1">&nbsp;</td>
				          <td width="10%" class="col-xs-1">&nbsp;</td>
				          <td colspan="2" class="col-xs-1">&nbsp;</td>
				          <td class="col-xs-1">&nbsp;</td>
						  <td class="col-xs-1">&nbsp;</td>
			          </tr>
					  <tr>
					    <td class="col-xs-1">&nbsp;</td>
				          <td width="10%" class="col-xs-1">&nbsp;</td>
				          <td width="20%" class="col-xs-1">&nbsp;</td>
				          <td width="10%" class="col-xs-1">&nbsp;</td>
				          <td colspan="2" class="col-xs-1">&nbsp;</td>
				          <td class="col-xs-1">&nbsp;</td>
						  <td class="col-xs-1">&nbsp;</td>
			          </tr>
					  <tr>
					    <td class="col-xs-1">&nbsp;</td>
				          <td width="10%" class="col-xs-1">&nbsp;</td>
				          <td width="20%" class="col-xs-1">&nbsp;</td>
				          <td width="10%" class="col-xs-1">&nbsp;</td>
				          <td colspan="2" class="col-xs-1">&nbsp;</td>
				          <td class="col-xs-1">&nbsp;</td>
						  <td class="col-xs-1">&nbsp;</td>
			          </tr>
					  <tr>
					    <td class="col-xs-1">&nbsp;</td>
				          <td width="10%" class="col-xs-1">&nbsp;</td>
				          <td width="20%" class="col-xs-1">&nbsp;</td>
				          <td width="10%" class="col-xs-1">&nbsp;</td>
				          <td colspan="2" class="col-xs-1">&nbsp;</td>
				          <td class="col-xs-1">&nbsp;</td>
						  <td class="col-xs-1">&nbsp;</td>
			          </tr>
						
						<tr>
				          <td colspan="2" class="col-xs-1">项目类别</td>
				          <td colspan="3" class="col-xs-5 tal">重大项目</td>
				          <td colspan="2" class="col-xs-1">申请经费（元）</td>
				          <td colspan="2" class="col-xs-1">&nbsp;</td>
			            </tr>
						
						<tr>
				          <td colspan="2" class="col-xs-1">预期成果</td>
				          <td colspan="3" class="col-xs-5 tal">&nbsp;</td>
				          <td colspan="2" class="col-xs-1">预计完成时间</td>
				          <td colspan="2" class="col-xs-1">&nbsp;</td>
			            </tr>
				    </tbody>
				</table>
				
			</div>
		</div>
	</div>
	<div class="wrapper row content gongzuo">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>人员基本信息</span>
					<button class="btn btn-info fr STYLE1"><a href="xmsb.html">返回</a></button>
				</div>
				<div class="panel-body">
				<button class="btn btn-info fr"><a href="rysb_insert.html">新增</a></button>
					<button class="btn btn-info fr">查询</button>
				</div>

		  		<!-- Table -->
				<table id="renyuantab" class="table table-bordered table-hover">
				<tbody>
				       <tr>
				          <td class="col-xs-1">姓名</td>
				          <td class="col-xs-1">性别</td>
				          <td class="col-xs-1">出生年月</td>
				          <td class="col-xs-1">职称</td>
				          <td class="col-xs-1">研究专长</td>
						  <td class="col-xs-1">学历</td>
						  <td class="col-xs-1">工作单位</td>
						 
			          </tr>
				       <tr>
				          <td class="col-xs-1" id="nameflg">王凯</td>
				          <td class="col-xs-1">男</td>
				          <td class="col-xs-1">1991-02-02</td>
				          <td class="col-xs-1">教授</td>
				          <td class="col-xs-1">软件工程</td>
						  <td class="col-xs-1">硕士</td>
						  <td class="col-xs-1">上海理工大学</td>
						
			          </tr>
				       
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
	<div class="wrapper row content shenqing">
		<div class="col-xs-12 mainPanel">
			<div class="panel panel-default">
				<!-- Default panel contents -->
				<div class="panel-heading">
					<span>项目附件</span>
					<span class="fr">共10项</span>
				</div>
				<div class="panel-body">
					<button class="btn btn-info fr">查询</button>
					<button class="btn btn-info fr">上传</button>
				</div>

		  		<!-- Table -->
				<table class="table table-bordered table-hover">
				    <tbody>
				       <tr>
				          <td class="col-xs-5">附件目录</td>
						  <td class="col-xs-1">上传时间</td>
						  <td class="col-xs-1">操作</td>	  
			          </tr>
					  <tr>
				          <td class="col-xs-5">科研平台需求.doc</td>
						  <td class="col-xs-1">2015-10-02 10:24</td>
						  <td class="col-xs-1">下载</td>	  
			          </tr>
					  <tr>
				          <td class="col-xs-5">数据库表整合版v2.doc</td>
						  <td class="col-xs-1">2015-10-02 10:24</td>
						  <td class="col-xs-1">下载</td>	  
			          </tr>
					  <tr>
				          <td class="col-xs-5">附件5：2015年申报书（其他类别）.doc</td>
						  <td class="col-xs-1">2015-10-02 10:24</td>
						  <td class="col-xs-1">下载</td>	  
			          </tr>
				       
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
	
	
<script src="<%=request.getContextPath()%>/js/jquery-1.10.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/control.js"></script>
</body>
</html>